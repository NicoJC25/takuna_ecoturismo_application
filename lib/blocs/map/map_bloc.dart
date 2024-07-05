import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;
  GoogleMapController? _mapController;
  LatLng? mapCenter;

  MapBloc({required this.locationBloc}) : super(const MapState()) {
    on<OnMapInitializedEvent>(_onInitMap);
    on<DisplayPolylinesEvent>(
        (event, emit) => state.copyWith(polylines: event.polylines));
    on<OnStartFollowingRouteEvent>(_onStartFollowingRoute);
  }

  void _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;

    emit(state.copyWith(isMapInitialized: true));
  }

  void clearPolylines() {
    state.polylines.clear();
  }

  void _onStartFollowingRoute(
      OnStartFollowingRouteEvent event, Emitter<MapState> emit) {
    emit(state.copyWith(isFollowingRoute: true));

    if (locationBloc.state.startRouteLocation == null) return;
    moveCamera(locationBloc.state.startRouteLocation!);
  }

  Future loadRouteFromGeoJson(String filePath) async {
    final Set<Polyline> polylines = {};

    String geoJsonString = await rootBundle.loadString(filePath);
    Map<String, dynamic> geoJson = jsonDecode(geoJsonString);

    List<dynamic> features = geoJson['features'];
    List<LatLng> routeCoordinates = [];

    for (var feature in features) {
      List<dynamic> coordinates = feature['geometry']['coordinates'];
      for (var coord in coordinates) {
        double lat = coord[0];
        double lng = coord[1];
        routeCoordinates.add(LatLng(lat, lng));
      }
    }

    polylines.add(Polyline(
      polylineId: PolylineId(filePath),
      width: 5,
      points: routeCoordinates,
    ));

    add(DisplayPolylinesEvent(polylines));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }
}

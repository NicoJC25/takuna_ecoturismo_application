import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? positionStream;

  //Definicion del bloc y procesos que hará cada evento
  LocationBloc() : super(const LocationState()) {
    on<OnStartFollowingUser>(
        (event, emit) => emit(state.copyWith(followingUser: true)));
    on<OnStopFollowingUser>(
        (event, emit) => emit(state.copyWith(followingUser: false)));
    on<OnStartFollowingRoute>(
        (event, emit) => emit(state.copyWith(followingRoute: true)));

    on<OnNewRouteLocationEvent>((event, emit) {
      emit(state.copyWith(startRouteLocation: event.newRouteLocation));
    });

    on<OnNewUserLocationEvent>((event, emit) {
      emit(state.copyWith(lastUserLocation: event.newUserLocation));
    });
  }

  //Obtener la posicion de comienzo de la ruta
  Future getRoutePosition(final Set<Polyline> polylines) async {
    final position = polylines.first;
    add(OnNewRouteLocationEvent(position.points.first));
  }

  //Logica cuando se empiece a seguir al usuario
  void startFollowingUser() {
    add(OnStartFollowingUser());

    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      add(OnNewUserLocationEvent(
          LatLng(position.latitude, position.longitude)));
    });
  }

  //Logica cuando se deje de seguir al usuario
  void stopFollowingUser() {
    positionStream?.cancel();
    add(OnStopFollowingUser());
  }

  //Cierra el flujo
  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }

  //Future getCurrentPosition(final Set<Polyline> polylines) async {
  //  add(OnStartFollowingRoute());

  //}
}

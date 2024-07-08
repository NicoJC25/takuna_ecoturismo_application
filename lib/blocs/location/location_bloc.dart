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

  LocationBloc() : super(const LocationState()) {
    on<OnStartFollowingUser>(
        (event, emit) => emit(state.copyWith(followingUser: true)));
    on<OnStopFollowingUser>(
        (event, emit) => emit(state.copyWith(followingUser: false)));
    on<OnStartFollowingRoute>(
        (event, emit) => emit(state.copyWith(followingRoute: true)));
    on<OnStopFollowingRoute>(
        (event, emit) => emit(state.copyWith(followingRoute: false)));

    on<OnNewRouteLocationEvent>((event, emit) {
      emit(state.copyWith(startRouteLocation: event.newRouteLocation));
    });

    on<OnNewUserLocationEvent>((event, emit) {
      emit(state.copyWith(lastUserLocation: event.newUserLocation));
    });
  }

  Future getRoutePosition(final Set<Polyline> polylines) async {
    final position = polylines.first;
    add(OnNewRouteLocationEvent(position.points.first));
  }

  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    add(OnNewUserLocationEvent(LatLng(position.latitude, position.longitude)));
  }

  void startFollowingUser() {
    add(OnStartFollowingUser());

    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      add(OnNewUserLocationEvent(
          LatLng(position.latitude, position.longitude)));
    });
  }

  void stopFollowingUser() {
    positionStream?.cancel();
    add(OnStopFollowingUser());
  }

  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }

  //Future getCurrentPosition(final Set<Polyline> polylines) async {
  //  add(OnStartFollowingRoute());

  //}
}

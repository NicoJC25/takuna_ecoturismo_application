import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationState()) {
    on<OnNewRouteLocationEvent>((event, emit) {
      emit(state.copyWith(startRouteLocation: event.newLocation));
    });
  }

  Future getCurrentPosition(final Set<Polyline> polylines) async {
    final position = polylines.first;
    add(OnNewRouteLocationEvent(position.points.first));
  }

  //Future getCurrentPosition(final Set<Polyline> polylines) async {
  //  add(OnStartFollowingRoute());

  //}
}

part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<dynamic> places;

  const SearchState({
    this.places = const [],
  });

  SearchState copyWith({
    List<dynamic>? places,
  }) =>
      SearchState(places: places ?? this.places);

  @override
  List<Object> get props => [places];
}

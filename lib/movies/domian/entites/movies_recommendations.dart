import 'package:equatable/equatable.dart';

class MoviesRecommendations extends Equatable {

  final int id;
  final String? backdropPath;

  MoviesRecommendations(
      {
        required this.id,
         this.backdropPath});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    backdropPath,
  ];
}

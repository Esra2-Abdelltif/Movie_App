import 'package:equatable/equatable.dart';
import 'package:movies_and_tv_app/movies/domian/entites/genres.dart';

class MoviesDetails extends Equatable {
  final List<Genres> genres;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final num voteAverage;
  final String backdropPath;
  final int runtime;

  MoviesDetails(
      {required this.genres,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.backdropPath,
      required this.runtime});

  @override
  // TODO: implement props
  List<Object?> get props => [
        genres,
        id,
        originalLanguage,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        backdropPath,
        runtime
      ];
}

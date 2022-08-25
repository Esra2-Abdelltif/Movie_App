import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final num voteAverage;
  final String backdropPath;

  Movies(
      {required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,required this.backdropPath});

  @override
  // TODO: implement props
  List<Object?> get props => [
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        backdropPath,
      ];
}

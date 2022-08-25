//1
import 'package:movies_and_tv_app/movies/data/models/genres_model.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movie_details.dart';

class MovieDatailsModel extends MoviesDetails {
  MovieDatailsModel(
      {required List<GenresModel> genres,
      required int id,
      required String originalLanguage,
      required String originalTitle,
      required String overview,
      required String posterPath,
      required String releaseDate,
      required String title,
      required num voteAverage,
      required String backdropPath,
      required int runtime})
      : super(
          genres: genres,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          voteAverage: voteAverage,
          backdropPath: backdropPath,
          runtime: runtime,
        );

  factory MovieDatailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDatailsModel(
          genres:  List.from(json['genres']).map((e)=>GenresModel.fromJson(e)).toList(),
          id: json['id'],
          originalLanguage: json['original_language'],
          originalTitle: json['original_title'],
          overview: json['overview'],
          posterPath: json['poster_path'],
          releaseDate: json['release_date'],
          title: json['title'],
          voteAverage: json['vote_average'],
          backdropPath: json['backdrop_path'],
          runtime: json['runtime']);
}

// genre: List<GenresModel>.from(json['genre'].map((e)=>GenresModel.fromJson(e))),

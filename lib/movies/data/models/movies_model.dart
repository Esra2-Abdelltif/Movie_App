//1
import 'package:movies_and_tv_app/movies/domian/entites/movies.dart';

class MoviesModel extends Movies {
  MoviesModel(
      {required List<int> genreIds,
      required int id,
      required String originalLanguage,
      required String originalTitle,
      required String overview,
      required String posterPath,
      required String releaseDate,
      required String title,
      required num voteAverage,
      required String backdropPath
      })
      : super(
            genreIds: genreIds,
            id: id,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            overview: overview,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title,
            voteAverage: voteAverage,
            backdropPath:backdropPath
  )
  ;

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
      genreIds: json['genre_ids'].cast<int>(),
      id:json['id'],
      originalLanguage:json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath : json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'],
      backdropPath: json['backdrop_path'],
  );
}

// genreIds: List<num>.from(json['genre_ids'].map((e)=>e)),
//1
import 'package:movies_and_tv_app/movies/domian/entites/movies_recommendations.dart';

class MoviesRecommendationsModel extends MoviesRecommendations {
  MoviesRecommendationsModel(
      {
        required int id,
         String? backdropPath
      })
      : super(
      id: id,
      backdropPath:backdropPath,
  )
  ;

  factory MoviesRecommendationsModel.fromJson(Map<String, dynamic> json) => MoviesRecommendationsModel(
    id:json['id'],
    backdropPath: json['backdrop_path'] ?? "/odJ4hx6g6vBt4lBWKFD1tI8WS4x.jpg",
  );
}

// genreIds: List<num>.from(json['genre_ids'].map((e)=>e)),
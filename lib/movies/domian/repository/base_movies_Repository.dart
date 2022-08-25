
import 'package:dartz/dartz.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movie_details.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movies.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movies_recommendations.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_movies_details_usescases.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_movies_recommendations.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository{

  Future<Either<Failure,List<Movies>>> getNowPlayingMovie();

  Future<Either<Failure,List<Movies>>> getPopularMovie();

  Future<Either<Failure,List<Movies>>> getTopRateMovie();
  Future<Either<Failure,MoviesDetails>> getMovieDatails(MoviesDetailsParameters parameters);
  Future<Either<Failure,List<MoviesRecommendations>>> getMoviesRecommendations(MoviesRecommendationsParameters parameters);


}
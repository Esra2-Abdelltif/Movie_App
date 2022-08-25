//3
import 'package:dartz/dartz.dart';
import 'package:movies_and_tv_app/core/error/exceptions.dart';
import 'package:movies_and_tv_app/core/error/failure.dart';
import 'package:movies_and_tv_app/movies/data/dataSource/movies_remote_dataSource.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movie_details.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movies.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movies_recommendations.dart';
import 'package:movies_and_tv_app/movies/domian/repository/base_movies_Repository.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_movies_details_usescases.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_movies_recommendations.dart';

class MoviesRepository implements BaseMoviesRepository{
  final BaseMoviesRemoteDataSource baseRemoteDataSource;

  MoviesRepository(this.baseRemoteDataSource);


  @override
  //L => Failure    R=>Success
  Future<Either<Failure,List<Movies>>> getNowPlayingMovie() async{
    // hb2a m7tga arg3 two type of model movies and error model use package dartz
    final result =await baseRemoteDataSource.getNowPlayingMovie();
   try{
     return Right(result);
   }on ServerException catch (failure){
     return Left(ServerFailure(failure.errorMessageModel.status_message));
   }
  }

  @override
  Future<Either<Failure,List<Movies>>>  getPopularMovie() async {
    final result =await baseRemoteDataSource.getPopularMovie();
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.status_message));
    }
  }

  @override
  Future<Either<Failure,List<Movies>>> getTopRateMovie() async{
    final result =await baseRemoteDataSource.getTopRateMovie();
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.status_message));
    }
  }

  @override
  Future<Either<Failure, MoviesDetails>> getMovieDatails(MoviesDetailsParameters parameters) async{
    final result =await baseRemoteDataSource.getMovieDatails(parameters);
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.status_message));
    }
  }

  @override
  Future<Either<Failure, List<MoviesRecommendations>>> getMoviesRecommendations(MoviesRecommendationsParameters parameters)async {
    final result =await baseRemoteDataSource.getMoviesRecommendationsModel(parameters);
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.status_message));
    }
  }


}
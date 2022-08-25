//2
import 'package:dio/dio.dart';
import 'package:movies_and_tv_app/core/error/exceptions.dart';
import 'package:movies_and_tv_app/core/network/error_message_model.dart';
import 'package:movies_and_tv_app/core/network/movies_api_constantace.dart';
import 'package:movies_and_tv_app/core/utils/app_constance.dart';
import 'package:movies_and_tv_app/movies/data/models/movie_datails_model.dart';
import 'package:movies_and_tv_app/movies/data/models/movies_model.dart';
import 'package:movies_and_tv_app/movies/data/models/movies_recommendations_model.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movies_recommendations.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_movies_details_usescases.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_movies_recommendations.dart';

abstract class BaseMoviesRemoteDataSource {
  //keda b3ml contract(عقد) by7dd return type kol method w kman el name bta3t kol method
  Future<List<MoviesModel>> getNowPlayingMovie();
  Future<List<MoviesModel>> getPopularMovie();
  Future<List<MoviesModel>> getTopRateMovie();
  Future<MovieDatailsModel> getMovieDatails(MoviesDetailsParameters parameters);
  Future<List<MoviesRecommendationsModel>> getMoviesRecommendationsModel(MoviesRecommendationsParameters parameters);


}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovie() async {
    final response = await Dio().get(MoviesApiConstance.nowPlayingMoviesPath);
    //if response susses
    if (response.statusCode == 200) {
      //عاملت resultعشان ده بس الي انا محتاجه
      return List.from((response.data['results'] as List).map((element) => MoviesModel.fromJson(element)));
    }
    //if response unsusses
    //create error model
    //create exception
    else {
      //ديه طريقه لو عااوزه ابعت مسج بس ومش هعمل ايرور مودل
      //return throw Exception('The resource you requested could not be found.');
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  @override
  Future<List<MoviesModel>> getPopularMovie() async {
    final response = await Dio().get(MoviesApiConstance.popularMoviesPath);
    //if response susses
    if (response.statusCode == 200) {
      //عاملت resultعشان ده بس الي انا محتاجه
      return List.from((response.data['results'] as List).map((element) => MoviesModel.fromJson(element)));
    }
    //if response unsusses
    //create error model
    //create exception
    else {
      //ديه طريقه لو عااوزه ابعت مسج بس ومش هعمل ايرور مودل
      //return throw Exception('The resource you requested could not be found.');
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  @override
  Future<List<MoviesModel>> getTopRateMovie() async {
    final response = await Dio().get(MoviesApiConstance.topRatedMoviesPath);
    //if response susses
    if (response.statusCode == 200) {
      //عاملت resultعشان ده بس الي انا محتاجه
      return List.from((response.data['results'] as List).map((element) => MoviesModel.fromJson(element)));
    }
    //if response unsusses
    //create error model
    //create exception
    else {
      //ديه طريقه لو عااوزه ابعت مسج بس ومش هعمل ايرور مودل
      //return throw Exception('The resource you requested could not be found.');
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDatailsModel> getMovieDatails(MoviesDetailsParameters parameters)async {
    final response = await Dio().get(MoviesApiConstance.moviesDetailsPath(parameters.MoviesId));
    //if response susses
    if (response.statusCode == 200) {
      //عاملت resultعشان ده بس الي انا محتاجه
      return  MovieDatailsModel.fromJson(response.data);
    }
    //if response unsusses
    //create error model
    //create exception
    else {
      //ديه طريقه لو عااوزه ابعت مسج بس ومش هعمل ايرور مودل
      //return throw Exception('The resource you requested could not be found.');
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesRecommendationsModel>> getMoviesRecommendationsModel(MoviesRecommendationsParameters parameters)async {
    final response = await Dio().get(MoviesApiConstance.moviesRecommendationsPath(parameters.MoviesId));
    //if response susses
    if (response.statusCode == 200) {
      //عاملت resultعشان ده بس الي انا محتاجه
      return List.from((response.data['results'] as List).map((element) => MoviesRecommendationsModel.fromJson(element)));
    }
    //if response unsusses
    //create error model
    //create exception
    else {
      //ديه طريقه لو عااوزه ابعت مسج بس ومش هعمل ايرور مودل
      //return throw Exception('The resource you requested could not be found.');
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }


}

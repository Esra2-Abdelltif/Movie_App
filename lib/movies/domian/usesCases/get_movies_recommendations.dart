
//y3tbr usercases hnha bridge between presentiona layer and function
import 'package:equatable/equatable.dart';
import 'package:movies_and_tv_app/core/useCases/base_useCase.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movie_details.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_and_tv_app/core/error/failure.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movies_recommendations.dart';

import '../repository/base_movies_Repository.dart';

class GetMoviesRecommendationsUsesCases  extends BaseUseCases<List<MoviesRecommendations>,MoviesRecommendationsParameters>{
  //take refrance from absrect class
  final BaseMoviesRepository baseMoviesRepository ;

  GetMoviesRecommendationsUsesCases(this.baseMoviesRepository);
  @override

  Future<Either<Failure,List<MoviesRecommendations>>> call(MoviesRecommendationsParameters parameters)async{
    return await baseMoviesRepository.getMoviesRecommendations(parameters);
  }
}

///-------------------------------------------------------------------
///fe 7alh lw 3ndy akter mn Parameters h3ml model w ast2blh mkan parameters type
class MoviesRecommendationsParameters extends Equatable{
  final int MoviesId;


  MoviesRecommendationsParameters({required this.MoviesId});

  @override
  // TODO: implement props
  List<Object> get props =>[MoviesId];
}

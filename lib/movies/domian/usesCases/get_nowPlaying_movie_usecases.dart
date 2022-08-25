
import 'package:dartz/dartz.dart';
import 'package:movies_and_tv_app/core/error/failure.dart';
import 'package:movies_and_tv_app/core/useCases/base_useCase.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movies.dart';
import 'package:movies_and_tv_app/movies/domian/repository/base_movies_Repository.dart';
//y3tbr usercases hnha bridge between presentiona layer and function

class GetNowPlayingMovieUsesCases extends BaseUseCases<List<Movies>,NoParameters>{
  //take refrance from absrect class
  final BaseMoviesRepository baseMoviesRepository ;

  GetNowPlayingMovieUsesCases(this.baseMoviesRepository);
  @override
  Future<Either<Failure,List<Movies>>> call(NoParameters parameters) async{
    return await baseMoviesRepository.getNowPlayingMovie();
  }
}
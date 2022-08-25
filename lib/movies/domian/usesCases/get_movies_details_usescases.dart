
//y3tbr usercases hnha bridge between presentiona layer and function
import 'package:equatable/equatable.dart';
import 'package:movies_and_tv_app/core/useCases/base_useCase.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movie_details.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_and_tv_app/core/error/failure.dart';

import '../repository/base_movies_Repository.dart';

class GetMovieDetailaUsesCases  extends BaseUseCases<MoviesDetails,MoviesDetailsParameters>{
  //take refrance from absrect class
  final BaseMoviesRepository baseMoviesRepository ;

  GetMovieDetailaUsesCases(this.baseMoviesRepository);
  @override

  Future<Either<Failure,MoviesDetails>> call(MoviesDetailsParameters parameters)async{
    return await baseMoviesRepository.getMovieDatails(parameters);
  }
}

///-------------------------------------------------------------------
///fe 7alh lw 3ndy akter mn Parameters h3ml model w ast2blh mkan parameters type
class MoviesDetailsParameters extends Equatable{
  final int MoviesId;


  MoviesDetailsParameters({required this.MoviesId});

  @override
  // TODO: implement props
  List<Object> get props =>[MoviesId];
}

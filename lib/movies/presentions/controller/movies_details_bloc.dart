import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_and_tv_app/core/utils/enums.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_movies_details_usescases.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_movies_recommendations.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_details_event.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_details_states.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDeatilsStates> {


  MoviesDetailsBloc( this.getMovieDetailaUsesCases,this.getMoviesRecommendationsUsesCases) : super( MoviesDeatilsStates()) {

    on<GetMoviesDetailsEvent>(_getMovieDetailaData);
    on<GetMovieRecommendationsEvent>(_getMoviesRecommendationsData);
  }
  final GetMovieDetailaUsesCases getMovieDetailaUsesCases;
  final GetMoviesRecommendationsUsesCases getMoviesRecommendationsUsesCases;




  FutureOr<void> _getMovieDetailaData(GetMoviesDetailsEvent event, Emitter<MoviesDeatilsStates> emit) async{
   final result= await getMovieDetailaUsesCases(MoviesDetailsParameters(MoviesId: event.movieId));
    //emit(const MoviesStates(nowPlayingMoviesState: RequestStates.loaded));

    result.fold(
            (l) => emit(state.copyWith(
            moviesDetailsState: RequestStates.error,
            moviesDetailsMessage: l.Message)),
            (r) => emit(state.copyWith(
            moviesDetails: r,
            moviesDetailsState: RequestStates.loaded)));
  }

  FutureOr<void> _getMoviesRecommendationsData(GetMovieRecommendationsEvent event, Emitter<MoviesDeatilsStates> emit) async{
    final result= await getMoviesRecommendationsUsesCases(MoviesRecommendationsParameters(MoviesId: event.movieId));
    //emit(const MoviesStates(nowPlayingMoviesState: RequestStates.loaded));

    result.fold(
            (l) => emit(state.copyWith(
            moviesRecommendationsState: RequestStates.error,
            moviesDetailsMessage:  l.Message)),
            (r) => emit(state.copyWith(
            moviesRecommendations: r,
            moviesRecommendationsState: RequestStates.loaded)));
  }



}

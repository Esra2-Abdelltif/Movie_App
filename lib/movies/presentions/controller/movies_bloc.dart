import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_and_tv_app/core/useCases/base_useCase.dart';
import 'package:movies_and_tv_app/core/utils/enums.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_nowPlaying_movie_usecases.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_popular_movie_usecases.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_topRate_movie_usecases.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_event.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMovieUsesCases getNowPlayingMovieUsesCases;
   final GetPopularMovieUsesCases getPopularMovieUsesCases;
   final GetTopRateMovieUsesCases getTopRateMovieUsesCases;

  MoviesBloc( this.getNowPlayingMovieUsesCases,this.getPopularMovieUsesCases,this.getTopRateMovieUsesCases) : super( const MoviesStates()) {

    ///GetNowPlayingMovieData
    on<GetNowPlayingMovieEvent>(_getNowPlayingMovieData);

    ///GetPopularMovieData
    on<GetPopularMovieEvent>(_getPopularMovieData);

    ///GetTopRateMovieData
    on<GetTopRateMovieEvent>(_getTopRateMovieData);
  }



  FutureOr<void> _getNowPlayingMovieData(GetNowPlayingMovieEvent event, Emitter<MoviesStates> emit) async{
    final result = await getNowPlayingMovieUsesCases( const NoParameters());
    //emit(const MoviesStates(nowPlayingMoviesState: RequestStates.loaded));

    result.fold(
            (l) => emit(state.copyWith(
            nowPlayingMoviesState: RequestStates.error,
            nowPlayingMessage: l.Message)),
            (r) => emit(state.copyWith(
            nowPlayingMovies: r,
            nowPlayingMoviesState: RequestStates.loaded)));
  }
  FutureOr<void> _getPopularMovieData(GetPopularMovieEvent event, Emitter<MoviesStates> emit)async {
    final result = await getPopularMovieUsesCases( const NoParameters());
//      emit(const MoviesStates(popularMoviesState: RequestStates.loaded));

    result.fold(
            (l) => emit(state.copyWith(
            popularMoviesState: RequestStates.error,
            popularMessage: l.Message)),
            (r) => emit(state.copyWith(
            popularMovies: r,
            popularMoviesState: RequestStates.loaded)));
  }
  FutureOr<void> _getTopRateMovieData(GetTopRateMovieEvent event, Emitter<MoviesStates> emit)async {
    final result = await getTopRateMovieUsesCases( const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
            topRateMoviesState: RequestStates.error,
            topRateMessage: l.Message)),
            (r) => emit(state.copyWith(
            topRateMovies: r,
            topRateMoviesState: RequestStates.loaded)));
  }

}

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_and_tv_app/core/utils/enums.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movies.dart';

class MoviesStates extends Equatable {
  //TODO: NowplayingState
  final List<Movies> nowPlayingMovies;
  final String nowPlayingMessage;
  final RequestStates nowPlayingMoviesState;

  //TODO: PopularState
  final List<Movies> popularMovies;
  final String popularMessage;
  final RequestStates popularMoviesState;

  //TODO: TopRateState
  final List<Movies> topRateMovies;
  final String topRateMessage;
  final RequestStates topRateMoviesState;

  const MoviesStates(
      {this.nowPlayingMovies = const [],
      this.nowPlayingMessage = '',
      this.nowPlayingMoviesState = RequestStates.loading,
      this.popularMovies = const [],
      this.popularMessage = '',
      this.popularMoviesState = RequestStates.loading,
      this.topRateMovies = const [],
      this.topRateMessage = '',
      this.topRateMoviesState = RequestStates.loading});

  //3shan a2dr a3rd 3 model fe nafs el screen ha3ml copy with
  // copy with bt5lny msh create new object w bt3ml return new and old data w tdefhm 3la object
  //ToDo: CopyWith
  MoviesStates copyWith({
    List<Movies>? nowPlayingMovies,
    String? nowPlayingMessage,
    RequestStates? nowPlayingMoviesState,
    List<Movies>? popularMovies,
    String? popularMessage,
    RequestStates? popularMoviesState,
    List<Movies>? topRateMovies,
    String? topRateMessage,
    RequestStates? topRateMoviesState,
  }) {
    return MoviesStates(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        nowPlayingMoviesState: nowPlayingMoviesState ?? this.nowPlayingMoviesState,
        popularMovies: popularMovies ?? this.popularMovies,
        popularMessage: popularMessage ?? this.popularMessage,
        popularMoviesState: popularMoviesState ?? this.popularMoviesState,
        topRateMovies: topRateMovies ?? this.topRateMovies,
        topRateMessage: topRateMessage ?? this.topRateMessage,
        topRateMoviesState: topRateMoviesState ?? this.topRateMoviesState);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMessage,
        nowPlayingMoviesState,
        popularMovies,
        popularMessage,
        popularMoviesState,
        topRateMoviesState,
        topRateMessage,
        topRateMovies
      ];
}

// class MovieInitial extends MoviesStates {}

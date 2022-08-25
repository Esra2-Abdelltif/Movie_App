
import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable{

  MoviesEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class GetNowPlayingMovieEvent extends MoviesEvent {}
class GetPopularMovieEvent extends MoviesEvent {}
class GetTopRateMovieEvent extends MoviesEvent {}




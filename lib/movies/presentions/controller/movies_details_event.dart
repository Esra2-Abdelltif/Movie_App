
import 'package:equatable/equatable.dart';

abstract class MoviesDetailsEvent extends Equatable{

  MoviesDetailsEvent();



}
class GetMoviesDetailsEvent extends MoviesDetailsEvent {
   final int movieId;

   GetMoviesDetailsEvent(this.movieId);
   @override
   // TODO: implement props
   List<Object?> get props => [movieId];
}
class GetMovieRecommendationsEvent extends MoviesDetailsEvent {
  final int movieId;

  GetMovieRecommendationsEvent(this.movieId);
  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}





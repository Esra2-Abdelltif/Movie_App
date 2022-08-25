import 'package:equatable/equatable.dart';
import 'package:movies_and_tv_app/core/utils/enums.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movie_details.dart';
import 'package:movies_and_tv_app/movies/domian/entites/movies_recommendations.dart';

class MoviesDeatilsStates extends Equatable {
  final MoviesDetails? moviesDetails;
  final String moviesDetailsMessage;
  final RequestStates moviesDetailsState;

  final  List<MoviesRecommendations> moviesRecommendations;
  final String  moviesRecommendationsMessage;
  final RequestStates  moviesRecommendationsState;

  const MoviesDeatilsStates(
      {this.moviesDetails ,
        this.moviesDetailsMessage = '',
        this.moviesDetailsState = RequestStates.loading,
        this.moviesRecommendations=const[] ,
        this.moviesRecommendationsMessage = '',
        this.moviesRecommendationsState = RequestStates.loading,

        });

  //3shan a2dr a3rd 3 model fe nafs el screen ha3ml copy with
  // copy with bt5lny msh create new object w bt3ml return new and old data w tdefhm 3la object
  //ToDo: CopyWith
  MoviesDeatilsStates copyWith({
    MoviesDetails? moviesDetails,
    String? moviesDetailsMessage,
    RequestStates? moviesDetailsState,
      List<MoviesRecommendations>? moviesRecommendations,
     String? moviesRecommendationsMessage,
     RequestStates?  moviesRecommendationsState,



  }) {
    return MoviesDeatilsStates(
        moviesDetails: moviesDetails ?? this.moviesDetails,
        moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
        moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
      moviesRecommendations: moviesRecommendations ?? this.moviesRecommendations,
      moviesRecommendationsState: moviesRecommendationsState ?? this.moviesRecommendationsState,
      moviesRecommendationsMessage: moviesRecommendationsMessage ?? this.moviesRecommendationsMessage,

       );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
   moviesDetailsState,moviesDetails,moviesDetailsMessage,moviesRecommendationsState,moviesRecommendations,moviesRecommendationsMessage
  ];
}

// class MovieInitial extends MoviesStates {}

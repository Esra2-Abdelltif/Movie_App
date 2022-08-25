import 'package:get_it/get_it.dart';
import 'package:movies_and_tv_app/movies/data/dataSource/movies_remote_dataSource.dart';
import 'package:movies_and_tv_app/movies/data/repository/Movies_Repository.dart';
import 'package:movies_and_tv_app/movies/domian/repository/base_movies_Repository.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_movies_details_usescases.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_movies_recommendations.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_nowPlaying_movie_usecases.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_popular_movie_usecases.dart';
import 'package:movies_and_tv_app/movies/domian/usesCases/get_topRate_movie_usecases.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_bloc.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_details_bloc.dart';

GetIt getIt = GetIt.instance;
class ServicesLocater{
  void init(){
    ///Bloc
    //Kol ma call MoviesBloc H create object mnh
     getIt.registerFactory(() => MoviesBloc(getIt(),getIt(), getIt()));
     getIt.registerFactory(() => MoviesDetailsBloc(getIt(),getIt()));


     ///UsesCases
    getIt.registerLazySingleton(() => GetNowPlayingMovieUsesCases(getIt()));
    getIt.registerLazySingleton(() => GetPopularMovieUsesCases(getIt()));
    getIt.registerLazySingleton(() => GetTopRateMovieUsesCases(getIt()));
     getIt.registerLazySingleton(() => GetMovieDetailaUsesCases(getIt()));
     getIt.registerLazySingleton(() => GetMoviesRecommendationsUsesCases(getIt()));





     ///Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(getIt()));

    ///DataSource
    getIt.registerLazySingleton<BaseMoviesRemoteDataSource>(() => MoviesRemoteDataSource());

  }

}
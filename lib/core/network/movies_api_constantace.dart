class MoviesApiConstance{
  static const String baseUrl='https://api.themoviedb.org/3';
  static const String appKey= "247a18e38e58225afffc980e1d8998e1";
  static const String nowPlayingMoviesPath ="${baseUrl}/movie/now_playing?api_key=${appKey}";
  static const String popularMoviesPath ="${baseUrl}/movie/popular?api_key=${appKey}";
  static const String topRatedMoviesPath ="${baseUrl}/movie/top_rated?api_key=${appKey}";
  static const String baseimageUrl ="https://www.themoviedb.org/t/p/w300_and_h450_bestv2";
  static  String moviesDetailsPath(int movieId) =>"${baseUrl}/movie/${movieId}?api_key=${appKey}";
  static  String moviesRecommendationsPath(int movieId) =>"${baseUrl}/movie/${movieId}/recommendations?api_key=${appKey}";



  static String imageUrl(String path)=>'$baseimageUrl$path';


}

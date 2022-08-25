import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_and_tv_app/core/global/themes/theme_data/theme_data_dark.dart';
import 'package:movies_and_tv_app/core/network/cacheHelper.dart';
import 'package:movies_and_tv_app/core/services/services.dart';
import 'package:movies_and_tv_app/core/utils/app_strings.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_bloc.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_details_bloc.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_details_event.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_event.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_states.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/observer_bloc.dart';
import 'package:movies_and_tv_app/movies/presentions/screens/movies_homeScreen.dart';
import 'package:movies_and_tv_app/movies/presentions/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  ServicesLocater().init();
  BlocOverrides.runZoned( () {
    runApp( MyApp());

  },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => getIt<MoviesBloc>()..add(GetNowPlayingMovieEvent())..add(GetPopularMovieEvent())..add(GetTopRateMovieEvent()) )),

      ],
      child: BlocConsumer<MoviesBloc,MoviesStates>(
        listener: (context ,state){},
        builder: (context ,state){
          return  MaterialApp(
            title: AppString.appName,
            theme:getThemeDataDark(),
            debugShowCheckedModeBanner: false,
            home: SplashSCreen(),
          );
        },
      ),
    );
  }
}



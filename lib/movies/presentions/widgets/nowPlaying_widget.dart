import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_and_tv_app/core/utils/app_strings.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_and_tv_app/core/network/movies_api_constantace.dart';
import 'package:movies_and_tv_app/core/utils/enums.dart';
import 'package:movies_and_tv_app/movies/presentions/controller/movies_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_and_tv_app/movies/presentions/screens/movie_detail_screen.dart';
import '../../../core/utils/app_constance.dart';
import '../controller/movies_states.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesBloc,MoviesStates>(
      //buildwhen use to not rebuild widget more than one
      buildWhen: (Pervices,current)=>Pervices.nowPlayingMoviesState!=current.nowPlayingMoviesState,
      listener: (context ,state){},
      builder: (context ,state){
        print(state.nowPlayingMoviesState);
        {
          switch(state.nowPlayingMoviesState){
            case RequestStates.loading:
              print('Loading');
              return SizedBox(
                height: 400,
                  child: Center(child: CircularProgressIndicator()));
            case RequestStates.loaded:
              return  FadeIn(
                duration: const Duration(milliseconds: 500),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 450,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {},
                  ),
                  items: state.nowPlayingMovies.map(
                        (item) {
                      return GestureDetector(
                        key: const Key('openMovieMinimalDetail'),
                        onTap: () {
                          NavigateTo(context: context,router: MovieDetailScreen(id: item.id));

                        },
                        child: Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    // fromLTRB
                                    Colors.transparent,
                                    Colors.black,
                                    Colors.black,
                                    Colors.transparent,
                                  ],
                                  stops: [0, 0.3, 0.5, 1],
                                ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                                );
                              },
                              blendMode: BlendMode.dstIn,
                              child: CachedNetworkImage(
                                height: 560.0,
                                width:double.infinity,
                                imageUrl: MoviesApiConstance.imageUrl(item.backdropPath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          color: Colors.redAccent,
                                          size: 16.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          AppString.NowPlaying.toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 16.0,

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16.0),
                                    child: Text(
                                      item.title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              );
              case RequestStates.error:
              print("error");
              return SizedBox(
                  height: 400,
                  child: Center(child:Text(state.nowPlayingMessage)));
          }
        }
      },
    );
  }
}

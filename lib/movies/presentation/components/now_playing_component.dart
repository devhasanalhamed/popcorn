import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/network/api_constants.dart';
import 'package:popcorn/core/services/size_config.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/movies/presentation/controller/movies_bloc.dart';
import 'package:popcorn/movies/presentation/controller/movies_state.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingMoviesState != current.nowPlayingMoviesState,
      builder: (context, state) {
        switch (state.nowPlayingMoviesState) {
          case RequestState.loading:
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade800,
              highlightColor: Colors.amber,
              child: Container(
                width: double.infinity,
                height: SizeConfig.safeBlockVertical! * 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 3,
                  ),
                ),
                child: const Center(
                  child: Text('Loading'),
                ),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: SizeConfig.safeBlockVertical! * 45,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.nowPlayingMovies.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        /// TODO : NAVIGATE TO MOVIE DETAILS
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
                              height: SizeConfig.safeBlockVertical! * 45,
                              imageUrl:
                                  ApiConstants.imageUrl(item.backdropPath),
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
                                        'Now Playing'.toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
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
                                      color: Colors.white,
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
          case RequestState.error:
            return Container(
              width: double.infinity,
              height: SizeConfig.safeBlockVertical! * 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 3,
                  color: const Color.fromARGB(255, 180, 40, 40),
                ),
              ),
              child: Center(
                child: Text(
                  state.nowPlayingMessage,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 180, 40, 40),
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}

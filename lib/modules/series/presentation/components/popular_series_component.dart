import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/constants/api_constants.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/modules/series/presentation/controller/bloc/series_bloc.dart';
import 'package:popcorn/modules/series/presentation/controller/bloc/series_state.dart';
import 'package:shimmer/shimmer.dart';

class PopularSeriesComponent extends StatelessWidget {
  const PopularSeriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesState>(
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.loading:
            return SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.done:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularSeries.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularSeries[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 170,
              child: Center(
                child: Text('Error has been occured.'),
              ),
            );
        }
      },
    );
  }
}

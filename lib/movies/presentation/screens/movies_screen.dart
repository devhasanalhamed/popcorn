import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/services/services_locator.dart';
import 'package:popcorn/movies/presentation/controller/movies_bloc.dart';
import 'package:popcorn/movies/presentation/controller/movies_event.dart';
import 'package:popcorn/movies/presentation/controller/movies_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('${MoviesBloc(sl()).hashCode}');
    return BlocProvider(
      create: (context) => MoviesBloc(sl())..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          log('$state');
          return const Scaffold();
        },
      ),
    );
  }
}

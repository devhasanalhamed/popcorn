import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/modules/home/components/profile_component.dart';
import 'package:popcorn/modules/home/controller/home_screen_bloc.dart';
import 'package:popcorn/modules/home/controller/home_screen_event.dart';
import 'package:popcorn/modules/home/controller/home_screen_state.dart';
import 'package:popcorn/modules/movies/presentation/screens/movies_screen.dart';
import 'package:popcorn/modules/series/presentation/screens/series_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [MoviesScreen(), SeriesScreen(), ProfileComponent()];
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          return Scaffold(
            body: pages[state.index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.index,
              onTap: (value) => context
                  .read<HomeScreenBloc>()
                  .add(UpdateHomeScreenIndexEvent(index: value)),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.movie), label: 'Movies'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.live_tv), label: 'Series'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile')
              ],
            ),
          );
        },
      ),
    );
  }
}

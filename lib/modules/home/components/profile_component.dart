import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/global/theme/controller/theme_bloc.dart';
import 'package:popcorn/core/global/theme/controller/theme_event.dart';
import 'package:popcorn/core/global/theme/controller/theme_state.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Center(
          child: Switch(
            value: state.isDark,
            onChanged: (value) {
              context.read<ThemeBloc>().add(ChangeThemeEvent());
            },
          ),
        );
      },
    );
  }
}

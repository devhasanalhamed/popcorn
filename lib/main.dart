import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:popcorn/core/global/theme/controller/theme_bloc.dart';
import 'package:popcorn/core/global/theme/controller/theme_state.dart';
import 'package:popcorn/core/services/local_storage_service.dart';
import 'package:popcorn/core/services/services_locator.dart';
import 'package:popcorn/core/utils/app_strings.dart';
import 'package:popcorn/modules/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.init();
  LocalStorageService.init();

  await dotenv.load(fileName: '.env');
  runApp(
    BlocProvider(
      create: (context) => sl<ThemeBloc>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      buildWhen: (previous, current) => previous.isDark != current.isDark,
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          theme: state.themeData,
          home: const HomeScreen(),
        );
      },
    );
  }
}

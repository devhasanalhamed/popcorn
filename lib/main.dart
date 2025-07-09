import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:popcorn/core/services/services_locator.dart';
import 'package:popcorn/core/utils/app_strings.dart';
import 'package:popcorn/modules/series/presentation/screens/series_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.init();

  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Colors.grey.shade900),
      home: const SeriesScreen(),
    );
  }
}

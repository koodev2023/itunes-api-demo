import 'package:easy_localization/easy_localization.dart';

import 'models/result.dart';
import 'view_models/favorite_view_model.dart';
import 'view_models/search_view_model.dart';
import 'views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ResultAdapter());

  await Hive.openBox('resultBox');

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en', 'US'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      ],
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchViewModel>(
          create: (context) => SearchViewModel(),
        ),
        ChangeNotifierProvider<FavoriteViewModel>(
          create: (context) => FavoriteViewModel(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'iTunes Search',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
        home: const HomeView(),
      ),
    );
  }
}

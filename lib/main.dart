import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:match_dating/auth/views_models/auth_view_model.dart';
import 'package:match_dating/chat/views_models/chat_view_model.dart';
import 'package:match_dating/crushes/views_models/crushes_view_model.dart';
import 'package:match_dating/home/views_models/home_view_model.dart';
import 'package:match_dating/init/views_models/init_view_model.dart';
import 'package:match_dating/localization/localization.dart';
import 'package:match_dating/routes.dart';
import 'package:match_dating/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';
import 'localization/localization_const.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      print("This is the local");
      print(locale);
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.brown),
    );
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => InitViewModel()),
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => HomeViewModel()),
          ChangeNotifierProvider(create: (_) => ChatViewModel()),
          ChangeNotifierProvider(create: (_) => CrushesViewModel()),
        ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: primaryColor,
          fontFamily: "Montserrat",
        ),
        navigatorKey: navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
        debugShowCheckedModeBanner: false,
        locale: _locale,
        supportedLocales: const [
          Locale('en'),
          Locale('fr'),
          Locale('hi'),
          Locale('id'),
          Locale('zh'),
          Locale('ar'),
        ],
        localizationsDelegates: const [
          DemoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          MonthYearPickerLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale?.languageCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }
}
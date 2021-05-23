import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/page/home_page.dart';
import 'package:technocrats/utils/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hackon With Amazon',
        theme: ThemeData(
          fontFamily: "Cairo",
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor),
          colorScheme: ColorScheme.light(),
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.indigoAccent.withOpacity(0.8),
          unselectedWidgetColor: Colors.indigo[900],
          switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        home: HomePage(),
      );
}

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
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 9)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
        } else {
          return MaterialApp(
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
      },
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "assets/images/launch/govid.gif",
          //height: MediaQuery.of(context).size.height,
          //width: MediaQuery.of(context).size.width)
        ),
        /*Icon(
          Icons.apartment_outlined,
          size: MediaQuery.of(context).size.width * 0.785,
        ),*/
      ),
    );
  }
}

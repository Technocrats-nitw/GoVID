import 'package:technocrats/mutations/theme_mutation.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/utils/routes.dart';
import 'package:technocrats/utils/themes/theme.dart';
import 'package:technocrats/views/home/home_screen.dart';
import 'package:technocrats/views/home/treating_covid_screen.dart';
import 'package:technocrats/views/hospital/hospital_screen.dart';
import 'package:technocrats/views/links/crowdfunding.dart';
import 'package:technocrats/views/links/link_screen.dart';
import 'package:technocrats/views/links/twitter_screen.dart';
import 'package:technocrats/views/medicine/medicine_screen.dart';
import 'package:technocrats/views/oxygen/oxygen_screen.dart';
import 'package:technocrats/views/plasma/add_plasma_screen.dart';
import 'package:technocrats/views/plasma/plasma_screen.dart';

import '../pkgs.dart';

class App extends StatelessWidget {
  final _delegate = VxNavigator(routes: {
    Routes.homeRoute: (_, __) => MaterialPage(child: HomeScreen()),
    Routes.plasmaRoute: (_, __) => MaterialPage(child: PlasmaScreen()),
    Routes.hospitalRoute: (_, __) => MaterialPage(child: HospitalScreen()),
    Routes.oxygenRoute: (_, __) => MaterialPage(child: OxygenScreen()),
    Routes.linkRoute: (_, __) => MaterialPage(child: LinkScreen()),
    Routes.medicineRoute: (_, __) => MaterialPage(child: MedicineScreen()),
    Routes.twitterSearchRoute: (_, __) =>
        MaterialPage(child: Scaffold(body: TwitterScreen())),
    Routes.crowdFundingRoute: (_, __) => MaterialPage(
        child: Scaffold(
            appBar: AppBar(title: Constants.crowdFunding.text.make()),
            body: CrowdFunding())),
    Routes.treatingCovidRoute: (_, __) =>
        MaterialPage(child: TreatingCovidScreen()),
    Routes.addPlasmaRoute: (_, __) => MaterialPage(child: AddPlasmaScreen()),
  });

  @override
  Widget build(BuildContext context) {
    final Store store = VxState.store;
    store.navigator = _delegate;
    return VxBuilder(
      mutations: {ThemeMutation},
      builder: (context, _) => MaterialApp.router(
        routerDelegate: _delegate,
        routeInformationParser: VxInformationParser(),
        debugShowCheckedModeBanner: false,
        theme: store.isDarkTheme
            ? AppTheme.darkTheme(context)
            : AppTheme.lightTheme(context),
      ),
    );
  }
}

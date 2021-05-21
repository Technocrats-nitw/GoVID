import 'package:technocrats/core/models/cities.dart';
import 'package:technocrats/core/models/external_links.dart';
import 'package:technocrats/core/models/hospital_beds.dart';
import 'package:technocrats/core/models/medicine.dart';
import 'package:technocrats/core/models/oxygen_suppliers.dart';
import 'package:technocrats/core/models/stats.dart';
import 'package:technocrats/core/models/version_checker.dart';
import 'package:velocity_x/velocity_x.dart';

import 'models/donors.dart';

class Store extends VxStore {
  // App Settings
  late VxNavigator navigator;
  bool isDarkTheme = false;

  //Home
  int selectedIndex = 0;

  // Data
  late Stats stats;
  late List<Donors> donors;
  late List<HospitalBeds> beds;
  late List<OxygenSupplier> oxygenSuppliers;
  late List<MedicineSupply> medicineSupplies;
  late List<City> cities;
  late List<ExternalLinks> externalLinks;
  late VersionChecker versionChecker;
}

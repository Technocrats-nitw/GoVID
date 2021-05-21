import 'package:technocrats/core/models/cities.dart';
import 'package:technocrats/core/models/donors.dart';
import 'package:technocrats/core/models/external_links.dart';
import 'package:technocrats/core/models/hospital_beds.dart';
import 'package:technocrats/core/models/medicine.dart';
import 'package:technocrats/core/models/oxygen_suppliers.dart';
import 'package:technocrats/core/models/stats.dart';
import 'package:technocrats/core/models/version_checker.dart';
import 'package:technocrats/pkgs.dart';
import 'package:technocrats/services/api/api_effect.dart';
import 'package:technocrats/services/api/apis.dart';

final APIService _apiService = APIService();

loadAllAPIs() async {
  StatsMutation();
  CheckVersionMutation();
  CityMutation();
}

class StatsMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() async {
    return await _apiService.getStats();
  }

  @override
  void success(result) {
    store.stats = Stats.fromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

class DonorsMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() async {
    return await _apiService.getDonors();
  }

  @override
  void success(result) {
    store.donors = donorsFromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

class HospitalBedsMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() async {
    return await _apiService.getHospitalBeds();
  }

  @override
  void success(result) {
    store.beds = hospitalBedsFromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

class OxygenMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() async {
    return await _apiService.getOxygenSuppliers();
  }

  @override
  void success(result) {
    store.oxygenSuppliers = oxygenSupplierFromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

class MedicinesMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() async {
    return await _apiService.getMedicineSupplies();
  }

  @override
  void success(result) {
    store.medicineSupplies = medicineSupplyFromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

class CityMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() async {
    return await _apiService.getCities();
  }

  @override
  void success(result) {
    store.cities = cityFromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }

  static String getCity(Store store, int cityId) {
    return store.cities
        .firstWhere(
          (c) => c.id == cityId,
          orElse: () => null,
        )
        ?.name;
  }
}

class ExternalLinksMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() async {
    return await _apiService.getExternalLinks();
  }

  @override
  void success(result) {
    store.externalLinks = externalLinksFromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

class CheckVersionMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() async {
    return await _apiService.checkVersion();
  }

  @override
  void success(result) {
    store.versionChecker = versionCheckerFromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

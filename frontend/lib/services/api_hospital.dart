/*
Author :
Sufiyan Ansari
Anshuman Mishra
NIT Warangal
*/
import 'package:http/http.dart' as http;
import 'package:technocrats/utils/constants.dart';
import 'dart:convert';
import 'package:technocrats/model/hospital_info.dart';

class API_hospital {
  Future<HospitalModel> getHospital(String cityName) async {
    var client = http.Client();
    var hospitalModel = null;

    var response = await client.get(Uri.parse(
        "https://technocrats.pythonanywhere.com/api/hospital/city/$cityName"));
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        hospitalModel = HospitalModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return hospitalModel;
    }

    return hospitalModel;
  }
}

import 'package:http/http.dart' as http;
import 'package:technocrats/constants.dart';
import 'dart:convert';
import 'package:technocrats/model/doctor_info.dart';

class API_doctor {
  Future<DoctorModel> getDoctors(String cityName) async {
    var client = http.Client();
    var doctorModel = null;

    var response = await client.get(Uri.parse('http://technocrats.pythonanywhere.com/api/doctor/city/$cityName'));
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        doctorModel = DoctorModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      //catch all exception=> here we can be specific though yet it's better this way
      return doctorModel;
    }

    return doctorModel;
  }
}

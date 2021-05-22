// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

List<DoctorModel> doctorModelFromJson(String str) => List<DoctorModel>.from(
    json.decode(str).map((x) => DoctorModel.fromJson(x)));

String doctorModelToJson(List<DoctorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorModel {
  DoctorModel({
    this.id,
    this.uprnNo,
    this.name,
    this.age,
    this.yearDob,
    this.gender,
    this.specialisation,
    this.location,
    this.state,
    this.isUser,
    this.email,
  });

  int id;
  int uprnNo;
  String name;
  int age;
  int yearDob;
  String gender;
  String specialisation;
  String location;
  String state;
  bool isUser;
  String email;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json["id"],
        uprnNo: json["uprn_no"],
        name: json["name"],
        age: json["age"],
        yearDob: json["year_dob"],
        gender: json["gender"],
        specialisation: json["specialisation"],
        location: json["location"],
        state: json["state"],
        isUser: json["isUser"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uprn_no": uprnNo,
        "name": name,
        "age": age,
        "year_dob": yearDob,
        "gender": gender,
        "specialisation": specialisation,
        "location": location,
        "state": state,
        "isUser": isUser,
        "email": email,
      };
}

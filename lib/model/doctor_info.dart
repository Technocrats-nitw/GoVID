// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

DoctorModel doctorModelFromJson(String str) =>
    DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  DoctorModel({
    this.itemCount,
    this.item,
  });

  int itemCount;
  List<Item> item;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        itemCount: json["ItemCount"],
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ItemCount": itemCount,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class Item {
  Item({
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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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

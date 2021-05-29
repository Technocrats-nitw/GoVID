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
    this.message,
    this.item,
  });

  int itemCount;
  String message;
  List<Item> item;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        itemCount: json["ItemCount"],
        message: json["message"],
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ItemCount": itemCount,
        "message": message,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.type,
    this.uprnNo,
    this.name,
    this.email,
    this.contact,
    this.url,
    this.image,
    this.locality,
    this.city,
    this.latitude,
    this.longitude,
    this.priceRange,
    this.experience,
    this.isUser,
    this.speciality,
  });

  int id;
  Type type;
  int uprnNo;
  String name;
  Email email;
  String contact;
  String url;
  String image;
  String locality;
  String city;
  String latitude;
  String longitude;
  int priceRange;
  int experience;
  bool isUser;
  String speciality;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        type: typeValues.map[json["type"]],
        uprnNo: json["uprn_no"],
        name: json["name"],
        email: emailValues.map[json["email"]],
        contact: json["contact"],
        url: json["url"],
        image: json["image"],
        locality: json["locality"],
        city: json["city"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        priceRange: json["priceRange"],
        experience: json["experience"],
        isUser: json["isUser"],
        speciality: json["speciality"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "uprn_no": uprnNo,
        "name": name,
        "email": emailValues.reverse[email],
        "contact": contact,
        "url": url,
        "image": image,
        "locality": locality,
        "city": city,
        "latitude": latitude,
        "longitude": longitude,
        "priceRange": priceRange,
        "experience": experience,
        "isUser": isUser,
        "speciality": speciality,
      };
}

enum Email { ADDSUFIYAN_GMAIL_COM }

final emailValues =
    EnumValues({"addsufiyan@gmail.com": Email.ADDSUFIYAN_GMAIL_COM});

enum Type { PHYSICIAN, DENTIST }

final typeValues =
    EnumValues({"Dentist": Type.DENTIST, "Physician": Type.PHYSICIAN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

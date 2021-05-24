// To parse this JSON data, do
//
//     final hospitalModel = hospitalModelFromJson(jsonString);

import 'dart:convert';

HospitalModel hospitalModelFromJson(String str) =>
    HospitalModel.fromJson(json.decode(str));

String hospitalModelToJson(HospitalModel data) => json.encode(data.toJson());

class HospitalModel {
  HospitalModel({
    this.itemCount,
    this.message,
    this.item,
  });

  int itemCount;
  String message;
  List<Item> item;

  factory HospitalModel.fromJson(Map<String, dynamic> json) => HospitalModel(
        itemCount: json["ItemCount"],
        message: json["Message"],
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ItemCount": itemCount,
        "Message": message,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.name,
    this.location,
    this.coordinates,
    this.state,
    this.district,
    this.pincode,
    this.telephone,
    this.ambulanceCount,
    this.plasmaDonorCount,
    this.email,
    this.website,
    this.specialties,
    this.stateId,
    this.districtId,
    this.oxygenCount,
    this.remedesivirCount,
    this.isVaccineCenter,
    this.avaialbleBedsCount,
  });

  int id;
  String name;
  String location;
  String coordinates;
  State state;
  String district;
  String pincode;
  String telephone;
  int ambulanceCount;
  int plasmaDonorCount;
  String email;
  String website;
  String specialties;
  int stateId;
  int districtId;
  int oxygenCount;
  int remedesivirCount;
  bool isVaccineCenter;
  int avaialbleBedsCount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        coordinates: json["coordinates"],
        state: stateValues.map[json["state"]],
        district: json["district"],
        pincode: json["pincode"],
        telephone: json["telephone"],
        ambulanceCount: json["ambulance_count"],
        plasmaDonorCount: json["plasma_donor_count"],
        email: json["email"],
        website: json["website"],
        specialties: json["specialties"],
        stateId: json["stateID"],
        districtId: json["districtID"],
        oxygenCount: json["oxygenCount"],
        remedesivirCount: json["remedesivirCount"],
        isVaccineCenter: json["isVaccineCenter"],
        avaialbleBedsCount: json["avaialbleBedsCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "coordinates": coordinates,
        "state": stateValues.reverse[state],
        "district": district,
        "pincode": pincode,
        "telephone": telephone,
        "ambulance_count": ambulanceCount,
        "plasma_donor_count": plasmaDonorCount,
        "email": email,
        "website": website,
        "specialties": specialties,
        "stateID": stateId,
        "districtID": districtId,
        "oxygenCount": oxygenCount,
        "remedesivirCount": remedesivirCount,
        "isVaccineCenter": isVaccineCenter,
        "avaialbleBedsCount": avaialbleBedsCount,
      };
}

enum State { UTTAR_PRADESH_UP }

final stateValues = EnumValues({"Uttar Pradesh UP": State.UTTAR_PRADESH_UP});

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

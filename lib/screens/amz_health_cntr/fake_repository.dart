import 'package:technocrats/model/data_model.dart';

class FakeRepository {
  static List<DataModel> data = [
    DataModel(
        serviceName: "Oxygen Cylinders : 75",
        time: "9:58 AM",
        date: "Sun, 30 May"),
    DataModel(
        serviceName: "RTPC Testing Kits :108",
        time: "9:58 PM",
        date: "Mon, 31 Aug"),
    DataModel(
        serviceName: "First Aid Kits : 92",
        time: "10:12 AM",
        date: "Sun, 23 May"),
    DataModel(
        serviceName: "PPE Kits : 297", time: "3:30 AM", date: "Sat, 29 May"),
    DataModel(
        serviceName: "Glucometer : 45", time: "9:58 PM", date: "Mon, 31 Aug"),
    DataModel(
        serviceName: "Oximeter : 43", time: "9:58 PM", date: "Mon, 31 Aug"),
    DataModel(
        serviceName: "Thermometers : 19", time: "9:58 PM", date: "Mon, 31 Aug"),
    DataModel(
        serviceName: "Sanitizer : 64", time: "9:58 PM", date: "Mon, 31 Aug"),
  ];
}

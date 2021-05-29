import 'package:flutter/material.dart';
import 'package:technocrats/model/doctor_info.dart';
import 'package:technocrats/screens/hospital_ui/DocInfo.dart';
import 'package:technocrats/services/api_doctor.dart';
import 'package:geolocator/geolocator.dart';

class doctorList extends StatefulWidget {
  @override
  _doctorListState createState() => _doctorListState();
}

class _doctorListState extends State<doctorList> {
  Future<DoctorModel> _doctorModel;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentCity;
  // variable starting with '_' means it's a private variable
  var details;
  void initState() {
    _getCurrentLocation();
    _doctorModel = API_doctor().getDoctors(_currentCity);
    super.initState();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentCity = "${place.locality}";
      });
    } catch (e) {
      print(e);
    }
  }

  String docname = "Doctorname";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Doctors Nearby"),
          backgroundColor: Color(0xFF2A0B35),
        ),
        body: Stack(
          children: <Widget>[
            //SearchBar(),
            Spacer(),
            Spacer(),
            Spacer(),
            InkWell(
              child: Container(
                child: FutureBuilder<DoctorModel>(
                  future: _doctorModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // return only if it has data

                      return ListView.builder(
                          itemCount: snapshot.data.itemCount,
                          itemBuilder: (context, index) {
                            var details = snapshot.data.item[index];
                            this.docname = details.name;
                            return Container(
                              height: 200,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 70,
                                    height: 90,
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.network(
                                          details.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    /*decoration: BoxDecoration(
                                      image: Image.network(details.image
                                          .toString()), /*DecorationImage(
                                            image: Image.network(),
                                            fit: BoxFit.cover)*/
                                    ),*/
                                  ),
                                  /*Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                        details.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),*/
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          details.name,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),

                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Container(
                                            width: 250,
                                            height: 50,
                                            child: Text(
                                              "A brief about the doctor.",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        ),
                                        //Text(details.speciality),
                                        Text("City : " + details.city),
                                        Text("Locality : " + details.locality),
                                        Text(details.email.toString()),
                                        Text("Experience : " +
                                            details.experience.toString() +
                                            " years ") //]),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                            Spacer();
                            Spacer();
                          });
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  },
                ),
              ),
              onTap: () {
                //debugPrint("CARD main clicked. redirect to details page");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DocInfoPage(
                            docname: this.docname,
                          )),
                );
              },
            )
          ],
        ));
  }

  _searchBar() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: "location...",
          ),
          onChanged: (text) {
            text = text.toLowerCase();
          },
        ));
  }
}

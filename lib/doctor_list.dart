import 'package:flutter/material.dart';
import 'package:technocrats/model/doctor_info.dart';
import 'package:technocrats/screens/hospital_ui/DocInfo.dart';
import 'package:technocrats/services/api_doctor.dart';

class doctorList extends StatefulWidget {
  @override
  _doctorListState createState() => _doctorListState();
}

class _doctorListState extends State<doctorList> {
  Future<DoctorModel> _doctorModel;
  // variable starting with '_' means it's a private variable
  var details;
  void initState() {
    _doctorModel = API_doctor().getDoctors();
    super.initState();
  }

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
                            /*return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              details.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            //Text(details.speciality),
                            Text("City : " + details.city),
                            Text("Locality : " + details.locality),
                            Text("Contacts : " + details.email.toString()),
                            Text("Experience : " +
                                details.experience.toString() +
                                " years ")
                          ],
                        ),
                      ),
                    );*/
                            return Container(
                              height: 200,
                              child: Row(
                                children: <Widget>[
                                  /*
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                details.location,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),*/
                                  Container(
                                    width: 70,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/docprofile/doc1.png'),
                                            fit: BoxFit.cover)),
                                  ),
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

                                      Container(
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
                                      //Text(details.speciality),
                                      Text("City : " + details.city),
                                      Text("Locality : " + details.locality),
                                      Text("Contacts : " +
                                          details.email.toString()),
                                      Text("Experience : " +
                                          details.experience.toString() +
                                          " years ") //]),
                                    ],
                                  ))
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
                  MaterialPageRoute(builder: (context) => DocInfoPage()),
                );
              },
            )
          ],
        ));

    /*
    Container createDocWidget(String imgName, var details) {
    return Container(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: docContentBgColor,
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/docprofile/$imgName'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Dr. $docName",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
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
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: openDocInfo,
      ),
    );*/
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

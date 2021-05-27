import 'package:flutter/material.dart';
import 'package:technocrats/model/hospital_info.dart' as hosp;
import 'package:technocrats/screens/rendered_screen/doctors.dart';
import 'package:technocrats/services/api_hospital.dart';

class hospitalList extends StatefulWidget {
  @override
  _hospitalListState createState() => _hospitalListState();
}

class _hospitalListState extends State<hospitalList> {
  Future<hosp.HospitalModel> _hospitalModel;
  // variable starting with '_' means it's a private variable
  var details;
  Future<String> docname;
  void initState() {
    _hospitalModel = API_hospital().getHospital();
    super.initState();
  }

  String hospitalname = "Hospital name";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Hospitals Nearby"),
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
                child: FutureBuilder<hosp.HospitalModel>(
                  future: _hospitalModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // return only if it has data

                      return ListView.builder(
                          itemCount: snapshot.data.itemCount,
                          itemBuilder: (context, index) {
                            var details = snapshot.data.item[index];
                            this.hospitalname = details.name;
                            return Container(
                              child: Expanded(
                                child: Row(
                                  children: <Widget>[
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
                                    Flexible(
                                      child: Container(
                                        child: SingleChildScrollView(
                                            child: Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                details.name,
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                              //Text(details.speciality),
                                              Text(
                                                "District : " +
                                                    details.district,
                                                overflow: TextOverflow.clip,
                                              ),
                                              Text(
                                                "Location : " +
                                                    details.location,
                                                overflow: TextOverflow.clip,
                                              ),
                                              Text(
                                                "State : " +
                                                    details.state.toString(),
                                                overflow: TextOverflow.clip,
                                              ),
                                              Text("Contacts : "),
                                              Text(
                                                details.email.toString(),
                                                overflow: TextOverflow.clip,
                                              ),
                                              Text(
                                                details.telephone,
                                                overflow: TextOverflow.clip,
                                              ),
                                              Text(
                                                details.website,
                                                overflow: TextOverflow.clip,
                                              ),

                                              Flexible(
                                                child: Container(
                                                  child: Text(
                                                    "Speciality : " +
                                                        details.specialties,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Oxygen Count : " +
                                                    details.oxygenCount
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                                overflow: TextOverflow.clip,
                                              ),
                                              Text(
                                                "Remdesivir Count : " +
                                                    details.remedesivirCount
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                                overflow: TextOverflow.clip,
                                              ),
                                              Text(
                                                "Vaccine Center : " +
                                                    (details.isVaccineCenter
                                                                .toString() ==
                                                            "true"
                                                        ? "YES"
                                                        : "NO"),
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                                overflow: TextOverflow.clip,
                                              ),
                                              Text(
                                                "Available Beds : " +
                                                    details.avaialbleBedsCount
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                                overflow: TextOverflow.clip,
                                              ),
                                              SizedBox(height: 25),
                                            ],
                                          ),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
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
                  MaterialPageRoute(builder: (context) => doctorList()),
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

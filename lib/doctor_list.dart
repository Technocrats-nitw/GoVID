import 'package:flutter/material.dart';
import 'package:technocrats/models/doctor_info.dart';
import 'package:technocrats/services/api_manager.dart';

class doctorList extends StatefulWidget {
  @override
  _doctorListState createState() => _doctorListState();
}

class _doctorListState extends State<doctorList> {
  Future<DoctorModel> _doctorModel;
  // variable starting with '_' means it's a private variable

  void initState() {
    _doctorModel = API_Manager().getDoctors();
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
      body: Container(
        child: FutureBuilder<DoctorModel>(
          future: _doctorModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return only if it has data
              return ListView.builder(
                  itemCount: snapshot.data.itemCount,
                  itemBuilder: (context, index) {
                    var details = snapshot.data.item[index];
                    return Container(
                      height: 200,
                      child: Row(
                        children: <Widget>[
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
                          ),
                          SingleChildScrollView(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //Container(child: [
                              Text(
                                details.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text("Specialization : " +
                                  details.specialisation.toString()),
                              Text("State : " + details.state),
                              Text("Age : " + details.age.toString()),
                              Text("Gender : " + details.gender),
                              Text("DOB :" + details.yearDob.toString()),
                              Text(details.uprnNo.toString()),
                              Text("Contact : ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                details.email,
                                overflow: TextOverflow.ellipsis,
                              ),
                              //]),
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
    );
  }
}

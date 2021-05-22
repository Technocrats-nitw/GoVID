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
      appBar: AppBar(
        title: Text("Doctors Nearby"),
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

                    /*var id = snapshot.data.,
                        uprnNo = snapshot.data.uprnNo,
                        age = snapshot.data.age,
                        yearDob = snapshot.data.yearDob;
                    var isUser = snapshot.data.isUser;
                    var name = snapshot.data.name,
                        gender = snapshot.data.gender,
                        specialisation = snapshot.data.specialisation,
                        location = snapshot.data.location,
                        state = snapshot.data.state,
                        email = snapshot.data.email;
                    */
                    return Container(
                      height: 100,
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
                          Column(
                            children: <Widget>[
                              Text(details.name),
                              //Text(age),
                              Text(details.age.toString()),
                              Text(details.specialisation.toString()),
                            ],
                          )
                        ],
                      ),
                    );
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

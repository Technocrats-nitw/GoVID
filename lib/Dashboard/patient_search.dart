import 'package:technocrats/screens/mock_data.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/screens/doctorapp/account.dart';

import '../pkgs.dart';

class PatientSearch extends StatelessWidget {
  final ValueNotifier<String> keyword = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    // final Store store = VxState.store;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2A0B35),
          //title: Text('Side menu'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Constants.patientSearch.text.xl3.semiBold.center.make(),
            20.heightBox,
            Constants.selectPatient.text.xl.semiBold.center.make(),
            ValueListenableBuilder(
              valueListenable: keyword,
              builder: (context, value, child) {
                return [
                  Autocomplete<String>(
                    displayStringForOption: (option) => option,
                    fieldViewBuilder: (context, textEditingController,
                            focusNode, onFieldSubmitted) =>
                        TextField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Name "),
                    ),
                    optionsBuilder: (textEditingValue) {
                      if (textEditingValue.text == '') {
                        return [];
                      }
                      return patients.where((String option) {
                        return option
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    onSelected: (String selection) {
                      keyword.value = selection;
                    },
                  ).p32(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Account()),
                      );
                    },
                    child: new Text('Find Patient'),
                  ),
                ].vStack();
              },
            ),
          ],
        ).hFull(context).centered());
  }
}

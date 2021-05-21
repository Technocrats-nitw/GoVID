import 'package:flutter/cupertino.dart';
import 'package:technocrats/mutations/get_apis_mutation.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/views/common/error_page.dart';
import 'package:technocrats/views/plasma/donors_list.dart';

import '../../pkgs.dart';

class PlasmaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DonorsMutation();
    final Store store = VxState.store;
    return Scaffold(
      appBar: AppBar(
        title: Constants.plasmaDonors.text.xl2.semiBold.make(),
      ),
      body: VxBuilder(
          builder: (context, status) {
            if (status == VxStatus.none) {
              print("loaded");
              return const CupertinoActivityIndicator().centered();
            } else if (status == VxStatus.success) {
              return DonorsList(donors: store.donors);
            } else if (status == VxStatus.error) {
              return ErrorPage();
            }
            return Constants.wentWrong.text.xl2.semiBold.makeCentered();
          },
          mutations: {DonorsMutation}),
    );
  }
}

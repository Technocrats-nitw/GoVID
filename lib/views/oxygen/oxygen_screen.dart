import 'package:flutter/cupertino.dart';
import 'package:technocrats/mutations/get_apis_mutation.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/views/common/error_page.dart';

import '../../pkgs.dart';
import 'oxygen_list.dart';

class OxygenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OxygenMutation();
    final Store store = VxState.store;
    return Scaffold(
      appBar: AppBar(
        title: Constants.oxygenSuppliers.text.xl2.semiBold.make(),
      ),
      body: VxBuilder(
          builder: (context, status) {
            if (status == VxStatus.none) {
              print("loaded");
              return const CupertinoActivityIndicator().centered();
            } else if (status == VxStatus.success) {
              return OxygenList(suppliers: store.oxygenSuppliers);
            } else if (status == VxStatus.error) {
              return ErrorPage();
            }
            return Constants.wentWrong.text.xl2.semiBold.makeCentered();
          },
          mutations: {OxygenMutation}),
    );
  }
}

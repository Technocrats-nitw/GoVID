import 'package:technocrats/pkgs.dart';

class BottomBarMutation extends VxMutation<Store> {
  final int index;

  BottomBarMutation(this.index);
  @override
  perform() {
    store.selectedIndex = index;
  }
}

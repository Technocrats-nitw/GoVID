import 'package:technocrats/core/store.dart';
import 'package:technocrats/pkgs.dart';

class ThemeMutation extends VxMutation<Store> {
  final bool isDarkMode;
  ThemeMutation(this.isDarkMode);
  @override
  perform() {
    store.isDarkTheme = isDarkMode;
  }
}

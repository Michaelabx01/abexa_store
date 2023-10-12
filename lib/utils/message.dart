import 'package:flutter/cupertino.dart';

class CartNotifier extends ChangeNotifier {
  void shouldRefresh() {
    notifyListeners();
  }
}

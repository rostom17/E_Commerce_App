import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  int _count = 1;

  void increment () {
    _count += 1;
    update();
  }

  void decrement () {
    if(_count > 1) {
      _count -= 1;
    }
    update();
  }

  int get itemCount => _count;
}
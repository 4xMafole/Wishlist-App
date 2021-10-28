import 'package:get/get.dart';

class Item {
  int id;
  String name;
  double price;
  RxBool isWishlisted;

  Item(
      {required this.id,
      required this.name,
      required this.price,
      required this.isWishlisted});
}

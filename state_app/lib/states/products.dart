import 'dart:math';

import 'package:get/get.dart';
import 'package:state_app/models/item.dart';

class Products extends GetxController {
  RxList<Item> _items = List.generate(
      100,
      (index) => Item(
          id: index,
          name: 'Product $index',
          price: Random().nextDouble() * 100,
          isWishlisted: false.obs)).obs;

  List<Item> get items {
    return [..._items];
  }

  List<Item> get wishListedItems {
    return _items.where((item) => item.isWishlisted.value == true).toList();
  }

  void addItem(int id) {
    currentIndex(id, true);
  }

  void removeItem(int id) {
    currentIndex(id, false);
  }

  void currentIndex(int id, bool wishlist) {
    int index = _items.indexWhere((element) => element.id == id);
    _items[index].isWishlisted.value = wishlist;
  }
}

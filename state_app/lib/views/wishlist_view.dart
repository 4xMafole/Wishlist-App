import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_app/states/products.dart';

class Wishlist extends StatelessWidget {
  final Products _productsController = Get.find<Products>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wishlist'),
        ),
        body: Obx(() => ListView.builder(
            itemCount: _productsController.wishListedItems.length,
            itemBuilder: (context, index) {
              final item = _productsController.wishListedItems[index];

              return Card(
                key: ValueKey(item.id),
                margin: EdgeInsets.all(5),
                color: Colors.blue[200],
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      item.isWishlisted.value = false;
                      _productsController.removeItem(item.id);
                    },
                  ),
                ),
              );
            })));
  }
}

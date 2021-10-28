import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_app/states/products.dart';
import 'package:state_app/views/wishlist_view.dart';

class HomeView extends StatelessWidget {
  final Products _products = Get.put(Products());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Getx States'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
              width: 300,
              height: 90,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Obx(
                () => Text('WishListed ${_products.wishListedItems.length}',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            onTap: () => Get.to(Wishlist()),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: _products.items.length,
                  itemBuilder: (context, index) {
                    final product = _products.items[index];

                    return Card(
                      key: ValueKey(product.id),
                      margin: const EdgeInsets.all(5),
                      color: Colors.amberAccent,
                      child: ListTile(
                        title: Text(product.name),
                        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                        trailing: Obx(
                          () => IconButton(
                            onPressed: () {
                              if (product.isWishlisted.value == false) {
                                _products.addItem(product.id);
                              } else {
                                _products.removeItem(product.id);
                              }
                            },
                            icon: Icon(Icons.favorite),
                            color: product.isWishlisted.value
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

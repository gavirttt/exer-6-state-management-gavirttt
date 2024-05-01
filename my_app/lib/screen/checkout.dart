import 'package:flutter/material.dart';
import 'package:my_app/model/item.dart';
import "package:provider/provider.dart";
import "package:my_app/provider/shoppingcart_provider.dart";

// class for checkout page
class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // call getter for items in cart
          const Center(child: Text("Item Details")),
          getItems(context),
        ],
      ),
    );
  }


// getter for items in cart
  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    // what to display based on the contents of the products list
    if(products.isEmpty){
      return const Text('\nNo Items to checkout!');
    } else {
      return Expanded(
        child: Column(
        children: [
          Flexible(
              child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(products[index].name),
                  trailing: Text("${products[index].price}")
                );
              },
            )
          ),
          Expanded(
            child: Column(
              children: [
                // shows the total cost of items in cart
                computeCost(),
                ElevatedButton(
                  onPressed: () {
                      context.read<ShoppingCart>().removeAll();
                      Navigator.pushNamed(context, "/products");
                      ScaffoldMessenger.of(context).showSnackBar( 
                        const SnackBar(
                          content: Text("Payment successful!"),
                          duration: Duration(seconds: 1, milliseconds: 100),
                        )
                      );
                  },
                  child: const Text("Pay Now!")
                ),
              ]
            )
          )
        ],
      ));
    }
  }


// getter for total cost of items in cart
  Widget computeCost() {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return Text("Total Cost to Pay: ${cart.cartTotal}");
    });
  }
}
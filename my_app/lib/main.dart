import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/screen/mycart.dart';
import 'package:my_app/screen/mycatalog.dart';
import 'package:my_app/screen/checkout.dart';
import 'provider/shoppingcart_provider.dart';

// multiprovider from provider package
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ShoppingCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/cart": (context) => const MyCart(), // page route for cart page
        "/products": (context) => const MyCatalog(), // page route for catalog page
        "/checkout": (context) => const CheckoutPage(), // page route for checkout page
      },
      home: const MyCatalog(),
    );
  }
}
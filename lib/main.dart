import 'package:flutter/material.dart';
import 'package:flutterintroduction2/models/cart.dart';
import 'package:flutterintroduction2/models/catalog.dart';
import 'package:flutterintroduction2/screens/cart.dart';
import 'package:flutterintroduction2/screens/catalog.dart';
import 'package:flutterintroduction2/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel?>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart?.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginWidget(),
          '/catalog': (context) => const CatalogWidget(),
          '/cart': (context) => const CartWidget(),
        },
      ),
    );
  }
}

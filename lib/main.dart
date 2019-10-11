import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider_one.dart';
import 'package:provider_demo/home_page.dart';
import 'package:provider_demo/shop_cart_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: 48),
        ChangeNotifierProvider.value(value: CounterModel()),
        ChangeNotifierProvider.value(value: ShopCartModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/home/presentation/views/home_view.dart';
import 'features/detail/presentation/views/detail_view.dart';
import 'features/menu/presentation/views/menu_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RealEstate UI Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => HomeView()),
        GetPage(name: '/detail', page: () => DetailView()),
        GetPage(name: '/menu', page: () => MenuView()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

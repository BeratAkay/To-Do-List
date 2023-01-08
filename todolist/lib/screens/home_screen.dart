import 'package:flutter/material.dart';
import 'package:todolist/helpers/drawer_navigation.dart';
import 'package:todolist/src/app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('to do list')
      ),
      drawer: DrawerNavigation() ,
    );
  }
}

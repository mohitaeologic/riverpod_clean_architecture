
import 'package:flutter/material.dart';
import '../constants/string_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.white,
          title:  const Text(
            StringConstants.applicationHeading,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: const Center(child: Text(StringConstants.loggedIn,style: TextStyle(color: Colors.blue),),));
  }
}

import 'package:flutter/material.dart';


void main(){
  runApp(Medicinas());
}

class Medicinas extends StatelessWidget {
  const Medicinas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MEDICINAS'),
      ),
      body: Container(),
    );
  }
}
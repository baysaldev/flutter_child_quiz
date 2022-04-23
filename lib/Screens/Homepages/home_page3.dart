// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_child_quiz/Screens/Oyunekranlari/sekiller.dart';

class HomePage3 extends StatelessWidget {
  const HomePage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => Sekiller())));
          },
          child: Container(
            width: 250,
            height: 45,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                "Şekiller Testine Başla",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

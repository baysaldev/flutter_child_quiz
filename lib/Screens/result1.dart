// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_child_quiz/Screens/oyun_menu.dart';
import 'package:flutter_child_quiz/Screens/Oyunekranlari/sayilar.dart';

class Result1 extends StatefulWidget {
  int? score, totalQuestion, correct, incorrect, notattempted;
  Result1(
      {this.score,
      this.totalQuestion,
      this.correct,
      this.incorrect,
      this.notattempted});

  @override
  State<Result1> createState() => _ResultState();
}

class _ResultState extends State<Result1> {
  String greeting = "";

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    var percentage = (widget.score! / (widget.totalQuestion! * 10)) * 100;
    if (percentage >= 90) {
      greeting = "ÇOK İYİ";
    } else if (percentage >= 80 && percentage < 90) {
      greeting = "İYİ";
    } else if (percentage >= 70 && percentage < 80) {
      greeting = "ORTA";
    } else if (percentage < 70) {
      greeting = "GELİŞTİRMELİ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$greeting",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Puanın ${widget.score}  /  ${widget.totalQuestion! * 10} Üzerinden",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${widget.correct} Doğru , ${widget.incorrect} Yanlış , ${widget.notattempted} Boş",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Sayilar())));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 54),
                child: Text(
                  "Testi Şimdi Tekrar Oynat",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => OyunMenu())));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 54),
                child: Text(
                  "OYUN MENÜSÜNE DÖN",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.blue, width: 2)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

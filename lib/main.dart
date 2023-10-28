// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: DateApp(),
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({super.key});

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
  String weekday = "";
  String year = "";
  String day = "";
  String month = "";
  int hour = 0;
  String second = "";
  String minute = "";
  String welcome = "";


    //  فنكشون بدخلها تيمر يعمل الي مالانهاية وداخل التايمر قيمة كل متغير بالوقت الحالي 
    // والوقت الحالي له العديد من القيم منها اليوم والساعة والثانية والشهر والدقيقة والسنة
  changeYear() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        weekday = DateTime.now().weekday.toString();
        year = DateTime.now().year.toString();
        day = DateTime.now().day.toString();
        month = DateTime.now().month.toString();
        hour = DateTime.now().hour;
        minute = DateTime.now().minute.toString();
        second = DateTime.now().second.toString();
      });
    });
  }



  //  فنكشون بدخلها تيمر يعمل الي مالانهاية وداخل اتايمر سويتش لتغير اليوم من رقم الي اسم
  changeweekday() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        switch (weekday) {
          case "1":
            weekday = "Monday";
            break;

          case "2":
            weekday = "Tuesday";
            break;

          case "3":
            weekday = "Wednesday";
            break;

          case "4":
            weekday = "Thursday";
            break;

          case "5":
            weekday = "Friday";
            break;

          case "6":
            weekday = "Saturday";
            break;

          case "7":
            weekday = "Sunday";
            break;

          default:
            month = " مش تمام خالص ";
            break;
        }
      });
    });
  }


  //  فنكشون بدخلها تيمر يعمل الي مالانهاية وداخل اتايمر سويتش لتغير الشهر من رقم الي اسم
  changemonth() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        switch (month) {
          case "1":
            month = "January";
            break;

          case "2":
            month = "February";
            break;

          case "3":
            month = "March ";
            break;

          case "4":
            month = "April";
            break;

          case "5":
            month = "May";
            break;

          case "6":
            month = "June";
            break;

          case "7":
            month = "July";
            break;

          case "8":
            month = "August";
            break;

          case "9":
            month = "September";
            break;

          case "10":
            month = "October";
            break;

          case "11":
            month = "November";
            break;

          case "12":
            month = "December";
            break;

          default:
            month = " مش تمام خالص ";
            break;
        }
      });
    });
  }



  //  فنكشون بدخلها تيمر يعمل الي مالانهاية للطرح من عدد السعات 12 ساعه
  changehour() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (hour > 12) {
          hour = hour - 12;
        }
      });
    });
  }
  //  فونكشون بداخلها تيمر يعمل مرة وحده فقط 
  changewelcome() {
    Timer(Duration(seconds: 10), () {
      welcome = "welcome";
    });
  }

  @override
  
  //  لتشغيل الفونكشوت تلقائي عند فتح البرنامج
  void initState() {    
    // TODO: implement initState
    super.initState();
    changeYear();
    changemonth();
    changeweekday();
    changehour();
    changewelcome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Time & Date App ",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 57, 73, 80),
      ),
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's & Date is $weekday ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "$month, $day, $year",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${hour.toString().padLeft(2, "0")} : ${minute.padLeft(2, "0")} : ${second.padLeft(2, "0")}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              welcome,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './main_page_body.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool hiddenBalance = false;
  String username = 'Gor';
  String balance = '0.00֏';
  String master = 'Guest';
  Color textcolor = const Color.fromARGB(158, 0, 0, 0);
  @override
  Widget build(context) {
    return Scaffold(
      
      appBar:  AppBar(
        
            elevation: 0,
            backgroundColor: const Color.fromARGB(252, 252, 252, 255),
           actions: [
             Icon(Icons.notifications_none, color: textcolor),
             const SizedBox(width:10),
             Icon(Icons.search, color: textcolor),
             const SizedBox(width: 20)
        ],
        title: Row(children: [
          Icon(
            Icons.account_circle,
            color: textcolor,
            size: 40,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(username, style: TextStyle(color: textcolor,fontSize: 25,fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward_ios_rounded, color: textcolor),
                 
                ],
              ),
              Text(master, style: TextStyle(color: textcolor,fontSize: 15),)
            ],
          )
        ]),
      ),

      body: MainPageBody(balance),
    
    );
  }
}

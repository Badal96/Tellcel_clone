import 'package:flutter/material.dart';
import 'package:telcell_wallet/helpers/colors.dart';
import './main_body.dart';


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
  
  @override
  Widget build(context) {
    return Scaffold(
      
      appBar:  AppBar(
        
            elevation: 0,
            backgroundColor:AppColors.appLightGrey,
           actions: [
             Icon(Icons.notifications_none, color: AppColors.appBlack),
             const SizedBox(width:10),
             Icon(Icons.search, color: AppColors.appBlack),
             const SizedBox(width: 20)
        ],
        title: Row(children: [
          Container(
            height: 40,
          margin: EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 172, 172, 172),
            // color: Color(0xffF3F5F5),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            iconSize: 25,
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Color(0xff37424A),
            ),
          ),
        ),
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(username, style: TextStyle(color: AppColors.appBlack,fontSize: 25,fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward_ios_rounded, color: AppColors.appBlack),
                 
                ],
              ),
              Text(master, style: TextStyle(color: AppColors.appBlack,fontSize: 15),)
            ],
          )
        ]),
      ),

      body: MainPageBody(balance),
   
    );
  }
}

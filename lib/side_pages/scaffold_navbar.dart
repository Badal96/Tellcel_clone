 import 'package:flutter/material.dart';
 import 'package:flutter/widgets.dart';
 import 'package:go_router/go_router.dart';

import '../helpers/colors.dart';
 

class ScaffoldWithNavbar extends StatefulWidget {
final Widget body;

   const ScaffoldWithNavbar({ required this.body,super.key});

  @override
  State<ScaffoldWithNavbar> createState() => _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends State<ScaffoldWithNavbar> {
  int currentTab = 0;
  Map pages = {0 : '',1:'bon' ,2: 'qrcode',3:'banking'};
@override
Widget build (context) {
  return Scaffold( 
    body: widget.body,

    bottomNavigationBar:    BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.appOrange,
        unselectedItemColor: Colors.grey,
        elevation: 7,
        onTap: (int index) {
          setState(() {
            
            currentTab = index;

            
            context.go('/${pages[currentTab]}');
          });
        },
        currentIndex: currentTab,
        items: const [
          BottomNavigationBarItem( icon: Icon(Icons.home), label: 'Գլխավոր'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'BON'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR կոդ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.museum_sharp), label: 'Բանկինգ'),
        ],
      ),

  );
}
}
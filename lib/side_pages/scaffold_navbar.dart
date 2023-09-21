import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../helpers/colors.dart';

class ScaffoldWithNavbar extends StatefulWidget {
  final Widget body;

  const ScaffoldWithNavbar({
    required this.body,
    super.key,
  });

  @override
  State<ScaffoldWithNavbar> createState() => _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends State<ScaffoldWithNavbar> {
  int currentindex = 0;
  @override
  Widget build(context) {
    final Map<int, String> navWithindex = {
      0: '/',
      1: '/bon',
      2: '/qr_code',
      3: '/banking'
    };

    return Scaffold(
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.appOrange,
        unselectedItemColor: Colors.grey,
        elevation: 7,
        onTap: (int index) {
          setState(() {
            currentindex = index;
          });
          context.go(navWithindex[index]!);
        },
        currentIndex: currentindex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Գլխավոր'),
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

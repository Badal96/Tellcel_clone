


import 'package:flutter/material.dart';

import '../helpers/colors.dart';

Widget servoceItems(
    {required String title,
    required String imgasset,
    required Color color,
    required void Function() ontap,
    String subtitle = ''}) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          width: 100,
          child: Stack(
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                          image: AssetImage(imgasset), fit: BoxFit.fitHeight))),
              Container(
                  padding: const EdgeInsets.only(left: 5, top: 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: Colors.white)))),
              Container(
                  padding: const EdgeInsets.only(left: 5, top: 22),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(subtitle,
                          style: const TextStyle(
                              fontSize: 8, color: Colors.white)))),
            ],
          )),
    ),
  );
}

Widget offersItems(
    {required String imageAsset,
    required String title,
    required String logoAsset}) {
  return Container(
    margin: EdgeInsets.only(right: 20),
    width: 200,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: AssetImage(
              imageAsset,
            ),
            fit: BoxFit.fill)),
    child: Stack(children: [
      Align(
        alignment: Alignment.topLeft,
        child: Container(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            )),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          height: 30,
          width: 50,
          padding: const EdgeInsets.only(left: 15, bottom: 10),
          child: Image(
            image: AssetImage(logoAsset),
            fit: BoxFit.fill,
          ),
        ),
      )
    ]),
  );
}

Widget otherServicesItem({required IconData icon, required String title}) {
  return Container(
    height: 80,
    width: 80,
    margin: const EdgeInsets.only(top: 10, right: 10),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
     
      color: AppColors.appLightGrey,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 30,
          color: AppColors.appOrange,
        ),
        Text(title)
      ],
    ),
  );
}


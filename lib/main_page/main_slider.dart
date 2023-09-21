import 'package:flutter/material.dart';
import '../helpers/colors.dart';
import 'package:go_router/go_router.dart';

import 'mainpage_widgets.dart';

class MainPageSlider extends StatelessWidget {
  final String balance;
  const MainPageSlider(this.balance, {super.key});

  @override
  Widget build(context) {
    var width = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              servoceItems(
                  title: 'Տրանսպորտ',
                  imgasset: 'lib/assets/bmwimage.jpg',
                  color: const Color.fromARGB(255, 121, 72, 150),
                  subtitle: 'ուղետոմսեր',
                  ontap: () {
                    context.go('/transport');
                  }),
              servoceItems(
                  title: 'Իվենթներ',
                  imgasset: 'lib/assets/bmwimage.jpg',
                  color: Colors.purple,
                  ontap: () {}),
              servoceItems(
                  title: 'Տերմինալից',
                  imgasset: 'lib/assets/bmwimage.jpg',
                  color: AppColors.appOrange,
                  subtitle: 'համալրված \n գումարը այստեղ',
                  ontap: () {}),
              servoceItems(
                  title: 'Վարկ',
                  imgasset: 'lib/assets/bmwimage.jpg',
                  color: AppColors.appOrange,
                  ontap: () {}),
              servoceItems(
                  title: 'ԶգոնուԹյունդ',
                  imgasset: 'lib/assets/bmwimage.jpg',
                  color: AppColors.appOrange,
                  subtitle: 'մի կորցրու',
                  ontap: () {}),
              servoceItems(
                  title: 'car',
                  imgasset: 'lib/assets/bmwimage.jpg',
                  color: AppColors.appOrange,
                  ontap: () {}),
              servoceItems(
                  title: 'car',
                  imgasset: 'lib/assets/bmwimage.jpg',
                  color: AppColors.appOrange,
                  ontap: () {}),
              servoceItems(
                  title: 'car',
                  imgasset: 'lib/assets/bmwimage.jpg',
                  color: AppColors.appOrange,
                  ontap: () {})
            ],
          )),
      const SizedBox(height: 15),
      Container(
        padding: const EdgeInsets.only(left: 5, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Services',
                style: TextStyle(
                    color: AppColors.appBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text('view all',
                style: TextStyle(color: AppColors.appBlack, fontSize: 15))
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          otherServicesItem(
              icon: Icons.attach_money_outlined, title: 'Payments'),
          otherServicesItem(
              icon: Icons.attach_money_outlined, title: 'Transfers'),
          otherServicesItem(
              icon: Icons.directions_bus_filled_outlined, title: 'Transport'),
          otherServicesItem(icon: Icons.attach_money_outlined, title: 'Loans'),
          otherServicesItem(icon: Icons.attach_money_outlined, title: 'Events'),
          otherServicesItem(
              icon: Icons.vertical_align_bottom_sharp, title: 'Withdrawal'),
          otherServicesItem(icon: Icons.handshake_outlined, title: 'Partners'),
        ]),
      ),
      const SizedBox(height: 15),
      Container(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Favorites',
                style: TextStyle(
                    color: AppColors.appBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text('view all',
                style: TextStyle(color: AppColors.appBlack, fontSize: 15))
          ],
        ),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    color: AppColors.appLightGrey,
                    borderRadius: BorderRadius.circular(100)),
                child:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add))),
            const SizedBox(height: 6),
            Text(
              'Add',
              style: TextStyle(fontSize: 13, color: AppColors.appBlack),
            )
          ],
        ),
      ),
      const SizedBox(height: 80),
      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Special offers',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 130,
        width: width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            offersItems(
                imageAsset: 'lib/assets/bmwimage.jpg',
                title: 'Անվճար առաքում',
                logoAsset: 'lib/assets/city_logo.png'),
            offersItems(
                imageAsset: 'lib/assets/bmwimage.jpg',
                title: 'Անվճար առաքում',
                logoAsset: 'lib/assets/city_logo.png'),
            offersItems(
                imageAsset: 'lib/assets/bmwimage.jpg',
                title: 'Անվճար առաքում',
                logoAsset: 'lib/assets/city_logo.png'),
            offersItems(
                imageAsset: 'lib/assets/bmwimage.jpg',
                title: 'Անվճար առաքում',
                logoAsset: 'lib/assets/city_logo.png'),
            offersItems(
                imageAsset: 'lib/assets/bmwimage.jpg',
                title: 'Անվճար առաքում',
                logoAsset: 'lib/assets/city_logo.png'),
          ],
        ),
      )
    ]);
  }
}

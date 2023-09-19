import 'package:flutter/material.dart';
import '../helpers/colors.dart';
import 'package:go_router/go_router.dart';

class MainPageSlider extends StatelessWidget {
  final String balance;
 const MainPageSlider (this.balance,{super.key});

 

  @override
  Widget build(context) {
    return Column(children: [
     Container(
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              servoceItems(
                 title: 'Տրանսպորտ', imgasset: 'lib/assets/bmwimage.jpg' ,color: const Color.fromARGB(255, 121, 72, 150),subtitle: 'ուղետոմսեր',ontap: (){
                  context.go(
                    context.namedLocation('transport', pathParameters: {'balance':balance})
                  );
                                  
                 }),
              servoceItems(
                 title:  'Իվենթներ',imgasset:  'lib/assets/bmwimage.jpg',color:  Colors.purple,ontap: (){}),
              servoceItems(
                 title:  'Տերմինալից',imgasset:  'lib/assets/bmwimage.jpg', color: AppColors.appOrange,subtitle: 'համալրված \n գումարը այստեղ',ontap: (){}),
              servoceItems(
                 title:  'Վարկ',imgasset:  'lib/assets/bmwimage.jpg',color:  AppColors.appOrange,ontap: (){}),
              servoceItems(
                 title:  'ԶգոնուԹյունդ',imgasset:  'lib/assets/bmwimage.jpg',color:  AppColors.appOrange,subtitle: 'մի կորցրու',ontap: (){}),
              servoceItems(
                 title:  'car',imgasset:  'lib/assets/bmwimage.jpg', color: AppColors.appOrange,ontap: (){}),
              servoceItems(
                 title:  'car',imgasset:  'lib/assets/bmwimage.jpg', color: AppColors.appOrange,ontap: (){}),
              servoceItems(
                 title:  'car', imgasset: 'lib/assets/bmwimage.jpg',color:  AppColors.appOrange,ontap: (){})
           
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
    ]);
  }
}

Widget servoceItems( {required String title, required String imgasset, required Color color, required void Function() ontap ,  String subtitle = ''}) {
  return GestureDetector(
    onTap:ontap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          width: 100,
          child: Stack(
            children: [  Container(margin:const EdgeInsets.only(bottom: 5), child: Align(alignment: Alignment.bottomCenter, child: Image(image: AssetImage(imgasset),fit: BoxFit.fill ))),
              Container(padding:const EdgeInsets.only(left: 5, top: 8), child: Align(alignment: Alignment.topLeft, child: Text(title ,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.white)))),
              Container(padding:const EdgeInsets.only(left: 5, top: 22), child: Align(alignment: Alignment.topLeft, child: Text(subtitle ,style:const TextStyle(fontSize: 8,color: Colors.white)))),
                ],
          )),
    ),
  );
}

Widget offersItems( {required String imageAsset, required String title,required String logoAsset }) {
   return Container(
    height: 90,
    width: 120,
    decoration: BoxDecoration(
        color: AppColors.appOrange, borderRadius: BorderRadius.circular(12)),
    child: Stack(children: [
      Image(
          image: NetworkImage(
            imageAsset,
          ),
          fit: BoxFit.fill),
      Container(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          )),
      Container(
          height: 30,
          width: 50,
          padding: const EdgeInsets.only(left: 15, bottom: 10),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Image(
                image: NetworkImage(logoAsset),
                fit: BoxFit.fill,
              ),
              ),
              )
    ]),
  );
}


//  'Payment': [Icon(  Icons.attach_money_outlined, color: AppColors.appOrange,), ],
//     'Transfers': Icon(Icons.attach_money_outlined, color: AppColors.appOrange),
//     'Transport':Icon(Icons.directions_bus_filled_outlined, color: AppColors.appOrange),     
//     'loans':  Icon( Icons.attach_money_outlined, color: AppColors.appOrange),
    
//     'Events':  Icon(Icons.attach_money_outlined, color: AppColors.appOrange,),
     
    
    
//     'Withdrawal':
//         Icon(Icons.vertical_align_bottom_sharp, color: AppColors.appOrange),
//     'Partners': Icon(Icons.handshake_outlined, color: AppColors.appOrange)
  


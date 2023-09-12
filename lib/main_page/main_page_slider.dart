import 'package:flutter/material.dart';

class MainPageSlider extends StatelessWidget {
 const  MainPageSlider ({super.key});

   @override
   Widget build (context) {
       return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ),
           

         
         

          ],
        ),
        );
       
   }
}

Widget makeScrolItems (String text,  imgasset ) {
  return  Container(
                decoration:BoxDecoration(image: DecorationImage(image: AssetImage(imgasset) ,fit:BoxFit.cover )),
                height: 120,
                width: 60,
                child: Column(
                children: [Text(text) ] ,
              )
            );

}


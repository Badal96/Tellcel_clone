import 'package:flutter/material.dart';
import '../helpers/colors.dart';

class MainPageSlider extends StatelessWidget {
 const  MainPageSlider ({super.key});

   @override
   Widget build (context) {
       return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        child: Row(

          children: [
           makeScrolItems('car','lib/assets/bmwimage.jpg',AppColors.appOrange ),
           makeScrolItems('car','lib/assets/bmwimage.jpg',AppColors.appOrange ),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ,AppColors.appOrange),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ,AppColors.appOrange),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ,AppColors.appOrange),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ,AppColors.appOrange),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ,AppColors.appOrange),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ,AppColors.appOrange),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ,AppColors.appOrange),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ,AppColors.appOrange),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ,AppColors.appOrange),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ,AppColors.appOrange),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ,AppColors.appOrange),
           makeScrolItems('car','lib/assets/bmwimage.jpg' ,AppColors.appOrange),    
          ],
        ),
        );
       
   }
}

Widget makeScrolItems (String text,  imgasset ,Color color) {
  return  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
                    
                  decoration:BoxDecoration(image: DecorationImage( image: AssetImage(imgasset) ,fit:BoxFit.contain ),borderRadius: BorderRadius.circular(10),color: color ),
                  height: 100,
                  width: 80,
                  child: Column(
                  children: [Text(text)] ,
                )
              ),
  );

}


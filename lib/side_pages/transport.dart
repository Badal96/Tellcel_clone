 import 'package:flutter/material.dart';
import 'package:telcell_wallet/helpers/colors.dart';

class TransportPage extends StatefulWidget {

  

  const TransportPage ({super.key});
  

  @override
  State<TransportPage> createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  int tickcount = 0;
 @override
 Widget build (context) {
  return  Scaffold(
    appBar: AppBar(
      elevation: 0,
      title: Text('transport', style: TextStyle(fontSize: 20,color: AppColors.appBlack),) ,
    ),
    body:const Placeholder(),

  );
 }
}
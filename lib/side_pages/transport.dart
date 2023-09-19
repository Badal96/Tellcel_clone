 import 'package:flutter/material.dart';
import 'package:telcell_wallet/helpers/colors.dart';

class TransportPage extends StatefulWidget {

  final String balance;

  const TransportPage ({super.key,
  required this.balance});

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
      title: Text(widget.balance, style: TextStyle(fontSize: 20,color: AppColors.appBlack),) ,
    ),
    body:const Placeholder(),

  );
 }
}
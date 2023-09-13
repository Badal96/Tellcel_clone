import 'package:flutter/material.dart';
import './main_slider.dart';
import '../http_requests/httprequest.dart';
class MainPageBody extends StatefulWidget {
  final String balance; 

  const MainPageBody(this.balance, {super.key});

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  final Color textcolor = const Color.fromARGB(158, 0, 0, 0);
  bool ishidden = true;
  late Future <String> text;
@override
  void initState() {
   
    super.initState();
    text = HttpRequests().getpictures();
  }
  


  @override
  Widget build(context) {
    double width = MediaQuery.of(context).size.width;
    Icon showBalanceIcon = ishidden
        ? const Icon(Icons.remove_red_eye)
        : const Icon(Icons.remove_red_eye_outlined);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(232, 235, 234, 232),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: width * 0.55,
                height: 160,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      ishidden = ishidden ? false : true;
                                    });
                                  },
                                  icon: showBalanceIcon)
                            ]),
                        const Text(
                          'Balance', style: TextStyle(color: Color.fromARGB(78, 0, 0, 0),fontSize: 15 ),
                        ),
                      const  SizedBox(height: 8),
                        Visibility(
                          visible: ishidden ? true : false,
                          replacement: const Text('*****',style:TextStyle(color: Color.fromARGB(78, 0, 0, 0),fontSize: 20 ),),
                          child: Text(widget.balance,style:const TextStyle(fontSize: 20),),
                        ),
                        Row(
                          children: [
                           
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                
                                  super.setState(() {
                                    text = HttpRequests().getpictures();
                                  } );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: const Text(
                                  'Replenish',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
              Container(
                height: 160,
                width: width * 0.35,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(232, 98, 201, 201),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child:  Column(
                  children: [  FutureBuilder(
                    future:text,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Align(child:  CircularProgressIndicator(), heightFactor: 4 , );}
                      else {
                        return Text(snapshot.data.toString(),style:const TextStyle(color: Colors.black),);
                      }
                      
                    },
                  )]
                ),
            
              ),
            ],
          ),
         const MainPageSlider()
         

        ],
     
      ),
    );
  }
}

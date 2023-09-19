import 'package:flutter/material.dart';
import 'package:telcell_wallet/helpers/colors.dart';
import './main_slider.dart';
import '../http_requests/httprequest.dart';
import 'package:dotted_border/dotted_border.dart';

class MainPageBody extends StatefulWidget {
 
 

  const MainPageBody({ super.key});

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
    String balance = '20000.00֏';
    bool hiddenBalance = false;
    String username = 'Gor';
    String master = 'Guest';
    bool ishidden = true;
  late Future text;

  @override
  void initState() {
    super.initState();
    text = HttpRequests().getCatsinfo();
  }

  @override
  Widget build(context) {
    String balanceMain = balance.split('.')[0];
    String balanceLeftover = balance.substring(balanceMain.length);
    TextStyle basicStyele = TextStyle(color: AppColors.appLightBlack);
    double width = MediaQuery.of(context).size.width;
    Icon showBalanceIcon = ishidden
        ? const Icon(Icons.remove_red_eye)
        : const Icon(Icons.remove_red_eye_outlined);

    return 
      

      Scaffold(
         appBar:  AppBar(
        
            elevation: 0,
            backgroundColor:AppColors.appLightGrey,
           actions: [
             Icon(Icons.notifications_none, color: AppColors.appBlack),
             const SizedBox(width:10),
             Icon(Icons.search, color: AppColors.appBlack),
             const SizedBox(width: 20)
        ],
        title: Row(children: [
          Container(
            height: 40,      
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 172, 172, 172),
            // color: Color(0xffF3F5F5),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            iconSize: 25,
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Color(0xff37424A),
            ),
          ),
        ),
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(username, style: TextStyle(color: AppColors.appBlack,fontSize: 25,fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward_ios_rounded, color: AppColors.appBlack),
                 
                ],
              ),
              Text(master, style: TextStyle(color: AppColors.appBlack,fontSize: 15),)
            ],
          )
        ]),
      ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 8 ,top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding:const EdgeInsets.symmetric(horizontal:10.0),
                      decoration:  BoxDecoration(
                          color: AppColors.appLightGrey,
                          borderRadius:const BorderRadius.all(Radius.circular(10))),
                      width: width * 0.52,
                      height: 170,
                     
                       
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
                                'Balance',
                                style: TextStyle(
                                    color: Color.fromARGB(78, 0, 0, 0), fontSize: 15),
                              ),
                              const SizedBox(height: 8),
                              Visibility(
                                visible: ishidden ? true : false,
                                replacement:  Text(
                                  '*****',
                                  style: TextStyle(
                                      color: AppColors.appBlack,
                                      fontSize: 20),
                                ),
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: balanceMain,
                                        style: TextStyle(
                                            color: AppColors.appBlack, fontSize: 20)),
                                    TextSpan(
                                        text: balanceLeftover,
                                        style: TextStyle(
                                            color: AppColors.appLightBlack,
                                            fontSize: 20))
                                  ]),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        super.setState(() {
                                          text = HttpRequests().getCatsinfo();
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.appOrange,
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
                              const SizedBox(height: 8)
                            ]),
                      
                    ),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      color: AppColors.appOrange,
                      dashPattern:const [8],
                      radius: Radius.circular(12),
                      child: Container(
                        height: 160,
                        width: width * 0.33,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(
                                      image: const AssetImage(
                                        'lib/assets/Visa_Logo.png',
                                      ),
                                      width: width * 0.3),
                                  RichText(
                                      text: TextSpan(children: const [
                                        TextSpan(text: 'Get', style: TextStyle()),
                                        TextSpan(
                                            text: ' 3%',
                                            style: TextStyle(color: Colors.green)),
                                        TextSpan(
                                            text: ' deposit \n rate with free \n Visa card')
                                      ], style: basicStyele),
                                      textAlign: TextAlign.center,
                                      maxLines: 3)
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                 MainPageSlider(balance)
              ],
            ),
          ),
        ),
      );
    
  }
}

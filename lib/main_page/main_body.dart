import 'package:flutter/material.dart';
import 'package:telcell_wallet/helpers/colors.dart';
import './main_slider.dart';
import '../http_requests/httprequest.dart';
import 'package:dotted_border/dotted_border.dart';

class MainPageBody extends StatefulWidget {
  final String balance;

  const MainPageBody(this.balance, {super.key});

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  bool ishidden = true;
  late Future text;
  @override
  void initState() {
    super.initState();
    text = HttpRequests().getCatsinfo();
  }

  @override
  Widget build(context) {
    String balanceMain = widget.balance.split('.')[0];
    String balanceLeftover = widget.balance.substring(balanceMain.length);
    String message = 'Get 3% deposit rate with free Visa card';
    TextStyle basicStyele = TextStyle(color: AppColors.appLightBlack);
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
                height: 170,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
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
                          replacement: const Text(
                            '*****',
                            style: TextStyle(
                                color: Color.fromARGB(78, 0, 0, 0),
                                fontSize: 20),
                          ),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(text: balanceMain,style: TextStyle(color: AppColors.appBlack,fontSize: 20)),
                              TextSpan(text: balanceLeftover,style: TextStyle(color: AppColors.appLightBlack,fontSize: 20))
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
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                color: AppColors.appOrange,
                dashPattern: [8],
                radius: Radius.circular(12),
                child: Container(
                  height: 160,
                  width: width * 0.35,
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
                                      text: ' deposit rate with free Visa card')
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
          const MainPageSlider()
        ],
      ),
    );
  }
}

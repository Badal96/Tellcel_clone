import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telcell_wallet/helpers/colors.dart';
import 'package:telcell_wallet/side_pages/error_message.dart';
import '../http_requests/httprequest.dart';

class SingleProductPage extends StatefulWidget {
  final int id;
  final Function ontap;
  final List<int> favlist;
  const SingleProductPage({ required this.id, super.key, required this.ontap, required this.favlist});

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  late Color initial;
  Future? productinfo;
  HttpRequests request = HttpRequests();
  @override
  void initState() {
    super.initState();  
    initial =  widget.favlist.contains(widget.id)?AppColors.appOrange:AppColors.appLightBlack;
    productinfo = request.getSingleProducts(widget.id.toString());
  }



  @override
  Widget build(context) {
    
   
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.appOrange,
        backgroundColor: AppColors.appLightGrey,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '500 BON',
                style: TextStyle(color: AppColors.appBlack),
              ),
              const Icon(Icons.currency_bitcoin)
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: productinfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) return const ErrorMessage();

          if (snapshot.data == null) return const ErrorMessage();

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Image(
                  image: NetworkImage(snapshot.data['image']),
                  height: 200,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                snapshot.data['title'],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Price ${snapshot.data['price']}\$',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                  textAlign: TextAlign.center,
                                ))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                         setState(() {
                           initial = widget.favlist.contains(widget.id)?AppColors.appOrange:AppColors.appLightBlack;
                         });
                         widget.ontap(widget.id);},

                      child: Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.heart_broken,
                            color:widget.favlist.contains(widget.id)?AppColors.appOrange:AppColors.appLightBlack,
                          )),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Description'),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(snapshot.data['description'])
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
       
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appOrange,
                  ),
                  child: const Text('Exchange'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telcell_wallet/bon_page/product_list.dart';
import 'package:telcell_wallet/helpers/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:telcell_wallet/http_requests/httprequest.dart';
class BonPage extends StatefulWidget {
  const BonPage({super.key});

  @override
  State<BonPage> createState() => _BonPageState();
}

class _BonPageState extends State<BonPage> {
      List<int> myproducts = [];
      HttpRequests requests = HttpRequests();
     late Future <List?> productList;

@override
  void initState() {
   
    super.initState();
    productList  = requests.getAllProducts();
  }

  void addmyproducts(int itemid) {
    setState(() {
      myproducts.contains(itemid)
          ? myproducts.remove(itemid)
          : myproducts.add(itemid);
    });
  }


  @override
  Widget build(context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Text(
          'BON',
          style: TextStyle(
              fontSize: 20,
              color: AppColors.appBlack,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.864),
        title: Padding(
          padding: const EdgeInsets.only(right: 30, top: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '500',
                    style: TextStyle(color: AppColors.appBlack),
                  ),
                  Icon(Icons.currency_bitcoin, color: AppColors.appOrange)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Until 30 Sep 2023',
                    style:
                        TextStyle(color: AppColors.appLightBlack, fontSize: 12),
                  ),
                  Icon(
                    Icons.dangerous_outlined,
                    color: AppColors.appOrange,
                    size: 15,
                  )
                ],
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 60,
              width: width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      iconbuiler(Icons.shopping_bag, 'Market', () {}),
                      iconbuiler(Icons.shopping_bag, 'My products', () {
                        context.goNamed('myproducts', extra: {
                          'favorites': myproducts,
                          'ontap': addmyproducts,
                          'productlist':productList
                         
                        });
                      }),
                      iconbuiler(Icons.shopping_bag, 'Invite friends', () {}),
                      iconbuiler(Icons.shopping_bag, 'Bon partners', () {}),
                      iconbuiler(Icons.shopping_bag, 'Events', () {}),
                      iconbuiler(Icons.shopping_bag, 'Present a Bon', () {})
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top products',
                      style: TextStyle(
                          color: AppColors.appBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text('view all',
                      style: TextStyle(color: AppColors.appBlack, fontSize: 15))
                ],
              ),
            ),
            ProductList(
              addorremoveproduct: addmyproducts,
               productlist:productList,
               favlist:myproducts
            )
          ]),
        ),
      ),
    );
  }
}

Widget iconbuiler(IconData icon, String text, void Function() ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 17),
      height: 40,
      decoration: BoxDecoration(
          color: AppColors.appLightGrey,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.appOrange, size: 16),
          const SizedBox(width: 5),
          Text(text)
        ],
      ),
    ),
  );
}

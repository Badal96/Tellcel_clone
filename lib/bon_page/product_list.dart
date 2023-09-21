import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telcell_wallet/helpers/colors.dart';
import 'package:telcell_wallet/http_requests/httprequest.dart';
import 'package:telcell_wallet/side_pages/error_message.dart';
import 'package:go_router/go_router.dart';
import 'package:telcell_wallet/side_pages/single_product.dart';

class ProductList extends StatefulWidget {
 final Function addtomyproduts;
  const ProductList({required this.addtomyproduts ,super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  HttpRequests requests = HttpRequests();
  Future? productList;
  @override
  void initState() {
    super.initState();
    productList = requests.getAllProducts();
  }

  @override
  Widget build(context) {
    double width = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: productList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasError) {
            return const ErrorMessage();
          }
          if (snapshot.data == null) {
            return const ErrorMessage();
          }

          return Column(
            children: [
              ...snapshot.data!.map((e) => singleItem(
                  ontap: widget.addtomyproduts,
                  context: context,
                  imagurl: e['image'],
                  width: width,
                  title: e['title'],
                  description: e['description'],
                  price: e['price'].toString(),
                  id: e['id']))
            ],
          );
        });
  }
}

Widget singleItem(
    {required BuildContext context,
    required String imagurl,
    required double width,
    required String title,
    required String description,
    required String price,
    required Function ontap,
    required int id}) {
  if (description.length > 200) {
    description = '${description.substring(0, 197)}...';
  }
  if (title.length > 50) title = '${title.substring(0, 47)}...';

  return GestureDetector(
    onTap: () {
      context.go(context.namedLocation('singleproduct',
          pathParameters: {'id': id.toString()}));
    },
    child: Container(
      height: 130,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: AppColors.appLightGrey)]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: NetworkImage(imagurl),
                height: 100,
                width: 60,
              ),
              Text(
                '$price \$',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style:const TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10),
            child: IconButton(
              icon: Icon(
                Icons.heart_broken,
                color: AppColors.appLightBlack,
              ),
              onPressed: () {
                ontap(id);
                
              },
            ),
          )
        ],
      ),
    ),
  );
}

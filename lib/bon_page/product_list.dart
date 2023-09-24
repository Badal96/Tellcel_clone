import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telcell_wallet/helpers/colors.dart';
import 'package:telcell_wallet/side_pages/error_message.dart';
import 'package:telcell_wallet/side_pages/single_product.dart';

class ProductList extends StatelessWidget {
  final void Function(int item) addorremoveproduct;
  final Future<List?> productlist;
  final List<int> favlist;
  final bool filtered;
  const ProductList(
      {required this.addorremoveproduct,
      required this.productlist,
      super.key,
      required this.favlist,
      this.filtered = false});

  @override
  Widget build(context) {
    return FutureBuilder(
        future: productlist,
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
                  favlist: favlist,
                  ontap: addorremoveproduct,
                  context: context,
                  imagurl: e['image'],
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
    {required List<int> favlist,
    required BuildContext context,
    required String imagurl,
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
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SingleProductPage(
                    id: id,
                    ontap: ontap,
                    favlist: favlist,
                  )));
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
                    style: const TextStyle(fontSize: 11),
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
                color: favlist.contains(id)
                    ? AppColors.appOrange
                    : AppColors.appLightBlack,
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

import 'package:flutter/material.dart';
import 'package:telcell_wallet/helpers/colors.dart';
import 'package:go_router/go_router.dart';
import '../bon_page/product_list.dart';
import 'error_message.dart';

class MyProducts extends StatefulWidget {
  final List<int> favlist;
  final Future<List?> productlist;
  final void Function(int id) ontap;
  const MyProducts(
      {required this.favlist,
      super.key,
      required this.productlist,
      required this.ontap});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  late List<int> favlist;
  @override
  void initState() {
    super.initState();
    favlist = List.from(widget.favlist);
  }

  void ontap(int id) {
     widget.ontap(id); 
    setState(() {   
      favlist.contains(id) ? favlist.remove(id) :favlist.add(id) ;
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appOrange,
          elevation: 0,
          title: const Text('My products'),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: widget.favlist.isEmpty
                ? noProducts(context)
                : FutureBuilder(
                    future: widget.productlist,
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
                          ...snapshot.data!
                              .where(
                                  (element) => favlist.contains(element['id']))
                              .map((e) => singleItem(
                                  favlist: favlist,
                                  ontap: ontap,
                                  context: context,
                                  imagurl: e['image'],
                                  title: e['title'],
                                  description: e['description'],
                                  price: e['price'].toString(),
                                  id: e['id']))
                        ],
                      );
                    },
                  )));
  }
}

Widget noProducts(BuildContext context) {
  return Column(
    children: [
      Image.asset('lib/assets/empty.png'),
      ElevatedButton(
          onPressed: () {
            context.go('/bon');
          },
          child: const Text('Go back'))
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
              image: NetworkImage(
                  'https://as2.ftcdn.net/v2/jpg/01/19/98/29/1000_F_119982932_Cv6iHvH4GF7qiTdSDrF37Q0hHIpVbOrd.jpg')),
          const Text('Smth went wrong'),
          ElevatedButton(onPressed: () {
            context.go('/bon');
          }, child: const Text('Go back'))
        ],
      ),
    );
  }
}

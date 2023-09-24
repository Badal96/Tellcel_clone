import 'package:go_router/go_router.dart';
import 'package:telcell_wallet/banking_page/banking_page.dart';
import 'package:telcell_wallet/bon_page/bon_page.dart';
import 'package:telcell_wallet/main_page/main_body.dart';
import 'package:telcell_wallet/qr_code_page/qr_code_page.dart';
import 'package:telcell_wallet/side_pages/Transport.dart';
import 'package:telcell_wallet/side_pages/my_products.dart';

import '../side_pages/scaffold_navbar.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const MainPageBody(),
            routes: [
              GoRoute(
                path: 'transport',
                builder: (context, state) => const TransportPage(),
              )
            ]),
        GoRoute(
            path: '/bon',
            name: 'bon',
            builder: (context, state) => const BonPage(),
            routes: [
              GoRoute(
                path: 'myproducts',
                name: 'myproducts',
                builder: (context, state) {
                  Map params = state.extra as Map;
                  return MyProducts(
                    favlist: params['favorites'],
                    productlist: params['productlist'],
                    ontap: params['ontap'],
                  );
                },
              )
            ]),
        GoRoute(
          path: '/qr_code',
          name: 'qr_code',
          builder: (context, state) => const QRCodeTab(),
        ),
        GoRoute(
          path: '/banking',
          name: 'banking',
          builder: (context, state) => const BankingPage(),
        ),
      ],
      builder: (context, state, child) => ScaffoldWithNavbar(body: child),
    )
  ],
);

 import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:telcell_wallet/bon_page/bon_page.dart';
import 'package:telcell_wallet/main_page/main_body.dart';
import 'package:telcell_wallet/side_pages/Transport.dart';
import '../side_pages/scaffold_navbar.dart';
 

 final GoRouter router = GoRouter(
  
  initialLocation: '/',
  routes: [
    ShellRoute( 
    builder: (context, state,child) => ScaffoldWithNavbar( body:child),
       routes: [ GoRoute(path: '/',  builder: (context, state) =>const MainPageBody() ,routes: [
                GoRoute(path:'transport/:balance', name: 'transport', builder: (context, state) => TransportPage(balance: state.pathParameters['balance']!),)
       ] ),
          GoRoute( path: '/bon', name:'bon', builder: (context, state) {return const BonPage();}) 
       ]
       
       
     ),
    
  ]
 );
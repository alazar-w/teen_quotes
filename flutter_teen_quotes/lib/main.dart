import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_teen_quotes/blocs/blocs.dart';
import 'package:flutter_teen_quotes/repository/quoteRepository.dart';
import 'package:flutter_teen_quotes/screens/screens.dart';

void main() async {
  runApp(
    BlocProvider(create: (BuildContext context) => QuoteBloc(QuoteRepository())..add(FetchQuote()),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      initialRoute: '/splash',
      routes: {
        '/splash':(context) => SplashScreen(),
        '/home': (context) => HomePage(),
//        '/details': (context) => DetailsPage(),
      },


    );
  }



}

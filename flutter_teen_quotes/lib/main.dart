import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_teen_quotes/blocs/blocs.dart';
import 'package:flutter_teen_quotes/repository/quoteRepository.dart';
import 'package:flutter_teen_quotes/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        body: BlocProvider(
            create: (BuildContext context) => QuoteBloc(QuoteRepository())..add(FetchQuote()),
            child: SplashScreen()
        ),

      ),
    );
  }



}

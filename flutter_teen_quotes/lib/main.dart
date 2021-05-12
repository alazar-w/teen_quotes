import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_teen_quotes/blocs/quoteBloc/quote.dart';
import 'package:flutter_teen_quotes/repository/quoteRepository.dart';
import 'package:flutter_teen_quotes/screens/HomePage.dart';
import 'package:flutter_teen_quotes/widgets/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teen Quote"),
        ),
        body: BlocProvider(
            create: (BuildContext context) => QuoteBloc(QuoteRepository())..add(FetchQuote()),
            child: HomePage()
        ),

        drawer: Drawer(
          child:drawerContent(context)
        ), //this will just add the Navigation Drawer  Icon
      ),
    );
  }



}

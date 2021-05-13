import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_teen_quotes/blocs/blocs.dart';
import 'package:flutter_teen_quotes/blocs/quoteBloc/quoteBloc.dart';
import 'package:flutter_teen_quotes/models/QuoteModel.dart';
import 'package:flutter_teen_quotes/widgets/Splash_screen_widget.dart';
import 'package:flutter_teen_quotes/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final  List<QuoteModel> quote;

  const HomePage({this.quote});

  @override
  Widget build(BuildContext context) {
    final quoteBloc = BlocProvider.of<QuoteBloc>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teen Quote"),
        ),
        body: Column(
          children: [
//            BlocListener<QuoteBloc, QuoteState>(listener: (context, state) {
//              if (state is QuoteIsLoaded) {
                 homePageContent(quote)
//              }
//              return Container(
//                child: Center(
//                  child: Text("Error Loading Data"),
//                ),
//              );
//            }),

          ],
        ),


        drawer: Drawer(
            child:drawerContent(context)
        ), //
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_teen_quotes/blocs/blocs.dart';
import 'package:flutter_teen_quotes/screens/HomePage.dart';
import 'package:flutter_teen_quotes/widgets/Splash_screen_widget.dart';


// This the widget where the BLoC states and events are handled.
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final quoteBloc = BlocProvider.of<QuoteBloc>(context);

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Center(
        child: BlocBuilder<QuoteBloc, QuoteState>(
          builder: (context, state) {
            if (state is QuoteIsLoading) {
              return SplashScreenWidget();
            } else if (state is QuoteIsLoaded) {
//               Navigator.of(context).push(MaterialPageRoute(builder:(_) => HomePage()));
              //named
//              Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
              //not named
//              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
                return HomePage();
            } else if (state is QuoteIsNotLoaded) {
              return Container(
                child: Center(
                  child: Text("Error Loading Data"),
                ),
              );
            }
            return  Container(
              child: Center(
                child: Text("Default:Error Loading Data"),
              ),
            );
          },
        ),
      ),
    );
  }

//  BlocProvider<QuoteBloc> _buildBody(BuildContext context) {
//    return BlocProvider(
//      create: (context) => QuoteBloc(QuoteRepository()),
//      child: Container(
//        height: MediaQuery.of(context).size.height,
//        width: MediaQuery.of(context).size.width,
//        color: Colors.orange,
//        child: Center(
//          // Here I have used BlocBuilder, but instead you can also use BlocListner as well.
//          child: BlocBuilder<QuoteBloc, QuoteState>(
//            builder: (context, state) {
//              if (state is QuoteIsLoading) {
//                return SplashScreenWidget();
//              } else if (state is QuoteIsLoaded) {
//                return HomePage();
//              }
//              return HomePage();
//            },
//          ),
//        ),
//      ),
//    );
//  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_teen_quotes/blocs/quoteBloc/quote.dart';
import 'package:flutter_teen_quotes/models/QuoteModel.dart';
import 'package:flutter_teen_quotes/repository/quoteRepository.dart';


class QuoteBloc extends Bloc<QuoteEvent,QuoteState>{
  QuoteRepository quoteRepository;

  QuoteBloc(this.quoteRepository) : super(InitialState());



  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    // TODO: implement mapEventToState
    if(event is FetchQuoteByTag){
      try{
        QuoteModel quote = await quoteRepository.getQuoteByTag(event.tag);
        yield QuoteIsLoaded(quote);

      }catch(_) {
        yield QuoteIsNotLoaded();
      }
    }else if(event is InitialState){
      yield QuoteIsLoading();
      try{
        QuoteModel quote = await quoteRepository.getQuote();
        yield QuoteIsLoaded(quote);

      }catch(_) {
        yield QuoteIsNotLoaded();
      }
    }
  }

}
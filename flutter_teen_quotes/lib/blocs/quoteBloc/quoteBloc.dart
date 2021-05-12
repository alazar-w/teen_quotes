import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_teen_quotes/blocs/quoteBloc/quote.dart';
import 'package:flutter_teen_quotes/models/QuoteModel.dart';
import 'package:flutter_teen_quotes/repository/quoteRepository.dart';


class QuoteBloc extends Bloc<QuoteEvent,QuoteState>{
  QuoteRepository quoteRepository;

  QuoteBloc(this.quoteRepository) : super(QuoteIsLoading());



  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    // TODO: implement mapEventToState
    if(event is FetchQuoteByTag){
      try{
        List<QuoteModel> quote = await quoteRepository.getQuotesByTag(event.tag);
        yield QuoteIsLoaded(quote);

      }catch(_) {
        yield QuoteIsNotLoaded();
      }
    }else if(event is FetchQuote){
      yield QuoteIsLoading();
      try{
        List<QuoteModel> quote = await quoteRepository.getQuotes();
        yield QuoteIsLoaded(quote);

      }catch(_) {
        yield QuoteIsNotLoaded();
      }
    }
  }

}
import 'package:equatable/equatable.dart';
import 'package:flutter_teen_quotes/models/QuoteModel.dart';

class QuoteState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InitialState extends QuoteState{}

class QuoteIsLoading extends QuoteState{
}

class QuoteIsLoaded extends QuoteState{
  final _quote;

  QuoteIsLoaded(this._quote);
  QuoteModel get getQuote => _quote;

  @override
  // TODO: implement props
  List<Object> get props => [_quote];

}

class QuoteIsNotLoaded extends QuoteState{}


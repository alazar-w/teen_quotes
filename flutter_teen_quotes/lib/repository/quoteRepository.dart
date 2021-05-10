import 'package:flutter_teen_quotes/models/QuoteModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuoteRepository{
  Future<QuoteModel> getQuoteByTag(String tag) async{
    final result = await http.Client().get(Uri.parse("http:someurl.com/q=$tag/&APPID = app_id_here"));

    if(result.statusCode != 200)
      throw Exception();
    return parsedJson(result.body);

  }
  Future<QuoteModel> getQuote() async{
    final result = await http.Client().get(Uri.parse("http:someurl.com/q=/&APPID = app_id_here"));

    if(result.statusCode != 200)
      throw Exception();
    return parsedJson(result.body);

  }


  QuoteModel parsedJson(final response){
    final jsonDecoded = json.decode(response);
    final jsonQuote = jsonDecoded["main"];

    return QuoteModel.fromJson(jsonQuote);
  }
}
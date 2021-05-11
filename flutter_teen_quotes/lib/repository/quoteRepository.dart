import 'dart:io';

import 'package:flutter_teen_quotes/models/QuoteModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_teen_quotes/helper/Constants.dart';

class QuoteRepository{

  Future<QuoteModel> getQuoteByTag(String tag) async{
    final result = await http.Client().get(Uri.parse(baseUrl),headers:<String,String>{'authorization':basicAuth});

    if(result.statusCode != 200)
      throw Exception();
    return parsedJson(result.body);

  }
  Future<QuoteModel> getQuote() async{
    final result = await http.Client().get(Uri.parse(baseUrl),headers:<String,String>{'authorization':basicAuth});

    if(result.statusCode != 200)
      throw Exception();
    return parsedJson(result.body);

  }


  QuoteModel parsedJson(final response){
    final jsonDecoded = json.decode(response);
    final jsonQuote = jsonDecoded["datas"]["data"];

    return QuoteModel.fromJson(jsonQuote);
  }
}
class QuoteModel {
  int id;
  String quote;
  String author;
  String tag;
  int numberOfLikes;
  bool isEnabled;

  QuoteModel({this.id ,this.quote,this.author,this.tag,this.numberOfLikes,this.isEnabled});

  factory QuoteModel.fromJson(Map<String,dynamic> json){
    return QuoteModel(
      id: json['id'],
      quote: json['quote'],
      author: json['author'],
      tag: json['tag'],
      numberOfLikes: json['numberOfLikes'],
      isEnabled: json['isEnabled']
    );
  }


}
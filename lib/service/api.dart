import 'dart:convert';
import 'package:homework08/models/beauty.dart';
import 'package:http/http.dart' as http;

class Api {
  String link = "https://dummyjson.com/products";

  Future<List<Beauty>> getData() async{
    var uri = Uri.parse(link);
    var response = await http.get(uri);
    var result = jsonDecode(response.body);

    List<Beauty> something = [];

    for (var element in result["products"]) {
      Beauty b1 = Beauty.fromjson(element);
      something.add(b1);
    }
    return something;
  }
}
import 'dart:convert';

import 'package:flutter/services.dart';

import '../data/shoes.dart';

const _delay = Duration(milliseconds: 1000);

class ShoppingRepository {
  Future<List> loadProduct() async {
    final String response = await rootBundle.loadString('assets/shoes.json');
    List data = await json.decode(response);

    return data.map((e) => Shoes.fromJSON(e)).toList();
  }
}

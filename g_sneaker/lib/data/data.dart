import 'package:g_sneaker/data/shoes.dart';

class Data {
  List<Shoes>? shoes;

  Data({this.shoes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['shoes'] != null) {
      shoes = <Shoes>[];
      json['shoes'].forEach((v) {
        shoes!.add(new Shoes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shoes != null) {
      data['shoes'] = this.shoes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

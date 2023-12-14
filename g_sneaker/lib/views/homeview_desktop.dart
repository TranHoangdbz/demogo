import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:g_sneaker/app_colors.dart';
import 'package:g_sneaker/data/cart_item.dart';

extension ColorExtension on String {
  toColored() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class HomeviewDesktop extends StatefulWidget {
  const HomeviewDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeviewDesktop> createState() => _HomeviewDesktopState();
}

class _HomeviewDesktopState extends State<HomeviewDesktop> {
  List _items = [];
  List _cart = [
    CartItem(Productid: 1, amount: 1),
  ];

  double _price = 0.00;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/shoes.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["shoes"];
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: 760,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 28, right: 28),
                width: 360,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Container(
                    //   height: 360,
                    //   width: 360,
                    //   decoration: BoxDecoration(
                    //       color: myYellow,
                    //       borderRadius: BorderRadius.circular(180)),
                    // ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 30,
                      child: Image(image: AssetImage("assets/nike.png")),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Our Products",
                      style: TextStyle(
                          color: myBlack,
                          fontSize: 24,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 80),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 380,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: _items[index]["color"]
                                          .toString()
                                          .toColored(),
                                    ),
                                    child: Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Transform(
                                            alignment: FractionalOffset.center,
                                            transform: Matrix4.rotationZ(
                                                -3.14159265358 / 8),
                                            child: Image.network(
                                                _items[index]["image"]))),
                                  ),
                                  SizedBox(
                                    height: 26,
                                  ),
                                  Container(
                                    child: Text(
                                      _items[index]["name"],
                                      style: TextStyle(
                                          fontFamily: 'Rubik',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Text(
                                      _items[index]["description"],
                                      style: TextStyle(
                                          fontFamily: 'Rubik',
                                          fontSize: 12,
                                          height: 1.5,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$" + "${_items[index]["price"]}",
                                            style: TextStyle(
                                                fontFamily: 'Rubik',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 20),
                                              height: 46,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(23),
                                                color: myYellow,
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                  fontFamily: 'Rubik',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )),
                                            ),
                                          )
                                        ]),
                                  )
                                ]),
                            // child: ListTile(
                            //   leading: Text(_items[index]["id"].toString()),
                            //   title: Text(_items[index]["name"]),
                            //   subtitle: Text(_items[index]["description"]),
                            // ),
                          );
                        },
                      ),
                    )
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(left: 28, right: 28),
                width: 360,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Container(
                    //   height: 360,
                    //   width: 360,
                    //   decoration: BoxDecoration(
                    //       color: myYellow,
                    //       borderRadius: BorderRadius.circular(180)),
                    // ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 30,
                      child: Image(image: AssetImage("assets/nike.png")),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your cart",
                            style: TextStyle(
                                color: myBlack,
                                fontSize: 24,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "\$" + _price.toString(),
                            style: TextStyle(
                                color: myBlack,
                                fontSize: 24,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _cart.length != 0
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: _cart.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  width: 304,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: _items[index]["color"]
                                                  .toString()
                                                  .toColored(),
                                            ),
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 20),
                                                child: Transform(
                                                    alignment:
                                                        FractionalOffset.center,
                                                    transform:
                                                        Matrix4.rotationZ(
                                                            -3.14159265358 / 8),
                                                    child: Image.network(
                                                        _items[index]
                                                            ["image"]))),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                _items[index]["name"],
                                                style: TextStyle(
                                                    fontFamily: 'Rubik',
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${_items[index]["price"]}",
                                                      style: TextStyle(
                                                          fontFamily: 'Rubik',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ]),
                                            ),
                                          ],
                                        )
                                      ]),
                                );
                              },
                            ),
                          )
                        : Container(
                            child: Text(
                              "Your cart is empty",
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

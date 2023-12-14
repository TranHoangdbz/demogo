import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:g_sneaker/views/homeview_desktop.dart';
import 'package:g_sneaker/views/homeview_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ScreenTypeLayout(
        mobile: HomeviewMobile(),
        desktop: HomeviewDesktop(),
      )),
    );
  }
}

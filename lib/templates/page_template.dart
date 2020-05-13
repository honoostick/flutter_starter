import 'package:flutter/material.dart';

class PageTemplateView extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return PageTemplateViewState();
  }
}

class PageTemplateViewState extends State<PageTemplateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("page_template"),
      ),
    );
  }
}

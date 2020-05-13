import 'package:flutter/material.dart';

class BlankView extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return BlankViewState();
  }
}

class BlankViewState extends State<BlankView> with AutomaticKeepAliveClientMixin<BlankView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Text("Blank"),
      ),
    );
  }
}



import 'package:flutter/material.dart';

class TabPageTemplateView extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return TabPageTemplateViewState();
  }
}

class TabPageTemplateViewState extends State<TabPageTemplateView> with AutomaticKeepAliveClientMixin<TabPageTemplateView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Text("tab_page_template"),
      ),
    );
  }
}

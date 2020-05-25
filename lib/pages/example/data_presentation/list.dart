import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_starter/const/const.dart';
import 'package:flutter_starter/utils/utils.dart';

/**
 * graph
 * https://google.github.io/charts/flutter/gallery.html
 * 
 */
class MListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MListViewState();
  }
}

class MListViewState extends State<MListView> {
  bool animate;
  List list = ['a', 'b', 'c'];
  int titleHeight = 100;

  MListViewState() {
    animate = false;
  }

  List<Widget> getList() {
    Iterable<Widget> listTitles = list.map((item) {
      return ListTile(
        isThreeLine: true,
        dense: false,
        leading: new CircleAvatar(child: new Text(item)),
        title: new Text('item 的标题'),
        subtitle: new Text('item 的内容'),
        trailing: new Icon(Icons.arrow_right, color: Colors.green),
      );
    });
    return listTitles.toList();
  }

  // factory MListViewState.withSampleData() {
  //   return MListViewState(
  //     _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }

  selectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.blue),
            new Text(text),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          new PopupMenuButton<String>(
            offset: Offset(0, 100),
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              this.selectView(Icons.message, 'Action1', '1'),
              this.selectView(Icons.group_add, 'Action2', '2'),
              this.selectView(Icons.cast_connected, 'Action3', '3'),
            ],
            onSelected: (String action) {
              // 点击选项的时候
              switch (action) {
                case '1':
                  break;
                case '2':
                  break;
                case '3':
                  break;
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: titleHeight.toDouble(),
              child: Text('ListTile', style: TextStyle(fontSize: 30),),
            ),
            Container(
              height: Utils.getHeightWithoutBar(context) - titleHeight,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5)),
              child: ListView(
                children: getList(),
              ),
            ),
            Container(
              height: 100,
              child: Text('Custom', style: TextStyle(fontSize: 30),),
            ),
            Container(
              height: Utils.getHeightWithoutBar(context) - titleHeight,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5)),
              child: ListView(
                children: this.list.map((item) {
                  return new Container(
                    padding: const EdgeInsets.all(8.0),
                    child: new Row(
                      children: <Widget>[
                        new CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://visua1lhunt.com/photos/3/portrait-of-eagle.jpg?s=xl",
                              scale: 10),
                          radius: 30.0,
                        ),
                        new Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: new Text('今天吃什么？今天吃什么？今天吃什么？'),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              height: 100,
              child: Text('builder', style: TextStyle(fontSize: 30),),
            ),
            Container(
              height: Utils.getHeightWithoutBar(context) - titleHeight,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5)),
              child: ListView.builder(
                  itemCount: 40,
                  itemBuilder: (BuildContext context, int index) {
                    return new Text('子项：' + index.toString());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

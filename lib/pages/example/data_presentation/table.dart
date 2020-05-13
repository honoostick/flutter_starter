import 'package:flutter/material.dart';

/**
 * graph
 * https://google.github.io/charts/flutter/gallery.html
 * 
 */
class TableView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TableViewState();
  }
}

class TableViewState extends State<TableView> {
  List<TableRow> items;
  bool animate;

  TableViewState() {
    items = _createSampleData();
    animate = false;
  }

  // factory TableViewState.withSampleData() {
  //   return TableViewState(
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

  /// Create series list with multiple series
  static List<TableRow> _createSampleData() {
    return [
      TableRow(
        children: [Text('1'),Text('1'),Text('1'),Text('1'),Text('1')],
        decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 3, style: BorderStyle.solid))
        ),
      TableRow(children: [Text('1'),Text('1'),Text('1'),Text('1'),Text('1')])
    ];
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
            items != null
                ? (AspectRatio(
                    aspectRatio: 1.6,
                    child: Table(
                      children: items,
                      columnWidths: <int, TableColumnWidth>{
                        0: FixedColumnWidth(100.0),
                        1: FixedColumnWidth(40.0),
                        2: FixedColumnWidth(100.0),
                      },
                      border: TableBorder.all(
                          color: Color(0xffdddddd),
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                  ))
                : Text('Loading'),
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

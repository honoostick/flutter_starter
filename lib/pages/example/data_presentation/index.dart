import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/example/data_presentation/charts.dart';
import 'package:flutter_starter/pages/example/data_presentation/list.dart' as mListView;
import 'package:flutter_starter/pages/example/data_presentation/table.dart';

/**
 * graph, table, list
 */
class DatePresentationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DatePresentationViewState();
  }
}

class DatePresentationViewState extends State<DatePresentationView> {
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
      body: Center(
        child: Column(
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChartsView()),
                );
              },
              color: Theme.of(context).primaryColor,
              child: Text(
                'Charts',
                style: TextStyle(color: Colors.white),
              ),
            ),
                        MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => mListView.MListView()),
                );
              },
              color: Theme.of(context).primaryColor,
              child: Text(
                'List',
                style: TextStyle(color: Colors.white),
              ),
            ),
                        MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TableView()),
                );
              },
              color: Theme.of(context).primaryColor,
              child: Text(
                'Table',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

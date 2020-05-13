import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/**
 * graph
 * https://google.github.io/charts/flutter/gallery.html
 * 
 */
class ChartsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChartsViewState();
  }
}

class ChartsViewState extends State<ChartsView> {
  List<charts.Series> seriesList;
  bool animate;

  ChartsViewState() {
    seriesList = _createSampleData();
    animate = false;
  }

  // factory ChartsViewState.withSampleData() {
  //   return ChartsViewState(
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
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tableSalesData = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
      new OrdinalSales('2017', 20),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
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
            seriesList != null
                ? (AspectRatio(
                    aspectRatio: 1.6,
                    child: charts.BarChart(
                      seriesList,
                      animate: animate,
                      barGroupingType: charts.BarGroupingType.grouped,
                    ),
                  ))
                : Text('Loading'),
            seriesList != null
                ? (AspectRatio(
                    aspectRatio: 1.6,
                    child: charts.BarChart(
                      seriesList,
                      animate: animate,
                      barGroupingType: charts.BarGroupingType.stacked,
                    ),
                  ))
                : Text('Loading'),
            seriesList != null
                ? (AspectRatio(
                    aspectRatio: 1.6,
                    child: charts.BarChart(
                      seriesList,
                      animate: animate,
                      vertical: false,
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

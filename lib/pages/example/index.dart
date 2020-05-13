import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/example/data_presentation/index.dart';
import 'package:flutter_starter/pages/example/form/index.dart';
import 'package:provider/provider.dart';
import '../../store/example.dart';
import '../../api/example_api.dart';

class ExampleView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExampleViewState();
  }
}

class ExampleViewState extends State<ExampleView>
    with AutomaticKeepAliveClientMixin<ExampleView> {
  var loading = true;

  ExampleViewState() {
    helloWorld();
  }

  @override
  bool get wantKeepAlive => true;

  helloWorld() {
    return ExampleAPI.helloWorld().then((res) {
      var data = res['data'];
      if (res['ok']) {
        print(1);
      }
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget profileView;
    if (loading) {
      profileView = Text('Loading');
    } else {
      profileView = MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DatePresentationView()),
          );
        },
        color: Theme.of(context).primaryColor,
        child: Text(
          'Date Presentation',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          profileView,
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormView()),
              );
            },
            color: Theme.of(context).primaryColor,
            child: Text(
              'Form',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Text('${Provider.of<ExampleModel>(context).theNum}'),
          MaterialButton(
            onPressed: () {
              Provider.of<ExampleModel>(context, listen: false).add();
            },
            child: Text('add'),
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scafoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      key: _scafoldkey,
      appBar: AppBar(
        title: Text("latihan Notification"),
      ),
      body: Center(
        child: Builder(
          builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    showToast();
                  },
                  child: Text("Show Toast"),
                ),
                MaterialButton(
                  onPressed: () {
                    showSnackbar();
                  },
                  child: Text("Show Snackbar"),
                ),
                MaterialButton(
                  onPressed: () {
                    showAlert(context);
                  },
                  child: Text("Show Alert"),
                )
              ]),
        ),
      ),
    ));
  }

  showToast() {
    setState(() {
      Fluttertoast.showToast(
          msg: 'This is notification from toast',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    });
  }

  void showSnackbar() {
    setState(() {
      final snackBar = SnackBar(
          content: Text("This is notifivation from snackbar"),
          duration: Duration(seconds: 5),
          action: SnackBarAction(
            label: 'undo',
            onPressed: () {},
          ));
      _scafoldkey.currentState.showSnackBar(snackBar);
    });
  }

  void showAlert(BuildContext context) {
    setState(() {
      Widget buttonOk = MaterialButton(
        child: Text("ok"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      Widget buttoncan = MaterialButton(
        child: Text("cancel"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      Widget buttonview = MaterialButton(
        child: Text("view"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      AlertDialog alert = AlertDialog(
        title: Text('Simple alert'),
        content: TextField(),
        //Text("This is alert message"),
        actions: [
          buttonOk,
          buttoncan,
          buttonview,
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    });
  }
}

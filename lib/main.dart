import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //It`s a controller which is used to control the textfield .
  var textfieldcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency convector '),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //Expanded is used if the whole item size is larger than screen size then it will be scrollable.
            //Basically it is used with ListView.
            Expanded(
              child: ListView(
                children: <Widget>[
                  //TextField is used to get the text input from user.
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: textfieldcontroller,
                    decoration: InputDecoration(
                        labelText: 'Amount', hintText: 'Enter The Amount'),
                  ),
                  //padding is used to give some space between two widget.
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  //Raised Button is used for a button .
                   RaisedButton(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Text('Convert'),
                    onPressed: () {
                      var amount =
                          double.parse(textfieldcontroller.text.toString()) *
                              0.014;
                      print(amount);
                      //Fluttertoast is an external plug in to perform the Native android toast effect.
                      Fluttertoast.showToast(
                          msg: amount.toString(),
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0,
                          );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Image.asset('assets/currency.jpg')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:intl/intl.dart';

class firstscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: book(),
    );
  }
}

class book extends StatefulWidget {
  @override
  _bookState createState() => _bookState();
}

class _bookState extends State<book> {
  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;
  String _format = 'yyyy-MMMM-dd';
  String _fromDateTime;
  String _toDateTime;

  void _showDatePickerFrom() {
    DatePicker.showDatePicker(
      context,
      dateFormat: _format,
      locale: _locale,
      onCancel: () => print('onCancel'),
      onConfirm: (dateTime, List<int> index) {
        var formatter = DateFormat("dd-MM-yyyy");
        setState(() {
          _fromDateTime = formatter.format(dateTime);
        });
      },
    );
  }

  void _showDatePickerTo() {
    DatePicker.showDatePicker(
      context,
      dateFormat: _format,
      locale: _locale,
      onCancel: () => print('onCancel'),
      onConfirm: (dateTime, List<int> index) {
        var formatter = DateFormat("dd-MM-yyyy");
        setState(() {
          _toDateTime = formatter.format(dateTime);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Image.network(
                      "https://images-na.ssl-images-amazon.com/images/I/41c0u9HnpOL._SX314_BO1,204,203,200_.jpg",
                      width: 150,
                      height: 200,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "Unposted Letter",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, bottom: 8, top: 10),
                            child: Text(
                              " Author : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, top: 12),
                            child: Text(
                              "Mahatria Ra",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Description : " ,style: TextStyle(fontSize: 18, color: Colors.black,fontWeight:FontWeight.bold ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:5,left: 10,right: 10,bottom: 10),
              child: Text(
                "   Unposted Letter shows us the path to understanding our subconscious mind, which helps us face the truth and manage our everyday struggles in a better way.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "  From Date : ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    _showDatePickerFrom();
                                  },
                                  child: Center(
                                    child: Text(
                                      _fromDateTime != null
                                          ? _fromDateTime
                                          : "Select Date",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 25),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "  To Date : ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  _showDatePickerTo();
                                },
                                child: Center(
                                  child: Text(
                                    _toDateTime != null
                                        ? _toDateTime
                                        : "Select Date",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
//            Padding(
//              padding: const EdgeInsets.only(top:45.0,left: 20,right: 20),
//              child:
//              Container(
//                height: 40,
//                width: MediaQuery.of(context).size.width,
//                decoration: BoxDecoration(
//                  color: Colors.deepPurple,
//                  borderRadius: BorderRadius.circular(15),
//                ),
//                child: Center(child: Text("Book Issue", style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
//              ),
//            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  height: 40,
                  width: 300,
                  child: FlatButton(
                    onPressed: () {},
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.deepPurple,
                    child: Text(
                      "Issue Book",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmc/firstscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pms',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => new Homepage(),
        '/firstscreen': (BuildContext context) => new firstscreen(),
      },
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget appBarTitle = Text("Books");
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );

  TextEditingController txtSearch = TextEditingController();

  Widget buildAppbar(BuildContext context) {
    return AppBar(
      title: appBarTitle,
      backgroundColor: Colors.deepPurple,
      actions: <Widget>[
        IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.appBarTitle = TextField(
                    controller: txtSearch,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.white)),
                  );
                } else {
                  this.actionIcon = Icon(
                    Icons.search,
                    color: Colors.white,
                  );
                  this.appBarTitle = Text("Books");
                  // txtSearch.clear();
                }
              });
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemBuilder: (BuildContext Context, int index) {
              return Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        "https://images-na.ssl-images-amazon.com/images/I/41c0u9HnpOL._SX314_BO1,204,203,200_.jpg",
                        width: 100,
                        height: 150,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Unposted Letter",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Unposted Letters is a collection of short articles published in different issues of the magazine, Frozen Thoughts, compiled by the editor.",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Author : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text("Mahatria Ra",
                                      style: TextStyle(fontSize: 16)),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FlatButton(
                                      color: Colors.deepPurple,
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/firstscreen');
                                      },
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                      child: Text(
                                        "Issue Book",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.end,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

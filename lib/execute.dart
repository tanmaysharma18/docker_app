import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Execute extends StatefulWidget {
  @override
  _ExecuteState createState() => _ExecuteState();
}

class _ExecuteState extends State<Execute> {
  String name;
  String cmd;
  var webdata;
  var webdata1;

  web(dockername, command) async {
    var url = 'http://192.168.99.101/cgi-bin/exec.py?x=$dockername&y=$command';
    var response = await http.get(url);
    setState(() {
      webdata = response.body;
    });
    print(webdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Execute Tab"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                    height: 30,
                  ),
                  Text(
                    "Enter the Container Name",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    height: 30,
                  ),
                  TextField(
                      decoration:
                          InputDecoration(hintText: "Enter the Container name"),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        name = value;
                      }),
                  SizedBox(
                    width: 10,
                    height: 40,
                  ),
                  Text(
                    "Enter the cmd",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    height: 20,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Enter the cmd"),
                    onChanged: (value) {
                      cmd = value;
                    },
                  ),
                  SizedBox(
                    width: 10,
                    height: 50,
                  ),
                  Builder(
                    builder: (context) => FlatButton(
                        child: Text(
                          "Click here",
                          style: TextStyle(
                            fontSize: 20,
                            backgroundColor: Colors.grey[200],
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          web(name, cmd);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Command executed!'),
                            duration: Duration(seconds: 3),
                          ));
                        }),
                  ),
                  SizedBox(
                    width: 10,
                    height: 30,
                  ),
                  Container(
                    width: 400,
                    height: 300,
                    child: Text(
                      webdata ?? "..",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    alignment: Alignment.center,
                    //color: Colors.blue,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.vertical(top: Radius.zero),
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

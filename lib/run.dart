import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

web(osname, imagename) async {
  var url =
      "http://192.168.99.101/cgi-bin/launch.py?x=${osname}&y=${imagename}";
  var response = await http.get(url);
  print(response.body);
}

class RunDocker extends StatelessWidget {
  String cmd;
  String imagename;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Docker App'),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.grey.shade300,
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    cmd = value;
                  },
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter ur Docker OS name",
                    prefixIcon: Icon(Icons.tablet_android),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    imagename = value;
                  },
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter image name",
                    prefixIcon: Icon(Icons.tablet_android),
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      web(cmd, imagename);
                      // print(cmd);
                    },
                    child: Text('Launch')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*class RunDocker extends StatefulWidget {
  @override
  _RunDockerState createState() => _RunDockerState();
}

class _RunDockerState extends State<RunDocker> {
  String osname;
  String imagename;
  var webdata;

  launch(osname, imagename) async {
    var url = 'http://192.168.99.101/cgi-bin/launch.py?x=$osname&y=$imagename';
    var response = await http.get(url);
    setState(() {
      webdata = response.body;
    });
    print(webdata);
  }

  final List<String> items = <String>['centos', 'httpd', 'wordpress', 'ubuntu'];
  String selectedItem = 'centos';

  bool docker = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Launch a docker',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Column(children: <Widget>[
                  SizedBox(
                    width: 10,
                    height: 20,
                  ),
                  Text(
                    "Enter the Conatiner name",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Enter a name"),
                    onChanged: (value) {
                      osname = value;
                    },
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 20,
                    height: 50,
                  ),
                  Text("Enter the image name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                      )),
                  SizedBox(
                    width: 10,
                    height: 30,
                  ),
                  DropdownButton<String>(
                    value: selectedItem,
                    onChanged: (String string) =>
                        setState(() => selectedItem = string),
                    selectedItemBuilder: (BuildContext context) {
                      return items.map<Widget>((String item) {
                        return Text(item);
                      }).toList();
                    },
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        child: Text(
                          '$item',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        value: item,
                      );
                    }).toList(),
                    onTap: () {
                      imagename = selectedItem;
                    },
                  ),
                  SizedBox(
                    width: 20,
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "To expose the container",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                      Checkbox(
                        value: docker,
                        onChanged: (bool value) {
                          setState(() {
                            docker = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Enter the port no."),
                    enabled: docker ? true : false,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 10,
                    height: 80,
                  ),
                  FlatButton(
                    onPressed: () {
                      launch(osname, imagename);
                    },
                    child: Text("Launch"),
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                    height: 80,
                  ),
                  Text(
                    webdata ?? "output is coming ...",
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/

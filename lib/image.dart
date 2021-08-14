import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateImage extends StatefulWidget {
  @override
  _CreateImageState createState() => _CreateImageState();
}

class _CreateImageState extends State<CreateImage> {
  String osname;
  String imagename;
  String version;
  var webdata;

  web(conName, imagename, version) async {
    var url =
        'http://192.168.99.101/cgi-bin/image.py?x=$conName&y=$imagename&z=$version';
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
        title: Text("Create a Docker Image"),
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
                    height: 15,
                  ),
                  Text("Enter the Container Name"),
                  SizedBox(
                    width: 10,
                    height: 35,
                  ),
                  TextField(
                      decoration:
                          InputDecoration(hintText: "Enter the Container name"),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        osname = value;
                      }),
                  SizedBox(
                    width: 10,
                    height: 40,
                  ),
                  Text("Enter the Image Name"),
                  SizedBox(
                    width: 10,
                    height: 35,
                  ),
                  TextField(
                      decoration:
                          InputDecoration(hintText: "Enter the Image name"),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        imagename = value;
                      }),
                  SizedBox(
                    width: 10,
                    height: 40,
                  ),
                  Text("Enter the Version"),
                  SizedBox(
                    width: 10,
                    height: 35,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Enter the version"),
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      version = value;
                    },
                  ),
                  SizedBox(
                    width: 10,
                    height: 40,
                  ),
                  Builder(
                    builder: (context) => FlatButton(
                        child: Text(
                          "Create",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          web(osname, imagename, version);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Image created'),
                            duration: Duration(seconds: 3),
                          ));
                        }),
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

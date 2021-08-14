import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DockerList extends StatefulWidget {
  @override
  _DockerListState createState() => _DockerListState();
}

class _DockerListState extends State<DockerList> {
  var webdata;

  web() async {
    var url = 'http://192.168.99.101/cgi-bin/docker.py';
    var response = await http.get(url);
    setState(() {
      webdata = response.body;
    });
    print(webdata);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("output"),
        ),
        body: SafeArea(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Container(),
            ),
          ),
        ),
      ),
    );
  }
}

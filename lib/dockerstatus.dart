import 'package:docker_task/dockerlist.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DockerStatus extends StatefulWidget {
  @override
  _DockerStatusState createState() => _DockerStatusState();
}

class _DockerStatusState extends State<DockerStatus> {
  String cmd;
  String cmd1;
  String cmd2;
  String ip;
  var webdata;
  var webdata1;
  var webdata2;
  var webdata3;
  var webdata4;
  var webdata5;

  web() async {
    var url = 'http://192.168.99.101/cgi-bin/docker.py';
    var response = await http.get(url);
    setState(() {
      webdata = response.body;
    });
    print(webdata);
  }

  web1(name) async {
    var url = 'http://192.168.99.101/cgi-bin/docker1.py?x=$name';
    var response = await http.get(url);
    setState(() {
      webdata1 = response.body;
    });
    print(webdata1);
  }

  web2(name) async {
    var url = 'http://192.168.99.101/cgi-bin/docker2.py?x=$name';
    var response = await http.get(url);
    setState(() {
      webdata2 = response.body;
    });
    print(webdata2);
  }

  web3(name) async {
    var url = 'http://192.168.99.101/cgi-bin/docker_rm.py?x=$name';
    var response = await http.get(url);
    setState(() {
      webdata3 = response.body;
    });
    print(webdata3);
  }

  web4() async {
    var url = 'http://192.168.99.101/cgi-bin/docker_rm_all.py';
    var response = await http.get(url);
    setState(() {
      webdata4 = response.body;
    });
    print(webdata4);
  }

  web5(ip) async {
    var url = 'http://192.168.99.101/cgi-bin/ip.py?x=$ip';
    var response = await http.get(url);
    setState(() {
      webdata5 = response.body;
    });
    print(webdata5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Status of docker',
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
                Text(
                  "To see the list of docker container",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 15,
                ),
                FlatButton(
                  onPressed: () {
                    web();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DockerList()));
                  },
                  child: Text(
                    "click here",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 60,
                ),
                Text(
                  "To start a container",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter the container name or id"),
                  textAlign: TextAlign.center,
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
                        "click here",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        web1(cmd);
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Container $cmd started'),
                          duration: Duration(seconds: 3),
                        ));
                      }),
                ),
                SizedBox(
                  width: 20,
                  height: 50,
                ),
                Text(
                  "To stop a container",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 50,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter the container name or id"),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    cmd1 = value;
                  },
                ),
                SizedBox(
                  width: 20,
                  height: 50,
                ),
                Builder(
                  builder: (context) => FlatButton(
                      child: Text(
                        "click here",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        web2(cmd1);
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Container $cmd1 stopped!'),
                          duration: Duration(seconds: 3),
                        ));
                      }),
                ),
                SizedBox(
                  width: 20,
                  height: 60,
                ),
                Text(
                  "To delete a container",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 50,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter the container name or id"),
                  textAlign: TextAlign.center,
                  onChanged: (name) {
                    cmd2 = name;
                  },
                ),
                SizedBox(
                  width: 20,
                  height: 50,
                ),
                Builder(
                  builder: (context) => FlatButton(
                      child: Text(
                        "click here",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        web3(cmd2);
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Container $cmd2 deleted'),
                          duration: Duration(seconds: 3),
                        ));
                      }),
                ),
                SizedBox(
                  width: 20,
                  height: 60,
                ),
                Text(
                  "To see the ip of container",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter the container name or id"),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    ip = value;
                  },
                ),
                SizedBox(
                  width: 10,
                  height: 50,
                ),
                Builder(
                  builder: (context) => FlatButton(
                      child: Text(
                        "click here",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        web5(ip);
                      }),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

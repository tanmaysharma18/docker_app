import 'package:docker_task/execute.dart';
import 'package:docker_task/dockerstatus.dart';
import 'package:docker_task/image.dart';
import 'package:docker_task/run.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

String cmd;

func() {
  print("jk");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Docker"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(alignment: Alignment.topCenter, children: <Widget>[]),
        ),
        drawer: Builder(
          builder: (context) => Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  subtitle: Text("To see status of docker"),
                  leading: Icon(
                    Icons.info,
                    size: 30,
                    color: Colors.indigo,
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(
                        "Docker Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DockerStatus()));
                  },
                ),
                ListTile(
                  subtitle:
                      Text("Launching a docker container using your image"),
                  leading: Icon(
                    Icons.directions_run,
                    size: 30,
                    color: Colors.indigo,
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(
                        "RUN A DOCKER CONTAINER",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RunDocker()));
                  },
                ),
                ListTile(
                  subtitle: Text("Run cmds in docker"),
                  leading: Icon(
                    Icons.create,
                    size: 30,
                    color: Colors.indigo,
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(
                        "Execute",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Execute()));
                  },
                ),
                ListTile(
                  subtitle: Text("To create your own image"),
                  leading: Icon(
                    Icons.music_video,
                    size: 30,
                    color: Colors.indigo,
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(
                        "Create Image",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateImage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

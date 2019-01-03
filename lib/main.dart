import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() async {

  List _data = await getJson();
  print(_data);
  for(int i=0; i< _data.length; i++){
    print(_data[i]['title']);
  }

  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("JSON"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Center(
        child: new ListView.builder(
            itemCount: _data.length,
            padding: const EdgeInsets.all(14.5),
            itemBuilder: (BuildContext context, int position){
              return Column(
                children: <Widget>[
                  new Divider(height: 5.5),
                  new ListTile(
                    title: Text("${_data[position]['title']}"),
                  )
                ],
              );
            })
      ),
    )
  ));
}

Future<List> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}

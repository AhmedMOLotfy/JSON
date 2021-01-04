import 'dart:async';
import 'dart:convert';
import 'package:json/MyModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future<List<Results>> fetchAlbum() async {
  final response = await http.get(
      'https://api.nytimes.com/svc/topstories/v2/business.json?api-key=kmFzeLy3fuGwS7FYuDCgvMpplpJ6GAkJ');
  if (response.statusCode == 200) {
    List<Results> list;
    var parsed = jsonDecode(response.body);
    var results = parsed['results'] as List;
    list = results.map<Results>((json) => Results.fromJson(json)).toList();
    return list;
  } else {
    throw Exception('Failed to load album');
  }
}

// Future<Times> ok() {
//   Future<Times> myf = fetchAlbum();
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Results>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Results>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data.map((e) => _buildItem(e)).toList(),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildItem(Results results) {
  return Column(
    children: [
      ExpansionTile(
        title: Padding(
          padding: EdgeInsets.all(3),
          child: Text("""${results.title.toString()}"""),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(results.byline.toString()),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () {
                  launch(results.url);
                },
              ),
            ],
          )
        ],
      ),
    ],
  );
}

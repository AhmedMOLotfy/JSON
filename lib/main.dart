import 'dart:async';
import 'dart:convert';
import 'package:json/MyModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Results>> fetchAlbum() async {
  final response =
      await http.get('https://api.nytimes.com/svc/topstories/v2/busin'
          'ess.json?api-key=kmFzeLy3fuGwS7FYuDCgvMpplpJ6GAkJ');

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
        primarySwatch: Colors.blue,
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
                  children: snapshot.data.map((e) => Text(e.url)).toList(),
                );
              }
              //   return Center(
              //     child: ListView(
              //       children: [
              //         Text("STATUS : ${snapshot.data.first.shortUrl}"),
              //         // Text("Section: ${snapshot.data.section}"),
              //         // Text("Copy Right: ${snapshot.data.copyright}"),
              //         // Text(
              //         //   "Num Results : ${snapshot.data.numResults.toString()}",
              //         // ),
              //         // Text(
              //         //   "Last Updated : ${snapshot.data.lastUpdated}",
              //         // ),
              //         // Padding(
              //         //   padding: const EdgeInsets.all(8.0),
              //         //   child: Text(
              //         //       "First Results : ${snapshot.data.results.first.toString()}"),
              //         // ),
              //       ],
              //     ),
              //   );
              // }
              else if (snapshot.hasError) {
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

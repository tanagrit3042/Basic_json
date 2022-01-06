import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Widjed"),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
            builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(data[index]["title"], data[index]['subtitle'],
                      data[index]['imageURL'], data[index]['detail']);
                },
                itemCount: data.length,
              );
            },
            future:
                DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )),
    );
  }

  Widget MyBox(String title, String subtitle, String imageURL, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = imageURL;
    v4 = detail;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      height: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageURL),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken)),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Test Widjet 1 $title",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          Text(
            "Test Widjet 2 $subtitle",
            style: TextStyle(
                fontSize: 25,
                color: Colors.white70,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextButton(
              onPressed: () {
                print("Next page");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detaipage(v1, v2, v3, v4)));
              },
              child: Text("อ่านต่อ",
                  style: TextStyle(fontSize: 10, color: Colors.white)))
        ],
      ),
    );
  }
}

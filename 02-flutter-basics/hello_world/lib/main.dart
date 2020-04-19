import 'package:flutter/material.dart';

import 'app_screens/home.dart';

void main() => runApp(MaterialApp(
      title: "Exploring UI widgets",
      home: Scaffold(
        appBar: AppBar(title: Text("Long list")),
        body: getListView()
      ),
    ));

List<String> getListElements() =>
    List<String>.generate(1000, (counter) => "Item $counter");

Widget getListView() {
  var listItems = getListElements();

  var listView = ListView.builder(
    itemBuilder: (context, index) => ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () => debugPrint('${listItems[index]} was tapped')

      ),
  );
  return listView;
}

// Long list are memory efficient, cause they load only items that we can actually see
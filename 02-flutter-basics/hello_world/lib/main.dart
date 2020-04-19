import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
      title: "Exploring UI widgets",
      home: Scaffold(
        appBar: AppBar(title: Text("Long list")),
        body: getListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> debugPrint("Working"),
          child: Icon(Icons.add),
          tooltip: "Add one more item",
        )
      ),
    ));


void showSnackBar(BuildContext context,String item){
  var snackBar = SnackBar(
    content: Text("You just tapped $item"),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: ()=>debugPrint("Dummy undo"),)
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
List<String> getListElements() =>
    List<String>.generate(1000, (counter) => "Item $counter");

Widget getListView() {
  var listItems = getListElements();

  var listView = ListView.builder(
    itemBuilder: (context, index) => ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () => showSnackBar(context,listItems[index])

      ),
  );
  return listView;
}

// Long list are memory efficient, cause they load only items that we can actually see
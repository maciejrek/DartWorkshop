import 'package:flutter/material.dart';

import 'app_screens/home.dart';


void main() => runApp(MaterialApp(
  title:"Exploring UI widgets",
  home: Scaffold(
    appBar:AppBar(title:Text("Basic list view - meant only for few list items")),
    body:getListView(),
  ),
));


Widget getListView(){
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading:Icon(Icons.landscape),
        title: Text("Title text"),
        subtitle:Text("Subtitle text"),
        trailing: Icon(Icons.wb_sunny),
        onTap:()=>debugPrint("Text"),

      ),
      ListTile(
        leading:Icon(Icons.laptop_chromebook),
        title: Text("laptop"),
      ),
      ListTile(
        leading:Icon(Icons.phone_android),
        title: Text("phone"),
      ),
      ListTile(
        leading:Icon(Icons.laptop_mac),
        title: Text("laptop mac"),
      ),
      Text("We can add any widget as a list element, like text"),
      Container(color:Colors.red,height:50.0,child:Text("Or even container"))
    ],
  );
  return listView;
}
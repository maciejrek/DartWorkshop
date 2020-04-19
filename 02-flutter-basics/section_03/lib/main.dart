import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Stateful App Example",
      home: FavouriteCity(),
    ));

//this class is immutable
class FavouriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavouriteCityState();
  }
}

//but the state is mutable 
class _FavouriteCityState extends State<FavouriteCity> {
  String nameCity = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stateful app example")),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                onSubmitted: (String userInput) => setState(()=> nameCity = userInput),
              ),
               TextField(
                onChanged: (String userInput) => setState(()=> nameCity = userInput),
              ),
              Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    "Your city name is $nameCity",
                    style: TextStyle(fontSize: 20.0),
                  )),
                  
            ],
          ),
        ));
  }
}

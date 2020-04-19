import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Simple Interest Calculator App',
      home: SIForm(),
    ));

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _currencies = ["Rupees", "Dollars", "Euro"];
  final _minimalPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Container(
          margin: EdgeInsets.all(_minimalPadding * 2),
          child: ListView(
            children: <Widget>[
              getImageAsset(),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimalPadding, bottom: _minimalPadding),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Principal',
                        hintText: 'Enter Principal e.g. 12000',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimalPadding, bottom: _minimalPadding),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Rate of Interest',
                        hintText: 'In percent',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                padding: EdgeInsets.only(top: _minimalPadding,bottom:_minimalPadding),
                child:Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Term',
                        hintText: 'Time in years',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                  Container(width:_minimalPadding*5,),
                  Expanded(
                      child: DropdownButton<String>(
                    items: _currencies
                        .map((String value) =>
                            DropdownMenuItem(value: value, child: Text(value)))
                        .toList(),
                    value: "Rupees",
                    onChanged: (String newValueSelected) => null,
                  ))
                ],
              )),
              Padding(
                padding: EdgeInsets.only(top: _minimalPadding,bottom:_minimalPadding),
                child: Row(children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child:Text("Calculate"),
                      onPressed:(){},
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child:Text("Reset"),
                      onPressed:(){},
                    ),
                  )
                ],)
              ),
              Padding(
                padding: EdgeInsets.only(top: _minimalPadding,bottom:_minimalPadding),
                child:Text("Todo text"),
              )
            ],
          )),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/wolf.png');
    Image image = Image(image: assetImage, width: 125.0, height: 125.0);
    return Container(
        child: image, margin: EdgeInsets.all(_minimalPadding * 10));
  }
}

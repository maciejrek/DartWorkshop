import 'package:flutter/material.dart';

void main() { 
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Interest Calculator App',
      home: SIForm(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
      ),
    )
    );
    }

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _currencies = ["Rupees", "Dollars", "Euro"];
  final _minimalPadding = 5.0;
  var _currentItemSelected = '';

  @override
  void initState(){
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var _displayResult = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
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
                    style: textStyle,
                    controller:principalController,
                    decoration: InputDecoration(
                        labelText: 'Principal',
                        hintText: 'Enter Principal e.g. 12000',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),

              Padding(
                  padding: EdgeInsets.only(
                      top: _minimalPadding, bottom: _minimalPadding),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: roiController,
                    decoration: InputDecoration(
                        labelText: 'Rate of Interest',
                        labelStyle: textStyle,
                        hintText: 'In percent',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),

              Padding(
                  padding: EdgeInsets.only(
                      top: _minimalPadding, bottom: _minimalPadding),
                  child: Row(
                    children: <Widget>[

                      Expanded(
                          child: TextField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: termController,
                        decoration: InputDecoration(
                            labelText: 'Term',
                            hintText: 'Time in years',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),

                      Container(
                        width: _minimalPadding * 5,
                      ),

                      Expanded(
                          child: DropdownButton<String>(
                        items: _currencies
                            .map((String value) { return DropdownMenuItem(
                                value: value, child: Text(value));})
                            .toList(),
                        value: _currentItemSelected,
                        onChanged: (String newValueSelected){
                            _onDropDownItemSelected(newValueSelected);},
                      ))
                    ],
                  )),

              Padding(
                  padding: EdgeInsets.only(
                      top: _minimalPadding, bottom: _minimalPadding),
                  child: Row(children: <Widget>[

                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          textColor: Theme.of(context).primaryColorDark,
                          child: Text(
                            "Calculate",
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState((){this._displayResult=_calculateTotalReturn();});
                          },
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            "Reset",
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () { setState((){_reset();});},
                        ),
                      )
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimalPadding, bottom: _minimalPadding),
                child: Text(this._displayResult, style: textStyle),
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

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() => this._currentItemSelected = newValueSelected);
  }

  String _calculateTotalReturn()
  {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term ) /100;

    String result = 'After $term years, your investment wil lbe worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

  void _reset(){
    principalController.text='';
    roiController.text='';
    termController.text='';
    _displayResult='';
    _currentItemSelected=_currencies[0];
  }
}

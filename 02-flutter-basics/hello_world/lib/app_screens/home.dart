import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.only(left: 10.0, top: 40.0),
            alignment: Alignment.center,
            color: Colors.deepPurple,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Col 1 Row 1",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 35.0,
                        fontFamily: 'ComicNeue',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "Col 1 Row 2",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 15.0,
                        fontFamily: 'ComicNeue',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Col 2 Row 1",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 35.0,
                        fontFamily: 'ComicNeue',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "Col 2 Row 2",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 15.0,
                        fontFamily: 'ComicNeue',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ))
                  ],
                ),
                MyImageAsset(),
                MyButton(),
              ],
            )));
  }
}

class MyImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/wolf.png');
    Image image = Image(image: assetImage, width: 250.0, height: 250.0);
    return Container(child: image);
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: 250.0,
      height: 50.0,
      child: RaisedButton(
        color: Colors.deepOrange,
        child: Text("My button text",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontFamily: 'ComicNeue',
              fontWeight: FontWeight.w700,
            )),
        elevation: 6.0,
        onPressed: () => myFunc(context),
      ),
    );
  }
}

void myFunc(BuildContext context) {
  var alertDialog = AlertDialog(
      title: Text("Title of alert dialog"),
      content: Text("Content of alert dialog"));

  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}

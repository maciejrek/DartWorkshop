import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  String appBarTitle;
  NoteDetail(this.appBarTitle);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  static var _priorities = ["High", "Low"];
  String appBarTitle;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var _current_priority = _priorities[0];

  NoteDetailState(this.appBarTitle);
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return WillPopScope(
    onWillPop:(){
      //Define what happens when user press back on device
      moveToLastScreen();
    },
    child:Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(
            icon:Icon(Icons.arrow_back_ios),
            onPressed:(){
              //Define what happens when user press back in AppBar
              moveToLastScreen();
            }
            ),
        ),

        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              //First element, dropdown
              ListTile(
                title: DropdownButton(
                    items: _priorities.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem));
                    }).toList(),
                    style: textStyle,
                    value: _current_priority,
                    onChanged: (valueSelectedByUser) {
                      setState(() {
                        debugPrint('User selected $valueSelectedByUser');
                      });
                    }),
              ),

              //Second element, text field
              Padding(
                padding: EdgeInsets.only(top:15.0,bottom:15.0),
                child:TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged:(value){
                    debugPrint('Something changed in title text field');
                  },
                  decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),
              ),

              //Third element, text field
              Padding(
                padding: EdgeInsets.only(top:15.0,bottom:15.0),
                child:TextField(
                  controller: descriptionController,
                  style: textStyle,
                  onChanged:(value){
                    debugPrint('Something changed in description text field');
                  },
                  decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),
              ),

              //Fourth element, buttons
              Padding(
                padding: EdgeInsets.only(top:15.0,bottom:15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child:Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        setState((){
                          debugPrint("Save button clicked");
                        });
                      },
                    ),),

                    Container(width: 5.0,),

                    Expanded(child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child:Text(
                        'Delete',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        setState((){
                          debugPrint("Delete button clicked");
                        });
                      },
                    ),)
                  ],
                )
              )
            ],
          ),
        )));
  }
  void moveToLastScreen(){
    Navigator.pop(context);
  }
}

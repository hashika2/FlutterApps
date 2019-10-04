import 'package:flutter/material.dart';
import 'package:notodo_app/ui/model/nodo_item.dart';
import 'package:notodo_app/ui/util/database_client.dart';

class NotoDoScreen extends StatefulWidget {
  NotoDoScreen({Key key}) : super(key: key);

  _NotoDoScreenState createState() => _NotoDoScreenState();
}

class _NotoDoScreenState extends State<NotoDoScreen> {
  final TextEditingController  _textEditingController = new TextEditingController(); 
  var db=new DatabaseHelper();

   Future _handleSubmit(String text) async {
     _textEditingController.clear();
     NoDoItem noDoItem= new NoDoItem(text, DateTime.now().toIso8601String());
     int savedItemId= await db.saveItem(noDoItem);

     print("item saved id:$savedItemId");

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black87,
     body: Column(),


     floatingActionButton: new FloatingActionButton(
       tooltip:"Add item",
       backgroundColor: Colors.redAccent,
       child: new ListTile(
         title: new Icon(Icons.add),
       ),
       onPressed: _showFormDiaog,
            ),
           );
         }
       
         void _showFormDiaog() {
           var alert=new AlertDialog(
             content: new Row(
               children: <Widget>[
                 new Expanded(
                   child: new TextField(
                     controller: _textEditingController,
                     autofocus: true,
                     decoration: new InputDecoration(
                       labelText: "item",
                       hintText: "eg.Don't buy stuff",
                       icon: new Icon(Icons.note_add)
                     ),
                   ),
                 )
               ],
             ),
             actions: <Widget>[
               new FlatButton(
                 onPressed: (){
                   _handleSubmit(_textEditingController.text);
                                      _textEditingController.clear();
                                    },
                                    child: Text("Save"),),
                                    new FlatButton(
                                      onPressed: ()=>Navigator.pop(context),
                                      child: Text("Cancel"),
                                    )
                                ],
                              );

                              showDialog(context: context,
                                builder: (_){
                                  return alert;
                                }
                              );
                   
                           }
                   
                    
}
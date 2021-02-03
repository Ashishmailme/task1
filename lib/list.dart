import 'package:flutter/material.dart';
import 'package:task1/model/list.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

import 'dart:convert';


class homePage extends StatefulWidget {
  
  @override
  _homePageState createState() => _homePageState();
  
}

class _homePageState extends State<homePage> {
  
   final String url = "https://jsonplaceholder.typicode.com/users";
   List data;

 
 @override
  void initState(){
  super.initState();
  this.getJsonData();
  }

   Future<String> getJsonData() async{
     var response = await http.get(
       Uri.encodeFull(url),
       headers: {"Accept":"application/json"}
     );
     print(url);
     print(response.body);

     setState(() {
       var converDataToJson = json.decode(response.body);
       data = converDataToJson;
     });
   }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Task 1')
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder:(BuildContext context,int index){
          return new Container(
            child:new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                     child:GestureDetector(
                       onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    	builder: (context) => _DestinationScreenState()),
  );
                       },
                        child: new Container(
                        child:new Text(data[index]["name"]),
                        padding: const EdgeInsets.all(20.0)),
                     )
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}




class _DestinationScreenState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child:Text("This is second Screen",style: TextStyle(color: Colors.white, fontSize: 24)),
      
    );
  }
}
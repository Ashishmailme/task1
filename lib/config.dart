// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
// import 'model/list.dart';

// import 'dart:convert';



// class api_manager{
//   Future<ListModel> getitems() async {
//     var listModel = null;

//     try{
//     var url= 'https://jsonplaceholder.typicode.com/users';
//     print(url);
//     var response = await http.get(url,headers:{"Accept":"application/json"});
//     print(response.body);
    

//     // checking the url
//     if(response.statusCode == 200){
//      var jsonString = response.body;
//      var jsonMap = json.decode(jsonString); 
   
//      listModel = ListModel.fromJson(jsonMap);
//     }
//   }catch(Exception){
//     return listModel;
//   }
//     return listModel;
    
//   }
  
// }

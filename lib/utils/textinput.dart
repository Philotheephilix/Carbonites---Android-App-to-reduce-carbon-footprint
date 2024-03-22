// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class DataHandling {
  static double totalexp = 0;
  static double totalcredit = 0;
  static double tempamount = 0 ;
  static List<Map<String, String>> dataList = [];
  static void handleData(String receiver, String amount) {
    // Create a map with the submitted data
    Map<String, String> dataMap = {
      'receiver': receiver,
      'amount': amount,
    };
     tempamount= double.tryParse(amount.toString()) ?? 0;
     if(tempamount<=0){
      totalexp += (tempamount*-1);
     }
     else{
      totalcredit += tempamount;
     }
    dataList.add(dataMap);
    print('Updated data list: $dataList');

  }
}



class TextDiaglog{
final TextEditingController _firstFieldController = TextEditingController();
  final TextEditingController _secondFieldController = TextEditingController();
Future openTextDialog(BuildContext context) => showDialog(
  context: context, 
  builder: (context)=>  AlertDialog(
    title: Text("Create New Transaction ",
    style: TextStyle(
    color: Color.fromARGB(255, 220, 220, 220),fontSize: 17
    ),),
   backgroundColor: Color.fromARGB(255, 0, 0, 0),
    content: Column(children: [
       SizedBox(
        height: 25,
      ),
      TextField(
        autofocus: true,
        style: TextStyle(color: Color.fromRGBO(192, 192, 192, 1),fontSize: 17,),
        controller: _firstFieldController,
        decoration: InputDecoration(hintText: "Sent to/Received from",
        hintStyle: TextStyle(fontWeight: FontWeight.w200,color: Color.fromARGB(255, 175, 175, 175)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(140, 132, 132, 132),
          width: 0.5)
        )
        ,focusedBorder: OutlineInputBorder(
          borderSide:BorderSide(color: Color.fromARGB(140, 132, 132, 132),
          width: 0.5)
        )),
      ),
      SizedBox(
        height: 25,
      ),
      TextField(
                controller: _secondFieldController,

                style: TextStyle(color: Color.fromARGB(255, 192, 192, 192),fontSize: 17,),

        decoration: InputDecoration(hintText: "Enter Amount",hintStyle: TextStyle(fontWeight: FontWeight.w200,color: Color.fromARGB(255, 172, 172, 172)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(140, 132, 132, 132),
          width: 0.5)
        )
        ,focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(140, 132, 132, 132),
          width: 0.5)
        )),
      ),
    ]),
    actions: [
      // ignore: sort_child_properties_last
      ElevatedButton( child: Text("Submit",
      style: TextStyle(color: Color.fromARGB(255, 48, 48, 48)),),
      onPressed: () => submit(context),
      style: ButtonStyle(
       backgroundColor: MaterialStateProperty.all<Color>(
      Color.fromARGB(255, 66, 235, 40),
    ),
      ),
      )
  ],
  ),);
  void submit (BuildContext context){
    var _receiver  = _firstFieldController.text;
    var _amount = _secondFieldController.text;
    print(_amount +_receiver);
    DataHandling.handleData(_receiver,_amount);
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}
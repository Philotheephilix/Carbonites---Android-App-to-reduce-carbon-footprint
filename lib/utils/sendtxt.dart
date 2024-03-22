import 'dart:convert';

import 'package:http/http.dart' as http;
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

Future<void> snedtxt(String? rectext) async{
       const String serverUrl = " https://a9a7-2409-408d-182-5b30-94dc-cd8c-58f3-a2f8.ngrok-free.app/process";
      final Uri url = Uri.parse(serverUrl);
      Map<String,String> headers = {"Content-type":"application/json"};
         Map<String,String> body = {"rectext":rectext!};
         String jBody = jsonEncode(body);
         try{
        final response = await http.post(url,headers: headers,body : jBody);
        if (response.statusCode == 200) {
          final Map<String,dynamic> data = jsonDecode(response.body);
         final String amount = (data['total'] is List && data['total'].isNotEmpty)
          ? data['total'][0].toString()
          : data['total'].toString();
         DataHandling.handleData(data['org'],"-"+amount);
        }
         }
         catch(e){
          print('Error sending request: $e');
         }
          ;


}
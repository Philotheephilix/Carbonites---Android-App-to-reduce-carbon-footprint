class Transactions{
  static List<Map<String,String>> datastorage=[];
  static void handledata(String _receivername,String _amount){
    Map<String,String> dataGet = {
      "reciever":_receivername,
      "amount" : _amount,
    };
    datastorage.add(dataGet);
    print(datastorage);
  }
}
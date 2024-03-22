import 'package:pi_carbon_tracer/utils/textinput.dart';
import 'package:flutter/material.dart';

void imagePickerModal(BuildContext context,{VoidCallback? onCameratap, VoidCallback?onGallerytap}){
   showModalBottomSheet(context: context, builder: (context){
   return Container(
    height: 260,
    decoration: const BoxDecoration(color:Color.fromARGB(255, 26, 26, 26) ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Container(
            decoration: BoxDecoration( color:Color.fromARGB(255, 158, 158, 158),borderRadius: BorderRadius.circular(8)),
            height: 5,
            width: 130,
            
          ),
        ),
        const SizedBox(height: 28,),
        GestureDetector(
          onTap: onCameratap,
          child: Card(
            child: Container(
               width: 175,
              height: 45,
              decoration: BoxDecoration(color:Color.fromARGB(255, 101, 255, 77) ,borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding:  EdgeInsets.only(left:25.0,right: 25,top: 8,bottom: 8),
                child: Center(child: Text("Take picture ",style:TextStyle(fontSize: 17,color:Color.fromARGB(255, 0, 0, 0) ) ,)),
              ),
        
            ),
          ),
        ),
         const SizedBox(height: 15,),
         GestureDetector(
           onTap: onGallerytap,
           child: Card(
            child: Container(
              width: 175,
              height: 45,
              decoration: BoxDecoration(color:Color.fromARGB(255, 101, 255, 77) ,borderRadius: BorderRadius.circular(5)),
              child:const  Padding(
                padding:  EdgeInsets.only(left:25.0,right: 25,top: 8,bottom: 8),
                child: Center(child: Text("Upload image ",style:TextStyle(fontSize: 17,color:Color.fromARGB(255, 0, 0, 0), ) ,)),
              ),
         
            ),
                 ),
         ),
          const SizedBox(height: 15,),
         GestureDetector(
           onTap:(){
            var textDiaglog = TextDiaglog();
            textDiaglog.openTextDialog(context);
           },
           child: Card(
            child: Container(
              width: 175,
              height: 45,
              decoration: BoxDecoration(color:Color.fromARGB(255, 101, 255, 77) ,borderRadius: BorderRadius.circular(5)),
              child:const  Padding(
                padding:  EdgeInsets.only(left:25.0,right: 25,top: 8,bottom: 8),
                child: Center(child: Text("Enter text ",style:TextStyle(fontSize: 17,color:Color.fromARGB(255, 0, 0, 0), ) ,)),
              ),
         
            ),
                 ),
         )
      ],
    ),
   );
});}
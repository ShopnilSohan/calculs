import 'package:calcul/widget/color.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double firstnum=0.0;
  double secondnum=0.0;
  var input='';
  var output='';
  var operation='';
  var hideInput=false;
  var outputSize=34.0;
  OnbuttonClick(value){
    if( value=='AC'){
      input ='';
      output='';
    }
    else if(
    value=='Del'
    ){
      if (input.isNotEmpty)
      input=input.substring(0,input.length-1);
    }
    else if (
    value=='=') {
      var userInput = input;
      userInput=input.replaceAll('x', '*');
      Parser P=Parser();
      Expression expression = P.parse(userInput);
      ContextModel cm = ContextModel();
      var finalvalue= expression.evaluate(EvaluationType.REAL, cm);
      output= finalvalue.toString();
      if(output.endsWith('.0')){
        output =output.substring(0,output.length-2);
        input=output;
        hideInput=true;
        outputSize=52;
      }

    }
    else {
      input=input+value;
      hideInput=false;
      outputSize=34;
    }
    setState(() {

    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Text( hideInput?'': input,
                 style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 48,
                     color: Colors.white),),
               SizedBox(
                 height: 20,
               ),
               Text(output,style: TextStyle(fontWeight: FontWeight.bold,fontSize: outputSize,color: Colors.white70),),
               SizedBox(
                 height: 20,
               ),
             ],
            ),
          )),
          Row(
            children: [
              button(
                text: 'AC',buttonbgColor: Colors.deepOrange
              ),
              button(
                text: 'Del',buttonbgColor: Colors.deepOrange
              ),
              button(
                text: '',buttonbgColor: Colors.deepOrange
              ),
              button(
                text: '/',buttonbgColor: Colors.deepOrange
              ),


            ],
          ),
          Row(
            children: [
              button(
                text: '7',
              ),
              button(
                text: '8',
              ),
              button(
                text: '9',
              ),
              button(
                text: 'x',buttonbgColor: Colors.deepOrange
              ),


            ],
          ),
          Row(
            children: [
              button(
                text: '4',
              ),
              button(
                text: '5',
              ),
              button(
                text: '6',
              ),
              button(
                text: '-',buttonbgColor: Colors.deepOrange
              ),


            ],
          ),
          Row(
            children: [
              button(
                text: '1',
              ),
              button(
                text: '2',
              ),
              button(
                text: '3',
              ),
              button(
                text: '+',buttonbgColor: Colors.deepOrange
              ),


            ],
          ),
          Row(
            children: [
              button(
                text: '%',
              ),
              button(
                text: '0',
              ),
              button(
                text: '.',
              ),
              button(
                text: '=',buttonbgColor: Colors.deepOrange,
              ),


            ],
          ),
        ],
      ),
    );
  }
  Widget button ({
    text, tColor=Colors.white, buttonbgColor= buttonColor
}){
    return  Expanded(child:
    Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: buttonbgColor,
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        ),
        child: Text(text,style: TextStyle(color: tColor,fontSize: 18,fontWeight: FontWeight.bold),),
        onPressed: ()=> OnbuttonClick(text),
      ),
    ));
  }
}

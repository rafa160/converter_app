
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'dart:convert';

import 'package:loading/loading.dart';

class ConverterPage extends StatefulWidget {
  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final libraController = TextEditingController();

  double dolar;
  double euro;
  double libra;
  double real;

  void _realChanged(String text){
    double real = double.parse(text);
    dolarController.text = (real/dolar).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
    libraController.text = (real/libra).toStringAsFixed(2);

  }
  void _euroChanged(String text){
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
    libraController.text = (euro * this.euro / libra).toStringAsFixed(2);


  }
  void _dolarChanged(String text){
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar/ euro).toStringAsFixed(2);
    libraController.text = (dolar * this.dolar/ libra).toStringAsFixed(2);

  }
  void _libraChanged(String text){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.amberAccent,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.black,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Converter App",
            style: TextStyle(color: Colors.amberAccent),
          ),
        ),
      ),
      body: FutureBuilder<Map>(
        future:getData(),
        builder: (context,snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return  _onLoading();
            default:
              if(snapshot.hasError){
                return Text("teste");
              } else {
                dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                libra = snapshot.data["results"]["currencies"]["GBP"]["buy"];
                return _showList();
              }
          }
        },
      ),
    );
  }

  Widget _showList(){
    return SingleChildScrollView(padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: Image.network(
                "https://i.pinimg.com/originals/2e/e6/99/2ee6998e34c3e2eff7b894c66cfc5267.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            buildTextField("Real", "R\$",realController, _realChanged),
            SizedBox(
              height: 20,
            ),
            buildTextField("Euro", "€",euroController, _euroChanged),
            SizedBox(
              height: 20,
            ),
            buildTextField("Libras", "£",libraController, _libraChanged),
            SizedBox(
              height: 20,
            ),
            buildTextField("Dolar", "US\$",dolarController, _dolarChanged),
            SizedBox(
              height: 20,
            ),
          ],
        ),
    );
  }

  Widget _onLoading() {
    return Align(
      child: Center(
        child: Loading(
          indicator: BallPulseIndicator(),
          size: 60,
          color: Colors.black,
        ),
      ),
    );
  }
}
const request = "https://api.hgbrasil.com/finance?format=json&key=9e65b260";

Future<Map> getData() async {
  http.Response response = await http.get(request);
  print(json.decode(response.body));
  return json.decode(response.body);
}




buildTextField(String label, String prefix, TextEditingController textEditingController, Function function){
  return TextField(
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        prefixText: prefix
    ),
    style: TextStyle(color: Colors.black,fontSize: 20),
    onChanged: function,
    keyboardType: TextInputType.number,
  );
}



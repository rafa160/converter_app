import 'package:conversor_app/api/api.dart';
import 'package:conversor_app/screens/converter.dart';
import 'package:flutter/material.dart';
import 'package:conversor_app/api/api.dart';
import 'package:flutter/services.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "Converter App",
            style: TextStyle(color: Colors.amberAccent),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buttonList() {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConverterPage()));
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQyA4WFD2hR7WPuzu-ViHViKqMvttKY74_i_byGyVMuA0SEX9Qf",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Conversor de Câmbio",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSRngpJdIxqs55xkszVd1mHfleZMn-o88vVBpZX9VxIj__ti7y9",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Cotação Dolar",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT64M8AgbKGgTGCtr_A9YEEuPzjI-aNvbgv8KVX5BizxO2dv2Od",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Cotação EURO",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),        InkWell(
          onTap: () {},
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTJHo5--ks7aeM9S08zIS2fy43BiEfFqO-mftK0TtQsoQsgJbAc",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Cotação Libra",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
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

  Future _loadData() async {
    await new Future.delayed(new Duration(seconds: 10));
    _dataLoaded();
  }

  void _dataLoaded(){
    setState(() {
      _loading = false;
    });
  }

  Widget _buildBody(){
    if(_loading){
      return _onLoading();
    } else {
      return
      _buttonList();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_latlong/flutter_latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _kilometerDistance = "";
  String _meterDistance = "";
  @override
  initState(){
    super.initState();
    _getDistance();
  }

  _getDistance(){
    final Distance distance = new Distance();

    // km = 423
    final num? km = distance.as(LengthUnit.Kilometer,
        new LatLng(52.518611, 13.408056), new LatLng(51.519475, 7.46694444));

    // meter = 422591.551
    final num? meter = distance(
      new LatLng(52.518611, 13.408056,),
      new LatLng(51.519475, 7.46694444,),
    );
    
    setState(() {
      _kilometerDistance = km.toString();
      _meterDistance = meter.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Kilometer distance : $_kilometerDistance',
            ),
            SizedBox(height: 20,),
            Text("Meter distance : $_meterDistance")
          ],
        ),
      ),
    );
  }
}

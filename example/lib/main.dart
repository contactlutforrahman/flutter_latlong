import 'package:flutter/material.dart';
import 'package:flutter_latlong/flutter_latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
  initState() {
    super.initState();
    _getDistance();
  }

  _getDistance() {
    final Distance distance = new Distance();

    final num? km = distance.as(LengthUnit.Kilometer,
        LatLng(24.012856, 89.259056), LatLng(23.810331, 90.412521));

    final num? meter =
        distance(LatLng(24.012856, 89.259056), LatLng(23.810331, 90.412521));

    setState(() {
      _kilometerDistance = km.toString();
      _meterDistance = meter.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 20,
            ),
            Text("Meter distance : $_meterDistance")
          ],
        ),
      ),
    );
  }
}

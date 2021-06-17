library flutter_latlong;

import 'dart:math' as math;

import 'package:dart_validate/dart_validate.dart';
import 'package:flutter_latlong/spline.dart';
import 'package:intl/intl.dart';
part "latlong/DistanceCalculator.dart";
part 'latlong/calculator/Haversine.dart';
part 'latlong/calculator/Vincenty.dart';
part "latlong/Distance.dart";
part "latlong/LatLng.dart";
part "latlong/LengthUnit.dart";
part "latlong/Path.dart";
part "latlong/Circle.dart";

/// Equator radius in meter (WGS84 ellipsoid)
const double EQUATOR_RADIUS = 6378137.0;

/// Polar radius in meter (WGS84 ellipsoid)
const double POLAR_RADIUS = 6356752.314245;

/// WGS84
const double FLATTENING = 1 / 298.257223563;

/// Earth radius in meter
const double EARTH_RADIUS = EQUATOR_RADIUS;

/// The PI constant.
const double PI = math.pi;

/// Converts degree to radian
double degToRadian(final double deg) => deg * (PI / 180.0);

/// Radian to degree
double radianToDeg(final double rad) => rad * (180.0 / PI);

/// Rounds [value] to given number of [decimals]
double round(final double value, {final int decimals: 6}) =>
    (value * math.pow(10, decimals)).round() / math.pow(10, decimals);

/// Convert a bearing to be within the 0 to +360 degrees range.
/// Compass bearing is in the rangen 0° ... 360°
double normalizeBearing(final double bearing) => (bearing + 360) % 360;

/// Converts a decimal coordinate value to hexadecimal format
///
///     final String sexa1 = decimalToSexagesimal(51.519475);
///     expect(sexa1, '51° 31\' 10.11"');
///
String decimalToSexagesimal(final double dec) {
  List<int> _split(final double value) {
    // NumberFormat is necessary to create digit after comma if the value
    // has no decimal point (only necessary for browser)
    final List<String> tmp = new NumberFormat("0.0#####")
        .format(round(value, decimals: 10))
        .split('.');
    return <int>[int.parse(tmp[0]).abs(), int.parse(tmp[1])];
  }

  final List<int> parts = _split(dec);
  final int integerPart = parts[0];
  final int fractionalPart = parts[1];

  final int deg = integerPart;
  final double min = double.parse("0.$fractionalPart") * 60;

  final List<int> minParts = _split(min);
  final int minFractionalPart = minParts[1];

  final double sec = (double.parse("0.$minFractionalPart") * 60);

  return "$deg° ${min.floor()}' ${round(sec, decimals: 2).toStringAsFixed(2)}\"";
}

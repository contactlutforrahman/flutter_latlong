part of flutter_latlong;

class Haversine implements DistanceCalculator {
  // final Logger _logger = new Logger('latlong.Haversine');

  const Haversine();

  /// Calculates distance with Haversine algorithm.
  ///
  /// Accuracy can be out by 0.3%
  /// More on [Wikipedia](https://en.wikipedia.org/wiki/Haversine_formula)
  @override
  double distance(final LatLng p1, final LatLng p2) {
    final sinDLat = math.sin((p2.latitudeInRad - p1.latitudeInRad) / 2);
    final sinDLng = math.sin((p2.longitudeInRad - p1.longitudeInRad) / 2);

    // Sides
    final a = sinDLat * sinDLat +
        sinDLng *
            sinDLng *
            math.cos(p1.latitudeInRad) *
            math.cos(p2.latitudeInRad);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return EQUATOR_RADIUS * c;
  }

  /// Returns a destination point based on the given [distance] and [bearing]
  ///
  /// Given a [from] (start) point, initial [bearing], and [distance],
  /// this will calculate the destination point and
  /// final bearing travelling along a (shortest distance) great circle arc.
  ///
  ///     final Haversine distance = const Haversine();
  ///
  ///     final num distanceInMeter = (EARTH_RADIUS * math.PI / 4).round();
  ///
  ///     final p1 = new LatLng(0.0, 0.0);
  ///     final p2 = distance.offset(p1, distanceInMeter, 180);
  ///
  @override
  LatLng offset(
      final LatLng? from, final double distanceInMeter, final double bearing) {
    DartValidate.inclusiveBetween(-180.0, 180.0, bearing,
        "Angle must be between -180 and 180 degrees but was $bearing");

    final double h = degToRadian(bearing.toDouble());

    final double a = distanceInMeter / EQUATOR_RADIUS;

    final double lat2 = math.asin(math.sin(from!.latitudeInRad) * math.cos(a) +
        math.cos(from.latitudeInRad) * math.sin(a) * math.cos(h));

    final double lng2 = from.longitudeInRad +
        math.atan2(math.sin(h) * math.sin(a) * math.cos(from.latitudeInRad),
            math.cos(a) - math.sin(from.latitudeInRad) * math.sin(lat2));

    return new LatLng(radianToDeg(lat2), radianToDeg(lng2));
  }

  //- private -----------------------------------------------------------------------------------
}

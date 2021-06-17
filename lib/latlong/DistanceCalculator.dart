part of flutter_latlong;

abstract class DistanceCalculator {
  num? distance(final LatLng p1, final LatLng p2);
  LatLng offset(
      final LatLng? from, final double distanceInMeter, final double bearing);
}

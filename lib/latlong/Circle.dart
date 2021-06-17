part of flutter_latlong;

/// Circle-base GEO algorithms.
///
/// Circle uses by default the Vincenty-Algorithm for distance computations
class Circle {
  // final Logger _logger = new Logger('latlong.Circle');

  final double radius;
  final LatLng center;
  final DistanceCalculator _calculator;

  Circle(final LatLng this.center, this.radius,
      {final DistanceCalculator calculator: const Vincenty()})
      : _calculator = calculator;

  /// Checks if a [point] is inside the given [Circle]
  ///
  ///     final Circle circle = new Circle(new LatLng(0.0,0.0), 111319.0);
  ///     final LatLng newPos = new LatLng(1.0,0.0);
  ///
  ///     expect(circle.isPointInside(newPos),isTrue);
  ///
  ///     final Circle circle2 = new Circle(new LatLng(0.0,0.0), 111318.0);
  ///
  ///     expect(circle2.isPointInside(newPos),isFalse);
  ///
  bool isPointInside(final LatLng point) {
    DartValidate.notNull(point);

    final Distance distance = new Distance(calculator: _calculator);

    final double dist = distance(center, point) as double;
    return dist <= radius;
  }

  //- private -----------------------------------------------------------------------------------
}

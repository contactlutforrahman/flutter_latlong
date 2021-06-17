part of spline;

class Point2D<T extends num> {
  final T x;
  final T y;

  Point2D(this.x, this.y);
}

abstract class CatmullRom<R> {
  const CatmullRom();

  R position(final double distance);
  R percentage(final num percent) => position(percent / 100);
}

class CatmullRomSpline<T extends num> extends CatmullRom<double> {
  // final Logger _logger = new Logger('spline.CatmullRomSpline');

  final T _p0, _p1, _p2, _p3;

  const CatmullRomSpline(this._p0, this._p1, this._p2, this._p3);
  const CatmullRomSpline.noEndpoints(final T p1, final T p2)
      : _p0 = p1,
        _p1 = p1,
        _p2 = p2,
        _p3 = p2;

  @override
  double position(final double distance) {
    DartValidate.inclusiveBetween(
        0, 1, distance, "Distance must be beteen 0 and 1 but was $distance");

    return 0.5 *
        ((2 * _p1) +
            (_p2 - _p0) * distance +
            (2 * _p0 - 5 * _p1 + 4 * _p2 - _p3) * distance * distance +
            (3 * _p1 - _p0 - 3 * _p2 + _p3) * distance * distance * distance);
  }
}

class CatmullRomSpline2D<T extends num> extends CatmullRom<Point2D<double>> {
  final Point2D<T> _p0;
  final Point2D<T> _p1;
  final Point2D<T> _p2;
  final Point2D<T> _p3;

  CatmullRomSpline2D(this._p0, this._p1, this._p2, this._p3) {
    DartValidate.notNull(_p0);
    DartValidate.notNull(_p1);
    DartValidate.notNull(_p2);
    DartValidate.notNull(_p3);
  }

  CatmullRomSpline2D.noEndpoints(final Point2D<T> p0, final Point2D<T> p1)
      : _p0 = p0,
        _p1 = p0,
        _p2 = p1,
        _p3 = p1 {
    DartValidate.notNull(p0);
    DartValidate.notNull(p1);
  }

  @override
  Point2D<double> position(final double distance) {
    DartValidate.inclusiveBetween(
        0, 1, distance, "Distance must be beteen 0 and 1 but was $distance");

    return new Point2D<double>(
        new CatmullRomSpline<T>(_p0.x, _p1.x, _p2.x, _p3.x).position(distance),
        new CatmullRomSpline<T>(_p0.y, _p1.y, _p2.y, _p3.y).position(distance));
  }
}

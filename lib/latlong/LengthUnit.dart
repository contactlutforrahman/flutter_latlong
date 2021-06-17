part of flutter_latlong;

class LengthUnit {
    static const LengthUnit Millimeter = const LengthUnit(1000.0);
    static const LengthUnit Centimeter = const LengthUnit(100.0);
    static const LengthUnit Meter = const LengthUnit(1.0);
    static const LengthUnit Kilometer = const LengthUnit(0.001);
    static const LengthUnit Mile = const LengthUnit(0.0006213712);

    final double scaleFactor;

    const LengthUnit(this.scaleFactor);

    double? to(final LengthUnit unit,final num? value) {
        if(unit.scaleFactor == scaleFactor) {
            return value as double?;
        }

        // Convert to primary unit.
        final double primaryValue = value! / scaleFactor;

        // Convert to destination unit.
        return primaryValue * unit.scaleFactor;
    }
}


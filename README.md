# Flutter LatLong

A Flutter package for getting location and location distance and more using latitude and longitude.

[![pub package](https://img.shields.io/pub/v/flutter_latlong.svg)](https://pub.dev/packages/flutter_latlong)

## Installation

``` flutter pub add flutter_latlong ```

or


```
dependencies:
  flutter_latlong: ^1.0.3
```

## Usage


### Distance
```dart

    import 'package:flutter_latlong/flutter_latlong.dart';
    final Distance distance = new Distance();
    
    final num? km = distance.as(LengthUnit.Kilometer, LatLng(24.012856, 89.259056), LatLng(23.810331, 90.412521));

    final num? meter = distance(
      LatLng(24.012856, 89.259056),
      LatLng(23.810331, 90.412521)
    );

```


## Path
```dart
    import 'package:flutter_latlong/flutter_latlong.dart';
    // zigzag is a list of coordinates
    final Path path = new Path.from(zigzag);
    
    // Result is below
    final Path steps = path.equalize(8,smoothPath: true);
```
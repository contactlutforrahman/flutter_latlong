# Flutter LatLong

A Flutter package for getting location and location distance and more using latitude and longitude.

## Installation

``` flutter pub add flutter_latlong ```

or


```
dependencies:
  flutter_latlong: ^1.0.0
```

## Usage


### Distance
```dart
    import 'package:flutter_latlong/flutter_latlong.dart';
    final Distance distance = new Distance();
    
    // km = 423
    final int km = distance.as(LengthUnit.Kilometer,
     new LatLng(52.518611,13.408056),new LatLng(51.519475,7.46694444));
    
    // meter = 422591.551
    final int meter = distance(
        new LatLng(52.518611,13.408056),
        new LatLng(51.519475,7.46694444)
        );

```

## Offset
```dart
    import 'package:flutter_latlong/flutter_latlong.dart';
    final Distance distance = const Distance();
    final num distanceInMeter = (EARTH_RADIUS * math.PI / 4).round();
    
    final p1 = new LatLng(0.0, 0.0);
    final p2 = distance.offset(p1, distanceInMeter, 180);
    
    // LatLng(latitude:-45.219848, longitude:0.0)
    print(p2.round());
    
    // 45° 13' 11.45" S, 0° 0' 0.00" O
    print(p2.toSexagesimal());
            
```

## Path smoothing
```dart
    import 'package:flutter_latlong/flutter_latlong.dart';
    // zigzag is a list of coordinates
    final Path path = new Path.from(zigzag);
    
    // Result is below
    final Path steps = path.equalize(8,smoothPath: true);
```
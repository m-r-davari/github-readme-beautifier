import 'dart:io';
import 'package:image/image.dart';
import 'package:test/test.dart';

import '../_test_util.dart';

void main() {
  group('Filter', () {
    test('quantize', () {
      final bytes = File('test/_data/png/buck_24.png').readAsBytesSync();

      final i0 = decodePng(bytes)!;
      quantize(i0, numberOfColors: 32, method: QuantizeMethod.octree);
      File('$testOutputPath/filter/quantize_octree.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(encodePng(i0));

      final i1 = decodePng(bytes)!;
      quantize(i1, numberOfColors: 32);
      File('$testOutputPath/filter/quantize_neural.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(encodePng(i1));
    });
  });
}

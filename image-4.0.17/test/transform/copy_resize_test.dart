import 'dart:io';
import 'package:image/image.dart';
import 'package:test/test.dart';

import '../_test_util.dart';

void main() {
  group('Transform', () {
    test('copyResize', () {
      final img =
          decodePng(File('test/_data/png/buck_24.png').readAsBytesSync())!;
      final i0 = copyResize(img, width: 64);
      expect(i0.width, equals(64));
      expect(i0.height, equals(39));
      File('$testOutputPath/transform/copyResize.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(encodePng(i0));
    });

    test('copyResize palette', () async {
      final img = await decodePngFile('test/_data/png/test.png');
      final i0 =
          copyResize(img!, width: 64, interpolation: Interpolation.cubic);
      await encodePngFile(
          '$testOutputPath/transform/copyResize_palette.png', i0);
    });
  });
}

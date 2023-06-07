@TestOn('browser')

import 'package:flutter_test/flutter_test.dart';
import 'package:nowingoogle/firebase_options.dart';

void main() {
  test('test firebase config on web', () {
    expect(
        () => DefaultFirebaseOptions.currentPlatform, throwsUnsupportedError);
  });
}

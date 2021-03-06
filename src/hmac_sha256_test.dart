// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Library tag to allow the test to run on Dartium.
library hmac_sha256_test;

import "package:expect/expect.dart";
import '../dart-src/crypto.dart';

part 'hmac_sha256_test_vectors.dart';

void testStandardVectors(inputs, keys, macs) {
  for (var i = 0; i < inputs.length; i++) {
    var hmac = new HMAC(new SHA256(), keys[i]);
    hmac.add(inputs[i]);
    var d = hmac.close();
    Expect.isTrue(CryptoUtils.bytesToHex(d).startsWith(macs[i]), '$i');
  }
}

void main() {
  testStandardVectors(hmac_sha256_inputs, hmac_sha256_keys, hmac_sha256_macs);
}

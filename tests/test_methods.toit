// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

// Copyright (c) 2021 Ekorau LLC

import btest show *

main:

  test-start

  test "equals, 2 case" "run/fail 2/1":
    expect-equals 2 2
    expect-equals 2 3

  test "near, 10 " "run/fail 10/3":
    expect-near 1.0 1.0
    expect-near FLT-NZERO FLT-PZERO
    expect-near 0.0 FLT-NZERO
    expect-near 1.0 0.99999999999999978
    a := (0.3 * 3) + 0.1
    expect-near 1.0 a
    print "  1.0 == ((0.3 * 3) + 0.1) is: $(1.0 == a)"
    print "  ulps distance between 1.0 and ((0.3 * 3) + 0.1) is: $(diff-ulps 1.0 a)"
    expect-near 1.0 0.99999
    expect-near 0.0 0.00001
    expect-near 0.0 0.000001
    expect-near 0.0 0.0000001
    expect-near -1.0 1.0


  test "null, 2" "run/fail 2/1":
    expect-not-null 3
    expect-not-null null

  test "true, 2" "run/fail 2/1":
    expect-true true
    expect-true false

  test "false, 2" "run/fail 2/1":
    expect-false true
    expect-false false

  test "runs, 3" "run/fail 3/1":
    expect-runs: 3
    expect-runs: throw "nope"
    expect-runs: 4

  test "throws, 3" "run/fail 3/1":
    expect-throws: throw "nope"
    expect-throws: 3
    expect-throws: throw "nope, again"

  test-end

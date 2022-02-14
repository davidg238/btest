// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

// Copyright (c) 2021 Ekorau LLC

import btest show *

main:

  test_start

  test "equals, 2 case" "run/fail 2/1":
    expect_equals 2 2
    expect_equals 2 3

  test "near, 10 " "run/fail 10/3":
    expect_near 1.0 1.0
    expect_near FLT_NZERO FLT_PZERO
    expect_near 0.0 FLT_NZERO
    expect_near 1.0 0.99999999999999978
    a := (0.3 * 3) + 0.1
    expect_near 1.0 a
    print "  1.0 == ((0.3 * 3) + 0.1) is: $(1.0 == a)"
    print "  ulps distance between 1.0 and ((0.3 * 3) + 0.1) is: $(diff_ulps 1.0 a)"
    expect_near 1.0 0.99999
    expect_near 0.0 0.00001
    expect_near 0.0 0.000001
    expect_near 0.0 0.0000001
    expect_near -1.0 1.0


  test "null, 2" "run/fail 2/1":
    expect_not_null 3
    expect_not_null null

  test "true, 2" "run/fail 2/1":
    expect_true true
    expect_true false

  test "false, 2" "run/fail 2/1":
    expect_false true
    expect_false false

  test "runs, 3" "run/fail 3/1":
    expect_runs: 3
    expect_runs: throw "nope"
    expect_runs: 4

  test "throws, 3" "run/fail 3/1":
    expect_throws: throw "nope"
    expect_throws: 3
    expect_throws: throw "nope, again"

  test_end

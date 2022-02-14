// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

// Copyright (c) 2021 Ekorau LLC

import btest show *

failed_calculation -> int:
  throw "oops"

main:

  test_start

  test "btest" "#0, 3 tests, all pass":

    expect_true: true
    expect_false: false
    expect_equals 2 2

  test "btest" "#1, 3 tests, all fail":

    expect_true: false  // 1
    expect_false: true  // 2
    expect_equals 2 3   // 3

  test "btest" "#2, 3 tests, 1st failed":

    expect_true: false  // 4
    expect_false: false
    expect_equals 2 2

  test "btest" "#3, 3 tests, 2nd failed":

    expect_true: true
    expect_false: true  // 5
    expect_equals 2 2

  test "btest" "#4, 3 tests, 3rd failed":

    expect_true: true
    expect_false: false
    expect_equals 2 3   // 6

  test "btest" "#5, 3 tests, first throws":

    expect_true: 0 == failed_calculation  // 7
    expect_false: false
    expect_equals 0 0

  test "btest" "#6, 3 tests, 2nd throws":

    expect_true: true
    expect_false: 0 == failed_calculation  // 8
    expect_equals 0 0

  test "btest" "#7, 3 tests, 3rd throws":

    expect_true: true
    expect_false: false
    expect_equals 0 failed_calculation  // 9


  test_end

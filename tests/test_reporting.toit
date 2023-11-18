// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

// Copyright (c) 2021 Ekorau LLC

import btest show *

failed-calculation -> int:
  throw "oops"

main:

  test-start

  test "btest" "#0, 3 tests, all pass":

    expect-true true
    expect-false false
    expect-equals 2 2

  test "btest" "#1, 3 tests, all fail":

    expect-true false  // 1
    expect-false true  // 2
    expect-equals 2 3   // 3

  test "btest" "#2, 3 tests, 1st failed":

    expect-true false  // 4
    expect-false false
    expect-equals 2 2

  test "btest" "#3, 3 tests, 2nd failed":

    expect-true true
    expect-false true  // 5
    expect-equals 2 2

  test "btest" "#4, 3 tests, 3rd failed":

    expect-true true
    expect-false false
    expect-equals 2 3   // 6

  test "btest" "#5, 3 tests, first throws":

    expect-true 0 == failed-calculation  // 7
    expect-false false
    expect-equals 0 0

  test "btest" "#6, 3 tests, 2nd throws":

    expect-true true
    expect-false 0 == failed-calculation  // 8
    expect-equals 0 0

  test "btest" "#7, 3 tests, 3rd throws":

    expect-true true
    expect-false false
    expect-equals 0 failed-calculation  // 9


  test-end

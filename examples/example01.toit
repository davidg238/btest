// Copyright (c) 2022 Ekorau LLC
// Use of this source code is governed by a Zero-Clause BSD license that can
// be found in the examples/LICENSE file.

import btest show *
import .mathfunctions show *

main:

  // Mark the start of the group of tests
  test-start

  // Test the factorial function handles input 0
  test "factorial" "HandlesZeroInput":

    expect-runs: factorial 0

  // Test the factorial function handles input negative inputs
  test "factorial" "HandlesNegativeInput":

    expect-throws: factorial -1
    expect-runs:   factorial 6

  // Test the factorial function handles various inputs
  test "factorial" "HandlesInput":

    expect-equals   1 (factorial 0)
    expect-equals   1 (factorial 1)
    expect-equals   2 (factorial 2)
    expect-equals   6 (factorial 3)
    expect-equals  24 (factorial 4)
    expect-equals 120 (factorial 5)

  // Mark the end of the group of tests, a testing summary is printed here
  test-end


/**
Output should look like:  

[example01.toit] 2022-02-12T20:34:01.780382Z: <process initiated>
[example01.toit] Test 0 class factorial, feature: HandlesZeroInput
[example01.toit]   run: 1 failed: 0
[example01.toit] Test 1 class factorial, feature: HandlesNegativeInput
[example01.toit]   run: 2 failed: 0
[example01.toit] Test 2 class factorial, feature: HandlesInput
[example01.toit]   run: 6 failed: 0
[example01.toit] -----------------------------------------------------
[example01.toit] Tests run/failed: 3/0 Cases run/failed: 9/0
[example01.toit] 2022-02-12T20:34:02.177163Z: <process terminated - exit code: 0>
*/
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

// Copyright (c) 2021 Ekorau LLC

/**
btest is a set of helper functions to test code.
Functions are provided to:  
  - group similar tests
  - test for expected results
  - summarize results

An `expect_` function tests the code produces an expected result.
A collection of tests for a logical feature, is grouped in a test suite.
A collection of test suites runs between `test_start` and `test_end` functions.
Testing does not stop at first failure.
*/

import .float_util show almost_equal_abs_ulps

tot_test := 0
test_fail := 0
case := 0
case_fail := 0
tot_case:= 0
tot_case_fail := 0
err_str := ""

/// Begin tests with this marker.
test_start:

/** 
Conclude tests with this marker. A summary of test results are reported to the console.
*/
test_end:
  print "-----------------------------------------------------"
  print "Tests run/failed: $tot_test/$test_fail Cases run/failed: $tot_case/$tot_case_fail"

/**
A block of tests, which test some feature of a class behavior.
If an exception is thrown within a test, further tests within the block, will not be executed.
*/
test suite_name/string test_name/string [block] ->none:
  try:
    print "Test $tot_test class $suite_name, feature: $test_name"
    case = 0
    case_fail = 0
    exception := catch:
      block.call
    if exception:
      print "      Case $case threw, $exception"
      print "       (No further cases run in this suite)"
      case++ // Since unwound during the exception.
      case_fail++
  finally:
    test_finished_

/// Test if the argument is not null.
expect_not_null val/any ->none:
  if val == null:
    print_err_ "expected non-null value"
    case_fail++
  case++

/// Test if the argument is true
expect_true val -> none:
  if not val:
    print_err_ "expected true"
    case_fail++
  case++

/// Test if the argument is false
expect_false val -> none:
  if val:
    print_err_ "expected false"
    case_fail++
  case++

/// Test if the two integer arguments are equal.
expect_equals expected/int val/int ->none:
  if expected != val:
    print_err_ "expected $expected but got $val"
    case_fail++
  case++

/**
Test if the two float arguments are "near".
Refer to float_util/almost_equal_abs_ulps.
*/
expect_near expected/float val/float ->none:
  if not almost_equal_abs_ulps expected val:
    print_err_ "expected $(%.7f expected) but got $(%.7f val)"
    case_fail++
  case++

/// Test if the block argument runs without error.
expect_runs [block] ->none:
  exception := catch:
    block.call
  if exception:
    print_err_ "threw $exception"
    case_fail++
  case++

/// Test if the block argument throws an exception during evaluation.
expect_throws [block] ->none:
  exception := catch:
    block.call
  if not exception:
    case_fail++
    print_err_ "no exception thrown"
  case++

// -- Internal helper methods --
test_finished_ -> none:
  print "  run: $case failed: $case_fail"
  tot_test++
  tot_case = tot_case + case
  if case_fail > 0:
    test_fail++
    tot_case_fail = tot_case_fail + case_fail

print_err_ msg/string -> none:
  print "      Case $case failed, $msg"

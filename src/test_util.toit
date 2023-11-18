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

import .float-util show almost-equal-abs-ulps

tot-test := 0
test-fail := 0
case := 0
case-fail := 0
tot-case:= 0
tot-case-fail := 0
err-str := ""

/// Begin tests with this marker.
test-start:

/** 
Conclude tests with this marker. A summary of test results are reported to the console.
*/
test-end:
  print "-----------------------------------------------------"
  print "Tests run/failed: $tot-test/$test-fail Cases run/failed: $tot-case/$tot-case-fail"

/**
A block of tests, which test some feature of a class behavior.
If an exception is thrown within a test, further tests within the block, will not be executed.
*/
test suite-name/string test-name/string [block] ->none:
  try:
    print "Test $tot-test class $suite-name, feature: $test-name"
    case = 0
    case-fail = 0
    exception := catch:
      block.call
    if exception:
      print "      Case $case threw, $exception"
      print "       (No further cases run in this suite)"
      case++ // Since unwound during the exception.
      case-fail++
  finally:
    test-finished_

/// Test if the argument is not null.
expect-not-null val/any ->none:
  if val == null:
    print-err_ "expected non-null value"
    case-fail++
  case++

/// Test if the argument is true
expect-true val -> none:
  if not val:
    print-err_ "expected true"
    case-fail++
  case++

/// Test if the argument is false
expect-false val -> none:
  if val:
    print-err_ "expected false"
    case-fail++
  case++

/// Test if the two integer arguments are equal.
expect-equals expected/int val/int ->none:
  if expected != val:
    print-err_ "expected $expected but got $val"
    case-fail++
  case++

/**
Test if the two float arguments are "near".
Refer to float_util/almost_equal_abs_ulps.
*/
expect-near expected/float val/float ->none:
  if not almost-equal-abs-ulps expected val:
    how-big := (expected == 0.0)? "$(%.2f (expected - val))": "$(%.2f (expected - val) * 100 / expected) %"
    print-err_ "expected $(%.7f expected) but got $(%.7f val), err: $how-big" 
    case-fail++
  case++

/// Test if the block argument runs without error.
expect-runs [block] ->none:
  exception := catch:
    block.call
  if exception:
    print-err_ "threw $exception"
    case-fail++
  case++

/// Test if the block argument throws an exception during evaluation.
expect-throws [block] ->none:
  exception := catch:
    block.call
  if not exception:
    case-fail++
    print-err_ "no exception thrown"
  case++

// -- Internal helper methods --
test-finished_ -> none:
  print "  run: $case failed: $case-fail"
  tot-test++
  tot-case = tot-case + case
  if case-fail > 0:
    test-fail++
    tot-case-fail = tot-case-fail + case-fail

print-err_ msg/string -> none:
  print "      Case $case failed, $msg"

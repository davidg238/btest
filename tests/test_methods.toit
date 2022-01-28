import btest show *


main:

  test_start

  test "equals, 2 case" "pass/fail 1/1":
    expect_equals 2 2
    expect_equals 2 3

  test "near, 10 " "pass/fail 7/3":
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


  test "null, 2" "pass/fail 1/1":
    expect_not_null 3

  test "runs, 2" "pass/fail 1/1":
    expect_runs: 3
    expect_runs: throw "nope"

  test "true, 2" "pass/fail 1/1":
    expect_true: [true]
    expect_true: [false]

  test "false, 2" "pass/fail 1/1":
    expect_false: [false]
    expect_false: [true]

  test_end

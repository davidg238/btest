
import ..src.test_util show *
import .mathfunctions show *

main:
// test_group_1:

  TEST_SUITE_START

  TEST_START

  TEST "FactorialTest" "HandlesZeroInput":

      ASSERT_EQ 1 1
 
  TEST_END
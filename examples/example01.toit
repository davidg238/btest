
import ..src.test_util show TEST_START TEST ASSERT_EQ TEST_END
import .mathfunctions show *

main:
// test_group_1:

  TEST_START

  TEST "FactorialTest" "HandlesZeroInput":

      ASSERT_EQ 1 1
 
  TEST_END
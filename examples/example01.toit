
import test_util show *
import .mathfunctions show *


test_group_1:

  TEST_START

  TEST "FactorialTest" "HandlesZeroInput":

      ASSERT_EQ (Factorial 0) 1
 
  TEST_END
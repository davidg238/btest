// Copyright (c) 2022 Ekorau LLC
// Use of this source code is governed by a Zero-Clause BSD license that can
// be found in the examples/LICENSE file.

import btest.float-util show *
main:

  print-comparisons := : | num |
    print "$((FUnion num).stringify) / $num"
  /*
  See the examples listed at https://en.wikipedia.org/wiki/Double-precision_floating-point_format
  (Not reproduced completely)
  */
  print "various examples ...."
  print-comparisons.call 1.0
  print-comparisons.call 1.0000000000000002
  print-comparisons.call 1.0000000000000004
  print-comparisons.call 2.0
  print-comparisons.call -2.0
  print-comparisons.call 3.0
  print-comparisons.call 4.0
  print-comparisons.call 5.0
  print-comparisons.call 6.0
  print-comparisons.call 23.0
  print-comparisons.call 0.01171875
  print "mins and maxs ...."
  print-comparisons.call float.MIN-POSITIVE
  print-comparisons.call float.MAX-FINITE
  print "+/-zero, infinity and not_a_number"
  print-comparisons.call (float.from-bits 0x0) // +0
  print-comparisons.call (float.from-bits 0x8000_0000_0000_0000) // -0
  print-comparisons.call float.INFINITY
  print-comparisons.call float.NAN

  print "FLT_NZERO is negative: $(FLT-NZERO.sign)"
  print "FLT_PZERO is negative: $(FLT-PZERO.sign)"
  print "compare n/p zero :  $(FLT-PZERO==FLT-NZERO)"
  print "diff_ulps $(diff-ulps FLT-PZERO FLT-NZERO)"
  print "diff_ulps $(diff-ulps FLT-NZERO float.MIN-POSITIVE)"
  print "diff_ulps $(diff-ulps FLT-PZERO float.MIN-POSITIVE)"


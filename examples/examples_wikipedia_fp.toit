import ..src.float_util show *
main:

  print_comparisons := : | num |
    print "$((FUnion num).stringify) / $num"
/*
 See the examples listed at https://en.wikipedia.org/wiki/Double-precision_floating-point_format
 (Not reproduced completely)
 */
  print "various examples ...."
  print_comparisons.call 1.0
  print_comparisons.call 1.0000000000000002
  print_comparisons.call 1.0000000000000004
  print_comparisons.call 2.0
  print_comparisons.call -2.0
  print_comparisons.call 3.0
  print_comparisons.call 4.0
  print_comparisons.call 5.0
  print_comparisons.call 6.0
  print_comparisons.call 23.0
  print_comparisons.call 0.01171875
  print "mins and maxs ...."
  print_comparisons.call float.MIN_POSITIVE
  print_comparisons.call float.MAX_FINITE
  print "+/-zero, infinity and not_a_number"
  print_comparisons.call (float.from_bits 0x0) // +0
  print_comparisons.call (float.from_bits 0x8000_0000_0000_0000) // -0
  print_comparisons.call float.INFINITY
  print_comparisons.call float.NAN

  print "FLT_NZERO is negative: $(FLT_NZERO.sign)"
  print "FLT_PZERO is negative: $(FLT_PZERO.sign)"
  print "compare n/p zero :  $(FLT_PZERO==FLT_NZERO)"
  print "diff_ulps $(diff_ulps FLT_PZERO FLT_NZERO)"
  print "diff_ulps $(diff_ulps FLT_NZERO float.MIN_POSITIVE)"
  print "diff_ulps $(diff_ulps FLT_PZERO float.MIN_POSITIVE)"

  
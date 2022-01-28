// Copyright (c) 2021 Ekorau LLC

import btest show *
import .mathfunctions

main:

  nums := [0.3, 0.29, 0.299, 0.299_999, 0.299_999_999, 0.299_999_999_999, 0.299_999_999_999_999,]

  print_comparisons := : | num |
    print "$((FUnion num).stringify) / $(%x num) / $num"


  nums.do: |num|
    a := (num * 3) + 0.1
    b := 1.0
    c := diff_ulps a b
    print "$a, $b, $c"

  print "similar $(diff_ulps 1.0 0.999_999_999_999_999_78)"
  print "sign diff $(diff_ulps -0.99999999999999978 0.99999999999999978)"
  print "zero diff $(diff_ulps -0.0 0.0)"
  print "no diff $(diff_ulps 1.0 0.999_999_999_999_999_78)"
  print "== diff $(         1.0==0.999_999_999_999_999_78)"
  print "almost_equal_ulps $(almost_equal_ulps 1.0 0.999_999_999_999_999_78)"
  print "close diff $(diff_ulps 0.999_999_999_999_999_7 0.999_999_999_999_999_78)"
  print "4/5 diff $(diff_ulps 4.0 5.0)"

  print "$(-0.0 < 0.0)"
  print "sign -0.0 $(-0.0.sign)"
  print "sign 0.0 $(0.0.sign)"
  print "negative -0.0 $((FUnion -0.0).negative)"
  print "negative 0.0  $((FUnion -0.0).negative)"
  print "negative 1.0  $((FUnion 1.0).negative)"

  print_comparisons.call  0.99999999999999978
  print_comparisons.call -0.99999999999999978
  print "------------------------------"

  print -0.0000001.sign
  print 0.0.sign
  print 0.0000001.sign
  print "  ulps distance between 0.0 and 0.000_000_1 is: $(diff_ulps 0.0 0.000_000_1)"
  print "  ulps distance between 0.0 and 0.000_000_000_1 is: $(diff_ulps 0.0 0.000_000_000_1)"
  print "  ulps distance between 1.0 and 1.000_000_1 is: $(diff_ulps 1.0 1.000_000_1)"
  print "  ulps distance between 1.0 and 1.000_000_000_1 is: $(diff_ulps 1.0 1.000_000_000_1)"
  print "  $(FUnion 0.000_000_000_000_000_1)"
  print "  ulps distance between 0.0 and 0.000_000_000_000_000_1 is: $(diff_ulps 0.0 0.000_000_000_000_000_1)"
  print "  ulps distance between 1.0 and 1.000_000_000_000_000_1 is: $(diff_ulps 1.0 1.000_000_000_000_000_1)"


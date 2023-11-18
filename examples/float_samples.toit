// Copyright (c) 2022 Ekorau LLC
// Use of this source code is governed by a Zero-Clause BSD license that can
// be found in the examples/LICENSE file.

import btest show *
import .mathfunctions

main:

  nums := [0.3, 0.29, 0.299, 0.299_999, 0.299_999_999, 0.299_999_999_999, 0.299_999_999_999_999,]

  print-comparisons := : | num |
    print "$((FUnion num).stringify) / $(%x num) / $num"


  nums.do: |num|
    a := (num * 3) + 0.1
    b := 1.0
    c := diff-ulps a b
    print "$a, $b, $c"

  print "similar $(diff-ulps 1.0 0.999_999_999_999_999_78)"
  print "sign diff $(diff-ulps -0.99999999999999978 0.99999999999999978)"
  print "zero diff $(diff-ulps -0.0 0.0)"
  print "no diff $(diff-ulps 1.0 0.999_999_999_999_999_78)"
  print "== diff $(         1.0==0.999_999_999_999_999_78)"
  print "almost_equal_ulps $(almost-equal-ulps 1.0 0.999_999_999_999_999_78)"
  print "close diff $(diff-ulps 0.999_999_999_999_999_7 0.999_999_999_999_999_78)"
  print "4/5 diff $(diff-ulps 4.0 5.0)"

  print "$(-0.0 < 0.0)"
  print "sign -0.0 $(-0.0.sign)"
  print "sign 0.0 $(0.0.sign)"
  print "negative -0.0 $((FUnion -0.0).negative)"
  print "negative 0.0  $((FUnion -0.0).negative)"
  print "negative 1.0  $((FUnion 1.0).negative)"

  print-comparisons.call  0.99999999999999978
  print-comparisons.call -0.99999999999999978
  print "------------------------------"

  print -0.0000001.sign
  print 0.0.sign
  print 0.0000001.sign
  print "  ulps distance between 0.0 and 0.000_000_1 is: $(diff-ulps 0.0 0.000_000_1)"
  print "  ulps distance between 0.0 and 0.000_000_000_1 is: $(diff-ulps 0.0 0.000_000_000_1)"
  print "  ulps distance between 1.0 and 1.000_000_1 is: $(diff-ulps 1.0 1.000_000_1)"
  print "  ulps distance between 1.0 and 1.000_000_000_1 is: $(diff-ulps 1.0 1.000_000_000_1)"
  print "  $(FUnion 0.000_000_000_000_000_1)"
  print "  ulps distance between 0.0 and 0.000_000_000_000_000_1 is: $(diff-ulps 0.0 0.000_000_000_000_000_1)"
  print "  ulps distance between 1.0 and 1.000_000_000_000_000_1 is: $(diff-ulps 1.0 1.000_000_000_000_000_1)"


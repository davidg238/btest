// Copyright (c) 2022 Ekorau LLC
// Use of this source code is governed by a Zero-Clause BSD license that can
// be found in the examples/LICENSE file.

factorial num/int -> int:
  if num < 0  : throw "factorial undefined for negative numbers"
  if 0 == num : return 1
  if 1 == num : return 1
  return num * (factorial num - 1)

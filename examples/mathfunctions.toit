// Copyright (c) 2021 Ekorau LLC

factorial num/int -> int:
  if 0 == num : return 1
  if 1 == num : return 1
  return num * (factorial num-1)

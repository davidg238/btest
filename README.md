# ttest A simple test framework

This is a very simple test framework, extracted from [TeFLL](https://github.com/davidg238/fuzzy_logic).  Originally it was the minimal code to match the API required to run a test suite for [eFLL](https://github.com/zerokol/eFLL).  It does not use the [expect](https://libs.toit.io/expect/library-summary) library, as that code appears to hard exit at first error, whereas during porting, it was preferred to measure progress by tests passed.

The code as extracted compiles, however when example01 is executed, it hangs indefinitely:
```
david (master *) examples $ toit device run example01.toit
2021-12-22T19:38:14.929669Z: <process initiated>

```
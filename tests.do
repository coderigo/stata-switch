/**
 * Make sure it works ( a very basic unit test )
 * Run as a .do file the usual way.
 */

/* Redefine the program to the latest version in the switch.ado file */
program drop switch
do switch.ado

/* Test 1 */
switch C, cases(A B C) values(20 30 40)
local expectedResult = 40
if($switch_return == `expectedResult'){
    di as green "Test 1 PASSED"
}
else{
    di as red "Test 1 FAILED"
    di as red "Expected switch_return to be 40 but got $switch_return"
}

/* Test 2 */
switch _8A, cases(_8A 50 _$_) values(1 2 3)
local expectedResult = 1
if($switch_return == `expectedResult'){
    di as green "Test 2 PASSED"
}
else{
    di as red "Test 2 FAILED"
    di as red "Expected switch_return to be `expectedResult' but got $switch_return"
}

/* Test 3 */
switch 100, cases(_8A 50 _$_) values(1 2 3)
local expectedResult = "no_swatch"
if("$switch_return" == "`expectedResult'"){
    di as green "Test 3 PASSED"
}
else{
    di as red "Test 3 FAILED"
    di as red "Expected switch_return to be `expectedResult' but got $switch_return"
}

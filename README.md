stata-switch
============

**Note: I don't work with Stata anymore and haven't had access to a license for a very long time. If you find this useful and would like to contribute fixes by all means submit PRs but I'm unfortunately unable to actively maintain it and check the source. Thanks!**

A switch statement for [Stata](http://www.stata.com/).

This was dusted off the bookshelf a few days ago when I needed to use Stata for the first time in a long time.

This program gives your Stata `.do` or `.ado` files something similar to JavaScript's (and other languages') [switch](http://www.w3schools.com/js/js_switch.asp) statment. It allows you to be a bit neater and replace multiple `if(){}` statements with one line of code.

## Installation

### Option 1: Using the SSC archive

This is available from within Stata with:

`ssc install switch`

This will install `switch` to your [personal ado directory](http://www.stata.com/support/faqs/programming/personal-ado-directory/).

**WARNING**: I no longer maintain `switch` on `ssc` as I find submission and revision process **far** easier, neater, and faster with GitHub, so to get the latest version I would recommend **Option 2**.

### Option 2: Clone the GitHub repo

Not as neat as **Option 1** but at least you get the latest version if there is one.
You may need to close and re-open Stata to get it to pick up the installed package.

```
# Example copies the `switch.ado` and `switch.sthlp` to
# the personal ado directory on Mac OS X, but can easily 
# modify to your own OS

$ git clone https://github.com/coderigo/stata-switch.git

# Create the directory for user-installed packages starting with `s`
# (optional - only needed if directory does not already exist)
$ mkdir ~/Library/Application Support/Stata/ado/plus/s

# Copy the files needed for `switch` to the above directory
$ mv stata-switch/switch.* ~/Library/Application Support/Stata/ado/plus/s
```

## Usage

A match is registered to a global variable called `switch_return` (it can be called with `$switch_return`).
A failure to match sets the value of `$switch_return` to the string : `"no_swatch"` (short for `"no switch match"`).

```stata
# From Stata command line

> switch C, cases(A B C) values(20 30 40)
switch matched C to a value of 40

> switch _8A, cases(_8A 50 _$_) values(1 2 3)
switch matched _8A to a value of 1

> switch 100, cases(_8A 50 _$_) values(1 2 3)
switch found no matching value for 100

> man switch /* Brings up the help file for switch */

# From a .do or .ado file

> local myLanguage = "english"
> switch `myLanguage', cases(spanish english japanese) values("Hola" "Hello" "Konnichiwa")

> local englishGreeting = "$switch_return"
> di "`englishGreeting' there!"
Hello there!
```

## Contributions

I'm happy to take contributions (please add a test for any modifications you make to the `tests.do` file).

I don't expect to get much interest, however. I'm cool with that :).


## Limitations
* It was developed in **Stata 10** (back in the day), but I've used it with **Stata 12** without issue and it **should** work with **Stata 13**. I'm happy to field bug reports, however, if anyone even looks here :=).
* There is no `default` option.
* It is aimed at variable assignment rather than code block execution. That is, one can replace this:

```stata
local myVar   = "ValueA"
local testVar = "Case1"
if("`testVar'" == "Case1"){
    local myVar = "Case1"
}
if("`testVar'" == "Case2"){
    local myVar = "Case2"
}
```

with this:

```stata
local testVar = "Case1"
switch `testVar', cases(Case1 Case2) values(Case1Value Case2Value)
local myVar   = "`switch_return'"
```

but one cannot replace this:

```stata
local myVar   = "ValueA"
local testVar = "Case1"
if("`testVar'" == "Case1"){
    local myVar = "Case1"
    /* More code to execute here*/
}
if("`testVar'" == "Case2"){
    local myVar = "Case2"
    /* More code to execute here*/
}
```

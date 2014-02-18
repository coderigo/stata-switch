*! version 1.0.2 26nov2009 Rodrigo Martell
version 10.1
program define switch
syntax anything, CAses(str) VALues(str)

    /* determine number of cases */
    local no_cases=wordcount("`cases'")
    /* determine number of values */
    local no_values=wordcount("`values'")

    /* Error trapping */

    /* complain if number of cases and values don't equate. */
    if `no_cases'!=`no_values'|`no_cases'==0 | `no_values'==0{
        di "The number of cases and values doesn't match, or you haven't entered any cases or values."      
        exit
    }

    /* complain if more than one arguments are passed */
    if wordcount("`anything'")>1{
        di "You may only supply one case to match to a value at a time."        
        exit
    }

    /* Execute switching */
    local result=0
    forvalues i=1/`no_cases'{       
        tokenize `cases'
        if "`anything'"=="``i''"{
            tokenize `values'
            global switch_return="``i''"
            local result=1
            di "switch matched `anything' to a value of $switch_return"
            exit
        }
    }

    /* report when finished */
    if `result'==0{
        global switch_return="no_swatch"
        di "switch found no matching value for `anything'"
    }

end

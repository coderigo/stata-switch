{smcl}
{* *! version 1.0.0  18mar2009}{...}
{cmd:help switch} {right:also see:  {help if }}
{hline}

{title:Title}

{p2colset 5 17 19 2}{...}
{p2col :{hi: switch} {hline 2}}Specifiy corresponding values to evaluated cases  (more efficient than consecutive {it:if} statements){p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 13 2}
{cmd:switch} {anything} {cmd:,} {opth ca:ses(string)} {opth val:ues(string)}

{synoptset 21 tabbed}{...}
{synopthdr}
{synoptline}
{synopt :{opth ca:ses(string)}}the possible cases given to {opth switch}, separated by a space.{p_end}
{synopt :{opth val:ues(string)}}the matching values (in corresponding order) to the cases supplied, separated by a space.{p_end}

{title:Description}

{pstd}
{opt switch} matches a given variable case to a given case-value set and stores the result (the matching value) in a local variable called {it:switch_return}.
If no match is made, the local variable {it:switch_return} is set to (string) {it:no_swatch}.

{title:Examples}

    {hline}
{phang}{cmd:. switch C, cases(A B C) values(20 30 40)}{p_end}
{phang}switch matched C to a value of 40{p_end}
    {hline}
{phang}{cmd:. switch _8A, cases(_8A 50 _$_) values(1 2 3)}{p_end}
{phang}switch matched _8A to a value of 1{p_end}
    {hline}
{phang}{cmd:. switch 100, cases(_8A 50 _$_) values(1 2 3)}{p_end}
{phang}switch found no matching value for 100{p_end}
    {hline}

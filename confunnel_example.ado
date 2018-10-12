*! 1.0.0 Tom Palmer 17nov2008
* clickable examples for confunnel helpfile
program confunnel_example, nclass
version 8.2
syntax anything , *
preserve
use "http://fmwww.bc.edu/repec/bocode/m/metan_example_data.dta", clear
gen logOR = log((tdeath*cnodeath)/(tnodeath*cdeath))
gen selogOR = sqrt((1/tdeath) + (1/tnodeath) + (1/cdeath) + (1/cnodeath))
`anything', `options'
restore
end

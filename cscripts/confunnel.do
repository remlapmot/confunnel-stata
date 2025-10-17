cscript confunnel adofiles confunnel

about

use http://fmwww.bc.edu/repec/bocode/m/metan_example_data.dta, clear
gen logOR = log((tdeath*cnodeath)/(tnodeath*cdeath))
gen selogOR = sqrt((1/tdeath) + (1/tnodeath) + (1/cdeath) + (1/cnodeath))

confunnel logOR selogOR

confunnel logOR selogOR, noshadedregions

confunnel logOR selogOR, solidcontours shadedcontours noshadedregions

confunnel logOR selogOR, metric(invse)

confunnel logOR selogOR, onesided(upper) noshadedregions

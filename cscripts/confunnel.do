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

confunnel logOR selogOR, onesided(lower) noshadedregions

confunnel logOR selogOR, metric(var)

confunnel logOR selogOR, metric(invvar)

confunnel logOR selogOR in 1/10, metric(invse)

confunnel logOR selogOR if selogOR < 1, metric(invvar) noshadedregions

confunnel logOR selogOR, functionlowopts(lc(red)) functionuppopts(lc(blue)) noshadedregions

* unsorted contour levels are sorted ascending
confunnel logOR selogOR, contours(10 5 1)

* contour levels outside (0, 100) are rejected
rcof "noisily confunnel logOR selogOR, contours(0 5)" == 125

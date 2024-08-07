version 18
webuse nsaidsset, clear

// ssc install mylabels

mylabels 0.02 0.2 1 5 50, myscale(log(@)) local(mylab)

confunnel _meta_es _meta_se, twowayopts(xtitle("Odds ratios (log scale)") `"xlabel(`mylab')"' title("Contour-enhanced funnel plot"))
gr export ./img/confunnel.png, replace

meta funnelplot, contours(1 5 10) xtitle("Odds ratios (log scale)") xlabel(`mylab') legend(pos(2) ring(0))
gr export ./img/metafunnel.png, replace

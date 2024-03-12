version 18
webuse nsaidsset, clear

confunnel _meta_es _meta_se, xtitle("Log odds-ratio")
gr export ./img/confunnel.png, replace

meta funnelplot, contours(1 5 10)
gr export ./img/metafunnel.png, replace

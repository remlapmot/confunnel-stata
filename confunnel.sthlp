{smcl}
{* Tom Palmer 19nov2008 }{...}
{hline}
{cmd:help confunnel}{right: ({browse "http://www.stata-journal.com/article.html?article=gr0033":SJ8-2: gr0033})}
{hline}

{title:Title}

{p2colset 5 18 20 2}{...}
{p2col :{cmd:confunnel} {hline 2}}Contour-enhanced funnel plots for meta-analysis{p_end}
{p2colreset}{...}


{title:Syntax}

{phang2}
{cmd: confunnel} {it:varname1} {it:varname2} {ifin} [{cmd:,} {it:options}]


{synoptset 34}{...}
{synopthdr}
{synoptline}
{synopt:{opth c:ontours(numlist)}} specify significance levels of the contours to be plotted; default is 1%, 5%, and 10% significance levels{p_end}
{synopt:{opth contcol:or(colorstyle)}} specify color of the contour lines if {cmd:shadedcontours} is not specified{p_end}
{synopt:{opt extra:plot(plots)}} specify additional plots to overlay the funnel plot{p_end}
{synopt:{opt functionlow:opts(options)}} pass options to the {cmd:twoway function} commands used to draw the contours {p_end}
{synopt:{opt functionupp:opts(options)}}  pass options to the {cmd:twoway function} commands used to draw the contours {p_end}
{synopt:{opt legendlab:els(labels)}} specify labels in the legend for added items{p_end}
{synopt:{opt legend:opts(options)}} specify options that affect the plot legend{p_end}
{synopt:{cmdab:m:etric(}{cmd:se}|{cmd:invse}|{cmd:var}|{cmd:invvar}{cmd:)}} the scale of the y axis; either {cmd:se}, {cmd:invse}, {cmd:var}, or {cmd:invvar}{p_end}
{synopt:{cmdab:one:sided(}{cmd:lower}|{cmd:upper}{cmd:)}} lower- or upper-tailed, one-sided significance contours{p_end}
{synopt:{opt scatter:opts(options)}} specifies any of the options documented in {helpb scatter} {p_end}
{synopt:{opt shadedc:ontours}} specify shaded, instead of black, contour lines{p_end}
{synopt:[{cmdab:no:}]{opt shadedr:egions}} specify or suppress shaded regions between the contours{p_end}
{synopt:{opt solidc:ontours}} specify solid, instead of dashed, contour lines{p_end}
{synopt:{opt studyl:ab(string)}} the legend label for the scatter points{p_end}
{synopt:{opth twoway:opts(twoway_options)}} pass options to the {cmd:twoway} plot{p_end}
{p2col: {help twoway_options}} pass options to the {cmd:twoway} plot{p_end}
{synoptline}
{p2colreset}{...}


{title:Description}

{pstd}{cmd:confunnel} plots contour-enhanced funnel plots for assessing
small-study reporting bias in meta-analysis.{p_end}

{pstd}Contours illustrating the statistical significance of the study-effect
estimates are plotted from either a one- or two-tailed test.{p_end}

{pstd}{cmd:confunnel} requires two input variables; {it:varname1} a variable of
effect estimates such as log odds ratios and {it:varname2} a variable of the
standard errors of the effect estimates.{p_end}

{pstd}The y axis can be specified using different scales, namely, standard
error, inverse standard error, variance, and inverse variance.{p_end}


{title:Options}

{phang}{opth contours(numlist)} specifies the significance levels of the
contours to be plotted; the default is {cmd:contours(1 5 10)}. There are only
distinct line patterns for 8 significance levels. See {help numlist}.

{phang}{opth contcolor(colorstyle)} specifies the color of the contour lines if
{cmd:noshadedcontours} is specified. See {manhelpi colorstyle G}.

{phang}{opt extraplot(plots)} specifies one or multiple additional plots to be
overlaid on the funnel plot.

{phang}{opt functionlowopts(options)} and {opt functionuppopts(options)} pass
options to the {cmd:twoway function} commands used to draw the 
significance contours; for example, the line widths can be changed. See
{manhelp graph_twoway_function G:graph twoway function}.

{phang}{opt legendlabels(labels)} specifies labels in the legend for extra
elements added to the funnel plot.  The option will take the form:
{cmd:legendlabels(`"8 "new label""')}.

{phang}{opt legendopts(options)} passes options to the plot legend. See
{manhelpi legend_option G}.

{phang}{cmd:metric(se}|{cmd:invse}|{cmd:var}|{cmd:invvar)} specifies the metric
of the y axis of the plot.  {cmd:se}, {cmd:invse}, {cmd:var}, and {cmd:invvar}
stand for standard error, inverse standard error, variance, and inverse
variance, respectively; the default is {cmd:se}.

{phang}{cmd:onesided(lower}|{cmd:upper)} can be lower or upper,
for lower-tailed or upper-tailed levels of statistical significance,
respectively.  If unspecified, two-sided significance levels are used to plot
the contours.

{phang}{opt scatteropts(options)} specifies any of the options documented
in {manhelp graph_twoway_scatter G:graph twoway scatter}.

{phang}{opt shadedcontours} specifies shaded contour lines; specify with the {cmd:noshadedregions} option.

{phang}[{opt no}]{opt shadedregions} specifies or suppresses shaded regions between the contours.
 This option provides plots that are more similar to those in the original 
 paper by Peters et al. (2008) and the Cochrane Handbook. 
 A plot with shadedregions is now the default.
 
{phang}{opt solidcontours} specifies solid contour lines; specify with the {cmd:shadedcontours}
 and {cmd:noshadedregions} option.

{phang}{opt studylab(string)} specifies the label for the scatter points in the legend. 
If not specified the default is "Studies". 

{phang}{opt twowayopts(options)} specifies options passed to the {cmd:twoway}
plotting function; see {manhelpi twoway_options G}.

{phang}{opt twoway_options} see {manhelpi twoway_options G}. As of {cmd:confunnel} 
version 1.0.5 twoway options can be specified at the end of the options and do not
 have to be within {opt twowayopts}.

{title:Remarks}

{pstd}The {cmd:confunnel} command is based on an idea by Peters et al. (2008) to
superimpose contours of statistical significance on a funnel plot in a
meta-analysis. The command was explained in Palmer et al. (2008). Superimposing contours 
on funnel plots has also been suggested by Spiegelhalter (2005) in a slightly different context.

{pstd}{cmd:confunnel} can be used in conjunction with the results of the {helpb metan},
{helpb metatrim}, and {helpb metabias} commands.  See {helpb meta} in Stata version 10
for information about user-written commands for meta-analysis.


{title:Examples}

{pstd}The following examples use the example dataset accompanying {helpb metan}.

{phang}{cmd:. confunnel logOR selogOR}{p_end}
{phang}{it:({stata confunnel_example confunnel logOR selogOR:click to run})}{p_end}

{phang}{cmd:. confunnel logOR selogOR, noshadedregions}{p_end}
{phang}{it:({stata `"confunnel_example confunnel logOR selogOR, noshadedregions"':click to run})}{p_end}

{phang}{cmd:. confunnel logOR selogOR, solidcontours shadedcontours noshadedregions}{p_end}
{phang}{it:({stata `"confunnel_example confunnel logOR selogOR, solidcontours shadedcontours noshadedregions"':click to run})}{p_end}

{phang}{cmd:. confunnel logOR selogOR, metric(invse)}{p_end}
{phang}{it:({stata "confunnel_example confunnel logOR selogOR, metric(invse)":click to run})}{p_end}

{phang}{cmd:. confunnel logOR selogOR, onesided(upper) noshadedregions}{p_end}
{phang}{it:({stata `"confunnel_example confunnel logOR selogOR, onesided(upper) noshadedregions"':click to run})}{p_end}


{title:References}

{phang}Palmer, T. M., J. L. Peters, A. J. Sutton, and S. G. Moreno. 2008. 
Contour enhanced funnel plots for meta-analysis. {it:Stata Journal} 8: 242-254.{p_end}

{phang}Peters, J. L., A. J. Sutton, D. R. Jones, K. R. Abrams, and L. Rushton.
2008. Contour-enhanced meta-analysis funnel plots help distinguish publication 
bias from other causes of asymmetry. {it:Journal of Clinical Epidemiology}. 61: 991-996.{p_end}

{phang}Spiegelhalter, D. J. 2005. Funnel plots for comparing institutional performance.
 {it:Statistics in Medicine} 24: 1185-1202.{p_end}

{phang}Sterne, J. A. C., and M. Egger. 2001. Funnel plots for detecting bias
in meta-analysis: Guidelines on choice of axis.
{it:Journal of Clinical Epidemiology} 54: 1046-1055.{p_end}

{phang}Sterne, J. A. C., and R. M. Harbord. 2004. Funnel plots in
meta-analysis. {it:Stata Journal} 4: 127-141.{p_end}

{phang}Sterne, J. A. C., M. Egger, and D. Moher. 2008. Chapter 10: Addressing reporting biases; 
Cochrane Handbook for Systematic Reviews of Interventions Version 5.0.1.{p_end}


{title:Author}

{phang}Tom Palmer, MRC Integrative Epidemiology Unit and Population Health Sciences, University of Bristol, UK. 
 {browse "mailto:tom.palmer@bristol.ac.uk":tom.palmer@bristol.ac.uk}.{p_end}
 
{phang}Jaime Peters wrote the first version of this command.{p_end}

{phang}Thanks to Santiago G. Moreno for testing the command.{p_end}

{phang}Please report any errors you may find.{p_end}


{title:Also see}

{psee}
Article: {it:Stata Journal}, volume 8, number 2: {browse "http://www.stata-journal.com/article.html?article=gr0033":gr0033}

{psee}
Online:  {helpb metabias}, {helpb metafunnel}, {helpb metan} (if installed)
{p_end}

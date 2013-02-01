ZeligPanelmodels
================

Econometric style TSCS analysis for Zelig 4

The development branch of ZeligPanelmodels is where to implement major and minor feature additions, as well as bug fixes and minor changes.

The plm package has several top-level functions for the estimation of models. These include:

1. A basic function for estimating most panel-data models (fixed effects, random effects, between effects, first differences, etc.)

        plm(formula, data, subset, na.action, effect = c("individual","time","twoways"), model = c("within","random",
        "ht","between","pooling","fd"), random.method = c("swar","walhus","amemiya","nerlove", "kinla"), 
        inst.method = c("bvk","baltagi"), index = NULL, ...)

2. General FGLS estimation

        pggls(formula, data, subset, na.action, effect = c("individual","time"), model = c("within","random",
        "pooling","fd"), index = NULL, ...)

3. Hausman-Taylor estimator 

        pht(formula, data, subset, na.action, index = NULL, ...)

4. Variable coefficients model

        pvcm(formula, data, subset, na.action, effect = c("individual","time"),
        model = c("within","random"), index = NULL, ...) 

The package also includes ```pccep()``` and ```pggm()``` estimators. Currently, I have no immediate plans to include these in ZeligPanelmodels

As of Version 1.0.0 of the package, the ```plm()``` estimator is included.

Subsequent versions will include estimators 2-4.

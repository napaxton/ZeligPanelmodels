ZeligPanelmodels
================

Econometric style TSCS analysis for Zelig 4

The development branch of ZeligPanelmodels is where to implement major and minor feature additions, as well as bug fixes and minor changes.

The plm package has several top-level functions for the estimation of models. These include:

* ``` plm(formula, data, subset, na.action, effect = c("individual","time","twoways"),
    model = c("within","random","ht","between","pooling","fd"),
    random.method = c("swar","walhus","amemiya","nerlove", "kinla"),
    inst.method = c("bvk","baltagi"), index = NULL, ...)
  ```

* ``` pggls(formula, data, subset, na.action, effect = c("individual","time"), model = c("within","random","pooling","fd"),
index = NULL, ...)
  ```

* ``` pht(formula, data, subset, na.action, index = NULL, ...)
```

* ``` pvcm(formula, data, subset, na.action, effect = c("individual","time"),
     model = c("within","random"), index = NULL, ...)
```

* The package also includes ```pccep()``` and ```pggm()``` estimators. Currently, I have no immediate plans to include these in ZeligPanelmodels

As of Version 1.0.0 of the package, the plm() estimator is included.

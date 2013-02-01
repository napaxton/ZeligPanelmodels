library(Zelig)
# library(ZeligPanelmodels)
library(plm)
data(Grunfeld)
detach(package:plm)
#This loads the CSTS data set from the plm package.
library(ZeligPanelmodels)
#loads my extension to Zelig
data(Grunfeld)

z.out <- zelig(inv~value+capital, data=Grunfeld, model="plm", pan.model="random", pan.index=c("firm","year"))
# copied exactly from plm documentation so I can test for zelig stuff, not plm stuff

names(z.out)

x.out <- setx(z.out)

z.out$result$formula

x.out <- setx(z.out)

s.out <- sim

#-----------
library(ZeligPanelmodels)

data(Grunfeld)

z.out <- zelig(
    inv ~ value + capital,                                                                    
    data=Grunfeld,  
    model="plm",   
    pan.model="random", 
    pan.index=c("firm","year")                                                                
)                                                                                         

sample.formula <- formula(z.out)


message("\n\nThis matrix works:")                                                                        
model.matrix(sample.formula, Grunfeld[1, ])                                                              

class(sample.formula) <- c("pFormula", class(sample.formula))


message("\n\nThis does not:")
model.matrix(sample.formula, Grunfeld[1, ]) 

#-----------
tx1 <- makePredictorTermMatrix(formula(z.out.re), Grunfeld, x.out.re)
tx1
ev1 <- compute.ev(z.out.re$result$coef, tx1)
ev1

library(ZeligPanelmodels)

data(Grunfeld)

z.out <- zelig(
               Formula(inv ~ value + capital),
               data=Grunfeld, 
               model="pan.plm", 
               pan.model="random", 
               pan.index=c("firm","year")
               )


x.out <- setx(z.out)

x.out


s.out <- sim(z.out, x.out)

library(ZeligPanelmodels)

data(Grunfeld)

z.out <- zelig(
               Formula(inv ~ value + capital),
               data=Grunfeld, 
               model="pan.plm", 
               pan.model="random", 
               pan.index=c("firm","year")
               )
z.out.fe <- zelig(
               Formula(inv ~ value + capital),
               data=Grunfeld, 
               model="pan.plm", 
               pan.model="within", 
               pan.index=c("firm","year")
               )

x.out <- setx(z.out)
x.out.l <- setx(z.out, capital=quantile(Grunfeld$capital, 0.25))
x.out.h <- setx(z.out, capital=quantile(Grunfeld$capital, 0.75))

x.out


s.out <- sim(z.out, x=x.out.l, x1=x.out.h)

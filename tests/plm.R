library(ZeligPanelmodels)

data(Grunfeld)

z.out.re <- zelig(
               inv ~ value + capital,
               data=Grunfeld, 
               model="pan.plm", 
               pan.model="random", 
               pan.index=c("firm","year")
               )
# z.out.fe <- zelig(
#                Formula(inv ~ value + capital),
#                data=Grunfeld, 
#                model="pan.plm", 
#                pan.model="within", 
#                pan.index=c("firm","year")
#                )
# z.out.fd <- zelig(
#     inv ~ value + capital,
#     data=Grunfeld, 
#     model="pan.plm", 
#     pan.model="fd", 
#     pan.index=c("firm","year")
#     )

x.out.re <- setx(z.out.re)
# x.out.l <- setx(z.out, capital=quantile(Grunfeld$capital, 0.25))
# x.out.h <- setx(z.out, capital=quantile(Grunfeld$capital, 0.75))

x.out.re


s.out.re <- sim(z.out.re, x=x.out.re)
# s.out.fe <-sim(z.out, x=x.out.l, x1=x.out.h)

s.out.re
# s.out.fe

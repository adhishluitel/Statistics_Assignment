library(mosaic)
library(tidyverse)

lm1 = lm(creatclear~age,data=creatinine)
coef(lm1)

new_dat = data.frame(age=55)
predict(lm1, new_dat)
plot(creatclear~age, data= creatinine)
abline(lm1)

head(creatinine)
filter(creatinine,age==55)

plot(creatclear~age, data=creatinine,
     pch=19, col='grey', bty='n',
     ylab="creatinine score", xlab="Age")

lm1 = lm(creatclear~age, data=creatinine)
abline(lm1, lwd=2, col='blue')
coef(lm1)
predict(lm1)[55]
coef(lm1)
predict(lm1)[40]


135 - 20*0.619
112 + 20*0.619
predict(lm1)[40]

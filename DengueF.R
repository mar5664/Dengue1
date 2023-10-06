library(TSstudio)
library(forecast)
library(tseries)

dengue.partition<-ts_split(dengue4.ts,sample.out = 99) 
est<-dengue.partition$train   
eval<-dengue.partition$test   
# DHR
fit <- auto.arima(est, xreg = harmonics, seasonal = FALSE)
accuracy(fc,eval)  
newharmonics <- fourier(est, K = , h =)
future.for<-forecast(fit,xreg = newharmonics,level=95)
summary(future.for)
plot(future.for)

#assess model's performance; compare original dataset (hold out/evaluation/testing part) with forecast, for n=12 
accuracy(M.bestfor,eval)
#refer to the plot, the model captures the trend and seasonal patterns
test_forecast(actual=dengue4.ts,forecast.obj =M.bestfor,test=eval)
#plot the forecast
plot_forecast(M.bestfor)
plot_forecast(M.bestfor, title = "")

#future forecast
future.for<-forecast(M.best,h=,level=)
summary(future.for)
plot(future.for)

#NNAR
set.seed()
fit.nnar112=nnetar(est, P=1, p=1, size=2) #NNAR(1,1,2)52
for.nnar112<-forecast(fit.nnar112,h=99)
accuracy(for.nnar112,eval)
print(fit.nnar112)
Box.test(fit.nnar112$residuals)
acf(fit.nnar101$residuals)

#SARIMA
M1<-arima(est,order=c(0,1,2),seasonal = list(order=c(1,1,0),52))
summary(M1)
#auto.arima
adj.autoarima<-auto.arima(est,max.order = 5,D=1,d=1,stepwise = FALSE,approximation=FALSE)

library(titanic)
data("titanic_train")
fit_logistic <- glm(Survived ~ Pclass + Sex + Age + SibSp + 
                      Parch + Fare, 
                    family = binomial(link = "logit"), 
                    data = titanic_train)
summary(fit_logistic)

library(VIM)
VIM::matrixplot(titanic_train)

fit_logistic <- glm(Survived ~ Pclass + Sex + SibSp + 
                      Parch + Fare, 
                    family = binomial(link = "logit"), 
                    data = titanic_train)
summary(fit_logistic)

p <- .25
n <- 10
set.seed(9842)
y <- rbinom(n,size=1,prob=p)

f <- function(p,y){
  p^sum(y) * (1-p)^(length(y) - sum(y))
}
p_hat <- mean(y)

plot(NA, xlim = c(0,1), ylim=c(0,7e-3), 
     xlab = "p", ylab = "likelihood function",
     main = "Maximum likelihood estimator of Bernoulli distribution",
     cex.main = .9)
grid()
curve(f(p,y),from = 0,to = 1, xname = "p",
      lwd = 3, add = TRUE, col = "gray30")
points(x = p, y = f(p,y), pch = 17, col = "#990000", cex = 1.5)
points(x = p_hat, y = f(p_hat,y), pch = 17, col = "#009999", cex = 1.5)
legend("topright", legend = c("Parameter","Estimator"), 
       col = c("#990000","#009999"), pch = 17, pt.cex = 1.5,
       bty = "n")

X <- subset(titanic_train, 
            select = c("Pclass", "Sex", "SibSp", "Parch", "Fare"))
X <- model.matrix(fit_logistic)
y <- fit_logistic$y

nll <- function(beta,X,y){
  xbeta <- X %*% beta
  -y %*% xbeta + sum(log(1 + exp(xbeta)))
}

sigmoid <- function(t){
  1 / (1 + exp(-t))
}

grad_nll <- function(beta,X,y){
  xbeta <- X %*% beta
  t(X) %*% (sigmoid(xbeta) - y)
}

hess_nll <- function(beta,X,y){
  xbeta <- X %*% beta
  sig <- sigmoid(xbeta)
  t(X) %*% sig %*% t(1 - sig) %*% X
}

opt_bfgs <- optim(par = rep(0,6), fn = nll, gr = grad_nll,
                  method = "BFGS", y = y, X = X)

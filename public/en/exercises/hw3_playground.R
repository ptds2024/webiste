
# Problem 1 ---------------------------------------------------------------

make_circle = function(col = "darkblue", fill = NULL, lty = 1) {
  phi <- seq(from = pi/2, to = 0, length.out = 201)
  f1_points <- cbind(.5 * cos(phi), .5 * sin(phi))
  
  phi <- seq(from = 0, to = pi, length.out = 101)
  f2_points <- cbind(.5 + .5 * cos(phi), .5 + .5 * sin(phi))
  
  x <- seq(from = .5, to = 1, length.out = 101)
  f3_points <- cbind(x, x - .5)
  
  coords = rbind(f2_points, f1_points, f3_points)
  
  lines(coords, col = col, lty = lty)
  if (!is.null(fill)){
    polygon(c(coords[,1]), c(coords[,2]), col = fill, border = NULL)
  }
}

make_square = function(bottom_left = c(0,0), side = 1, col = "darkblue", fill = NULL){
  lines(c(bottom_left, bottom_left), c(bottom_left + side, bottom_left), col = col)
  lines(c(bottom_left + side, bottom_left), c(bottom_left + side, bottom_left + side), col = col)
  lines(c(bottom_left + side, bottom_left + side), c(bottom_left, bottom_left + side), col = col)
  lines(c(bottom_left, bottom_left + side), c(bottom_left, bottom_left), col = col)
  if (!is.null(fill)){
    polygon(c(bottom_left, bottom_left+side, bottom_left+side, bottom_left), c(bottom_left, bottom_left, bottom_left+side, bottom_left+side), border = NULL, col = fill)
  }
}

inside_region <- function(x, ind = NULL) {
  if (is.null(ind)) {
    stop("Index should be supplied to calculate the are border.")
  }
  
  if (ind == 1) {
    I <- x[1]^2 + x[2]^2 > .5^2
  } else if (ind == 2) {
    I <- (x[1] - .5)^2 + (x[2] - .5)^2 < .5^2
  } else if (ind == 3) {
    I <- x[2] > x[1] - .5
  }
  
  return(I)
}

inside_shape = function(x){
  if (inside_region(x, 1) && inside_region(x, 2) && inside_region(x, 3)) {
    return(1)
  } else {
    return(0)
  }
}

find_area = function(B = 5000, seed = 10, make_plot = TRUE){
  # Control seed
  set.seed(seed)
  
  # Simulate B points
  point = matrix(runif(2*B, 0, 1), B, 2)
  
  # Compute the number of points inside unit circle
  nb_inside = apply(point, 1, inside_shape)
  area_hat = sum(nb_inside)/B
  
  # Make plot
  if (make_plot){
    plot(NA, xlim = c(-0.1,1.1), ylim = c(-0.1,1.1), xlab = "x", ylab = "y")
    make_square()
    cols = hcl(h = seq(15, 375, length = 3), l = 65, c = 100, alpha = 0.2)[1:2]
    grid()
    for (i in 1:B){
      points(point[i,1], point[i,2], pch = 16, col = cols[1 + nb_inside[i]])
    }
    make_circle()
  }
  
  # return estimated value of pi
  return(area_hat)
}


B = seq(from = 10^3, to = 10^5, by = 500)
val <- numeric(length(B))
for (k in 1 : length(B)) {
  val[k] <- find_area(B[k], make_plot = FALSE)
}




# Problem 3 ---------------------------------------------------------------

library(titanic)
library(tidyverse)

data <- titanic_train %>% as_tibble() %>% 
  select(Survived, Pclass, Sex, SibSp, Parch, Fare) %>% 
  mutate(Sex = factor(Sex))

set.seed(1)
ind_train <- sample(1:nrow(data), size = .7*nrow(data), replace = FALSE)

data_train <- data[ind_train, ]
data_test <- data[-ind_train, ]

model_glm <- glm(Survived ~ ., data = data_train, family = binomial(link = "logit"))

sigma_f <- function(x) {
  1/pi * atan(x) + .5 
}

nll <- function(w, X, y) {
  xw <- X %*% w
  loglik <- y * log(sigma_f(xw) / (1 - sigma_f(xw))) + log(1 - sigma_f(xw))
  return(-sum(loglik))
}

X_data <- model.matrix(model_glm)
Y_data <- model_glm$y

model_cauchy <- optim(par = rep(0, 6), fn = nll, X = X_data, y = Y_data, method = "BFGS")

pred_glm <- predict(model_glm, newdata = data_test, type = "response") > .5

data_test_mat <- data_test %>% mutate(Sex = Sex == "male") %>% as.matrix()
pred_cauchy <- sigma_f(data_test_mat %*% model_cauchy$par) > .5

table(data_test$Survived, pred_glm)
table(data_test$Survived, pred_cauchy)

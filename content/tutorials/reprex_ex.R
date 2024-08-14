library(reprex)
(y <- 1:4)
mean(y)


library(slackr)
slackr_setup()
slackr(str(iris))
slackr('Here I am')
slackr('Here I am', channel='#random')

library(slackreprex)
library(magrittr)

slackteams::load_teams()

slackreprex::slack_reprex({
  x <- 10
  hist(runif(x))
  hist(runif(2*y))
},
text = 'My question is ...) ',
channel = '#test_reprex')

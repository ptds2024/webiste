+++
title = "Project"
weight = 10
+++

{{% notice warning %}}
Presentations of the projects are held the **2021-12-20**.
You have 15 minutes of presentation + 5 minutes of questions per group.
Each member should present a piece of the presentation.
{{% /notice %}}

The output of your project must be:

1. An awesome project!  
2. A super R-package that can be directly installed from your GitHub repository. More specifically you should make sure:
  + you have a DESCRIPTION file with all necessary information including, but not limited to, Package title, general description, dependencies, license, and imports.  
  + R/Rcpp functions with documentation including title, description, parameters, authors, exports, and at least one example.  
  + A well formatted package skeleton (man, inst, docs, R, etc.)
  + A shiny app to allow someone having absolutely no R knowledge to “use” what you have done in your project. This shiny app should be within your package. 
  + The package can seamlessly be installed from your GitHub repository (for example using `remotes::install_github("ptds2021/projectGX")` where `X` is your group number.
  + A vignette that illustrates your package/shiny app with nice examples.
3. The GitHub repository is well-documented with nice commit messages and clear issues (close them once done!). Up-to-date GitHub projects that demonstrate your current organization for the project: TODOs, tasks in progress of resolution, tasks that have been completed.
4. A website built using `blogdown` showcasing your work and your package. In particular, you should at least motivate your package and explain how to use it. You should also make a short video showing how to use the package.

The presentations are scheduled as follows:
```{r}
set.seed(1)
tibble::tibble(
  group = sample.int(6,6),
  time_start = seq(
    from=as.POSIXct("2021-12-20 09:00:00","%Y-%m-%d %H:%M", tz="Lausanne/Switzerland"),
    to=as.POSIXct("2021-12-20 10:40:00", "%Y-%m-%d %H:%M", tz="Lausanne/Switzerland"),
    by="20 min"
  ),
  time_end = seq(
    from=as.POSIXct("2021-12-20 09:20:00","%Y-%m-%d %H:%M", tz="Lausanne/Switzerland"),
    to=as.POSIXct("2021-12-20 11:00:00", "%Y-%m-%d %H:%M", tz="Lausanne/Switzerland"),
    by="20 min"
  )
)
```

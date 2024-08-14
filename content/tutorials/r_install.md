+++
title = "R/RStudio setup"
date =  2023-09-05T13:10:39+02:00
weight = 5
+++

## Installing `R` and `RStudio` 

### 1. Installing `R`

Install the latest version of `R` (4.3.1 as of September 5, 2023). `R` itself is similar to an engine and chassis of a car, that is a bare minimum so that you can start driving. You need to follow steps below: 

* Visit [https://cran.r-project.org](https://cran.r-project.org) and click on "Download R for ...", where ... corresponds to your operating system. 
* Depending on the operating system: 
  - For Mac: download "R-4.3.1-arm64.pkg", open this file, and install `R`;
  - For Windows: click on "base", "Download R-4.3.1 for Windows", and download the .exe file. Open it, and install `R`.
  
*Note:* If you are a Mac user and you see similar to the following warning messages during the startup

```{toml}
During startup - Warning messages:
1: Setting LC_CTYPE failed, using "C"
2: Setting LC_COLLATE failed, using "C"
3: Setting LC_TIME failed, using "C"
4: Setting LC_MESSAGES failed, using "C"
5: Setting LC_PAPER failed, using "C"
[R.app GUI 1.50 (6126) x86_64-apple-darwin9.8.0]

WARNING: You're using a non-UTF8 locale, therefore only ASCII characters will work. Please read R for Mac OS X FAQ (see Help) section 9 and adjust your system preferences accordingly. [History restored from /Users/nemo/.Rapp.history]
```

you need to follow [steps below](https://stackoverflow.com/questions/9689104/installing-r-on-mac-warning-messages-setting-lc-ctype-failed-using-c): 

* Open Terminal
* Write or paste in: `defaults write org.R-project.R force.LANG en_US.UTF-8`
* Close Terminal

### 2. Installing RStudio

*Caution:* Install `RStudio` only once `R` has been installed and only in this order.

`RStudio` is an integrated development environment for `R`. Following up our example of the car, `RStudio` is similar to additional parts, such as exterior, interior, air conditioner, etc. You can drive the vehicle without them, but life is much simpler and pleasant if they are present.

We will install the free version: 
 
* Visit [RStudio website](https://posit.co/download/rstudio-desktop/).
* Click on the respective version of your operating system, this will start the downloading process.
* Open the file and install.

*Note:* To improve the quality of the code, we will limit the length of lines to 80 symbols. To display the margin in RStudio sourse editor:

* Open RStudio
* Go to Tools -> Global Options… -> Code -> Display
* Click on “Show margin”
* Set "Margin column" to 80

<img src="/tutorials/length.png" alt="map" width="400px"/>

*Check yourself:* Open `RStudio` application. In the console you will see something as follows:

```{toml}
R version 4.3.1 (2023-06-16 ucrt) -- "Beagle Scouts"
Copyright (C) 2023 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.
```

### 3. Installing packages

*Note:* Packages can be installed from both `R` and `RStudio`. The installed `RStudio` is not required.

In this course we will utilize a number of packages. If a package is published on CRAN, then the procedure of installing the package is straightforward: 

* Open RStudio
* In the console execute the following command: `install.packages("package_name")`, where `package_name` is the name of the desired package (e.g., "ggplot2").

Several packages, however, would have only development version (or simply be not published on CRAN). Then, knowing the GitHub link to the repo, one could follow the steps below:

* Install `devtools` package (if it has not yet been installed) as usual (as shown above).
* Type `devtools::install_github("username/repo")` and hit the Enter/return key to execute the command in the console, where `username` is the username of the owner of the repo, and `repo` is the name of the repo.

For homeworks you will use the following packages from CRAN: `"tidyverse"`, `"devtools"`, `"rmarkdown"`, `"knitr"`, `"shiny"`, `"roxygen2"`. 

*Note:* Before installing the `"devtools"` package, you will most certainly need to install building tools.
For Windows, you need to install [RTools](https://cran.r-project.org/bin/windows/Rtools/).
For Mac, you need to install [XCode](https://developer.apple.com/xcode/).
Check this [link](https://r-pkgs.org/setup.html#setup-tools) for more details.

*Note:* Packages should be installed only **once**. No needs to install them every time when you want to use them (it is the same as installing Skype every time you want to call your parents). That is why it is better to do it in console, not in source editor.

*Check yourself:* [To check if a package was installed successfully](https://stackoverflow.com/questions/9341635/check-for-installed-packages-before-running-install-packages), use `"name_of_package" %in% rownames(installed.packages())`.

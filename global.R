#Data Project
library(shiny)
library(xlsx)
library(pyramid)

variantChecker <- function (variant)  {
  
  f1 = "almost constant 1.4 children each woman"
  f2 = "little increase, from 2025 up to 1.6 children each woman"
  f3 = "decrease in the long run 2060 to 1.2"
  
  l1 = "Basic assumptions Boys 85 Years, Girls 89,2 Years"
  l2 = "strong increase Boys 87.7 years, Girls 91.2 Years"
  
  m1 = " 100tsd from 2014"
  m2 = " 200tsd from 2020"  
  
  variantChecker = list()
  if (variant == "Variante 1-W1 EJ") {
    variantChecker$f = f1
    variantChecker$l = l1
    variantChecker$m = m1
  }
  if (variant == "Variante 1-W2 EJ") {
    variantChecker$f = f1
    variantChecker$l = l1
    variantChecker$m = m2
  }
  if (variant == "Variante 2-W1 EJ") {
    variantChecker$f = f1
    variantChecker$l = l2
    variantChecker$m = m1
  }
  if (variant == "Variante 2-W2 EJ") {
    variantChecker$f = f1
    variantChecker$l = l2
    variantChecker$m = m2
  }
  if (variant == "Variante 3-W1 EJ") {
    variantChecker$f = f2
    variantChecker$l = l1
    variantChecker$m = m1
  }
  if (variant == "Variante 3-W2 EJ") {
    variantChecker$f = f2
    variantChecker$l = l1
    variantChecker$m = m2
  }
  if (variant == "Variante 4-W1 EJ") {
    variantChecker$f = f2
    variantChecker$l = l2
    variantChecker$m = m1
  }
  if (variant == "Variante 4-W2 EJ") {
    variantChecker$f = f2
    variantChecker$l = l2
    variantChecker$m = m2
  }
  if (variant == "Variante 5-W1 EJ") {
    variantChecker$f = f3
    variantChecker$l = l1
    variantChecker$m = m1
  }
  if (variant == "Variante 5-W2 EJ") {
    variantChecker$f = f3
    variantChecker$l = l1
    variantChecker$m = m2
  }
  if (variant == "Variante 6-W1 EJ") {
    variantChecker$f = f3
    variantChecker$l = l2
    variantChecker$m = m1
  }
  if (variant == "Variante 6-W2 EJ") {
    variantChecker$f = f3
    variantChecker$l = l2
    variantChecker$m = m2
  } 
  variantChecker
}

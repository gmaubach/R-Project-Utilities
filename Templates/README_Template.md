---
title: 'Your project title here
author: 'Author(s) name(s) here'
date: 'Current date here'
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE, cache = FALSE)
```
# Topic

# Context

# Goals

# Approach
## Exploring the problem
## Exploring the solution
## Defining data usage

# Data Mining
## Data import
## Data preparation
## Data surveying
## Data modeling

# Deployment

# Programs
´´´{r}
source("main_program.R")
´´´

# Information on used system and configuration
```{r}
cat("Gathering system information after running 'main_program.R' ...\n")
sessionInfo()
cat("... Done! (Gathering system information)\n")
```
# Organisation of the project
```{r}
list.dir(path = "project_directory", 
  all.files = FALSE,
  recursive = TRUE,
  include.dirs = TRUE)
```

# Instructions for reproducing the project

# EOF .

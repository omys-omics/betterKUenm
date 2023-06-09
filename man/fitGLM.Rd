% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fitGLM.R
\name{fitGLM}
\alias{fitGLM}
\title{Fitting Generalized Linear Models for only presences data}
\usage{
fitGLM(presences, background, w_presences = 1, w_backg = 1000)
}
\arguments{
\item{presences}{matrix of environmental values for presences records}

\item{background}{matrix of environmental values for background records}

\item{w_presences}{a numeric value to weight presence records}

\item{w_backg}{a numeric value to weight background records}
}
\value{
fitGLM returns an object of class inheriting from "glm" which inherits from the class "lm".
}
\description{
Fitting Generalized Linear Models for only presences data
}
\examples{
### Loading data
data("records", package = "betterKUenm")
envar <- terra::rast(system.file("extdata", "variables.tif", package = "betterKUenm"))
M <- terra::vect(system.file("extdata", "M.gpkg", package = "betterKUenm"))

## Step 1: Get env information of the presences and background data
occ_data <- occ_prep(data = records, lon = "longitude", lat = "latitude", variables = envar)
bcg_data <- ext_back(variables = envar, M = M, n = 1000)

## Step 2: Call GLM
glm_model <- fitGLM(presences = occ_data, background = bcg_data)
summary(glm_model)
}

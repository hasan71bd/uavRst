% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rs_pc2D_dtm.R
\name{pc2D_dtm}
\alias{pc2D_dtm}
\title{Create a Digital Terrain Model from UAV generated point clouds by minimum altitude sampling}
\usage{
pc2D_dtm(laspcFile = NULL, gisdbasePath = NULL, tension = 20,
  cutExtent = NULL, sampleGridSize = 25, targetGridSize = 0.25,
  splineThresGridSize = 0.5, projFolder = NULL,
  proj4 = "+proj=utm +zone=32 +datum=WGS84 +units=m +no_defs",
  giLinks = NULL, verbose = FALSE)
}
\arguments{
\item{laspcFile}{character. default is \code{NULL} path  to the laz/las file(s)}

\item{gisdbasePath}{character. default is \code{NULL} root directory of the project. NOTE the function creates two subfolder named \code{run} and \code{output}}

\item{tension}{numeric. tension of spline interpolation.}

\item{cutExtent}{clip area}

\item{sampleGridSize}{numeric, resolution extraction raster}

\item{targetGridSize}{numeric. the resolution of the target DTM raster}

\item{splineThresGridSize}{numeric. threshold of minimum gridsize tha is used for splininterpolation if the desired resolution is finer a two step approximation is choosen 
first step spline interpolation using the treshold gridsize second step bilinear resampling to the desired targetGridSize.}

\item{projFolder}{subfolders that will be created/linked for R related GRASS processing}

\item{proj4}{character. valid proj4 string that should be assumingly the correct one}

\item{giLinks}{list of link2GI cli pathes, default is NULL}

\item{verbose}{to be quiet (1)}
}
\description{
Create a Digital Terrain Model from a high density point cloud as typically derived by an optical UAV retrieval. Due to the poor estimation of ground points 
a minimum samopling approach is applied. It retrieves on a coarse sampling gridsize the minimum value and interpolates on these samples a surface grid with a higher target 
resolution. this is a kind of an try and error process and provides fairly good results if the point cloud shows at least some real surface points on a not to coarse grid.
}
\examples{
\dontrun{
pc2D_dtm(laspcFile =  "~/path/to/lasdata",
       gisdbasePath = "~/temp5",
       thinGrid = "0.5",
       splineNumber = "5" ,
       sampleGridSize = "0.5")
}
}
\author{
Chris Reudenbach
}
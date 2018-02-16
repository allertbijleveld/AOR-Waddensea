# Data Repository: Abundance, Biomass and Occupancy for 16 macrozoobenthos species in the Dutch Wadden Sea sampled between 2008 and 2015

## Original publication
This repository contains data for the paper: Bijleveld, A. I. et al. (2018) Presence-absence of marine macrozoobenthos does not generally predict abundance and biomass. Scientific Reports 8, 3039, doi:10.1038/s41598-018-21285-1.

## Citation
Please cite the original publication when using this data 

## Files
* `abundance_occupancy-regional.csv`: Yearly abundance and occupancy data for the entire Dutch Wadden Sea
* `abundance_occupancy-local.csv`: Yearly abundance and occupancy data per tidal basin 
* `biomass_occupancy-regional.csv`: Yearly biomass and occupancy data for the entire Dutch Wadden Sea
* `biomass_occupancy-local.csv`: Yearly biomass and occupancy data per tidal basin 
* `R-code to identify outliers.r`: Implementation of Local Polynomial Regression Fitting to identify outliers

## Data explanantion
Occupancy was calculated as the sum of the total number of presences divided by the number of sampling stations visited. Abundance (n m-2) and biomass (g AFDM m-2) were calculated within occupied patches only. The regional data are species-specific values averaged accross the entire Dutch Wadden Sea, and local data represent averages within years and tidal basins. Column headers preceded by 't_' represent transformed values. See the original paper for more details.  

## Persistent identifier for this Data Repository
[![DOI](https://zenodo.org/badge/114802916.svg)](https://zenodo.org/badge/latestdoi/114802916)

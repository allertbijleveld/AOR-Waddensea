# Appendix A1 – R script for identifying outliers

## This R-script accompanies the paper:
## Bijleveld et al. (in review) xxx

## if you use this script please cite the accompanying publiation


outliers <-function(afdm, L, criterium=2, span=span){
	# afdm = biomass of individuals
	# L = length of individuals
	# criterium = value to define outliers (the number of times the Inter quartile Range) 
	# data frame needs to be ordered on the predictor variable for smoother
	d<-data.frame(ID=1:length(afdm), afdmi=afdm, L=L)
	
	## transform variables
	d$log_afdm<-log10(d$afdmi)
	d$log_L<-log10(d$L)
	
	## drop na's
	d2<-d[complete.cases(d),]
	d2<-d2[order(d2$L),]

	# fit non-linear smoother 
	smoother <- loess(log_afdm ~ log_L, span=span, data=d2, control = loess.control(surface = "direct"))

	#calculate residual flesh mass
	R<-d2$rel_afdm <- resid(smoother) 

	## identify outliers
	#hist(R, n=30)
	resid.q <- quantile(R,prob=c(0.25,0.75))	#calaculate quantiles	
	iqr <- diff(resid.q)	#calculate Inter Quartile Range
	limits <- resid.q + criterium*iqr*c(-1,1)
	#abline(v=limits, col=2, lty=2)
	score <- (pmin((R-limits[1])/iqr,0) + pmax((R - limits[2])/iqr,0))
	d2$outlier<-abs(score)>0

	## predict values on original dataframe
	d$predicted<-10^predict(smoother, log10(d$L))
	## match outliers
	id<-match(d$ID, d2$ID)
	d$outliers<-d2$outlier[id]
	
	# plot fit
	plot(smoother,xlab="",ylab="")
	title(ylab=expression(paste(log[10],"(",AFDM[flesh],", mg)")), outer=F, line=2.5, cex.lab=1.25)	
	title(xlab=expression(paste(log[10],"(length, mm)")), outer=F, line=3, cex.lab=1.25)	
	lines(smoother$fitted~d2$log_L, col="green", lwd=3)
	points(d2$log_afdm[d2$outlier] ~ d2$log_L[d2$outlier], col=2, cex=2, pch=19)

	## plot outlier envelope 
	L<-seq(min(d2$log_L),max(d2$log_L),0.01)
	AVG<- predict(smoother, L)
	AVGmin<- AVG + limits[1]	
	AVGmax<- AVG + limits[2]	
	lines(AVGmin ~ L, col=2, lty=2)
	lines(AVGmax ~ L, col=2, lty=2)

	return(d)
	}

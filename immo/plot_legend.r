### Function plot only the legend of a markov random field, like in drawmaps
legend_map <- function(ylim_spat, xlimits = c(1,40), ylimits = c(3,5), 
                               cex.legend = 1, nrcolors = 100, digits = 2, par_new = FALSE, 
                               shift_text = c(2.5,-1.5), hcl.par = list(h = c(250, 0), c = 80, l = c(50, 95), power = 1.2), window.scale = 2) {
  
  op <- par(no.readonly = TRUE)
  
  lowerlimit <- ylim_spat[1]
  upperlimit <- ylim_spat[2]
  
  
  if(par_new) par(mar=c(0,0,0,0),oma=c(0,0,0,0))
  
  windowxlimits <- c((1 + window.scale*0.5)*xlimits[1] - window.scale*0.5 * xlimits[2], (1 + window.scale*0.5)*xlimits[2] - window.scale*0.5*xlimits[1])
  
  plot(windowxlimits, ylimits, type = "n", axes = FALSE, col = "white", 
       xlab = "", ylab = "", main="")
  
  # legend.colors <- grey((0:(nrcolors - 1))/(nrcolors - 1))
  # legend.colors <- rev(legend.colors)
  legend.colors <- colorspace::diverge_hcl(nrcolors,h=hcl.par$h,c=hcl.par$c,l=hcl.par$l,power=hcl.par$power)
  legend.colors <- rev(legend.colors)
  
  ylo <- yro <- ylimits[1] + (0.57 * (ylimits[2] - ylimits[1]))/1
  ylu <- yru <- ylimits[1] + (0.43 * (ylimits[2] - ylimits[1]))/1
  tylu <- tyru <- ylimits[1] + 0.35
  xlu <- xlo <- xlimits[1] + 0.01 * (xlimits[2] - xlimits[1])
  xru <- xro <- xlimits[1] + 0.99 * (xlimits[2] - xlimits[1])
  step <- (xru - xlu)/nrcolors
  for (i in 0:(nrcolors - 1)) {
    polygon(c(xlo + step * i, xlo + step * (i + 1), 
              xlu + step * (i + 1), xlu + step * i), c(ylo, 
                                                       yro, yru, ylu), col = legend.colors[i + 1], 
            border = legend.colors[i + 1])
  }
  lines(c(xlo, xro, xru, xlu, xlo), c(ylo, yro, yru, 
                                      ylu, ylo), col = "black")
  text(xlu + shift_text[1] * step, tylu, round(lowerlimit, digits=digits), 
       col = "black", cex = cex.legend)
  text(xru + shift_text[2] * step, tyru, round(upperlimit, digits=digits), 
       col = "black", cex = cex.legend)
  if (lowerlimit + (upperlimit - lowerlimit)/3 < 0 && 
      0 < upperlimit - (upperlimit - lowerlimit)/3) {
    help <- cut(c(0, lowerlimit, upperlimit), nrcolors)
    help <- as.vector(help, mode = "numeric")
    if (nrcolors%%2 == 0) 
      text(xlu + step * (help[1]), tylu, "0", col = "black", 
           cex = cex.legend)
    else text(xlu + step * (help[1] - 0.5), tylu, 
              "0", col = "black", cex = cex.legend)
  }
  #par(op)
}

# legend_map(c(-1, 1))
# legend_map(c(0.5,1))

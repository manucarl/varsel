#this script codes names of districts so that they are identical to the names
#in the map nigeria_dist_sort.bnd


nigeriaraw$region <- numeric(nrow(nigeriaraw))
nigeriaraw$subregion <- numeric(nrow(nigeriaraw))

levels(nigeriaraw$v023) <- rep(1:37,each = 2)[-72]

nigeriaraw$region <- as.numeric(nigeriaraw$v024)
nigeriaraw$subregion <- as.numeric(nigeriaraw$v023)


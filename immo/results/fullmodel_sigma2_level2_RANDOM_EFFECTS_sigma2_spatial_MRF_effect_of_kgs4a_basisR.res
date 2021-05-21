BayesX.design.matrix <- function(x, ...) {
  w <- getOption("warn")
  options(warn = -1)
  tx <- as.integer(as.character(unlist(x)))
  options("warn" = w)
  x <- if(!any(is.na(tx))) tx else as.integer(x)
  levels <- c(8336, 8337, 8315, 8311, 9262, 9172, 9163, 9776, 9763, 8435, 8335, 8327, 8326, 8316, 8325, 9275, 9189, 9171, 9187, 9182, 9173, 9175, 9764, 8436, 9780, 9762, 9180, 9190, 9188, 9162, 9775, 8421, 8437, 8426, 8417, 8416, 8317, 8237, 8211, 9272, 9271, 9263, 9279, 9277, 9261, 9183, 9184, 9177, 9778, 9777, 9761, 9181, 9179, 9174, 9774, 8425, 8415, 8231, 8115, 8235, 8216, 8212, 7317, 7320, 10041, 9276, 9362, 9278, 9274, 9178, 9186, 9161, 9773, 9772, 9771, 9185, 8135, 8117, 8116, 8111, 8236, 8121, 8118, 8221, 8215, 7334, 7318, 7314, 7311, 7340, 7337, 7316, 7313, 7312, 10044, 10045, 10043, 7335, 10042, 7211, 9565, 9563, 9372, 9375, 9273, 9176, 9562, 9779, 9577, 9573, 9561, 8136, 8119, 8125, 8226, 8222, 7338, 7332, 7319, 10046, 7336, 7333, 7235, 9576, 9564, 9363, 9376, 9373, 9361, 9572, 9461, 9663, 9575, 9571, 8127, 8126, 9675, 9662, 8225, 6437, 6431, 7331, 7315, 7134, 7133, 7231, 6414, 7232, 9574, 9474, 9462, 9377, 9374, 9371, 9471, 9463, 9679, 8128, 9678, 9676, 9661, 6432, 6411, 6433, 7339, 7233, 7140, 7135, 6439, 6436, 5366, 5314, 7131, 5316, 5122, 5334, 5362, 5358, 5315, 9479, 9472, 9464, 9478, 9477, 9674, 9473, 9673, 9677, 9672, 9671, 6438, 6413, 6412, 7141, 7137, 7111, 6533, 6434, 7138, 5382, 5378, 5120, 5124, 5158, 5117, 5111, 5370, 5162, 5116, 9475, 16072, 9476, 16069, 16054, 16066, 6631, 6440, 6435, 6531, 7143, 6532, 7132, 5374, 5954, 5914, 5513, 5113, 5916, 5913, 5911, 5512, 5119, 5114, 5112, 5166, 14523, 16075, 16073, 16070, 16055, 16053, 16051, 16067, 16063, 16056, 6632, 6535, 6534, 5970, 5966, 5962, 5978, 5562, 5170, 5154, 14524, 14521, 14511, 16077, 16076, 16074, 16071, 16052, 16068, 16064, 14628, 14612, 6636, 6634, 6611, 6635, 5958, 5974, 5915, 5558, 5554, 5515, 3456, 16061, 14522, 14713, 14729, 15084, 15002, 16065, 14626, 12052, 14625, 14627, 3452, 3402, 3152, 6633, 3156, 5762, 5711, 5774, 5754, 5570, 5566, 3454, 3404, 16062, 15087, 14730, 15088, 15001, 12053, 12071, 12066, 12062, 3462, 3405, 3457, 3453, 3158, 3155, 3153, 3255, 3102, 5758, 5766, 3460, 3459, 15085, 15089, 15003, 15091, 15082, 12072, 12067, 12064, 12061, 12054, 3458, 3455, 3451, 3403, 3401, 3154, 3103, 3101, 3254, 3252, 3157, 3257, 5770, 3251, 4011, 15083, 15086, 12069, 12051, 12060, 11000, 4012, 3461, 1054, 1001, 3151, 3241, 3351, 3256, 3361, 3356, 15081, 15090, 12063, 13075, 12073, 12065, 3352, 1051, 1059, 1002, 3360, 3358, 3357, 3354, 12070, 12068, 13073, 13071, 13003, 3359, 1056, 1004, 1061, 1058, 1057, 3355, 3353, 13076, 13072, 13004, 2000, 1060, 1055, 1053, 13074, 1062, 1003)
  x <- factor(x, levels = levels)
  X <- diag(length(levels))[x, ]
  attr(X, "type") <- "mrf"
  return(X)
}
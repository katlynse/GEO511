library(plot3D)
data(volcano)

##simple example persp3D
par(mfrow = c(1, 1))
persp3D(z = volcano, main = "volcano", clab = c("height", "m"))

#compared to persp
persp(z = volcano, main = "volcano")

##simple example contour3D
contour3D(z = volcano, colvar = volcano, lwd = 2, 
          nlevels = 20, clab = c("height", "m"), colkey = FALSE)

#combined with persp3D
persp3D(z = volcano, col = "white", shade = 0.1, plot = FALSE)
contour3D(z = volcano, colvar = volcano, lwd = 1, 
  add = TRUE, dDepth = 0.5)

#compared to contour
contour(z = volcano, lwd = 2, 
        nlevels = 20)

##fancy example
persp3D(z = volcano, zlim = c(-60, 200), phi = 20,
        colkey = list(length = 0.2, width = 0.4, shift = 0.15,
                      cex.axis = 0.8, cex.clab = 0.85), lighting = TRUE, lphi = 90,
        clab = c("","height","m"), bty = "f", plot = FALSE)
# create gradient in x-direction
Vx <- volcano[-1, ] - volcano[-nrow(volcano), ]
# add as image with own color key, at bottom
image3D(z = -60, colvar = Vx/10, add = TRUE,
        colkey = list(length = 0.2, width = 0.4, shift = -0.15,
                      cex.axis = 0.8, cex.clab = 0.85),
        clab = c("","gradient","m/m"), plot = FALSE)
# add contour
contour3D(z = -60+0.01, colvar = Vx/10, add = TRUE,
          col = "black", plot = TRUE)



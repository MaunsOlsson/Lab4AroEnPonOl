

B <- det(y - X %*% )


x <- matrix(c(0, 0.5, 1, 2, 5), ncol = 1)
x
y <- matrix(c(1, 3, 3, 5, 11), ncol = 1)
y

z <- cbind(x^0, x, 1/(x+1))
a = solve(t(z) %*% z) %*% t(z) %*% y


xs <- seq(from = -0.2, by = 0.01, to = 5.2)
plot(x = as.vector(x), y = as.vector(y))


ggplot(mapping = aes(x, y)) + geom_point()

a[1, ]+a[2, ]*xs+a[3, ]/(xs+1)

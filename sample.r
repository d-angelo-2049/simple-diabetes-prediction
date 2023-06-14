# hello world
greet <- function() {
  print("Hello world")
}
greet()

# easy calc
print((1 + 2 - 3 * 4) / 5^6)
print(sqrt(2))
print(sqrt(100) + round(100) / log10(100))

## variable
x <- 2 
print(x) 
print(x + 3)

x <- 2 
x <- 3 
print(x) 
print(y <- x)
print(x <- 1:4) 

objects()


## vector 
print(c(1.0, 2.0, 3.0, 4.0, 5.0))
print( c <- c(1.0, 2.0, 3.0, 4.0, 5.0) )
print(length(c))
print(x <- c(1:5))
print(x <- c(3:-3))
print(rep(1:3, length=8))
print(seq(1, 10, length=5))
print(seq(along=c(2,8,5)) )

print(matrix(1:6, nrow=2, ncol=3))
print(matrix(1:6, nrow=2, ncol=3, byrow=T))
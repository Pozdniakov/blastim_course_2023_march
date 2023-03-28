# Load necessary library
library(ggplot2)

# Create two vectors, x and y
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)

# Create a data frame from the vectors
data <- data.frame(x, y)

# Generate a line graph using ggplot2
p <- ggplot(data, aes(x, y)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 3) +
  labs(title = "Line Graph", x = "X-axis", y = "Y-axis") +
  theme_minimal()

# Display the graph
print(p)

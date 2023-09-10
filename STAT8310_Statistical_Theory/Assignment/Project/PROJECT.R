### QUESTION 1
# PART A
DB <- read.csv(file.path("C:/Users/demir/OneDrive/Desktop/project/starbucks.csv"))
head(DB)
pairs(DB[c("calories","total_fat_g","cholesterol_mg","sodium_mg",
           "total_carbs_g","sugar_g","caffeine_mg")])
cor(DB[c("calories","total_fat_g","cholesterol_mg","sodium_mg",
         "total_carbs_g","sugar_g","caffeine_mg")])
# Calculate the correlation matrix
cor_matrix <- cor(DB)
# Create a correlation plot to visualize correlations
library(corrplot)
corrplot(cor_matrix, method = "color", type = "upper",
         tl.col = "black", tl.srt = 45)

# PART B
# Calculate the mean and standard deviation of each column in DB
DB_mean <- apply(DB, 2, mean)
DB_sd <- apply(DB, 2, sd)
# Display the mean and standard deviation of each column in DB
data.frame(mean = DB_mean, sd = DB_sd)

# PART C

# Remove "x" from DB as it is not a variable
DB_no_x <- DB[, -1]

# Center the data
DB_centered <- scale(DB_no_x, center = TRUE, scale = FALSE)

# Perform PCA on the centered data
pca <- prcomp(DB_centered)

# Calculate proportion of variance explained by each principal component
pca_prop_var <- round(100 * pca$sdev^2 / sum(pca$sdev^2), 2)

# Calculate cumulative variance percentage
cum_var <- cumsum(pca_prop_var)

# Combine proportion of variance and cumulative variance percentage into a data frame
pca_results <- data.frame(Principal_Component = names(DB_no_x),
                          Proportion_of_Variance = pca_prop_var,
                          Cumulative_Variance_Percentage = cum_var)

# Display data frame of PCA results
pca_results

# PART D

# Identify principal components that explain at least 95% of the variance
pc_95 <- which(cum_var >= 95)[1]
pc_subset <- 1:pc_95
pc_subset

#PART E

library(ggplot2)

# Extract principal component scores
scores <- as.data.frame(pca$x)

# Create scatter plot of PC1 vs. PC2 scores
ggplot(scores, aes(x = PC1, y = PC2)) +
  geom_point() +
  xlab("First Principal Component (PC1)") +
  ylab("Second Principal Component (PC2)") +
  ggtitle("Scores on the First and Second Principal Components")


### QUESTION 2


# PART A

# Set seed for reproducibility
set.seed(123)

# Define parameters
n <- 200
m <- 300
mu <- 5
sigma_sq <- 12
sigma <- sqrt(sigma_sq)

# Simulate independent random samples X and Y
X <- rnorm(n, mean = mu, sd = sigma)
Y <- rnorm(m, mean = mu, sd = sigma)

# PART B

# Calculate sample means
X_bar <- mean(X)
Y_bar <- mean(Y)

# Compute estimators
T1 <- (n * X_bar + m * Y_bar) / (n + m)
T2 <- 0.5 * (X_bar + Y_bar)

# Print results
cat("X_bar:", X_bar, "\n")
cat("Y_bar:", Y_bar, "\n")
cat("T1:", T1, "\n")
cat("T2:", T2, "\n")

# PART C

# Required library for ggplot2
library(ggplot2)

# Set the number of bootstraps
b <- 100

# Initialize vectors to store bootstrap estimates
T1_boot <- numeric(b)
T2_boot <- numeric(b)

# Perform bootstrapping
for (i in 1:b) {
  # Sample with replacement
  X_boot <- sample(X, size = n, replace = TRUE)
  Y_boot <- sample(Y, size = m, replace = TRUE)

  # Calculate sample means
  X_bar_boot <- mean(X_boot)
  Y_bar_boot <- mean(Y_boot)

  # Compute estimators
  T1_boot[i] <- (n * X_bar_boot + m * Y_bar_boot) / (n + m)
  T2_boot[i] <- 0.5 * (X_bar_boot + Y_bar_boot)
}

# Create data frame for plotting
boot_estimates <- data.frame(T1 = T1_boot, T2 = T2_boot)

# Construct histograms
ggplot(boot_estimates, aes(x = T1)) +
  geom_histogram(color = "black", fill = "lightblue", bins = 30) +
  labs(title = "Histogram for T1",
       x = "T1 values",
       y = "Frequency")

ggplot(boot_estimates, aes(x = T2)) +
  geom_histogram(color = "black", fill = "lightblue", bins = 30) +
  labs(title = "Histogram for T2",
       x = "T2 values",
       y = "Frequency")

# PART D
# WRITTEN ON PAPER

# PART E

# Function to calculate ECDF-based confidence intervals
ecdf_conf_interval <- function(boot_values, alpha = 0.05) {
  lower_quantile <- quantile(boot_values, probs = alpha / 2)
  upper_quantile <- quantile(boot_values, probs = 1 - alpha / 2)
  return(c(lower_quantile, upper_quantile))
}

# Calculate 95% confidence intervals for T1 and T2
T1_conf_interval <- ecdf_conf_interval(T1_boot, alpha = 0.05)
T2_conf_interval <- ecdf_conf_interval(T2_boot, alpha = 0.05)

# Print results
cat("95% confidence interval for T1: (", T1_conf_interval[1],
    ",", T1_conf_interval[2], ")\n")
cat("95% confidence interval for T2: (", T2_conf_interval[1],
    ",", T2_conf_interval[2], ")\n")

# PART F
# ON-PAPER ANSWER

# QUESTION 3
# ON-PAPER ANSWER

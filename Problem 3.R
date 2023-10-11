galaxies <- read_csv("galaxy_data.txt")

ggplot(galaxies, aes(x=a_26)) +
  geom_histogram(binwidth=1, fill="lightblue", color="black") +
  theme_minimal() +
  labs(title="Distribution of Linear Diameter (a_26) of Galaxies", 
       x="Linear Diameter (kpc)", 
       y="Number of Galaxies")

# Looking at the histogram plot, we can see a clear decreasing trend of the
# the frequencies of galaxies as the galaxies gets bigger. This indicates that 
# smaller galaxies are the most common, and bigger ones are rarer.
# This trend is however broken with the first bar in the histogram, 
# which indicates the smallest galaxies in the dataset.
# If this trend is true, this could indicate that there are missing smaller 
# galaxies in the dataset. 
# Create a factor with the wrong order of levels
sizes <- factor(c("small", "large", "large", "large", "small", "medium"))
sizes
table(sizes)
str(sizes)

sizes <- factor(sizes, levels=rev(levels(sizes)))
sizes
table(sizes)
str(sizes)

# Source: http://www.cookbook-r.com/Manipulating_data/Changing_the_order_of_levels_of_a_factor/

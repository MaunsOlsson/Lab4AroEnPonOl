

theme_liu <- function(){
  theme(
    panel.background = element_rect(fill = "white"),
    plot.background = element_rect(fill = "#00b9e7"),
    axis.text = element_text(family = "sans",
                             colour = "white"),
    axis.title = element_text(family = "sans",
                             colour = "white",
                             face = "bold")
    )
  }

ggplot(airquality, aes(Wind, Temp, colour = factor(Month))) +
  geom_point()

ggplot(airquality, aes(Wind, Temp, colour = factor(Month))) +
  geom_point() + theme_liu()

ggplot(airquality, aes(Wind, Temp, colour = factor(Month))) +
  geom_point() +


ggplot(airquality, aes(Wind, Temp, colour = factor(Month))) +
  geom_point() +
  theme(
    # Change the background colour(s) and the border colour:
    panel.background = element_rect(fill = "pink",
                                    colour = "red",
                                    linewidth = 2),
    plot.background = element_rect(fill = "darkblue"),
    legend.background = element_rect(fill = "white"),
    # Change the colours of the grid lines:
    panel.grid.major = element_line(colour = "cyan"),
    panel.grid.minor = element_line(colour = "yellow2",
                                    linetype = "dotted",
                                    linewidth = 1),
    # Change fonts, font size, rotation, and colour of the text on the axis:
    axis.text = element_text(family = "Courier New",
                             colour = "magenta",
                             face = "bold",
                             angle = 45,
                             hjust = 1),
    axis.title = element_text(family = "Arial",
                              colour = "skyblue",
                              face = "italic",
                              size = 18)
  )

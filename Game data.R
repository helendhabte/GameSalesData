library(ggplot2)

games <- read.csv("game sales.csv")
head(games)

#Creating scatter plot
a <- ggplot(data=games, aes(x=Critic_Score, y=User_Score,
                       colour=Genre, size=Global_Sales)) +
  geom_point()

#Adding labels, titles, and formatting
a +
  xlab("Critic Score") +
  ylab("User Score") +
  ggtitle("User Score vs. Critic Score") +
  theme(axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12),
        plot.title = element_text(size = 15, hjust = 0.5),
        panel.background = element_rect(fill="lightblue",
                                        colour = "lightblue"),
        plot.background = element_rect(fill="gray80"),
        legend.background = element_rect(bg=))

#Creating histograms

ggplot(data=games, aes(x=Global_Sales)) + 
geom_histogram(aes(fill=Genre), colour = "Black") +
  xlab("Global Sales (Millions)") +
  ylab("Count") +
  ggtitle("Global Sales Distribution") +
  theme(axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12),
        plot.title = element_text(size = 15, hjust = 0.5))


ggplot(data=games, aes(x=User_Score)) + 
  geom_histogram(fill="LightBlue", colour="DarkBlue") +
    xlab("User Scores") +
    ylab("Count") +
           ggtitle("User Ratings") +
           theme(axis.title.x = element_text(size = 12),
                 axis.title.y = element_text(size = 12),
                  plot.title = element_text(hjust =0.5))

ggplot(data=games, aes(x=Critic_Score)) + 
  geom_histogram(fill="Coral2", colour="Coral3") +
    xlab("Critic Scores") +
    ylab("Count") +
    ggtitle("Critic Ratings") +
        theme(axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12),
        plot.title = element_text(hjust =0.5))           


##Facets
ggplot(data=games, aes(x=Global_Sales)) +
         geom_histogram(binwidth=0.6, aes(fill=Genre), 
                        colour="Black") +
  facet_grid(Genre~., scales="free") +
    xlab("Global Sales") +
    ylab("Count") +
    ggtitle("Global Sales Distribution") +
      theme(plot.title = element_text(hjust=0.5))

ggplot(data=games, aes(x=Critic_Score, y=User_Score,
                            colour=Genre)) +
  geom_point(size=3) + facet_grid(Genre~., scales="free") +
    xlab("Critic Score") + 
    ylab("User Score") +
    ggtitle("Ratings") +
      theme(plot.title = element_text(hjust = 0.5))

##ggplot(data=games, aes(x=Critic_Score, y=User_Score,
##                       colour=Genre)) +
##  geom_point(size=3) + facet_grid(Year~.)

#Creating boxplot
bp <- ggplot(data=games, aes(x=Genre, y=User_Score, colour=Genre)) +
  geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) 

bp + 
  ylab("User Score") +
  ggtitle("User Ratings by Genre") +
    theme(axis.title.x = element_text(size = 12),
          axis.title.y = element_text(size = 12),
          plot.title = element_text(size = 15, hjust=0.5))

#Barplot
ggplot(data=games, aes(x=Publisher, y=Global_Sales)) + geom_bar(stat="identity")

ggplot(data=games, aes(x=Year)) +
  geom_bar(stat="bin", fill="cyan4", colour="cyan3") +
    ylab("Count") +
    ggtitle("Count by Year Released") +
      theme(plot.title = element_text(hjust = 0.5),
            panel.background = element_rect(fill="lightblue",
                                            colour = "lightblue"))
    
ggplot(data=games, aes(x=factor(Genre))) +
  geom_bar(stat="count", fill="dodgerblue4", colour="dodgerblue3") +
  ylab("Count") +
  xlab("Genre") +
  ggtitle("Count by Year Released") +
  theme(plot.title = element_text(hjust = 0.5),
        panel.background = element_rect(fill="lightblue",
                                        colour = "lightblue"))







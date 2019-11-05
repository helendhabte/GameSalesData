library(ggplot2)

games <- read.csv("game sales.csv")
games = read.csv("game sales.csv", na.strings=c("","NA"))


head(games)

#Clean data
#Removing blank values

#Creating scatter plot
ggplot(data=games, aes(x=Critic_Score, y=User_Score,
                       colour=Genre, size=Global_Sales)) +
  geom_point() +
    xlab("Critic Score") +
    ylab("User Score") +
    ggtitle("User and Critic Ratings") +
        theme(axis.title.x = element_text(size = 12),
              axis.title.y = element_text(size = 12),
              plot.title = element_text(size = 15, hjust = 0.5),
              panel.background = element_rect(fill="lightblue",
                                              colour = "lightblue"),
              plot.background = element_rect(fill="gray83"),
              legend.background = element_blank())

#2
ggplot(data=subset(games, !is.na(ESRB_Rating)), aes(x=Year, 
                                                   y=Global_Sales, colour=ESRB_Rating)) +
  geom_point() +
    xlab("Year") +
    ylab("Sales") +
    ggtitle("Global Sales") +
          theme(axis.title.x = element_text(size = 12),
              axis.title.y = element_text(size = 12),
              plot.title = element_text(size = 15, hjust = 0.5),
              panel.background = element_rect(fill="lightblue",
                                                colour = "lightblue"),
              plot.background = element_rect(fill="gray83"),
              legend.background = element_blank())


#Creating histograms

ggplot(data=games, aes(x=User_Score)) + 
  geom_histogram(fill="cornflowerblue", colour="DarkBlue") +
    xlab("User Scores") +
    ylab("Count") +
    ggtitle("User Ratings") +
           theme(axis.title.x = element_text(size = 12),
                axis.title.y = element_text(size = 12),
                plot.title = element_text(hjust =0.5),
                panel.background = element_rect(fill="lightblue",
                                                   colour = "lightblue"),
                plot.background = element_rect(fill="gray83"))

ggplot(data=games, aes(x=Critic_Score)) + 
  geom_histogram(fill="Coral3", colour="Coral4") +
    xlab("Critic Scores") +
    ylab("Count") +
    ggtitle("Critic Ratings") +
        theme(axis.title.x = element_text(size = 12),
            axis.title.y = element_text(size = 12),
            plot.title = element_text(hjust =0.5),
            panel.background = element_rect(fill="lightblue",
                                            colour = "lightblue"),
            plot.background = element_rect(fill="gray83"))           

#Facets
ggplot(data=games, aes(x=Critic_Score, y=User_Score, colour=Genre)) +
  geom_point() +
    facet_grid(Genre~., scales="free") +
      xlab("Critic Scores") +
      ylab("User Rating") +
      ggtitle("Ratings") +
        theme(plot.title = element_text(hjust=0.5),
              panel.background = element_rect(fill="lightblue",
                                              colour = "lightblue"),
              plot.background = element_rect(fill="gray83"),
              legend.background = element_blank())

ggplot(data=games, aes(x=Global_Sales)) +
  geom_histogram(binwidth=0.1, aes(fill=Genre), colour="Black") +
    facet_grid(Genre~., scales="free") +
      xlab("Sales") +
      ylab("Count") +
      ggtitle("Global Sales Distribution") +
      theme(plot.title = element_text(hjust=0.5),
            panel.background = element_rect(fill="lightblue",
                                            colour = "lightblue"),
            plot.background = element_rect(fill="gray83"),
            legend.background = element_blank())

#Creating boxplot
ggplot(data=games, aes(x=Genre, y=Critic_Score, colour=Genre)) +
  geom_jitter() + 
  geom_boxplot(size=1.2, alpha=0.5) +
    ylab("Critic Scores") +
    ggtitle("Critic Ratings by Genre") +
      theme(axis.title.x = element_text(size = 12),
            axis.title.y = element_text(size = 12),
            plot.title = element_text(size = 15, hjust=0.5),
            panel.background = element_rect(fill="lightblue",
                                            colour = "lightblue"),
            plot.background = element_rect(fill="gray83"),
            legend.background = element_blank())


    










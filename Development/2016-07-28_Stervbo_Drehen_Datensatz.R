
library(tidyr) 
library(dplyr) 

test_df <- data_frame(channel = LETTERS[1:5], unit = letters[1:5], custID = 
                        c(1:5), dummy = 1) 
test_df

test_df %>% spread(channel, dummy) %>% mutate(dummy = 1) %>% spread(unit, 
                                                                    dummy) 


channel_wide <- test_df  %>% select(channel, custID) %>% spread(channel, 
                                                               custID) 
unit_wide <- test_df  %>% select(unit, custID) %>% spread(unit, custID) 
bind_cols(channel_wide, unit_wide) 

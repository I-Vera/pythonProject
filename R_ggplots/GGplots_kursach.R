#Plot 1 - correlation plot between scales of VOSI by exp.group
# Load data

att_data <- read_csv("ATT_final3.0.csv")
att_vosi <- subset(att_data, select = c(ID_participant, cog_load, gender, age, vosi_object, vosi_spatial))
att_vosi <- distinct(att_vosi, select = ID_participant, .keep_all = TRUE)

# att_vosi$vosi_object & att_vosi$vosi_spatial - normal distribution (through shapiro.test)
shapiro.test(att_vosi$vosi_object)
shapiro.test(att_vosi$vosi_spatial)
cor.test(att_vosi$vosi_object, att_vosi$vosi_spatial)
plot1 <- ggplot(data = att_vosi,
                mapping = aes(vosi_object, vosi_spatial))+
  geom_point(size = 2)+
  geom_smooth(method = "lm", colour = 'green', alpha = 0.5)+
  facet_wrap(~cog_load)
plot1

#Plot 2 - line plot with error bands for RT by resolution for 2 groups

NCLHigh <- ifelse(att_data$cog_load == 0, att_data$att_resp.rt.high, 0)
NCLMed <- ifelse(att_data$cog_load == 0, att_data$att_resp.rt.medium, 0)
NCLLow <- ifelse(att_data$cog_load == 0, att_data$att_resp.rt.low, 0)
CLHigh <- ifelse(att_data$cog_load == 1, att_data$att_resp.rt.high, 0)
CLMed <- ifelse(att_data$cog_load == 1, att_data$att_resp.rt.medium, 0)
CLLow <- ifelse(att_data$cog_load == 1, att_data$att_resp.rt.low, 0)

attRT_df <- data.frame(
  resolution = c('High','Medium','Low','High','Medium','Low'),
  exp.group = c('NCL','NCL','NCL','CL','CL','CL'),
  mean_RT = c(mean(NCLHigh),mean(NCLMed), mean(NCLLow), mean(CLHigh),mean(CLMed),mean(CLLow)))

plot2 <-ggplot(attRT_df,aes(resolution, mean_RT, colour = exp.group))+
  geom_point(size = 3)+
  geom_line()
plot2

# ДРУГОЙ ВАРИАНТ ;____; Посмотреть на дисперсию
#restructure data
att_long <- att_data %>% gather (res, RT, c(att_resp.rt.high, att_resp.rt.medium, att_resp.rt.low))
att_long$res[att_long$res == 'att_resp.rt.high'] <- 3
att_long$res[att_long$res == 'att_resp.rt.medium'] <- 2
att_long$res[att_long$res == 'att_resp.rt.low'] <- 1

plot3 <-ggplot(att_long,aes(res, RT))+
  geom_boxplot(varwidth = T, fill = 'green')
plot3


install.packages("tidyverse")
install.packages("haven")
install.packages("psych")

#讀取sav檔案(民調主要檔案類型)
library(sjlabelled)
sun2021 <- read_data("/Users/ron/Desktop/test/sun.sav") 

#資料檢核
load("../sun2021.rda")  
nrow(sun2021)   # 看看有多少觀察值（多少列）--333列
names(sun2021)  # 看看有那些變數，以及這些變數的名稱--117個

# 製作各題目次數分配表＿以性別為例
table(sun2021$gender)
sun2021$gender<- factor(sun2021$gender, labels = c("male", "femaie"))
gender <- table(sun2021$gender)

# 繪圖＿以性別為例
prop.table(gender)
round(prop.table(gender), 3)
# 圓餅圖
barplot(gender)
# 長條圖
pie(gender)


# 交叉分析＿以年齡層與電話類別為例
sun2021$age<- factor(sun2021$age, labels = c("20-24","25-29","30-34","35-39","40-44","45-49","50-54","55-59","60-64","65-69","70up","refuse"))
sun2021$TEL<- factor(sun2021$TEL, labels = c("home","cellphone","company"))
library(ggplot2)
# 製作點狀圖
ggplot(data = sun2021, aes(x =age, y = TEL)) + geom_jitter() 
# 製作長條圖＿以別為例
ggplot(data = sun2021, aes(x = age, fill = TEL)) + geom_bar(position = "dodge")
# 可以發現60歲以上族群手機使用者較少，以住家電話為主












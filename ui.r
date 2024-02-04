# library(shiny)
# library(plotly)

# # 定义用户界面
# ui <- fluidPage(
#   includeHTML("Front.html"),
#     titlePanel("折线图示例"),
#     mainPanel(
#         plotOutput("lineChart") # 用于展示折线图的输出
#     )
# )

# library(shiny)
# library(plotly)

# # 定义用户界面
# ui <- fluidPage(
#     includeHTML("Front.html"),
#     titlePanel("气泡图示例"),
#     mainPanel(
#         plotlyOutput("bubbleChart") # 用于展示气泡图的输出
#     )
# )

#setwd(r"(C:\Users\songqiu\Desktop\myapp)")


library(shiny)
library(ggplot2)

# 定义用户界面
ui <- fluidPage(
    includeHTML("Front.html"),
    # theme = shinytheme("flatly"),  # 使用Flatly主题，这是一个具有橙色调的主题
    titlePanel(""),
    mainPanel(
        plotOutput("lineChart"),
        plotOutput("heatmap")
    )
)

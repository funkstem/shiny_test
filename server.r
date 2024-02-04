# library(shiny)
# library(plotly)

# # 定义服务器逻辑
# server <- function(input, output) {
#     output$bubbleChart <- renderPlotly({
#         # 生成一些示例数据
#         set.seed(123)
#         data <- data.frame(
#             x = rnorm(100),
#             y = rnorm(100),
#             size = runif(100, 1, 100),
#             color = runif(100)
#         )
        
#         # 创建气泡图
#         plot_ly(data, x = ~x, y = ~y, size = ~size, color = ~color, 
#                 marker = list(sizemode = 'diameter', sizemin = 5, opacity = 0.5),hoverinfo = 'none') %>%
#             add_markers() %>%
#             layout(title = "气泡图", xaxis = list(title = "X轴"), yaxis = list(title = "Y轴"))
#     })
# }


library(shiny)
library(ggplot2)

# 定义服务器逻辑
server <- function(input, output) {

      output$lineChart <- renderPlot({
    # 创建一个包含多个系列的数据框
    data <- data.frame(
      x = rep(1:20, 3),
      y = c(rnorm(20, mean = 0), rnorm(20, mean = 3), rnorm(20, mean = -2)),
      group = rep(c("A", "B", "C"), each = 20)
    )
    
    # 绘制多条线的折线图
    ggplot(data, aes(x, y, colour = group)) +
      geom_line() +
      scale_colour_manual(values = c("grey", "dimgrey", "black")) +  # 手动指定颜色
      theme_minimal(base_family = "Helvetica") +
      labs(title = "Line chart", x = "X", y = "Y")
  })


    output$heatmap <- renderPlot({
        # 生成一些示例数据
        matrix_data <- matrix(rnorm(100), 10)
        data <- as.data.frame(as.table(matrix_data))

        # 创建热力图
        ggplot(data, aes(.data$Var1, .data$Var2, fill = .data$Freq)) +
            geom_tile() +
            scale_fill_gradient(low = "gainsboro", high = "darkgray") +  # 使用橙色渐变
            theme_minimal() +
            labs(title = "热力图", x = "X轴", y = "Y轴")
    })
}
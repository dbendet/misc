require(rCharts)
require(rjson)

x = read.csv('sankey.csv', header=FALSE)

colnames(x) <- c("source", "target", "value")

sankeyPlot <- rCharts$new()

sankeyPlot$set(
  data = x,
  nodeWidth = 15,
  nodePadding = 10,
  layout = 32,
  width = 500,
  height = 300,
  units = "TWh",
  title = "Sankey Diagram"
)

sankeyPlot$setLib('http://timelyportfolio.github.io/rCharts_d3_sankey')

sankeyPlot




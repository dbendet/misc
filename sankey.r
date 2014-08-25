library(rCharts)
library(rjson)

df = read.csv('sankey.csv', header=FALSE)

colnames(df) <- c("source", "target", "value")

sankeyPlot <- rCharts$new()

sankeyPlot$set(
 data = df,
 nodeWidth = 15,
 nodePadding = 10,
 layout = 32,
 width = 500,
 height = 300,
 units = "TWh",
 title = "Sankey Diagram"
)

sankeyPlot$setLib('http://timelyportfolio.github.io/rCharts_d3_sankey')

sankeyPlot$setTemplate(
  afterScript = "
    <script>
    //  var cscale = d3.scale.category10();
        var cscale = d3.scale.ordinal().range(['#27ae60', '#2980b9', '#e67e22', '#f1c40f', '#e74c3c']);

      d3.selectAll('#{{ chartId }} svg path.link')
        .style('stroke', function(d){
          return cscale(d.source.name);
        })

       // .style('stroke-opacity', .7)

      d3.selectAll('#{{ chartId }} svg .node rect')
        .style('fill', function(d){
          return cscale(d.name)
        })
        .style('stroke', 'none')
    </script>
")

sankeyPlot



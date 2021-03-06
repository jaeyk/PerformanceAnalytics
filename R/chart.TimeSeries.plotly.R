#' @rdname chart.TimeSeries
#' 

chart.TimeSeries.plotly <-
  function(R,
           main,
           ...){
    
    R = checkData(R, method="xts")
    columns = ncol(R)
    rows = nrow(R)
    columnnames = colnames(R)
    
    date = index(R)
    
    R = checkData(R, method="data.frame")
    
    plot <- plotly::layout(plotly::plot_ly(R, mode = 'lines'), title=main)
    
    
    for(i in 1:columns){
      plot <- plotly::add_trace(plot,
                        y = R[[i]],
                        x = date,
                        mode = 'lines',
                        name=columnnames[i])
    }
    
    return(plot)
  }
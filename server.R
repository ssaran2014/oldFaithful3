require(stats); require(graphics);

f.tit <-  "faithful data: Eruptions of Old Faithful"

ne60 <- round(e60 <- 60 * faithful$eruptions)
all.equal(e60, ne60)             # relative diff. ~ 1/10000
table(zapsmall(abs(e60 - ne60))) # 0, 0.02 or 0.04
faithful$better.eruptions <- ne60 / 60
te <- table(ne60)
te[te >= 4]                      # (too) many multiples of 5 !


shinyServer(
  function(input, output) {
    output$myHist <- renderPlot({
      plot(names(te), te, type = "h", main = f.tit, xlab = "Eruption time (sec)")
      
      plot(faithful[, -3], main = f.tit,
           xlab = "Eruption time (min)",
           ylab = "Waiting time to next eruption (min)")
      #lines(lowess(faithful$eruptions, faithful$waiting, f = 2/3, iter = 3),
      #      col = "red")
      fit <- lm(waiting ~ eruptions, faithful)
      abline(fit, col="red")
      
      value <- input$choice
      
      wait <- function(value){
        fit$coeff[1] + value * fit$coeff[2]
        }
      
      output$answer <- renderText(paste("The expected waiting time is", round({wait(value)}, 0), " minutes."))
                 
    })
    
  }
)
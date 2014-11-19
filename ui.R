shinyUI(pageWithSidebar(
  headerPanel("Predicting Eruption Time of Old Faithful"),
  sidebarPanel(
    h3('Input Last Eruption Time'),
    sliderInput("choice", 'Last eruption duration time (min)', value = 3.0, min=1.5, max=5.5, step=0.25,)
    
  ),
  mainPanel(
    ("Old Faithful is a geyser in Yellowstone Park in the U.S. See http://en.wikipedia.org/wiki/Old_Faithful. "),
    ("It erupts periodically. Scientists have observed 272 such eruptions and recorded the eruption time"),
    ("and the wait time between eruptions. The chart below shows that relationship."),
    ("We have done a regression of the wait times to the eruption time. If you enter the eruption time"),
    ("on the left slide bar, the predicted wait time for the next eruption is indicated below"),
    h3('Plot of Eruptions of Old Faithful'),
    plotOutput('myHist'),
    textOutput("answer")
    )
))
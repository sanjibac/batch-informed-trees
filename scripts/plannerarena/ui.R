library(shiny)

shinyUI(
    navbarPage("Planner Arena",
        tabPanel("Overall performance",
            uiOutput("performancePage"),
            value="performance",
            icon=icon("bar-chart")),
        tabPanel("Progress",
            uiOutput("progressPage"),
            value="progress",
            icon=icon("area-chart")),
        tabPanel("Regression",
            uiOutput("regressionPage"),
            value="regression",
            icon=icon("bar-chart")),
        tabPanel("Database info",
            uiOutput('dbinfoPage'),
            value="dbinfo",
            icon=icon("info-circle")),
        tabPanel("Change database",
            div(class="span10 offset1",
                fileInput("database",
                    label = h2("Upload benchmark database"),
                    accept = c("application/x-sqlite3", ".db")
                ),
                h2("Default benchmark database"),
                tags$ul(
                    tags$li(a(href="javascript:history.go(0)", "Reset to default database")),
                    tags$li(a(href="benchmark.db", "Download default database"))
                )
            ),
            value="database",
            icon=icon("database")),
        tabPanel("Help",
            div(class="span10 offset1",
                includeMarkdown("www/help.md")
            ),
            value="help",
            icon=icon("question-circle")),
        id = "navbar",
        header = tags$link(rel="stylesheet", type="text/css", href="plannerarena.css"),
        footer = div(class="footer",
            div(class="container",
                p(
                    a(href="http://www.kavrakilab.org", "Physical and Biological Computing Group"),
                    "•",
                    a(href="http://www.cs.rice.edu", "Department of Computer Science"),
                    "•",
                    a(href="http://www.rice.edu", "Rice University")
                )
            ),
            includeScript('www/ga.js')
        ),
        inverse = TRUE
    )
)


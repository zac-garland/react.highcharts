#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
reactHC <- function(options = NULL, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    options = options
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'reactHC',
    x,
    width = width,
    height = height,
    package = 'react.highcharts',
    elementId = elementId
  )
}

#' Shiny bindings for reactHC
#'
#' Output and render functions for using reactHC within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a reactHC
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name reactHC-shiny
#'
#' @export
reactHCOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'reactHC', width, height, package = 'react.highcharts')
}

#' @rdname reactHC-shiny
#' @export
renderReactHC <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, reactHCOutput, env, quoted = TRUE)
}

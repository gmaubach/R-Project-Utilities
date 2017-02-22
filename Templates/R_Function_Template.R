#----------------------------------------------------------------
#' @title
#'
#' @description
#' \code{function_name} describe what the function does
#'
#' @usage
#'   describe how the function should be called
#'
#' @param param_name (type of the parameter)
#'   Describe what the parameter does,
#'   start with capital letter and end with fullstop,
#'   all parameters must be documented.
#'
#' @details
#'   provide important information of how the function
#'   operates
#'   @section Section title is only on line long:
#'   Put the paragraph of the details in this section.
#'   The section title must be followed by a ":" (colon).
#'   @section Operation
#'   Describe operation.
#'   @section Error Handling
#'   Describe error handling
#'   @section Side Effects
#'   Describe any side effects.
#'   @section Warning
#'   When calling this function make sure that ...
#'   @section Annotations
#'
#' @return describes the output of a function
#'
#' @examples path/relative/to/package/root
#'
#' @include filename.R to be loaded before this function
#'
#' @family  add appropriate lists/interlinks to seealso
#' @seealso point to other useful resources
#' @aliases add additional aliases through which the user
#'   can find the documentation with "?"
#' @concept add extra keywords that will be found with
#'   help.search()
#' @keywords keyword1 keyword2 ...
#'   to add standardised optional keywords which must be
#'   taken from the predefined list replicated in the
#'   keywords vignette
#'
#' @author Georg Maubach
#'
#' @source give credits to those you provided code
#'
#' @export
#----------------------------------------------------------------
my_function <- function(argument_1 = "some_value",
                        argument_2 = "another_value"
                        ) {

  function_name <- "function_name_here"
  cat(paste(function_name, " ...\n"))  # indicate start
  #--------------------------------------------------------------

  # Function body

  #--------------------------------------------------------------
  cat(paste("...", function_name, "\n"))  # indicate end

  invisible(result) | return(result)
}
#----------------------------------------------------------------

# EOF .



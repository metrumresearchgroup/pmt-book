library(dplyr)
library(pmtables)
library(purrr)
library(yspec)
library(tidyr)
options(pmtables.textwidth = 6)

local({
  hook_old <- knitr::knit_hooks$get("source")  # save the old hook
  knitr::knit_hooks$set(source = function(x, options) {
    if(!isTRUE(options$nosanitize)) {
      x <- sub("%>%\\s*\n\\s*st\\_as\\_image\\(\\)", "", x)
      x <- sub("%>% st_as_image()", "", x, fixed = TRUE)
    }
    hook_old(x, options)
  })
})

# knitr::knit_engines$set(asimage = function(options) {
#   x <- st2png(eval(parse(text = options$code)), dir = "build", 
#               stem = basename(tempfile()))
#   ans <- vector(mode = "list", length = 2)
#   ans[[1]] <- structure(list(src = options$code), class = "source")
#   ans[[2]] <- knitr::include_graphics(x)
#   options$engine <- 'r'
#   options$out.width = "100%"
#   knitr::engine_output(options, out = ans)
# })
# 
# knitr::knit_hooks$set(img = function(before, options, envir) {
#   if(before) {
#     options$code <- paste0("st_as_image(", options$code, ")")
#   }
#   if (!before) {
#     # ## after a chunk has been evaluated
#     # if (rgl.cur() == 0) return()  # no active device
#     # name = paste0(options$fig.path, options$label, '.png')
#     # rgl.snapshot(name, fmt = 'png')
#     # return(paste0('![rgl plot](', name, ')\n'))
#   }
#   return
# })

find . -name '*.[R|Rmd]' -type f -print0 | xargs -0 cat | wc -l


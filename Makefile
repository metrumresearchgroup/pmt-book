METRUMIO=~/git/metrumresearchgroup/metrumresearchgroup.github.io/pmt-book

book: 
	Rscript -e 'rmarkdown::render("pmt-intro.Rmd")'

spelling:
	Rscript -e 'spelling::spell_check_files(list.files("source", full.names = TRUE, pattern = "Rmd"), ignore = readLines("source/WORDLIST"))'
 
move: 
	cp -r book/docs/* docs/



METRUMIO=~/git/metrumresearchgroup/metrumresearchgroup.github.io/pmt-book

book: 
	Rscript -e 'rmarkdown::render("pmt-intro.Rmd")'

spelling:
	Rscript -e 'spelling::spell_check_files(list.files(".", full.names = TRUE, pattern = "qmd"), ignore = readLines("source/WORDLIST"))'
 
publish:
	quarto render 
	

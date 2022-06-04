METRUMIO=~/git/metrumresearchgroup/metrumresearchgroup.github.io/pmt-book

book: 
	Rscript -e 'rmarkdown::render("pmt-intro.Rmd")'

spelling:
	Rscript -e 'spelling::spell_check_files(list.files("book", full.names = TRUE, pattern = "qmd"), ignore = readLines("source/WORDLIST"))'
 
move: 
	cp -r book/docs/* docs/

publish:
	quarto render book
	make move
	

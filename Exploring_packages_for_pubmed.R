library(devtools)
install_github("ropensci/rentrez")

library(rentrez)
brc1_papers <- entrez_search(db="pubmed", term="brc1")
brc1_papers
str(brc1_papers)

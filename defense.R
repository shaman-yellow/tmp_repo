# ==========================================================================
# draw figures or create tables
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# ==========================================================================
# metaAnalysis of literature
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

dir.create("defense")
eg <- RCurl::getURL("https://www.bibliometrix.org/datasets/management1.txt")
writeLines(eg, "defense/eg.txt")

# ==========================================================================
# tcm and lcms
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

file <- list.files("./defense/", "^tcm_lcms.*txt", full.names = T)
db <- bibliometrix::convert2df(file, "wos", "plaintext")
res <- bibliometrix::biblioAnalysis(db, sep = ";")

## keywords
net <- bibnetwork(db, "defense/keywords_coOccur.pdf")

# ==========================================================================
# tcm and composition
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

file <- list.files("./defense/", "^tcm_comp.*\\.txt", full.names = T)
db <- bibliometrix::convert2df(file, "wos", "plaintext")
res <- bibliometrix::biblioAnalysis(db, sep = ";")

## keywords
net <- bibnetwork(db, "defense/comp_keywords_coOccur.pdf")



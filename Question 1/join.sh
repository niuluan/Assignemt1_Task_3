#!/bin/bash

# make expression table and annotation table's gene in the same order
head -1 expression1.tab > expression2.tab
tail -n +2 expression1.tab | sort -t$'\t' -k 1 >> expression2.tab
head -1 annotation1.tab > annotation2.tab
tail -n +2 annotation1.tab | sort -t$'\t' -k 1 >> annotation2.tab
# like MySQL inner join from expression e table and annotation a table on gene=gene
join -t$'\t' -o 1.1,2.2,1.2,2.3 --header expression2.tab annotation2.tab
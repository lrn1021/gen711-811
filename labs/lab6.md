---
title: "Lab 6"
author: "Jeffrey Miller"
date: "2026 Feb 27"
output: pdf_document
---


### Today
1. Review, fastqc
2. Redirection and pipes

:::::::::::::::::::::::::::::::::::::::: review
'which for base and conda env'
::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: keypoints
Employ the grep command to search for information within files.
Print the results of a command to a file.
Construct command pipelines with two or more stages.
Use for loops to run the same command for several input files.
::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions for practical
How can I search within files?
How can I combine existing commands to do new things?
::::::::::::::::::::::::::::::::::::::::::::::::::


:::::::::::::::::::::::::::::::::::::::: Nucleotide abbreviations
The four nucleotides that appear in DNA are abbreviated A, C, T and G. Unknown nucleotides are represented with the letter N. An N appearing in a sequencing file represents a position where the sequencing machine was not able to confidently determine the nucleotide in that position. You can think of an N as being aNy nucleotide at that position in the DNA sequence.
::::::::::::::::::::::::::::::::::::::::::::::::::

## Exercise 1

1. Search for the sequence `GNATNACCACTTCC` in the `SRR098026.fastq` file.
  Have your search return all matching lines and the name (or identifier) for each sequence
  that contains a match.

2. Search for the sequence `AAGTT` in both FASTQ files.
  Have your search return all matching lines and the name (or identifier) for each sequence
  that contains a match.

3. How do the search results differ when matching in one file vs. both files? If you wanted to keep the original FASTQ format, how would you get around this?

## Exercise 2

How many sequences are there in `SRR098026.fastq`? Remember that every sequence is formed by four lines.

## Exercise 3

How many sequences in `SRR098026.fastq` contain at least 3 consecutive Ns?

:::::::::::::::::::::::::::::::::::::::: keypoints

- `grep` is a powerful search tool with many options for customization.
- `>`, `>>`, and `|` are different ways of redirecting output.
- `command > file` redirects a command's output to a file.
- `command >> file` redirects a command's output to a file without overwriting the existing contents of the file.
- `command_1 | command_2` redirects the output of the first command as input to the second command.
- `for` loops are used for iteration.
- `basename` gets rid of repetitive parts of names.

::::::::::::::::::::::::::::::::::::::::::::::::::
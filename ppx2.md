
## Gen711/811 Practical Exam 2023 (40 scaled points)

## NAME: LW

Instructions:  
- Make sure to paste all the commands that you use below each of the tasks.  
- Some tasks require you to copy your output here. All output that you paste is less than 10 lines.   
- Do not spend too much time on a single prompt. It's important to get to all prompts.    
- If you get stuck and do not know how to proceed: specifically ask for the answer.  
- Help will get you to the next step, but you will lose points for that prompt.  
- Questions on clarification of the question does not result in the loss of points.  
- Replace MYNAME with your first and last name.   
- Download the practical into your gen711/811 folder as indicated at the begining of class. 
- Keep the '.md' extension until you turn it in. 
- Right before you upload it, save it as a '.txt' document MYNAME_practical.txt. 
- Save the document to your lab folder so that you know where it is when you need to upload it.
- Document must be uploaded before 5pm to get credit. 

Hints: 
- Remember, if you want to re-run a command, but change it slightly to try to fix it, hit the up arrow and edit the last command that you ran. 
- When typing out commands, filenames, or paths, hit the tab button a couple time to see if it autocompletes for you

### 1. Paste the command(s) below that you used get practical exam pasted into vscode. (2 point): 

ctrl + a then ctrl + v then ctrl + c 

### 2. From your home directory, make a new directory to hold fastq files called 'analysis' (2 points)

to get to home directory: cd ~ (takes right to home dir.) mkdir (makes a new dir.) 

to create a new directory: mkdir (whatever you want to call it)

to get into the analysis file: cd analysis

### 3. Copy the fastq files /tmp/gen711_2023/Sample1.fastq and /tmp/gen711_2023/Sample2.fastq directly into the 'analysis' directory without changing your current directory. (2 points, partial credit if you need to change directories first) For todays practice practical, use SRR fastqs instead. 

cp (command for copy)
maybe cp+ copy length, link or whatever it is

### 4. Use an absolute path to change your current working directory to the 'analysis' folder/directory. (2 points, partial credit for using a relative path)

cd (use for absolute path) cd /home/user/lrn1021/gen711-811/analysis. 

### 5. The fastq file you just copied is data from the UNH genome center. This is the first time you've ever seen these FASTQs. To confirm that the format of the FASTQs look ok, view one of the two files and paste the top 4 lines of the file below. (4 points) 

back out: cd ../

instead of fastq we did SSR:
cd gen711-811/
ls
cd shell_data/
ls
 cd untrimmed_fastq 
 ls 
 --> blue: dir, red: zip, white: files
head SRR097977.fastq (shows the first few lines in the fastq file)

### 6. You've decided that you want to make a seperate file of the reads to BLAST them at NCBI to make sure they belong to the species that you seqiuenced. However, your blast program is written to accept FASTA files rather than FASTQ files (FASTA files only contain the header line above the read, and the read itself). You will need to make a 'FASTA' file from each FASTQ file. Before you make the new files, pipe the output to a command that that allows you to see just the first lines of the output. (5 points)  

grep -A1 (-A1 is the matching line to the specific search "^@SSR.1 ", its the line and the line after it, search for the SSR.1 in that file. the @ means it will be at the start of the line. the | is the result of the -A1 thing, shows the however first few lines after you use grep). --no-group-separator <--- prevents grep from inserting spacers | (pipe) head = shows the first 10 lines. 

to the answer should be: grep -A1 --no-group-separator "^@SRR######.1 " SRR######.fastq | head 

grep -A1 --no-group-separator "^@SRR097977.1 " SRR097977.fastq | head  or
grep -A1 --no-group-separator "^@SRR098027.1 " SRR097977.fastq | head  

removing the .1 " spits out more info 

then it gave: @SRR097977.1 209DTAAXX_Lenski2_1_7:8:3:710:178 length=36
TATTCTGCCATAATGAAATTCGCCACTTGTTAGTGT

### 7. Redirect the output of your command (command in 6 that is converting the format of the FASTQ into FASTA) into new files. Give the new file the same names, but uses the '.fasta' extension rather than the '.fastq' extension of the original file name. (5 points)

head -n 4 SRR097977.fastq 

awk 'NR%4==1{print ">"substr($0,2)} NR%4==2{print}' sample.fastq > sample.fasta. 
if multiple fastq files use this instead/too: 
for file in *.fastq; do
    awk 'NR%4==1{print ">"substr($0,2)} NR%4==2{print}' "$file" > "${file%.fastq}.fasta"
done

### 8. How many reads have 15 or more uncalled bases (NNNNNNNNNNNNNNN) in both samples? Count the number of reads in both WITHOUT making a new file. (4 points)

without making a new file, grep -c "N\{15,\}" sample.fastqc

grep -c "N\{15,\}" sample1.fastq sample2.fastq
```

**How it works:**

- `grep -c` — counts matching lines instead of printing them
- `"N\{15,\}"` — regex meaning "N repeated 15 or more times"
- Running it on both files in one command prints a count for each file — **no new file created**

**Example output:**
```
sample1.fastq:42
sample2.fastq:37

wc -l SRR097977.fastq
grep -c "^@"SRR097977.fastq

### 9. Make a new directory called 'to_blast' in your current directory. Then, move the two fasta files into this new 'to_blast' directory (4 points)

mkdir to_blast
mv *.fasta to_blast/ 

mkdir to_blast --> creates a new directory called to_blast in your current directory
mv *.fasta to_blast/ --> moves all .fasta files into it at once using the * wildcard

ls to_blast/

Which should show your two .fasta files inside the directory.

to move the FASTA Files: mv Sample1.fasta Sample2.fasta to_blast/

or using a wildcard: mv *.fasta to_blast/

### 10. Without changing directories, what command could you use to confirm that the files made it into the 'to_blast' folder. (2 points)

ls to_blast/ (without using cd to get home)


### 11. What is the 100th line in the Sample1.fasta file? (hint: the 'head' command is one way to do this- but you may need to specify an option) (2 points)

head -n 100 to_blast/Sample1.fasta | tail -n 1

head -n 100 — grabs the first 100 lines
| tail -n 1 — pipes that output and grabs only the last line (i.e. line 100)

cd to_blast/
ls
should result in" sample.fasta

### 12. Run md5sum on Sample1.fasta (md5sum Sample1.fasta). Then, run it again, but redirect the output to a new file called 'my_md5sums.txt'.  (2 points)

First run: md5sum to_blast/Sample1.fasta

Second run: redirect output to a new file: md5sum to_blast/Sample1.fasta > my_md5sums.txt

md5sum — generates a checksum hash to verify file integrity
redirects the output to a new file called my_md5sums.txt instead of printing to screen

bash this: cat my_md5sums.txt

Which should show something like: d41d8cd98f00b204e9800998ecf8427e  to_blast/Sample1.fasta

# 13: run the md5sum command on Sample2.fasta and add it the the end of 'my_md5sums.txt'. (2 points)

md5sum to_blast/Sample2.fasta >> my_md5sums.txt

The key difference here is >> instead of >:

 > overwrites the file (would erase Sample1's checksum)
 >> appends to the end of the file (keeps Sample1's checksum and adds Sample2's)

 to verify: 
 cat my_md5sums.txt or try md5sum Sample2.fasta >> my_md5sums.txt

 md5sum --> used to verifying or computing a file or stream

Which should show both entries:

d41d8cd98f00b204e9800998ecf8427e  to_blast/Sample1.fasta
7c4a8d09ca3762af61e59520943dc26  to_blast/Sample2.fasta

or try: md5sum Sample.fasta > my_md5sum.txt

# 14: Lastly, add your name to the end of 'my_md5sums.txt' file. (2 points)

use echo! 

echo "Your Name" >> my_md5sums.txt
so, echo "Lilly Walsh" >> my_md5sums.txt

or you can use without echo, this is a bit more precise:
printf "\nYour Name\n" >> my_md5sums.txt
so, printf "\nLilly Walsh\n" >> my_md5sums.txt


### Extra credit: Run fastqc on one of the fastq files, and one of the fasta files. Did they both run? Why or why not?  (2 points)

fastqc Sample1.fastq
fastqc to_blast/Sample1.fasta

`Sample1.fastq` — **runs successfully**. FastQC is designed for FASTQ files and can read the quality scores.

fastqc Sample1.fastq
fastqc to_blast/Sample1.fasta


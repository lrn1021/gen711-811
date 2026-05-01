 for filename in *.fastq
 do
 echo -e "name=$(basename ${filename} .fastq)"
 echo -e "mv ${filename}  ${name}_2026.txt"
 done
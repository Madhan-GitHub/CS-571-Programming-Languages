Group Members:
1)
Name: Akhil Bommini
Binghamton ID: B00820119
Email Address: abommin1@binghamton.edu

2)
Name: Madhan Thangavel
Binghamton ID: B00814916
Email Address: mthanga1@binghamton.edu

Whether your code was tested on bingsuns or remote.cs?
Yes, the code has been tested on remote.cs and runs correctly.

The tar file contains below mentioned files
a) calc.l - This flex file contains the token information provided during the input.
b) calc.y - This bison file contains the logic to parse information based on the defined grammer.
c) Makefile - This file contains the compilation, execution and linking code of calc.l and calc.y files.
d) README - This text file contains the details of group members and steps to execute the program.

Steps to execute the program:
1) Untar the p1-abommin1andmthanga1.tar file in a folder.
2) The tar file contains below mentioned files
	a) calc.l - This flex file contains the token information provided during the input.
	b) calc.y - This bison file contains the logic to parse information based on the defined grammer.
	c) Makefile - This file contains the compilation, execution and linking code of calc.l and calc.y files.
	d) README - This text file contains the details of group members and code execution.
3) Within the same folder, type "make" on the command prompt and press enter.
4) The above mentioned command will compile the calc.l & calc.y files and will redirect the output to a executable file named calc. 
   An input text file can be used to pass the input required for the execution of the program.

Below is the code snippet of the Makefile.
all: compile_flex compile_bison link_flex_bison

Code to- 
Compile flex file	:flex -l calc.l
Compile bison file	:bison -dv calc.y
Link the files		:gcc -o calc calc.tab.c lex.yy.c -lfl
Above mentioned steps will be performed by the makefile. Just go to the source code folder and execute the make command.
  
Steps to execute the output:

Type below mentioned code from the source code folder
./calc < input - Here input file will contains the input required for the execution of executable file.
OR 
./calc  - With this process, input needs to be typed on the command prompt.

Note: If any warnings popup during compilation just ignore and execute the output.

Control+D is used to exit the program.

 

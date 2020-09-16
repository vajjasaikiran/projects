There are in total 93 files(45*2 = 90 input, q1 file, q2 file, readme.tx-------3 matches abondoned commentary and scorecard files are not downloaded)
1.For 194161016_q1.py run the program using python filename.py
2.It creates 194161016-matchid-scorecard-computed.txt files by reading the data from commentary files.
3.For 194161016_q2.py run the program using python filename.py
4.It compares 2 files 194161016-matchid-scorecard-computed.txt, 194161016-matchid-scorecard-published.txt
5.It prints the mismatches found and the total no. of mismatches found onto a new file 194161016-differences.py(which has the mismatches of the matches)
Note: I have hardcoded matchId's of 10 matches by passing them from a list for which the program runs fine.(As I have formatted those 10 files by doing some preprocessing)
Running all the match files by including matchId's in the list at the top of 194161016_q1.py program will throw exceptions as the program cannot handle unformatted files.(I have not done preprocessing for the rest of the files.Just included them in the directory)

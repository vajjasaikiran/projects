My folder has 5 files in total
194161016_q1.py
194161016_q1.txt
194161016_q2c.py
194161016_q2d.py
194161016_q2.txt

For q1 just run the program using python 194161016_q1.py
    - It will take input from 194161016_q1.txt file
    - Prints output into a 194161016_q1_output.txt(which is created during runtime)
    - also creates a courseDict1.txt which has the dictionary of list of all courses
input for this question is as follows
Department name
batchname
monday-10 slots(from 8am to 6pm)
tuesday-10 slots(from 8am to 6pm)
wednesday-10 slots(from 8am to 6pm)
thursday-10 slots(from 8am to 6pm)
friday-10 slots(from 8am to 6pm)

Output:
involves all the necessary information like(room no,course no,instructorname, day, time) of every clash in the timetable
eg:Monday-[CS543,4102,ABC],[CS544,4102,CDF]$ is in timetable of one slot which implies a clash
output:
clash found for depatmentname of batchname on monday in 8-9 slot
CS543 4102 ABC
CS544 4102 CDF

For q2 run the program using python 194161016_q2c.py
    - It will take input from 194161016_q2.txt file
    - Prints output into a 194161016_q2c_output.txt(created during runtime)
    - also creates a courseDict2.txt which has the dictionary of courses
input for this question is as follows
departmentname
batchname
midsem=schedule
endsem=schedule

output:
involves all the necessary information like(department name, batchname,course no, day, time) of every clash in the timetable
eg:If there is a clash on 18Sep2019 in 9to11 slot for courses CS543,CS547
Exam clash found Datacience department Mtech1 batch on 18sep2019 in 9to11 slot
cs543 ABC
cs547 CDF

for 194161016_q2d.py run using python 194161016_q2d.py
   It wil read the two dictionaries created courseDict1.txt and courseDict2.txt and prints the courses which are in class time
   but not in exam timetable
   output will be printed onto 194161016_q1d_output.txt(created at runtime)
CS593 for MTech1 batch of DataScience department is not there in the examination timetable
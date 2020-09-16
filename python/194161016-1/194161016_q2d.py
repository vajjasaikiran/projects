import os
import sys
import pickle

sys.stdout = open(os.path.join(os.getcwd(), '194161016_q2d_output.txt'), 'w')
with open("courseDict1.txt", "rb") as myFile:
    courseDict1 = pickle.load(myFile)
with open("courseDict2.txt", "rb") as myFile:
    courseDict2 = pickle.load(myFile)

for department in courseDict1.keys():
    for batch in courseDict1[department].keys():
        if(batch != "professorDictionary"):
            list1 = courseDict1[department][batch]
            if department in courseDict2:
                if batch in courseDict2[department]:
                    list2 = courseDict2[department][batch]
                    for course in list1:
                        if(course not in list2):
                            print(course+" for "+batch+" batch of "+department+" department is not there in the examination timetable")
import os
import sys
import pickle

#redirecting the print statements to write into an input file
sys.stdout = open(os.path.join(os.getcwd(), '194161016_q2c_output.txt'), 'w')
f1 = open(os.path.join(os.getcwd(),"194161016_q2.txt"),"r").readlines()
courseDict = {}
department = ''
batch = ''
day = ''
# typeOfExam = ''
professorDict = {}
# def mainFunction():
for line in f1:
    line = line.replace("\n","")
    if (line == ""):
        continue
    if("DEPARTMENT" in line):
        department = line.split('-')[1]
        courseDict[department] = {}
    elif("BATCH" in line):
        batch = line.split('-')[1]
        courseDict[department][batch] = []
    else:
        # typeOfExam,
        schedule = line.split("=")[1]
        listOfDays = schedule.split("$,")
        days, exams = [list(d) for d in zip(*[[i for i in c.split('-')] for c in listOfDays])]
        for index in range(0,len(exams)):
            morning, afternoon = exams[index].split(",")
            day = days[index]
            if("nil" not in morning):
                if("[" in morning):
                    courses = morning.replace("[","").replace("]","").split("/")
                    print("exam clash found for batch-"+batch+" of "+department+" department on"+day)
                    for i in range(0,len(courses)):
                        courseName, time, instructorName = courses[i].split("%")
                        print(time+"   "+courseName+"    "+instructorName)
                        if(courseName not in courseDict[department][batch]):
                            courseDict[department][batch].append(courseName)
                else:
                    courseName, time, instructorName = morning.split("%")
                    if(courseName not in courseDict[department][batch]):
                        courseDict[department][batch].append(courseName)
            if("nil" not in afternoon):
                if("[" in afternoon):
                    courses = afternoon.replace("[","").replace("]","").split("/")
                    print("exam clash found for batch-"+batch+" of "+department+" department on"+day)
                    for i in range(0,2):
                        courseName, instructorName, time = courses[i].split("%")
                        print(time+"   "+courseName+"    "+instructorName)
                        if(courseName not in courseDict[department][batch]):
                            courseDict[department][batch].append(courseName)
                else:
                    courseName, time, instructorName = afternoon.split("%")
                    if(courseName not in courseDict[department][batch]):
                        courseDict[department][batch].append(courseName)

with open("courseDict2.txt", "wb") as myFile:
    pickle.dump(courseDict, myFile)
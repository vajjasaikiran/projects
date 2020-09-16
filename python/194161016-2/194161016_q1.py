import os
import sys
import pickle

#redirecting the print statements to write into an input file
sys.stdout = open(os.path.join(os.getcwd(), '194161016_q1_output.txt'), 'w')
f1 = open(os.path.join(os.getcwd(),"194161016_q1.txt"),"r").readlines()
slotTimings = {0:"8:00am-8:55am",1:"9:00am-9:55am",2:"10:00am-10:55am",3:"11:00am-11:55am",4:"12:00pm-12:55pm",5:"1:00pm-1:55pm",
                6:"2:00am-2:55am",7:"3:00am-3:55am",8:"4:00pm-4:55pm",9:"5:00pm-5:55pm"}
courseDict = {}
roomDictionary = {}
department = ''
batch = ''
day = ''
departmentDictionary = {}
for line in f1:
    line = line.replace("\n","")
    if (line == ""):
        continue
    if("DEPARTMENT" in line):
        department = line.split('-')[1]
        courseDict[department] = {"professorDictionary":{}}
    elif("BATCH" in line):
        batch = line.split('-')[1]
        courseDict[department][batch] = []
    elif("DICTIONARY" in line):
        departmentDictionary = {}
        listOfValues = (line.split("=")[1]).split("$")
        for val in listOfValues:
            key, value = val.split("-")
            departmentDictionary[key]=value
    else:
        day,schedule = line.split('-')
        listOfSlots = schedule.split(",")
        for index in range(0,len(listOfSlots)):
            if(listOfSlots[index] != "nil"):    
                if("/" in listOfSlots[index]):
                    listOfCourses = listOfSlots[index].split("/")
                    tempCourses = []
                    tempRoomNo = []
                    tempProfessor = []
                    for key in listOfCourses:
                        slot = departmentDictionary[key]
                        # courseDetail = courseDetail.replace("[","").replace("]","")
                        course,room,professor = slot.split(",")
                        if(course not in courseDict[department][batch]):
                            if("+" in course):
                                course = course.split("+")
                                for c in course:
                                    if(c not in courseDict[department][batch]):
                                        courseDict[department][batch].append(c)
                            else:
                                courseDict[department][batch].append(course)
                        tempCourses.append(course)
                        tempRoomNo.append(room)
                        tempProfessor.append(professor)
                        
                        if(room != "lab"):
                            if(room not in roomDictionary):
                                roomDictionary[room] = {}
                            if(day not in roomDictionary[room]):
                                roomDictionary[room][day] = {}
                            if(slotTimings[index] not in roomDictionary[room][day]):
                                roomDictionary[room][day][slotTimings[index]] = [course+","+professor]
                            else:
                                if(course+","+professor not in roomDictionary[room][day][slotTimings[index]]):
                                    roomDictionary[room][day][slotTimings[index]].append(course+","+professor)

                        if("+" in professor):
                            professor = professor.split("+")
                        else:
                            professor = [professor]
                        for professorName in professor:
                            if(professorName not in courseDict[department]["professorDictionary"]):
                                courseDict[department]["professorDictionary"][professorName] = {}
                            if(day not in courseDict[department]["professorDictionary"][professorName]):
                                courseDict[department]["professorDictionary"][professorName][day] = {}
                            if(slotTimings[index] not in courseDict[department]["professorDictionary"][professorName][day]):
                                courseDict[department]["professorDictionary"][professorName][day][slotTimings[index]] =  [course+","+room]
                            else:
                                if(course+","+room not in courseDict[department]["professorDictionary"][professorName][day][slotTimings[index]]):
                                    courseDict[department]["professorDictionary"][professorName][day][slotTimings[index]].append(course+","+room) 
                    print("clashes found for "+batch+" of "+department+" department on "+day+" in "+slotTimings[index]+" slot")
                    for i in range(0,len(listOfCourses)):
                        print(tempCourses[i]+"   "+tempRoomNo[i]+"   "+tempProfessor[i])
                    print()

                else:
                    if("nil" not in listOfSlots[index]):
                        course,room,professor = departmentDictionary[listOfSlots[index]].split(",")
                        if(room != "lab"):
                            if(room not in roomDictionary):
                                roomDictionary[room] = {}
                            if(day not in roomDictionary[room]):
                                roomDictionary[room][day] = {}
                            if(slotTimings[index] not in roomDictionary[room][day]):
                                roomDictionary[room][day][slotTimings[index]] = [course+","+professor]
                            else:
                                if(course+","+professor not in roomDictionary[room][day][slotTimings[index]]):
                                    roomDictionary[room][day][slotTimings[index]].append(course+","+professor)

                        if("/" in professor):
                            professor = professor.split("/")
                        else:
                            professor = [professor]
                        for professorName in professor:
                            if(professorName not in courseDict[department]["professorDictionary"]):
                                courseDict[department]["professorDictionary"][professorName] = {}
                            if(day not in courseDict[department]["professorDictionary"][professorName]):
                                courseDict[department]["professorDictionary"][professorName][day] = {}
                            if(slotTimings[index] not in courseDict[department]["professorDictionary"][professorName][day]):
                                courseDict[department]["professorDictionary"][professorName][day][slotTimings[index]] =  [course+","+room]
                            else:
                                if(course+","+room not in courseDict[department]["professorDictionary"][professorName][day][slotTimings[index]]):
                                    courseDict[department]["professorDictionary"][professorName][day][slotTimings[index]].append(course+","+room) 

                        if(course not in courseDict[department][batch]):
                            if("+" in course):
                                course = course.split("+")
                                for c in course:
                                    if(c not in courseDict[department][batch]):
                                        courseDict[department][batch].append(c) 
                            else:
                                courseDict[department][batch].append(course)
print("room clashes:")
for roomNo in roomDictionary:
    for day in roomDictionary[roomNo]:
        for slot in roomDictionary[roomNo][day]:
            if(len(roomDictionary[roomNo][day][slot])>1):
                print("clash found for "+roomNo+" room on "+day+" in "+slot+" slot")
                for courseProfessor in roomDictionary[roomNo][day][slot]:
                    courseName, professorName = courseProfessor.split(",")
                    print(courseName+"   "+professorName)
                print()
print("professor clashes:")
for dep in courseDict:
    for prof in courseDict[dep]["professorDictionary"]:
        for day in courseDict[dep]["professorDictionary"][prof]:
            for slot in courseDict[dep]["professorDictionary"][prof][day]:
                if(len(courseDict[dep]["professorDictionary"][prof][day][slot])>1):
                    print("clash found for "+prof+" on "+day+" in "+slot+" slot")
                    for courseRoom in courseDict[dep]["professorDictionary"][prof][day][slot]:
                        courseName, roomNumber = courseRoom.split(",")
                        print(courseName+"   "+roomNumber)
                    print()

with open("courseDict1.txt", "wb") as myFile:
    pickle.dump(courseDict, myFile)
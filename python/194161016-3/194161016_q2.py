import os,sys,re,random
sys.stdout = open(os.path.join(os.getcwd(),"194161016-differences.txt"),"a")
matchNumbers = ['4170','4165','4155','4150','4188','4183','4190','4178','4173','4158']
for MATCHID in matchNumbers:   
    f1 = open(os.path.join(os.getcwd(),"194161016-"+MATCHID+"-scorecard-computed.txt"),"r").readlines()
    f2 = open(os.path.join(os.getcwd(),"194161016-"+MATCHID+"-scorecard-published.txt"),"r").readlines()

    
    FirstInningsLineComputed = ''
    SecondInningsLineComputed = ''
    FirstInningsBatsmenLineComputed = ''
    SecondInningsBatsmenLineComputed = ''
    FirstInningsBowlerLineComputed = ''
    SecondInningsBowlerLineComputed = ''
    FirstInningsExtrasComputed = ''
    SecondInningsExtrasComputed = ''
    FirstInningsDNBComputed = ''
    SecondInningsDNBComputed = ''
    FirstInningsTotalComputed=''
    SecondInningsTotalComputed = ''
    FirstInningsFOWComputed = ''
    SecondInningsFOWComputed = ''
    FirstInningsBatsmenComputed = {}
    FirstInningsBowlerComputed = {}
    SecondInningsBatsmenComputed = {}
    SecondInningsBowlerComputed = {}
    flag = True
    for line1 in f1:
        line1 = line1.replace("\n","")
        if(line1 == ""):
            flag = False
            continue
        if("Innings" in line1 and "maximum" in line1):
            FirstInningsLineComputed = line1.strip().split(" ")
        elif("Innings" in line1 and "target" in line1):
            SecondInningsLineComputed = line1.strip().split(" ")
        elif("BATSMEN" in line1):
            if(flag):
                FirstInningsBatsmenLineComputed = re.split(r" {2,}",line1.strip())
            else:
                SecondInningsBatsmenLineComputed = re.split(r" {2,}",line1.strip())
        elif("BOWLING" in line1):
            if(flag):
                FirstInningsBowlerLineComputed = re.split(r" {2,}",line1.strip())
            else:
                SecondInningsBowlerLineComputed = re.split(r" {2,}",line1.strip())
        elif("Extras" in line1):
            if(flag):
                FirstInningsExtrasComputed = re.split(r" {2,}",line1.strip())
            else:
                SecondInningsExtrasComputed = re.split(r" {2,}",line1.strip())
        elif("Did not bat" in line1):
            if(flag):
                FirstInningsDNBComputed = line1
            else:
                SecondInningsDNBComputed = line1
        elif("TOTAL" in line1):
            if(flag):
                FirstInningsTotalComputed = re.split(r" {2,}",line1.strip())
            else:
                SecondInningsTotalComputed = re.split(r" {2,}",line1.strip())
        elif("Fall of wickets" in line1):
            if(flag):
                FirstInningsFOWComputed = line1
            else:
                SecondInningsFOWComputed = line1
        else:
            listOfValues = re.split(r" {2,}",line1.strip())
            if(len(listOfValues) == 8):
                if(flag):
                    FirstInningsBatsmenComputed[listOfValues[0]] = listOfValues
                else:
                    SecondInningsBatsmenComputed[listOfValues[0]] = listOfValues
            else:
                if(not flag):
                    FirstInningsBowlerComputed[listOfValues[0]] = listOfValues
                else:
                    SecondInningsBowlerComputed[listOfValues[0]] = listOfValues

    FirstInningsLinePublished = ''
    SecondInningsLinePublished = ''
    FirstInningsBatsmenLinePublished = ''
    SecondInningsBatsmenLinePublished = ''
    FirstInningsBowlerLinePublished = ''
    SecondInningsBowlerLinePublished = ''
    FirstInningsExtrasPublished = ''
    SecondInningsExtrasPublished = ''
    FirstInningsDNBPublished = ''
    SecondInningsDNBPublished = ''
    FirstInningsTotalPublished=''
    SecondInningsTotalPublished = ''
    FirstInningsFOWPublished = ''
    SecondInningsFOWPublished = ''
    FirstInningsBatsmenPublished = {}
    FirstInningsBowlerPublished = {}
    SecondInningsBatsmenPublished = {}
    SecondInningsBowlerPublished = {}
    flag = True
    for line2 in f2:
        line2 = line2.replace("\n","")
        if(line2 == ""):
            flag = False
            continue
        if("Innings" in line2 and "maximum" in line2):
            line2 = line2.replace("\t","     ")
            FirstInningsLinePublished = re.split(r" {1,}",line2.strip())
        elif("Innings" in line2 and "target" in line2):
            line2 = line2.replace("\t","     ")
            SecondInningsLinePublished = re.split(r" {1,}",line2.strip())
        elif("BATSMEN" in line2):
            line2 = line2.replace("\t","     ")
            if(flag):
                FirstInningsBatsmenLinePublished = re.split(r" {2,}",line2.strip())
            else:
                SecondInningsBatsmenLinePublished = re.split(r" {2,}",line2.strip())
        elif("BOWLING" in line2):
            line2 = line2.replace("\t","     ")
            if(flag):
                FirstInningsBowlerLinePublished = re.split(r" {2,}",line2.strip())
            else:
                SecondInningsBowlerLinePublished = re.split(r" {2,}",line2.strip())
        elif("Extras" in line2):
            line2 = line2.replace("\t","     ")
            if(flag):
                FirstInningsExtrasPublished = re.split(r" {2,}",line2.strip())
            else:
                SecondInningsExtrasPublished = re.split(r" {2,}",line2.strip())
        elif("Did not bat" in line2):
            if(flag):
                FirstInningsDNBPublished = line2
            else:
                SecondInningsDNBPublished = line2
        elif("TOTAL" in line2):
            line2 = line2.replace("\t","     ")
            if(flag):
                FirstInningsTotalPublished = re.split(r" {2,}",line2.strip())
            else:
                SecondInningsTotalPublished = re.split(r" {2,}",line2.strip())
        elif("Fall of wickets" in line2):
            if(flag):
                FirstInningsFOWPublished = line2
            else:
                SecondInningsFOWPublished = line2
        else:
            line2 = line2.replace("\t","     ")
            listOfValues = re.split(r" {2,}",line2.strip())
            if(len(listOfValues) == 8):
                if(flag):
                    FirstInningsBatsmenPublished[listOfValues[0]] = listOfValues
                else:
                    SecondInningsBatsmenPublished[listOfValues[0]] = listOfValues
            else:
                if(not flag):
                    FirstInningsBowlerPublished[listOfValues[0]] = listOfValues
                else:
                    SecondInningsBowlerPublished[listOfValues[0]] = listOfValues

    team1 = FirstInningsLinePublished[0]
    team2 = SecondInningsLinePublished[0]
    differenceCount = 0
    # ################################add match number after creating for loop
    print("Differences found in "+team1+" vs "+team2+" match no-"+MATCHID)
    # header comparison
    flag1 = True
    for i in range(0,len(FirstInningsLinePublished)):
        if(FirstInningsLinePublished[i].strip()!= FirstInningsLineComputed[i].strip()):
            differenceCount += 1
            if(flag1):
                print("#Header Comparisons")
                flag1 = False
            print("Computed:"+FirstInningsLineComputed[i])
            print("Published:"+FirstInningsLinePublished[i])
    for i in range(0,len(SecondInningsLinePublished)):
        if(SecondInningsLinePublished[i].strip()!= SecondInningsLineComputed[i].strip()):
            differenceCount += 1
            if(flag1):
                print("#Header Comparisons")
                flag1 = False
            print("Computed:"+SecondInningsLineComputed[i])
            print("Published:"+SecondInningsLinePublished[i])
    #Batsmen header comparison
    flag1 = True
    for i in range(0,len(FirstInningsBatsmenLinePublished)):
        if(FirstInningsBatsmenLinePublished[i].strip()!= FirstInningsBatsmenLineComputed[i].strip()):
            differenceCount += 1
            if(flag1):
                print("#Batsmen Header Comparisons")
                flag1 = False
            print("Computed:"+FirstInningsBatsmenLineComputed[i])
            print("Published:"+FirstInningsBatsmenLinePublished[i])
    for i in range(0,len(SecondInningsBatsmenLinePublished)):
        if(SecondInningsBatsmenLinePublished[i].strip()!= SecondInningsBatsmenLineComputed[i].strip()):
            differenceCount += 1
            if(flag1):
                print("#Batsmen Header Comparisons")
                flag1 = False
            print("Computed:"+SecondInningsBatsmenLineComputed[i])
            print("Published:"+SecondInningsBatsmenLinePublished[i])

    #Bowler header comparison
    flag1 = True
    for i in range(0,len(FirstInningsBowlerLinePublished)):
        if(i == 5):
            if(FirstInningsBowlerLinePublished[i].strip().lower()!= FirstInningsBowlerLineComputed[i].strip().lower()):
                differenceCount += 1
                if(flag1):
                    print("#Bowler Header Comparisons")
                    flag1 = False
                print("Computed:"+FirstInningsBowlerLineComputed[i])
                print("Published:"+FirstInningsBowlerLinePublished[i])
        elif(FirstInningsBowlerLinePublished[i].strip()!= FirstInningsBowlerLineComputed[i].strip()):
            differenceCount += 1
            if(flag1):
                print("#Bowler Header Comparisons")
                flag1 = False
            print("Computed:"+FirstInningsBowlerLineComputed[i])
            print("Published:"+FirstInningsBowlerLinePublished[i])
    for i in range(0,len(SecondInningsBowlerLinePublished)):
        if(i == 5):
            if(SecondInningsBowlerLinePublished[i].strip().lower()!= SecondInningsBowlerLineComputed[i].strip().lower()):
                differenceCount += 1
                if(flag1):
                    print("#Bowler Header Comparisons")
                    flag1 = False
                print("Computed:"+SecondInningsBowlerLineComputed[i])
                print("Published:"+SecondInningsBowlerLinePublished[i])
        elif(SecondInningsBowlerLinePublished[i].strip()!= SecondInningsBowlerLineComputed[i].strip()):
            differenceCount += 1
            if(flag1):
                print("#Bowler Header Comparisons")
                flag1 = False
            print("Computed:"+SecondInningsBowlerLineComputed[i])
            print("Published:"+SecondInningsBowlerLinePublished[i])

    #Extras comparison
    flag1 = True
    for i in range(0,len(FirstInningsExtrasPublished)):
        if(FirstInningsExtrasPublished[i].strip()!= FirstInningsExtrasComputed[i].strip()):
            differenceCount += 1
            if(flag1):
                print("#Extras Comparisons")
                flag1 = False
            print("Computed:"+FirstInningsExtrasComputed[i])
            print("Published:"+FirstInningsExtrasPublished[i])
    for i in range(0,len(SecondInningsExtrasPublished)):
        if(SecondInningsExtrasPublished[i].strip()!= SecondInningsExtrasComputed[i].strip()):
            differenceCount += 1
            if(flag1):
                print("#Extras Comparisons")
                flag1 = False
            print("Computed:"+SecondInningsExtrasComputed[i])
            print("Published:"+SecondInningsExtrasPublished[i])

    #Total comparison
    flag1 = True
    for i in range(0,len(FirstInningsTotalPublished)):
        if(FirstInningsTotalPublished[i].strip()!= FirstInningsTotalComputed[i].strip()):
            differenceCount += 1
            if(flag1):
                print("#Total Comparisons")
                flag1 = False
            print("Computed:"+FirstInningsTotalComputed[i])
            print("Published:"+FirstInningsTotalPublished[i])
    for i in range(0,len(SecondInningsTotalPublished)):
        if(SecondInningsTotalPublished[i].strip() != SecondInningsTotalComputed[i].strip()):
            differenceCount += 1
            if(flag1):
                print("#Total Comparisons")
                flag1 = False
            print("Computed:"+SecondInningsTotalComputed[i])
            print("Published:"+SecondInningsTotalPublished[i])

    #Did not bat comparison
    print("##Did not bat comparisons")
    flag1 = True
    flag2 = True
    if(FirstInningsDNBComputed == FirstInningsDNBPublished and FirstInningsDNBPublished ==''):
        flag1 = False
    if(SecondInningsDNBComputed == SecondInningsDNBPublished and SecondInningsDNBPublished ==''):
        flag2 = False
    if(FirstInningsDNBPublished == '' and FirstInningsDNBComputed != ''):
        differenceCount += 1
        flag1 = False
        print("computed: "+FirstInningsDNBComputed)
        print("published: "+FirstInningsDNBPublished)
    elif(FirstInningsDNBPublished != '' and FirstInningsDNBComputed == ''):
        differenceCount += 1
        flag1 = False
        print("computed: "+FirstInningsDNBComputed)
        print("published: "+FirstInningsDNBPublished)
    if(SecondInningsDNBPublished == '' and SecondInningsDNBComputed != ''):
        differenceCount += 1
        flag2 = False
        print("computed: "+SecondInningsDNBComputed)
        print("published: "+SecondInningsDNBPublished)
    elif(SecondInningsDNBPublished != '' and SecondInningsDNBComputed == ''):
        differenceCount += 1
        flag2 = False
        print("computed: "+SecondInningsDNBComputed)
        print("published: "+SecondInningsDNBPublished)
    if(flag1):
        lis1P = (FirstInningsDNBPublished.split(":")[1]).split(", ")
        lis1C = (FirstInningsDNBComputed.split(":")[1]).split(", ")
        for i in lis1P:
            test = any(j in i for j in lis1C)
            if(not test):
                print(i+" is not present in did not bat list")
    if(flag2):
        lis2P = (SecondInningsDNBPublished.split(":")[1]).split(", ")
        lis2C = (SecondInningsDNBComputed.split(":")[1]).split(", ")
        for i in lis2P:
            test = any(j in i for j in lis2C)
            if(not test):
                print(i+" is not present in did not bat list")

    #fall of wickets comparisons
    print("##Fall Of Wickets Comparisons")
    flag1 = True
    flag2 = True
    if(FirstInningsFOWComputed == FirstInningsFOWPublished and FirstInningsFOWPublished ==''):
        flag1 = False
    if(SecondInningsFOWComputed == SecondInningsFOWPublished and SecondInningsFOWPublished ==''):
        flag2 = False
    if(FirstInningsFOWPublished == '' and FirstInningsFOWComputed != ''):
        differenceCount += 1
        flag1 = False
        print("computed: "+FirstInningsFOWComputed)
        print("published: "+FirstInningsFOWPublished)
    elif(FirstInningsFOWPublished != '' and FirstInningsFOWComputed == ''):
        differenceCount += 1
        flag1 = False
        print("computed: "+FirstInningsFOWComputed)
        print("published: "+FirstInningsFOWPublished)
    if(SecondInningsFOWPublished == '' and SecondInningsFOWComputed != ''):
        differenceCount += 1
        flag2 = False
        print("computed: "+SecondInningsFOWComputed)
        print("published: "+SecondInningsFOWPublished)
    elif(SecondInningsFOWPublished != '' and SecondInningsFOWComputed == ''):
        differenceCount += 1
        flag2 = False
        print("computed: "+SecondInningsFOWComputed)
        print("published: "+SecondInningsFOWPublished)
    if(flag1):
        lis1P = (FirstInningsFOWPublished.split(":")[1]).split(",  ")
        lis1C = (FirstInningsFOWComputed.split(":")[1]).split(",  ")
        if(len(lis1P) != len(lis1C)):
            differenceCount += 1
            print("no of wickets printed in fall of wickets is incorrect")
            print("Computed: "+FirstInningsFOWComputed)
            print("Published: "+FirstInningsFOWPublished)
        else:
            for i in range(0,len(lis1P)):
                wicketP = re.findall(r"\d+-\d{1,3}",lis1P[i])[0]
                playerP = re.findall(r"\((.+?),",lis1P[i])[0]
                overP = re.findall(r"\d{1,2}\.\d ov",lis1P[i])[0]
                wicketC = re.findall(r"\d+-\d{1,3}",lis1C[i])[0]
                playerC = re.findall(r"\((.+?),",lis1C[i])[0]
                overC = re.findall(r"\d{1,2}\.\d ov",lis1C[i])[0]
                if(wicketP != wicketC):
                    differenceCount += 1
                    print("computed: "+wicketC)
                    print("Published: "+wicketP)
                if(overP != overC):
                    differenceCount += 1
                    print("computed: "+overC)
                    print("Published: "+overP)
                if(playerC not in playerP):
                    differenceCount += 1
                    print("computed: "+playerC)
                    print("Published: "+playerP)

    if(flag2):
        lis2P = (SecondInningsFOWPublished.split(":")[1]).split(",  ")
        lis2C = (SecondInningsFOWComputed.split(":")[1]).split(",  ")
        if(len(lis1P) != len(lis1C)):
            differenceCount += 1
            print("no of wickets printed in fall of wickets is incorrect")
            print("Computed: "+SecondInningsFOWComputed)
            print("Published: "+SecondInningsFOWPublished)
        else:
            for i in range(0,len(lis2P)):
                wicketP = re.findall(r"\d+-\d{1,3}",lis2P[i])[0]
                playerP = re.findall(r"\((.+?),",lis2P[i])[0]
                overP = re.findall(r"\d{1,2}\.\d ov",lis2P[i])[0]
                wicketC = re.findall(r"\d+-\d{1,3}",lis2C[i])[0]
                playerC = re.findall(r"\((.+?),",lis2C[i])[0]
                overC = re.findall(r"\d{1,2}\.\d ov",lis2C[i])[0]
                if(wicketP != wicketC):
                    differenceCount += 1
                    print("computed: "+wicketC)
                    print("Published: "+wicketP)
                if(overP != overC):
                    differenceCount += 1
                    print("computed: "+overC)
                    print("Published: "+overP)
                if(playerC not in playerP):
                    differenceCount += 1
                    print("computed: "+playerC)
                    print("Published: "+playerP)

    #Batsmen comparisons

    keyWords = ["player","dismissal","runs","balls","minutes","4s","6s","StrikeRate"]
    for keyP in list(FirstInningsBatsmenPublished.keys()):
        keyC = [k for k in FirstInningsBatsmenComputed.keys() if k in keyP][0]
        lis1P = FirstInningsBatsmenPublished[keyP]
        lis1C = FirstInningsBatsmenComputed[keyC]
        for i in range(1,len(lis1P)):
            if(i == 7):
                diff = abs(float(lis1C[i])-float(lis1P[i]))
                if(diff > 0.1):
                    differenceCount += 1
                    print(keyWords[i]+" info mismatch for "+keyP)
                    print("computed:"+lis1C[i])
                    print("Published:"+lis1P[i])
            elif(lis1P[i].strip() != lis1C[i].strip()):
                differenceCount += 1
                print(keyWords[i]+" info mismatch for "+keyP)
                print("computed:"+lis1C[i])
                print("Published:"+lis1P[i])

    for keyP in list(SecondInningsBatsmenPublished.keys()):
        keyC = [k for k in SecondInningsBatsmenComputed.keys() if k in keyP][0]
        lis2P = SecondInningsBatsmenPublished[keyP]
        lis2C = SecondInningsBatsmenComputed[keyC]
        for i in range(1,len(lis2P)):
            if(i == 7):
                diff = abs(float(lis2C[i])-float(lis2P[i]))
                if(diff > 0.1):
                    differenceCount += 1
                    print(keyWords[i]+" info mismatch for "+keyP)
                    print("computed:"+lis2C[i])
                    print("Published:"+lis2P[i])
            elif(lis2P[i].strip() != lis2C[i].strip()):
                differenceCount += 1
                print(keyWords[i]+" info mismatch for "+keyP)
                print("computed:"+lis2C[i])
                print("Published:"+lis2P[i])

    #Bowler Comparisons
    keyWords = ["player","Overs","MaidenOvers","Runs","Wickets","Economy","noOfZeros","4s","6s","Wides","NB"]
    for keyP in list(FirstInningsBowlerPublished.keys()):
        keyC = [k for k in FirstInningsBowlerComputed.keys() if k in keyP][0]
        lis1P = FirstInningsBowlerPublished[keyP]
        lis1C = FirstInningsBowlerComputed[keyC]
        for i in range(1,len(lis1P)):
            if(i == 5):
                diff = abs(float(lis1C[i])-float(lis1P[i]))
                if(diff > 0.1):
                    differenceCount += 1
                    print(keyWords[i]+" info mismatch for "+keyP)
                    print("computed:"+lis1C[i])
                    print("Published:"+lis1P[i])
            elif(lis1P[i].strip() != lis1C[i].strip()):
                differenceCount += 1
                print(keyWords[i]+" info mismatch for "+keyP)
                print("computed:"+lis1C[i])
                print("Published:"+lis1P[i])

    for keyP in list(SecondInningsBowlerPublished.keys()):
        keyC = [k for k in SecondInningsBowlerComputed.keys() if k in keyP][0]
        lis2P = SecondInningsBowlerPublished[keyP]
        lis2C = SecondInningsBowlerComputed[keyC]
        for i in range(1,len(lis2P)):
            if(i == 5):
                diff = abs(float(lis2C[i])-float(lis2P[i]))
                if(diff > 0.1):
                    differenceCount += 1
                    print(keyWords[i]+" info mismatch for "+keyP)
                    print("computed:"+lis2C[i])
                    print("Published:"+lis2P[i])
            elif(lis2P[i].strip() != lis2C[i].strip()):
                differenceCount += 1
                print(keyWords[i]+" info mismatch for "+keyP)
                print("computed:"+lis2C[i])
                print("Published:"+lis2P[i])
    print("Total differences found:",end="")
    print(differenceCount,end="")
    print()
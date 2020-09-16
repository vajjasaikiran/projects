import os,sys,re,random
matchNumbers = ['4170','4165','4155','4150','4188','4183','4190','4178','4173','4158']
 
for MATCHID in matchNumbers:
    class batsmen(object):
        def __init__(self,name):
            self.name = name
            self.noOfRuns = 0
            self.noOfBalls = 0
            self.noOfMinutes = 0
            self.noOfFours = 0
            self.noOfSixes = 0
            self.outFlag = False
            self.wicketInfo = ""
            self.name2 = ""
            self.natureOfDismissal = ""

    class bowler(object):
        def __init__(self,name):
            self.name = name
            self.noOfRuns = 0
            self.noOfBalls = 0
            self.noOfMaidenOvers = 0
            self.noOfWickets = 0
            self.noOfZeros = 0
            self.noOfFours = 0
            self.noOfSixes = 0
            self.noOfWides = 0
            self.noOfNoBalls = 0

    extrasDict = {"1stInnings":{"w":0,"nb":0,"lb":0,"b":0},"2ndInnings":{"w":0,"nb":0,"lb":0,"b":0}}
    noOfWicketsDict = {"1stInnings":0,"2ndInnings":0}
    noOfOversDict = {"1stInnings":'',"2ndInnings":''}
    fallOfWickets = {"1stInnings":{},"2ndInnings":{}}
    totalRuns = {"1stInnings":0,"2ndInnings":0}

    f1 = open(os.path.join(os.getcwd(),"194161016-"+MATCHID+"-commentary.txt"),"r").readlines()
    str1 = f1[0].replace("\n","")
    str2 = f1[1].replace("\n","")
    lis1 = str1.split(",")
    lis2 = str2.split(",")
    team1 = (lis1[0].split("1")[0]).replace(" ","")
    team2 = (lis2[0].split("1")[0]).replace(" ","")
    playerList1 = []
    playerList2 = []
    for i in lis1: 
        playerList1.append(i.split(" ")[-1])
    for i in lis2:
        playerList2.append(i.split(" ")[-1])
    dictOfPlayers = {}
    dictOfPlayers[team1] = playerList1
    dictOfPlayers[team2] = playerList2
    #####################
    ballRegularExpression = re.compile(r'^\d{1,2}\.\d$')
    runsRegularExpression = re.compile(r'^[0-9]?([a-zA-Z]{1,2})?$')
    bowlerBatsmenRegularexpression = re.compile(r'^[a-zA-z ]+ to [a-zA-z ]+, .*(run|runs|wide|wides|bye|byes|OUT|leg bye|leg byes),')
    ballCount = 0
    runCount = 0
    wicketCount = 0
    currentOver = -1
    currentBall = -1
    dictOfBowlers = {"1stInnings":{},"2ndInnings":{}}
    dictOfBatsmen = {"1stInnings":{},"2ndInnings":{}}
    runsOrWicketsInfo = ''
    bowlerName = ''
    batsmenName = ''
    currentInnings = '2ndInnings'
    number = -1
    for line in f1[2:]:
        line = line.replace("\n","")
        if(line == "##########"):
            dictOfBowlers[currentInnings][bowlerName].noOfBalls += int(ballCount)
            noOfWicketsDict[currentInnings] = wicketCount
            currentInnings = '1stInnings'
            wicketCount = 0
            currentBall = -1
            currentOver = -1
            continue
        if(line == ""):
            continue
        if (re.search(ballRegularExpression,line)):
            if(currentOver == -1 and currentBall == -1):
                noOfOversDict[currentInnings] = line
            prevOver = currentOver
            prevBall = currentBall
            currentOver, currentBall = line.split(".")
            if(prevBall == -1):
                ballCount = currentBall
            if(prevOver != -1):
                if(prevOver != currentOver):
                    if(runCount == 0):
                        dictOfBowlers[currentInnings][bowlerName].noOfMaidenOvers += 1
                    runCount = 0
            if(prevBall != -1):
                if(prevOver != currentOver):
                    dictOfBowlers[currentInnings][bowlerName].noOfBalls += int(ballCount)
                    ballCount = currentBall
            continue
        if (re.search(runsRegularExpression,line)):
            runsOrWicketsInfo = line
            if(re.search(r"^\d",runsOrWicketsInfo)):
                number = int(re.findall(r"^\d",runsOrWicketsInfo)[0])
                totalRuns[currentInnings] += number
                runCount += number
            else:
                number = 0
            continue
        if(re.search(bowlerBatsmenRegularexpression,line)):
            bowlerBatsmenInfo = line.split(',')[0]
            listBatsmenBowlerInfo = bowlerBatsmenInfo.split(' ')
            bowlerName = listBatsmenBowlerInfo[0]
            batsmenName = listBatsmenBowlerInfo[len(listBatsmenBowlerInfo)-1]
            
            if bowlerName not in dictOfBowlers[currentInnings]:
                dictOfBowlers[currentInnings][bowlerName] = bowler(bowlerName)
            if batsmenName not in dictOfBatsmen[currentInnings]:
                dictOfBatsmen[currentInnings][batsmenName] = batsmen(batsmenName)
            dictOfBatsmen[currentInnings][batsmenName].noOfBalls += 1
            
            if('W' in runsOrWicketsInfo):
                dictOfBowlers[currentInnings][bowlerName].noOfWickets += 1
                wicketCount += 1
                fallOfWickets[currentInnings][wicketCount] = {}
                fallOfWickets[currentInnings][wicketCount]['over'] = currentOver+"."+currentBall
                fallOfWickets[currentInnings][wicketCount]['runs'] = totalRuns[currentInnings]
            elif("w" in runsOrWicketsInfo):
                dictOfBowlers[currentInnings][bowlerName].noOfWides += 1
                extrasDict[currentInnings]["w"] += number
            elif("nb" in runsOrWicketsInfo):
                dictOfBowlers[currentInnings][bowlerName].noOfNoBalls += 1
                dictOfBatsmen[currentInnings][batsmenName].noOfRuns += number-1
                extrasDict[currentInnings]["nb"] += 1
            elif("lb" in runsOrWicketsInfo):
                extrasDict[currentInnings]["lb"] += number
            elif("b" in runsOrWicketsInfo):
                extrasDict[currentInnings]["b"] += number
            else:
                if(number == 4):
                    dictOfBatsmen[currentInnings][batsmenName].noOfFours += 1
                    dictOfBowlers[currentInnings][bowlerName].noOfFours += 1
                if(number == 6):
                    dictOfBatsmen[currentInnings][batsmenName].noOfSixes += 1
                    dictOfBowlers[currentInnings][bowlerName].noOfSixes += 1
                dictOfBatsmen[currentInnings][batsmenName].noOfRuns += number
            dictOfBowlers[currentInnings][bowlerName].noOfRuns += number
            if(number == 0):
                dictOfBowlers[currentInnings][bowlerName].noOfZeros += 1
            continue
        if(re.search(r"\(\d+m \d+b \d+x4 \d+x6\) SR:",line)):
            lis = line.split(" ")
            types = ['st','c','lbw','hitwicket','b','run',]                                                                                 
            for i in types:                                                                        
                if(i not in lis):            
                    continue   
                ind = lis.index(i)-1
                if (i == 'run'):
                    dictOfBowlers[currentInnings][bowlerName].noOfWickets -= 1
                break
            outBatsmen = lis[ind]                                                             
            batsmenNatureOfDismissal = " ".join(lis[ind+1:len(lis)-7])
            batsmenMinutes = re.search(r"\d \((.+?)m",line).group(1)
            if(outBatsmen not in dictOfBatsmen[currentInnings]):
                dictOfBatsmen[currentInnings][outBatsmen] = batsmen(outBatsmen)
            dictOfBatsmen[currentInnings][outBatsmen].outFlag = True
            dictOfBatsmen[currentInnings][outBatsmen].noOfMinutes = batsmenMinutes
            dictOfBatsmen[currentInnings][outBatsmen].natureOfDismissal = batsmenNatureOfDismissal
            fallOfWickets[currentInnings][wicketCount]["player"] = outBatsmen
    noOfWicketsDict[currentInnings] = wicketCount
    ###############################
    sys.stdout = open(os.path.join(os.getcwd(),"194161016-"+MATCHID+"-scorecard-computed.txt"),"w")
    firstInnings = ''
    secondInnings = ''
    if(list(dictOfBatsmen["1stInnings"].keys())[0] in dictOfPlayers[list(dictOfPlayers.keys())[0]]):
        firstInnings = list(dictOfPlayers.keys())[0]
        secondInnings = list(dictOfPlayers.keys())[1]
    else:
        firstInnings = list(dictOfPlayers.keys())[1]
        secondInnings = list(dictOfPlayers.keys())[0]

    currInnings = ["1stInnings","2ndInnings"]
    for innings in currInnings:
        listOfBatsmenKeys = list(dictOfBatsmen[innings].keys())
        maxLenBatsmen = max(len(i) for i in listOfBatsmenKeys)
        listOfDismissalKeys = []
        for i in dictOfBatsmen[innings]:
            listOfDismissalKeys.append(dictOfBatsmen[innings][i].natureOfDismissal)
        maxLenDismissal = max(len(i) for i in listOfDismissalKeys)
        
        if(innings == "1stInnings"):
            print(firstInnings +" Innings (50 overs maximum)")
        else:
            print(secondInnings+" Innings (target: "+str(totalRuns["1stInnings"]+1)+" runs from 50 overs)")
        print("BATSMEN".ljust(maxLenBatsmen+5),end="")
        print("".ljust(maxLenDismissal+5),end="")
        print("R".ljust(8),end="")
        print("B".ljust(7),end="")
        print("M".ljust(8),end="")
        print("4s".ljust(7),end="")
        print("6s".ljust(7),end="")
        print("SR")
        for key in dictOfBatsmen[innings]:
            print(key.ljust(maxLenBatsmen+5),end="")
            if(dictOfBatsmen[innings][key].natureOfDismissal == ''):
                print("not out".ljust(maxLenDismissal+5),end="")
            else:
                print(dictOfBatsmen[innings][key].natureOfDismissal.ljust(maxLenDismissal+5),end="")
            print(str(dictOfBatsmen[innings][key].noOfRuns).ljust(8),end="")
            print(str(dictOfBatsmen[innings][key].noOfBalls).ljust(7),end="")
            print(str(dictOfBatsmen[innings][key].noOfMinutes).ljust(8),end="")
            print(str(dictOfBatsmen[innings][key].noOfFours).ljust(7),end="")
            print(str(dictOfBatsmen[innings][key].noOfSixes).ljust(7),end="")
            print(round((dictOfBatsmen[innings][key].noOfRuns*100)/dictOfBatsmen[innings][key].noOfBalls,2))
        totalExtras = 0
        for key in extrasDict[innings]:
            totalExtras += extrasDict[innings][key]
        print("Extras                                        "+str(totalExtras)+" (",end="")
        extrasString = ""
        if(extrasDict[innings]["b"] != 0):
            extrasString += "b "+str(extrasDict[innings]["b"])+", "
        if(extrasDict[innings]["lb"] != 0):
            extrasString +="lb "+str(extrasDict[innings]["lb"])+", "
        if(extrasDict[innings]["nb"] != 0):
            extrasString += "nb "+str(extrasDict[innings]["nb"])+", "
        if(extrasDict[innings]["w"] != 0):
            extrasString += "w "+str(extrasDict[innings]["w"])+", "
        print(extrasString[:len(extrasString)-2]+")")
        wicketsPrinted = str(noOfWicketsDict[innings])
        if(wicketsPrinted == '10'):
            print("TOTAL                                 "+str(totalRuns[innings])+" all out ",end="")
        else:
            print("TOTAL                                 "+str(totalRuns[innings])+"/"+wicketsPrinted+" ",end="")
        overs = noOfOversDict[innings]
        over, ball = noOfOversDict[innings].split(".")
        if(ball == '6'):
            overs = str(int(over)+1)
        print("(",end="")
        print(overs,end="")
        print(" Overs, RR: ",end="")
        runRate = 0
        if("." in overs):
            denominator = (int(over)*6+int(ball))/6
            numerator = int(totalRuns[innings])
            runRate = numerator/denominator
        else:
            runRate = int(totalRuns[innings])/int(overs)
        print(round(runRate,2),end="")
        print(")")
        if(innings == '1stInnings'):
            temp = firstInnings
        else:
            temp = secondInnings
        if(len(list(dictOfBatsmen[innings].keys())) != len(list(dictOfPlayers[temp]))):
            print("Did not bat:",end="")
            resultString = ''
            for player in dictOfPlayers[temp]:
                if(player not in list(dictOfBatsmen[innings].keys())):
                    resultString += player + ", "
            resultString = resultString[:len(resultString)-2]
            print(resultString)
        if(noOfWicketsDict[innings] != 0):
            print("Fall of wickets:",end=" ")
            fallOfWicketsString = ''
            wickets = noOfWicketsDict[innings]
            runsSS = totalRuns[innings]
            FOW = list(reversed(sorted(list(fallOfWickets[innings].keys()))))
            for i in FOW:
                fallOfWicketsString += str(wickets-i+1)+"-"+str(runsSS-fallOfWickets[innings][i]["runs"])+" ("+str(fallOfWickets[innings][i]["player"])+", "+str(fallOfWickets[innings][i]["over"])+" ov),  "
            print(fallOfWicketsString[:len(fallOfWicketsString)-3])

        listOfKeys = list(dictOfBowlers[innings].keys())
        maxLen = max(len(i) for i in listOfKeys)
        print("BOWLING".ljust(maxLen+10)+"O".ljust(7)+"M".ljust(7)+"R".ljust(8)+"W".ljust(7)+"Econ".ljust(9)+"0s".ljust(7)+"4s".ljust(7)+"6s".ljust(7)+"WD".ljust(7)+"NB")
        for key in dictOfBowlers[innings]:
            print(key.ljust(maxLen+10),end="")
            noOfOvers = str(int(dictOfBowlers[innings][key].noOfBalls/6))
            if(dictOfBowlers[innings][key].noOfBalls%6 != 0):
                noOfOvers += "."+str(dictOfBowlers[innings][key].noOfBalls%6)
            print(str(noOfOvers).ljust(7),end="")
            print(str(dictOfBowlers[innings][key].noOfMaidenOvers).ljust(7),end="")
            print(str(dictOfBowlers[innings][key].noOfRuns).ljust(8),end="")
            print(str(dictOfBowlers[innings][key].noOfWickets).ljust(7),end="")
            economyRate = (dictOfBowlers[innings][key].noOfRuns*6)/dictOfBowlers[innings][key].noOfBalls
            print(str(round(economyRate,2)).ljust(9),end="")
            print(str(dictOfBowlers[innings][key].noOfZeros).ljust(7),end="")
            print(str(dictOfBowlers[innings][key].noOfFours).ljust(7),end="")
            print(str(dictOfBowlers[innings][key].noOfSixes).ljust(7),end="")
            print(str(dictOfBowlers[innings][key].noOfWides).ljust(7),end="")
            print(dictOfBowlers[innings][key].noOfNoBalls)
        print()

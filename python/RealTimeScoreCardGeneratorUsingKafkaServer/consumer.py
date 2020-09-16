import json
from kafka import KafkaConsumer
import os,sys,re,random,threading
matchNumbers = ["4143","4144","4145","4146","4147","4148","4149","4150","4151","4152","4153","4154","4155","4156","4157","4158","4159","4160","4161","4162","4163","4165","4166","4168","4169","4170","4171","4172","4173","4174","4175","4176","4177","4178","4179","4180","4182","4183","4184","4186","4187","4188","4190","4191","4192"]
def matchScoreCard(match,f1):
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
    inningsFlag = False
    extrasDict = {"1stInnings":{"w":0,"nb":0,"lb":0,"b":0},"2ndInnings":{"w":0,"nb":0,"lb":0,"b":0}}
    noOfWicketsDict = {"1stInnings":0,"2ndInnings":0}
    noOfOversDict = {"1stInnings":'',"2ndInnings":''}
    fallOfWickets = {"1stInnings":{},"2ndInnings":{}}
    totalRuns = {"1stInnings":0,"2ndInnings":0}

    try:
        str1 = f1[0].replace("\n","")
        str2 = f1[1].replace("\n","")
    except:
        return
    lis1 = str1.split(",")
    lis2 = str2.split(",")
    team1 = (lis1[0].split("1")[0]).replace(" ","")
    team2 = (lis2[0].split("1")[0]).replace(" ","")
    playerList1 = []
    playerList2 = []
    for i in lis1: 
        playerList1.append(str(re.search(r"\d (.+?)$",i).group(1)))
    for i in lis2:
        playerList2.append(str((re.search(r"\d (.+?)$",i)).group(1)))
    dictOfPlayers = {}
    dictOfPlayers[team1] = playerList1
    dictOfPlayers[team2] = playerList2
    #####################
    ballRegularExpression = re.compile(r'^\d{1,2}\.\d$')
    runsRegularExpression = re.compile(r'^[0-9]?([a-zA-Z]{1,2})?$')
    bowlerBatsmenRegularexpression = re.compile(r'^[a-zA-z -]+ to [a-zA-z -]+, .*(run|runs|wide|wides|bye|byes|OUT|leg bye|leg byes),')
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
    currentInnings = '1stInnings'
    number = -1
    for line in f1[2:]:
        line = line.replace("\n","")
        if(line == "##########"):
            dictOfBowlers[currentInnings][bowlerName].noOfBalls += int(ballCount)
            noOfWicketsDict[currentInnings] = wicketCount
            currentInnings = '2ndInnings'
            wicketCount = 0
            currentBall = -1
            currentOver = -1
            inningsFlag = True
            continue
        if(line == "END OF FILE"):
            dictOfBowlers[currentInnings][bowlerName].noOfBalls += int(ballCount)
        if(line == ""):
            continue
        if (re.search(ballRegularExpression,line)):
            noOfOversDict[currentInnings] = line
            prevOver = currentOver
            prevBall = currentBall
            currentOver, currentBall = line.split(".")
            prevballCount = ballCount
            ballCount = currentBall
            if(prevOver != -1):
                if(prevOver != currentOver):
                    if(runCount == 0):
                        dictOfBowlers[currentInnings][bowlerName].noOfMaidenOvers += 1
                    runCount = 0
            if(prevBall != -1):
                if(prevOver != currentOver):
                    dictOfBowlers[currentInnings][bowlerName].noOfBalls += int(prevballCount)
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
    file1 = open(os.path.join(os.getcwd(),"194161016-"+match+"-scorecard-computed.txt"),"w")
    firstInnings = ''
    secondInnings = ''
    if(list(dictOfBatsmen["1stInnings"].keys())[0] in x for x in dictOfPlayers[list(dictOfPlayers.keys())[0]]):
        firstInnings = list(dictOfPlayers.keys())[0]
        secondInnings = list(dictOfPlayers.keys())[1]
    else:
        firstInnings = list(dictOfPlayers.keys())[1]
        secondInnings = list(dictOfPlayers.keys())[0]

    if inningsFlag:
        currInnings = ["1stInnings","2ndInnings"]
    else:
        currInnings = ["1stInnings"]
    for innings in currInnings:
        listOfBatsmenKeys = list(dictOfBatsmen[innings].keys())
        
        try:
            maxLenBatsmen = max(len(i) for i in listOfBatsmenKeys)
            listOfDismissalKeys = []
            for i in dictOfBatsmen[innings]:
                listOfDismissalKeys.append(dictOfBatsmen[innings][i].natureOfDismissal)
            maxLenDismissal = max(len(i) for i in listOfDismissalKeys)
            
            if(innings == "1stInnings"):
                file1.write(firstInnings +" Innings (50 overs maximum)\n")
            else:
                file1.write(secondInnings+" Innings (target: "+str(totalRuns["1stInnings"]+1)+" runs from 50 overs)\n")
            file1.write("BATSMEN".ljust(maxLenBatsmen+5))
            file1.write("".ljust(maxLenDismissal+5))
            file1.write("R".ljust(8))
            file1.write("B".ljust(7))
            file1.write("M".ljust(8))
            file1.write("4s".ljust(7))
            file1.write("6s".ljust(7))
            file1.write("SR\n")
            for key in dictOfBatsmen[innings]:
                file1.write(key.ljust(maxLenBatsmen+5))
                if(dictOfBatsmen[innings][key].natureOfDismissal == ''):
                    file1.write("not out".ljust(maxLenDismissal+5))
                else:
                    file1.write(dictOfBatsmen[innings][key].natureOfDismissal.ljust(maxLenDismissal+5))
                file1.write(str(dictOfBatsmen[innings][key].noOfRuns).ljust(8))
                file1.write(str(dictOfBatsmen[innings][key].noOfBalls).ljust(7))
                file1.write(str(dictOfBatsmen[innings][key].noOfMinutes).ljust(8))
                file1.write(str(dictOfBatsmen[innings][key].noOfFours).ljust(7))
                file1.write(str(dictOfBatsmen[innings][key].noOfSixes).ljust(7))
                if(dictOfBatsmen[innings][key].noOfBalls == 0):
                    file1.write("0.00\n".ljust(9))
                else:
                    file1.write(str(round((dictOfBatsmen[innings][key].noOfRuns*100)/dictOfBatsmen[innings][key].noOfBalls,2))+"\n")
                
            totalExtras = 0
            for key in extrasDict[innings]:
                totalExtras += extrasDict[innings][key]
            file1.write("Extras                                        "+str(totalExtras)+" (")
            extrasString = ""
            if(extrasDict[innings]["b"] != 0):
                extrasString += "b "+str(extrasDict[innings]["b"])+", "
            if(extrasDict[innings]["lb"] != 0):
                extrasString +="lb "+str(extrasDict[innings]["lb"])+", "
            if(extrasDict[innings]["nb"] != 0):
                extrasString += "nb "+str(extrasDict[innings]["nb"])+", "
            if(extrasDict[innings]["w"] != 0):
                extrasString += "w "+str(extrasDict[innings]["w"])+", "
            file1.write(extrasString[:len(extrasString)-2]+")\n")
            wicketsPrinted = str(noOfWicketsDict[innings])
            if(wicketsPrinted == '10'):
                file1.write("TOTAL                                 "+str(totalRuns[innings])+" all out ")
            else:
                file1.write("TOTAL                                 "+str(totalRuns[innings])+"/"+wicketsPrinted+" ")
            overs = noOfOversDict[innings]
            over, ball = noOfOversDict[innings].split(".")
            if(ball == '6'):
                overs = str(int(over)+1)
            file1.write("(")
            file1.write(overs)
            file1.write(" Overs, RR: ")
            runRate = 0
            if("." in overs):
                denominator = (int(over)*6+int(ball))/6
                numerator = int(totalRuns[innings])
                runRate = numerator/denominator
            else:
                runRate = int(totalRuns[innings])/int(overs)
            file1.write(str(round(runRate,2)))
            file1.write(")\n")
            if(innings == '1stInnings'):
                temp = firstInnings
            else:
                temp = secondInnings
            if(len(list(dictOfBatsmen[innings].keys())) != len(list(dictOfPlayers[temp]))):
                file1.write("Did not bat:")
                resultString = ''
                for player in dictOfPlayers[temp]:
                    if(all(x not in player for x in  list(dictOfBatsmen[innings].keys()))):
                        resultString += player + ", "
                resultString = resultString[:len(resultString)-2]
                file1.write(resultString+"\n")
            if(noOfWicketsDict[innings] != 0):
                file1.write("Fall of wickets:")
                fallOfWicketsString = ''
                FOW = list((sorted(list(fallOfWickets[innings].keys()))))
                for i in FOW:
                    fallOfWicketsString += str(i)+"-"+str(fallOfWickets[innings][i]["runs"])+" ("+str(fallOfWickets[innings][i]["player"])+", "+str(fallOfWickets[innings][i]["over"])+" ov),  "
                file1.write(fallOfWicketsString[:len(fallOfWicketsString)-3]+"\n")

            listOfKeys = list(dictOfBowlers[innings].keys())
            maxLen = max(len(i) for i in listOfKeys)
            file1.write("BOWLING".ljust(maxLen+10)+"O".ljust(7)+"M".ljust(7)+"R".ljust(8)+"W".ljust(7)+"Econ".ljust(9)+"0s".ljust(7)+"4s".ljust(7)+"6s".ljust(7)+"WD".ljust(7)+"NB\n")
            for key in dictOfBowlers[innings]:
                file1.write(key.ljust(maxLen+10))
                noOfOvers = str(int(dictOfBowlers[innings][key].noOfBalls/6))
                if(dictOfBowlers[innings][key].noOfBalls%6 != 0):
                    noOfOvers += "."+str(dictOfBowlers[innings][key].noOfBalls%6)
                file1.write(str(noOfOvers).ljust(7))
                file1.write(str(dictOfBowlers[innings][key].noOfMaidenOvers).ljust(7))
                file1.write(str(dictOfBowlers[innings][key].noOfRuns).ljust(8))
                file1.write(str(dictOfBowlers[innings][key].noOfWickets).ljust(7))
                if(dictOfBowlers[innings][key].noOfBalls == 0):
                    file1.write("0.00".ljust(9))
                else:
                    economyRate = (dictOfBowlers[innings][key].noOfRuns*6)/dictOfBowlers[innings][key].noOfBalls
                    file1.write(str(round(economyRate,2)).ljust(9))
                file1.write(str(dictOfBowlers[innings][key].noOfZeros).ljust(7))
                file1.write(str(dictOfBowlers[innings][key].noOfFours).ljust(7))
                file1.write(str(dictOfBowlers[innings][key].noOfSixes).ljust(7))
                file1.write(str(dictOfBowlers[innings][key].noOfWides).ljust(7))
                file1.write(str(dictOfBowlers[innings][key].noOfNoBalls)+"\n")
            file1.write("\n")
        except:
            return


def computeScore(match):
    consumer = KafkaConsumer(match,group_id='basis',bootstrap_servers=['localhost:9092'],auto_offset_reset='earliest', enable_auto_commit=False,consumer_timeout_ms=50000)
    listOfValues = []
    for message in consumer:
        listOfValues.append("%s" % (message.value.decode('utf-8')))
        matchScoreCard(match,listOfValues)

#create and start threads
threads = []
for matchID in matchNumbers:
    t1 = threading.Thread(target=computeScore,args=(matchID,))
    threads.append(t1)
    t1.start()

for i in range(len(matchNumbers)):
    threads[i].join()
from kafka import KafkaProducer
import yaml
import threading,os,sys,random
matchNumbers = ["4143","4144","4145","4146","4147","4148","4149","4150","4151","4152","4153","4154","4155","4156","4157","4158","4159","4160","4161","4162","4163","4165","4166","4168","4169","4170","4171","4172","4173","4174","4175","4176","4177","4178","4179","4180","4182","4183","4184","4186","4187","4188","4190","4191","4192"]
producers = []
files = []
for matchID in matchNumbers:
    producers.append(KafkaProducer(bootstrap_servers = ['localhost:9092']))
    files.append(open(os.path.join(os.getcwd(),"194161016-"+matchID+"-Commentary.txt"),"r"))
def writeData(producer,line):
    try:
        matchInfo,message = line.split("$")
        matchId = matchInfo.split(",")[0]
        print(matchId + "::"+message)
        producer.send(matchId,value = bytes(message,encoding='utf-8'))
    except:
        return
removedFiles = []
while(len(files)>0):
    for i in range(len(files)):
        line = files[i].readline()
        if("END OF FILE" in line):
            removedFiles.append(files[i])
        else:
            writeData(producers[i],line)
    if(len(removedFiles)>0):
        tempFiles = [elem for elem in files if elem not in removedFiles]
        files = tempFiles
        removedFiles = []
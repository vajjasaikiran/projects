import tweepy,os,sys,json
from functions import fun1

with open(os.path.join(os.getcwd(),"tokens.json")) as f:
    tokenData = json.load(f)

api = fun1.initialiseAPIconnection(tokenData["consumerKey"],tokenData["consumerSecretKey"], tokenData["accessToken"], tokenData["accessTokenSecret"])
userId = input("Please enter a user Id\n")
if(not userId.isnumeric() or "." in userId):
    print("enter valid user id....exiting")
    exit()
userId = int(userId)
while(1):
    try:
        userInfo = api.get_user(user_id = userId)
        print("##########################################")
        print("Attribute".ljust(30) + "Values".ljust(30))
        print("Twitter userId".ljust(30)+ userInfo.id_str)
        print("Screen Name".ljust(30)+userInfo.screen_name)
        print("User Name".ljust(30)+userInfo.name)
        print("User Location".ljust(30)+userInfo.location)
        desciption = (str(userInfo.description).replace("\n",""))
        print("User Description".ljust(30)+desciption)
        print("Total Followers".ljust(30)+str(userInfo.followers_count))
        print("Total Statuses".ljust(30)+str(userInfo.statuses_count))
        if(userInfo.url == None):
            print("User URL".ljust(30)+"None")
        else:
            print("User URL".ljust(30)+userInfo.url)
        break
    except tweepy.TweepError as e:
        userId = input("Please try again by entering a valid userid\n")
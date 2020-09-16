import tweepy,os,sys,json
from functions import fun1

with open(os.path.join(os.getcwd(),"tokens.json")) as f:
    tokenData = json.load(f)

api = fun1.initialiseAPIconnection(tokenData["consumerKey"],tokenData["consumerSecretKey"], tokenData["accessToken"], tokenData["accessTokenSecret"])
users = input("Please enter a user Id's with space seperation\n")
listOfUserIDs = users.split(" ")
followersList = []
friendsList = []
for userId in listOfUserIDs:
    if(not userId.isnumeric() or "." in userId):
        print("entered invalid user id:"+ userId+".....continuing with other user")
        continue
    userId = int(userId)
    try:
        userInfo = api.get_user(user_id = userId)
    except tweepy.TweepError as e:
        print("exception thrown by tweepy",e)
        continue
    for page in tweepy.Cursor(api.followers, user_id = userId,wait_on_rate_limit=True).pages():
        try:
            followersList.extend(page)
        except tweepy.TweepError as e:
            print(e)
    print("The followers list:")
    for followerInfo in followersList:
        try:
            print("  ->"+followerInfo.screen_name)
        except tweepy.TweepError as e:
            print(e)

    # friends list
    for page in tweepy.Cursor(api.friends_ids, user_id = int(userId),wait_on_rate_limit=True,count=1000).pages():
        try:
            friendsList.extend(page)
        except tweepy.TweepError as e:
            print(e)
    userScreenName = userInfo.screen_name
    frieList = []
    print("The friends list:")
    for friendId in friendsList:
        frieList = []
        friendScreenName = api.get_user(friendId).screen_name
        for page1 in tweepy.Cursor(api.friends, user_id = int(friendId),wait_on_rate_limit=True,count=1000).pages():
            try:
                frieList.extend(page1)
            except tweepy.TweepError as e:
                print(e)
        listOfFriendScreenNames = [f1.screen_name for f1 in frieList]
        if(userScreenName in listOfFriendScreenNames):
            print("  ->"+friendScreenName)

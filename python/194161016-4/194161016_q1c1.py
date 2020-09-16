import tweepy,os,sys,json
from functions import fun1

with open(os.path.join(os.getcwd(),"tokens.json")) as f:
    tokenData = json.load(f)

api = fun1.initialiseAPIconnection(tokenData["consumerKey"],tokenData["consumerSecretKey"], tokenData["accessToken"], tokenData["accessTokenSecret"])

keyword = input("please enter the keyword\n")
tweetObjects = []
for page in tweepy.Cursor(api.search, q = keyword,wait_on_rate_limit=True,count=1000).pages():
    try:
        tweetObjects.extend(page)
    except tweepy.TweepError as e:
        print(e)
tweetNumber = 1
if(len(tweetObjects)>=1):
    for tweet in tweetObjects:
        try:
            print("tweet",tweetNumber,":")
            print(tweet.text)
            tweetNumber += 1
        except tweepy.TweepError as e:
            print("Found exception:::::",e)
else:
    print("No results found for the given keyword in the last seven days")
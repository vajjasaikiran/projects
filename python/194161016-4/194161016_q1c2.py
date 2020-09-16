import tweepy,os,sys,json
from functions import fun1
from math import radians, cos, sin, asin, sqrt

with open(os.path.join(os.getcwd(),"tokens.json")) as f:
    tokenData = json.load(f)

api = fun1.initialiseAPIconnection(tokenData["consumerKey"],tokenData["consumerSecretKey"], tokenData["accessToken"], tokenData["accessTokenSecret"])
# calculating distance between two given latitudes and longiudes by using haversine formula
def haversine(lon1, lat1, lon2, lat2):
    lon1, lat1, lon2, lat2 = map(radians, [lon1, lat1, lon2, lat2])
    dlon = lon2 - lon1 
    dlat = lat2 - lat1 
    a = sin(dlat/2)**2 + cos(lat1) * cos(lat2) * sin(dlon/2)**2
    c = 2 * asin(sqrt(a)) 
    r = 6371
    return c * r

locations = input("please enter the latitudes and longitudes with space separations like long1, lat1, long2, lat2\n")
try:
    listOfValues = locations.split(" ")
    if(len(listOfValues) < 4):
        print("please enter 4 values long1, lat1, long2, lat2")
        print("exiting....")
        exit()
    long1, lat1, long2, lat2 = map(float,locations.split(" "))
except ValueError as e:
    print("Please enter real valued latitudes and longiudes in the form long1, lat1, long2, lat2....exiting")
    exit()

tweetObjects = []
circleDiameter = haversine(long1, lat1, long2, lat2)
circleRadius = circleDiameter/2
circleLat, circleLong = (lat1+lat2)/2, (long1+long2)/2
query = str(circleLat)+","+str(circleLong)+","+str(circleRadius)+"km"
for page in tweepy.Cursor(api.search, geocode=query,wait_on_rate_limit=True,count=1000).pages(5):
    try:
        tweetObjects.extend(page)
    except tweepy.TweepError as e:
        print(e)

tweetNumber = 1
for tweet in tweetObjects:
    try:
        tweet = tweet._json
        print("tweet",tweetNumber)
        print(tweet["text"])
        tweetNumber = tweetNumber+1
    except tweepy.TweepError as e:
        print("Exception thrown::::::::",e)
import tweepy
def initialiseAPIconnection(consumerKey, consumerSecretKey, accessToken, accessTokenSecret):
    auth = tweepy.OAuthHandler(consumerKey, consumerSecretKey)
    auth.set_access_token(accessToken, accessTokenSecret)
    api = tweepy.API(auth)
    return api
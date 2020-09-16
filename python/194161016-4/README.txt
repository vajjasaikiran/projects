My folder has 4 python files, 1 json file, functions folder and readme.txt file
Python files - four python programs for four questions
json file 
	- tokens.json which stores the access tokens, secret keys etc.All python programs use 		  these tokens to create connection with twitter api.
funcions folder 
	- it is a modukle which just has one python program fun1.py I have created a function 		initialiseAPIconnection() to initialise api connection using the tokens and return he api 		object. This functionality is also used by all programs.
Way to execute programs
Q1a - python 194161016_q1a.py
    - It asks to enter userid
    - If the userId is a valid userId it gives you the userInfo as desired with require
      attributes else prints error to enter valid userid.
Sample:python3 194161016_q1a.py
Please enter a user Id
12345678
Output will be printed onto the terminal itself


Q1b - python 194161016_q1b.py
    - It askes for list of userId's seperated with spaces
    - For every userId if the userId given is a valid one it prints the list of followers and
      friends list 
    - If any user is not valid it prints error message and continues to check with the next user 	in the list of userIds
Sample: python3 194161016_q1b.py
Please enter a user Id's with space seperation
1 2 3 4
output will be printed onto terminal


Q1c1 - python 194161016_q1c1.py
     - It asks to enter a keyword.
     - If it finds any tweets with the provided keywords , it will print the tweets onto the     terminal else it will print that no tweets were found in last seven days(Note: using basic account twitter api gives you only last seven days. If for any provided keyword if there are no tweets in last seven days, API will not return any tweets)
sample:
Please enter the keyword:
OnionPriceHike
output of tweets will be printed onto the terminal


Q1c2 - python 194161016_q1c1.py
     - It asks to enter latitudes and longitudes seperated by spaces
     - If the provided input is valid it prints the tweets emerging in the region
     - else prints error message
sample: python 194161016_q1c2.py
1 2 3 4
output will be printed onto the terminal


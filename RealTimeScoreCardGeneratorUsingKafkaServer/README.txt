This execution requires kafka server,java/jdk,zookeeper installed on your pc and kafka-python(pip install kafka-python) a python module for kafka operations.

194161016 folder has 2 python programs(producer program, consumer program), 45 commentary files(as 3 matches are abondonded) for producer to write data onto kafka server and a README file.
producer.py
    -> This is producer program which writes data onto kafka server.
    -> For checking of interleaving of messages I have included a print statement which shows - MATCHID::message on the terminal
    -> execute producer using python3 producer.py
consumer.py
    -> execute consumer using python3 consumer.py
    -> This is a consumer program which reads data from its corresponding topic and generates scorecards.
    -> Once you run consumer program it will take around 5 to 10 seconds for consumer threads to create and score cards will get generated for whatever data it has read till now and will keep on updating the score card ball by ball.
    -> For real time checking of updation of scorecard ball by ball for every match, please open scorecard files in some editors(like VSCODE etc.) as normal text editors will not show you updated data if the file is opened.


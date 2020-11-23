# Realtime cricket score card generator using kafka server

In this project I have implemented a simulation of real time cricket score card generator of all 2019 world cup matches using the data available on espncricinfo and used kafka libraries to simulate the real time data generation

We all watch live cricket commentary on various websites like espncricinfo, cricbuzz etc. Have you ever wondered how the cricet score cards are generated ball by ball in real time? We can achieve this with the use of real time event stream platform called Apache Kafka.

## Apache Kafka
We can define event streaming as a practice of capturing data in real-time from event generating sources like IOT sensors, smart applications, cloud applications, and software applications. storing these event streams, manipulating, processing these event streams in real-time. We can also route the event streams to different applications as needed.

Apache Kafka is one such open source distributed event streaming platform. It provides us with an infrastructure to stream the data real time and process them with minimum latency and high durability. More information at : [Apache kakfka](https://kafka.apache.org/documentation/#introduction) 

### In this project I developed logic to generate the cricket score cards, using the commentary data available on [espncricinfo](https://www.espncricinfo.com/scores/series/8039/season/2019/icc-cricket-world-cup?view=results)
As the world cup is completed we cannot capture the data and process them real time. So with the help of kafka server, I have created 45 topics, 45 producers and 45 consumers one  for every world cup match. Here every producer behaves as if producing the commentary data and pushing the data onto their corresponding topics. Consumer on the other side is responsible for consuming the commentary data and generating the score card for the data it has received at any point of time.  
I have done some preprosessing on the commentary data so that we can send the commentary data to the respective topics.

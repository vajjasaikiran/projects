/*
SQLyog Community Edition- MySQL GUI v6.07
Host - 5.6.21 : Database - saddc
*********************************************************************
Server version : 5.6.21
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `saddc`;

USE `saddc`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `clients` */

DROP TABLE IF EXISTS `clients`;

CREATE TABLE `clients` (
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `pubkey` blob,
  `prikey` blob,
  `status` varchar(10) DEFAULT NULL,
  `pubkey1` varchar(1000) DEFAULT NULL,
  `prikey1` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clients` */

insert  into `clients`(`name`,`username`,`password`,`email`,`contact`,`pubkey`,`prikey`,`status`,`pubkey1`,`prikey1`) values ('ali','ali','ali','aliincloudtechnologies@gmail.com','9639639630','0F0*ÜHŒ=+Å\02\0ÇàËµ6‚òÏπIY`÷Eu°9å÷Ó≥›∏Â\0Qá©è¨÷f\'¸@ãvQ \\ô{Å;','06\00*ÜHŒ=+Å\00îs%à˚V]√¯4µ¨Ï	5UUsÀ‰uÓ;','normal','Sun EC public key, 192 bits\n  public x coord: 3200704003448788386220697420055059211782311481653778561253\n  public y coord: 7765939834761239342288706131292904102594042711605215547\n  parameters: secp192k1 (1.3.132.0.31)','sun.security.ec.ECPrivateKeyImpl@52cd');

/*Table structure for table `cloud` */

DROP TABLE IF EXISTS `cloud`;

CREATE TABLE `cloud` (
  `sno` int(10) NOT NULL AUTO_INCREMENT,
  `fileid` varchar(10) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `filehash` varchar(1000) DEFAULT NULL,
  `sigb1` blob,
  `sigb2` blob,
  `sigb3` blob,
  `clientid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  UNIQUE KEY `sno` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cloud` */

insert  into `cloud`(`sno`,`fileid`,`filename`,`filehash`,`sigb1`,`sigb2`,`sigb3`,`clientid`) values (1,'file001','aa.txt','bf3f0eb42b79e2111a8ccb34cb7d64e287d65f8e','04)A‰˘#E^1º4/h≤b\Z±⁄??≈…}_\r\n?·Ù¶†¥?ƒch0C\r\n?c™7≥·','06?mÀ2≈™4?b±a?Œ¿DU˝”πi÷¢LΩ/0?‹Ò?r«ı~??GÌƒT‡ÆY','05#%¨Z¯5¿? N}R5æ∫Ch?•B÷?4!Í??Y?¥<ı¥¶&m‡¯-\"zy','ali');

/*Table structure for table `requesttoauditor` */

DROP TABLE IF EXISTS `requesttoauditor`;

CREATE TABLE `requesttoauditor` (
  `filename` varchar(100) DEFAULT NULL,
  `filedata` varchar(10000) DEFAULT NULL,
  `clientid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `requesttoauditor` */

insert  into `requesttoauditor`(`filename`,`filedata`,`clientid`) values ('aa.txt','BUILDING and applying any data mining model generally assumes that the underlying data is freely accessible. Often, this is not realistic. Privacy and security concerns restrict the sharing or centralization of data. Privacy- preserving data mining has emerged as an effective method to solve this problem [1]. Distributed solutions have been proposed that can preserve privacy while still enabling data mining. However, while perturbation based solutions do not provide stringent privacy, cryptographic solutions are too inefficient and infeasible to enable truly large scale analytics to face the era of big data. In this paper, we propose a solution that uses both randomization and cryptographic techniques to provide improved efficiency and security for several decision tree-based learning tasks. Indeed, to the best of our knowledge, the proposed solution provides an order of magnitude improvement in efficiency over existing solutions while providing more security. This is an effective solution to privacy-preserving data mining for the big data challenge. The proposed approach is based on random decision trees (RDT), developed by Fan et al. [2]. One important property of RDT is that the same code can be used for multiple data mining tasks: classification, regression, ranking and multiple classification [2], [3], [4]. As shown previously, the RDT is an efficient implementation of Bayes optimal classifier (BOC) [2], effective non-parametric density estimation [4], and can be explained via high order statistics such as moments [5]. The use of the multiple RDTs in various learning tasks offers many benefits over other traditional classification/tree building techniques, because its structure and progression lends itself to modification for distributed/ parallel tasks. RDT is also an excellent candidate for use in privacy preserving distributed data mining since: 1. Randomness in structure rather than simple perturbation of input/output is more effective?perturbing the input or output from a database to achieve privacy works, but the utility of the information garnered from data mining can be diminished if the perturbations are not carefully controlled, or conversely, information can be leaked if the information is not perturbed enough. Instead, we can exploit the design properties of RDT to generate trees that are random in structure, providing us with a similar end efect as perturbation without the associated pitfalls. A random structure provides security against leveraging a priori information to discover the entire classification model or instances. 2. Purely cryptographic approaches are often too slow to be practical and can become computationally expensive as the size of the data set increases and intercommunications between different parties increase. RDT provides a convenient escape from this paradigm thanks to its ','ali');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

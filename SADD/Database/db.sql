/*
SQLyog Community Edition- MySQL GUI v6.07
Host - 5.5.30 : Database - saddc
*********************************************************************
Server version : 5.5.30
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `saddc`;

USE `saddc`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `auditor` */

DROP TABLE IF EXISTS `auditor`;

CREATE TABLE `auditor` (
  `fileid` varchar(1000) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `filehash` varchar(1000) DEFAULT NULL,
  `block1` varchar(4000) DEFAULT NULL,
  `block2` varchar(4000) DEFAULT NULL,
  `block3` varchar(4000) DEFAULT NULL,
  `clientid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auditor` */

insert  into `auditor`(`fileid`,`filename`,`filehash`,`block1`,`block2`,`block3`,`clientid`) values ('file001','sa.txt','3b9768caff2a6eb730e4ca3a2a069244b292b834','A Secure and Dynamic Multi-keyword Ranked Search Scheme over Encrypted Cloud Data Due to the increasing popularity of cloud computing, more and more data owners are motivated to outsource their data to cloud servers for great convenience and reduced cost in data management. However, sensitive data should be encrypted before outsourcing for privacy requirements, which obsoletes data utilization like keyword-based document retrieval. In this paper, we presen','t a secure multi-keyword ranked search scheme over encrypted cloud data, which simultaneously supports dynamic update operations like deletion and insertion of documents. Specifically, the vector space model and the widely-used TF IDF model are combined in the index construction and query generation. We construct a special tree-based index structure and propose a ?Greedy Depth-first Search? algorithm to provide efficient multi-keyword ranked search. The se','cure kNN algorithm is utilized to encrypt the index and query vectors, and meanwhile ensure accurate relevance score calculation between encrypted index and query vectors. In order to resist statistical attacks, phantom terms are added to the index vector for blinding search results . Due to the use of our special tree-based index structure, the proposed scheme can achieve sub-linear search time and deal with the deletion and insertion of documents flexibly.','swamy'),('file0056','pro.txt','/²pcmNJN0\08{£´J´D“ô)Œ*½p°uíÝµ#@öoD‚Á˜–Ùôü²v','jº·bçÄÆ7txAÙ>öòZßH*/BÊï`Ü2r¾¾Öî4q„³cïËcÞ,œþªàÊ¤…Äl,ƒJCÅK®Ëa\ZD¨^€F7û—„P´\ZÄ¤V*l3ûóXÐÉex›Íw	ýã99èEìg‹ÂÉØ=MËÎ¨`_*~`¼¡¹)¨étµ²Êl\\™š¿¤y\"#­ÿ\nÀ‘¿¦6êÉŒ®JÏ\"ù_1Z½Ñ[žÞ«™rÛ€\rÊ4\\9weBHÌêÙ0\rg»6z8Ó©zSz¹\\\"M«œ*‘”+½\"&Z¡³H‚Ì“­NNª\0—þ8wCé\"8^%ÁLtµV ž#O¬êQ{].ìôDq„ÖB\\ýl\"','ŸT•ôéTX¡N—<Vœ\'¥%hì.DþôÓŽ$>æmgÜc¾OµÒ\0·oa@íæuÛÿÅÿÀwÙ;t¤…_:&¹ùä…–Ä5áû#¦àË.\'{¶­“ƒ˜y[7ÒÈ¶™ýë6Ur4*[¼!wþ„á‹7øø\Z£EÿxLü„½±¡o²ÖëÙR¶ø…hEhàu“B‡BdNa[\"Ý=¬\"äFÌ}¬<ÔÒ3Š3¶]žôd=óúÕœéKÉºå¦q¦¾Aú#ÂŠ$=—Òìr‘QÍ!^€¬ˆ2#ëlúä6±Œdí\nYûa‚Z]bºU©XÜ„²\"Ó_h¡7 Œe?Ç(ÊµQ+BP”páRMŒ,û','HWU—ÓúÙJž}‚œÜºŠ3¶]žôd=óúÕœéKä×ùÿPsH§\n\ZÙ¤©+ÄÐK/œ‰˜yOÙ²‡	Šð5ƒâ¬p‡Ü+´#%÷v¥X°ÿ1šR¤¦šž#{\"5Ÿ·ã½‹c¥‡4ˆÂß´ùºÑR§±ÞD\\drÛzx#¸-¥xK¸‰°\'6xáOtûGWëœû‡‹4å¡OSé~‰ž\"»ËlrrwB[L \0±ÈM,¨þs!w”š¥¶æPzØHÌqŸ}¿J]Šjœýrÿ-€ž‚©ºÇ\\ñ?è.ßQŒb­À³)³”ÏÆõ¥7ÙçÁ€Îè4ÉêÁ<\\MDž\rß©=¬ùœÑhMµmUÑ¯Ò” N#','swamy'),('file0057','pro.txt','—\"keõ0¿Kƒ°÷O²E{n=C¾	B­îØÅ™V Ÿ¹ õy¥ãjjÂ…_0','jº·bçÄÆ7txAÙ>öòZßH*/BÊï`Ü2r¾¾Öî4q„³cïËcÞ,œþªàÊ¤…Äl,ƒJCÅK®Ëa\ZD¨^€F7û—„P´\ZÄ¤V*l3ûóXÐÉex›Íw	ýã99èEìg‹ÂÉØ=MËÎ¨`_*~`¼¡¹)¨étµ²Êl\\™š¿¤y\"#­ÿ\nÀ‘¿¦6êÉŒ®JÏ\"ù_1Z½Ñ[žÞ«™rÛ€\rÊ4\\9weBHÌêÙ0\rg»6z8Ó©zSz¹\\\"M«œ*‘”+½\"&Z¡³H‚Ì“­NNª\0—þ8wCé\"8^%ÁLtµV ž#O¬êQ{].ìôDq„ÖB\\ýl\"','ŸT•ôéTX¡N—<Vœ\'¥%hì.DþôÓŽ$>æmgÜc¾OµÒ\0·oa@íæuÛÿÅÿÀwÙ;t¤…_:&¹ùä…–Ä5áû#¦àË.\'{¶­“ƒ˜y[7ÒÈ¶™ýë6Ur4*[¼!wþ„á‹7øø\Z£EÿxLü„½±¡o²ÖëÙR¶ø…hEhàu“B‡BdNa[\"Ý=¬\"äFÌ}¬<ÔÒ3Š3¶]žôd=óúÕœéKÉºå¦q¦¾Aú#ÂŠ$=—Òìr‘QÍ!^€¬ˆ2#ëlúä6±Œdí\nYûa‚Z]bºU©XÜ„²\"Ó_h¡7 Œe?Ç(ÊµQ+BP”páRMŒ,û','HWU—ÓúÙJž}‚œÜºŠ3¶]žôd=óúÕœéKä×ùÿPsH§\n\ZÙ¤©+ÄÐK/œ‰˜yOÙ²‡	Šð5ƒâ¬p‡Ü+´#%÷v¥X°ÿ1šR¤¦šž#{\"5Ÿ·ã½‹c¥‡4ˆÂß´ùºÑR§±ÞD\\drÛzx#¸-¥xK¸‰°\'6xáOtûGWëœû‡‹4å¡OSé~‰ž\"»ËlrrwB[L \0±ÈM,¨þs!w”š¥¶æPzØHÌqŸ}¿J]Šjœýrÿ-€ž‚©ºÇ\\ñ?è.ßQŒb­À³)³”ÏÆõ¥7ÙçÁ€Îè4ÉêÁ<\\MDž\rß©=¬ùœÑhMµmUÑ¯Ò” N#','swamy');

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

insert  into `clients`(`name`,`username`,`password`,`email`,`contact`,`pubkey`,`prikey`,`status`,`pubkey1`,`prikey1`) values ('swamy','swamy','swamy','aliincloudtechnologies@gmail.com','8522991105','0F0*�H�=+�\02\0Oke�,�fb��=�t��p�w\rF�ڡ���{�24���.��6^\n= Iِ','06\00*�H�=+�\00;��6[	ϗ	�e�#�$�=đ�Q','normal','Sun EC public key, 192 bits\n  public x coord: 1947361067186639605480228207760606363595841180483554774342\n  public y coord: 5636004341510325751201561473551257810500269848567109769616\n  parameters: secp192k1 (1.3.132.0.31)','sun.security.ec.ECPrivateKeyImpl@ffffd768');

/*Table structure for table `cloud` */

DROP TABLE IF EXISTS `cloud`;

CREATE TABLE `cloud` (
  `sno` int(10) NOT NULL AUTO_INCREMENT,
  `fileid` varchar(10) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `filehash` varchar(1000) DEFAULT NULL,
  `block1` varchar(10000) DEFAULT NULL,
  `block2` varchar(4000) DEFAULT NULL,
  `block3` varchar(4000) DEFAULT NULL,
  `clientid` varchar(100) DEFAULT NULL,
  `stats` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  UNIQUE KEY `sno` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

/*Data for the table `cloud` */

insert  into `cloud`(`sno`,`fileid`,`filename`,`filehash`,`block1`,`block2`,`block3`,`clientid`,`stats`) values (55,'file001','sa.txt','3b9768caff2a6eb730e4ca3a2a069244b292b834','A Secure and Dynamic Multi-keyword Ranked Search Scheme over Encrypted Cloud Data Due to the increasing popularity of cloud computing, more and more data owners are motivated to outsource their data to cloud servers for great convenience and reduced cost in data management. However, sensitive data should be encrypted before outsourcing for privacy requirements, which obsoletes data utilization like keyword-based document retrieval. In this paper, we presen','t a secure multi-keyword ranked search scheme over encrypted cloud data, which simultaneously supports dynamic update operations like deletion and insertion of documents. Specifically, the vector space model and the widely-used TF IDF model are combined in the index construction and query generation. We construct a special tree-based index structure and propose a ?Greedy Depth-first Search? algorithm to provide efficient multi-keyword ranked search. The se','cure kNN algorithm is utilized to encrypt the index and query vectors, and meanwhile ensure accurate relevance score calculation between encrypted index and query vectors. In order to resist statistical attacks, phantom terms are added to the index vector for blinding search results . Due to the use of our special tree-based index structure, the proposed scheme can achieve sub-linear search time and deal with the deletion and insertion of documents flexibly.','swamy','SecCloud'),(56,'file0056','pro.txt','/²pcmNJN0\08{£´J´D“ô)Œ*½p°uíÝµ#@öoD‚Á˜–Ùôü²v','jº·bçÄÆ7txAÙ>öòZßH*/BÊï`Ü2r¾¾Öî4q„³cïËcÞ,œþªàÊ¤…Äl,ƒJCÅK®Ëa\ZD¨^€F7û—„P´\ZÄ¤V*l3ûóXÐÉex›Íw	ýã99èEìg‹ÂÉØ=MËÎ¨`_*~`¼¡¹)¨étµ²Êl\\™š¿¤y\"#­ÿ\nÀ‘¿¦6êÉŒ®JÏ\"ù_1Z½Ñ[žÞ«™rÛ€\rÊ4\\9weBHÌêÙ0\rg»6z8Ó©zSz¹\\\"M«œ*‘”+½\"&Z¡³H‚Ì“­NNª\0—þ8wCé\"8^%ÁLtµV ž#O¬êQ{].ìôDq„ÖB\\ýl\"','ŸT•ôéTX¡N—<Vœ\'¥%hì.DþôÓŽ$>æmgÜc¾OµÒ\0·oa@íæuÛÿÅÿÀwÙ;t¤…_:&¹ùä…–Ä5áû#¦àË.\'{¶­“ƒ˜y[7ÒÈ¶™ýë6Ur4*[¼!wþ„á‹7øø\Z£EÿxLü„½±¡o²ÖëÙR¶ø…hEhàu“B‡BdNa[\"Ý=¬\"äFÌ}¬<ÔÒ3Š3¶]žôd=óúÕœéKÉºå¦q¦¾Aú#ÂŠ$=—Òìr‘QÍ!^€¬ˆ2#ëlúä6±Œdí\nYûa‚Z]bºU©XÜ„²\"Ó_h¡7 Œe?Ç(ÊµQ+BP”páRMŒ,û','HWU—ÓúÙJž}‚œÜºŠ3¶]žôd=óúÕœéKä×ùÿPsH§\n\ZÙ¤©+ÄÐK/œ‰˜yOÙ²‡	Šð5ƒâ¬p‡Ü+´#%÷v¥X°ÿ1šR¤¦šž#{\"5Ÿ·ã½‹c¥‡4ˆÂß´ùºÑR§±ÞD\\drÛzx#¸-¥xK¸‰°\'6xáOtûGWëœû‡‹4å¡OSé~‰ž\"»ËlrrwB[L \0±ÈM,¨þs!w”š¥¶æPzØHÌqŸ}¿J]Šjœýrÿ-€ž‚©ºÇ\\ñ?è.ßQŒb­À³)³”ÏÆõ¥7ÙçÁ€Îè4ÉêÁ<\\MDž\rß©=¬ùœÑhMµmUÑ¯Ò” N#','swamy','SecCloud1'),(57,'file0057','pro.txt','—\"keõ0¿Kƒ°÷O²E{n=C¾	B­îØÅ™V Ÿ¹ õy¥ãjjÂ…_0','jº·bçÄÆ7txAÙ>öòZßH*/BÊï`Ü2r¾¾Öî4q„³cïËcÞ,œþªàÊ¤…Äl,ƒJCÅK®Ëa\ZD¨^€F7û—„P´\ZÄ¤V*l3ûóXÐÉex›Íw	ýã99èEìg‹ÂÉØ=MËÎ¨`_*~`¼¡¹)¨étµ²Êl\\™š¿¤y\"#­ÿ\nÀ‘¿¦6êÉŒ®JÏ\"ù_1Z½Ñ[žÞ«™rÛ€\rÊ4\\9weBHÌêÙ0\rg»6z8Ó©zSz¹\\\"M«œ*‘”+½\"&Z¡³H‚Ì“­NNª\0—þ8wCé\"8^%ÁLtµV ž#O¬êQ{].ìôDq„ÖB\\ýl\"','ŸT•ôéTX¡N—<Vœ\'¥%hì.DþôÓŽ$>æmgÜc¾OµÒ\0·oa@íæuÛÿÅÿÀwÙ;t¤…_:&¹ùä…–Ä5áû#¦àË.\'{¶­“ƒ˜y[7ÒÈ¶™ýë6Ur4*[¼!wþ„á‹7øø\Z£EÿxLü„½±¡o²ÖëÙR¶ø…hEhàu“B‡BdNa[\"Ý=¬\"äFÌ}¬<ÔÒ3Š3¶]žôd=óúÕœéKÉºå¦q¦¾Aú#ÂŠ$=—Òìr‘QÍ!^€¬ˆ2#ëlúä6±Œdí\nYûa‚Z]bºU©XÜ„²\"Ó_h¡7 Œe?Ç(ÊµQ+BP”páRMŒ,û','HWU—ÓúÙJž}‚œÜºŠ3¶]žôd=óúÕœéKä×ùÿPsH§\n\ZÙ¤©+ÄÐK/œ‰˜yOÙ²‡	Šð5ƒâ¬p‡Ü+´#%÷v¥X°ÿ1šR¤¦šž#{\"5Ÿ·ã½‹c¥‡4ˆÂß´ùºÑR§±ÞD\\drÛzx#¸-¥xK¸‰°\'6xáOtûGWëœû‡‹4å¡OSé~‰ž\"»ËlrrwB[L \0±ÈM,¨þs!w”š¥¶æPzØHÌqŸ}¿J]Šjœýrÿ-€ž‚©ºÇ\\ñ?è.ßQŒb­À³)³”ÏÆõ¥7ÙçÁ€Îè4ÉêÁ<\\MDž\rß©=¬ùœÑhMµmUÑ¯Ò” N#','swamy','SecCloud1');

/*Table structure for table `requesttoauditor` */

DROP TABLE IF EXISTS `requesttoauditor`;

CREATE TABLE `requesttoauditor` (
  `filename` varchar(100) DEFAULT NULL,
  `filedata` blob,
  `clientid` varchar(100) DEFAULT NULL,
  `stats` varchar(1000) DEFAULT NULL,
  `hash` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `requesttoauditor` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

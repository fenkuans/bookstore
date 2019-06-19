CREATE DATABASE bookshopping;

CREATE TABLE ec_user(
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(50) NOT NULL UNIQUE,
PASSWORD VARCHAR(50) NOT NULL,
NAME VARCHAR(50) NOT NULL,
sex SMALLINT UNSIGNED DEFAULT 1,
email VARCHAR(50),
phone SMALLINT UNSIGNED,
address VARCHAR(255),
role SMALLINT UNSIGNED DEFAULT 1,
create_date DATETIME,
disabled TINYINT(1) UNSIGNED DEFAULT 0,
active VARCHAR(255)
);
ALTER TABLE ec_user MODIFY phone VARCHAR(20);
CREATE TABLE ec_article_type(
CODE VARCHAR(100) PRIMARY KEY NOT NULL,
NAME VARCHAR(50) UNIQUE,
remark VARCHAR(200)
);

CREATE TABLE ec_article(
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(200) NOT NULL,
supplier VARCHAR(20),
price DOUBLE UNSIGNED NOT NULL,
discount DOUBLE UNSIGNED,
locality VARCHAR(200),
putaway_date DATETIME,
STORAGE INT UNSIGNED,
image VARCHAR(200),
description VARCHAR(500),
type_code VARCHAR(100),
create_date DATETIME,
disabled TINYINT(1) UNSIGNED DEFAULT 0,
FOREIGN KEY (type_code) REFERENCES ec_article_type(CODE)
);

CREATE TABLE ce_order(
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
order_code VARCHAR(20) UNIQUE,
create_date DATETIME,
send_date DATETIME,
STATUS VARCHAR(20),
amount DOUBLE UNSIGNED NOT NULL,
user_id INT UNSIGNED,
FOREIGN KEY (user_id) REFERENCES ec_user(id)
);

create table ec_order_item(
order_id int unsigned,
article_id int unsigned,
order_num int,
primary key(order_id,article_id),
foreign key (order_id) references ce_order(id),
foreign key (article_id) references ec_article(id)
);
insert into `ec_user` (`username`, `PASSWORD`, `NAME`, `SEX`, `EMAIL`, `PHONE`, `ADDRESS`, `ROLE`, `CREATE_DATE`) values('admin','123456','管理员','1','test@163.com','18998665678','珠江新城','2',NOW());
insert into `ec_user` (`username`, `PASSWORD`, `NAME`, `SEX`, `EMAIL`, `PHONE`, `ADDRESS`, `ROLE`, `CREATE_DATE`) values('test1','123456','张小棠','1','test1@163.com','13487890989','天河车陂','1',NOW());

insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0001','程序设计','程序设计');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010001','----程序设计','程序设计');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010002','----数据库','数据库');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010003','----计算机理论','计算机理论');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00010004','----计算机教材','计算机教材');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0002','小说','小说');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00020001','----社会','社会');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00020002','----言情','言情');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00020003','----悬疑','悬疑');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0003','文艺','文艺');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00030001','----文学','文学');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00030002','----传记','传记');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0004','青春','青春');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040001','----青春文学','青春文学');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040002','----动漫','动漫');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00040003','----幽默','幽默');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0005','励志/成功','励志/成功');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00050001','----修养','修养');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00050002','----成功','成功');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00050003','----职场','职场');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00050004','----沟通','沟通');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0006','少儿','少儿');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00060001','----0-2','0-2岁');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00060002','----3-6','3-6岁');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00060003','----7-10','7-10岁');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00060004','----11-14','11-14岁');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00060005','----科学','科学');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00060006','----图画书','图画书');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0007','生活','生活');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070001','----两性','两性');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070002','----孕期','孕期');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070003','----育儿','育儿');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070004','----亲子关系','亲子关系');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070005','----保健','保健');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070006','----运动','运动');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00070007','----美食','美食');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0008','管理','管理');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00080001','----经济','经济');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00080002','----会计','会计');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00080003','----人力资源','人力资源');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00080004','----创业','创业');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0009','教育','教育');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00090001','----教材','教材');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00090002','----外语','外语');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00090003','----考试','考试');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('00090004','----中小学教辅','中小学教辅');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0010','休闲/爱好','休闲/爱好');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0011','旅游/地图','旅游/地图');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0012','家庭/家居','家庭/家居');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0013','亲子/家教','亲子/家教');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0014','美食','美食');
insert into `ec_ARTICLE_type` (`CODE`, `NAME`, `REMARK`) values('0015','政治/军事','政治/军事');

insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('1','魔戒：插图珍藏版（200套限量编号版随机发送！）。天真无邪的哈比男孩佛罗多继承了一枚戒指，却发现它就是黑暗魔君索伦铸造的至尊魔戒，具有奴役全世界的力量。','(英国) J.R.R.托尔金 著','132.3','译林出版社','2012-06-19','100','22566493-1_b.jpg',' 天真无邪的哈比男孩佛罗多继承了一枚戒指，却发现它就是黑暗魔君索伦铸造的至尊魔戒，具有奴役全世界的力量。在甘道夫的指导下，佛罗多和精灵、矮人、哈比人、人类组成远征队，要将魔戒扔进末日火山口销毁。索伦已派出黑骑士四处搜寻这枚戒指，而魔戒又有强大的腐蚀力，会使佩戴者心灵扭曲；善的力量能否战胜恶的诱惑？这是一次异常艰险的远征……','00010002','2012-06-18');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('2','权威定本四大名著： 红楼梦 三国演义  水浒传  西游记 全国独家',NULL,'145.8','清华大学出版社',NULL,'100','20605371-1_a.jpg','权威定本四大名著： 红楼梦 三国演义  水浒传  西游记','00020001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('3','什么是什么》第一二合辑平装（全20册，一套来自德国的最权威、最畅销的少年儿童百科知识全书）','本社 编','147','湖北教育出版社',NULL,'100','20588965-1_b.jpg','书中所有照片都是第一手照片。这种情况在国内及国外的其他少年儿童百科全书中是很难看到的。因为书中所有照片都是来自全世界的顶级权威研究机构，所有照片非常精美、清晰。《太空航行》一书中有30多张照片来自美国航天局，其他照片来自欧洲航天局、美国射电天文台等','00010002','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('4','万物生光辉 ——邂逅最可爱的动物，感受最纯真的幽默。畅销全球30年自然写作经典，万物有灵且美系列自然小说之五',NULL,'23.6',NULL,NULL,'100','22639083-1_a.jpg', '描述','00020001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('5','爱你是最好的时光Ⅱ（终极大结局完结篇，当当网全国独家赠送匪我思存民国虐恋故事《兰烬》漫画版）',NULL,'17.6',NULL,NULL,'100','22630101-1_a.jpg', '描述','00020001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('6','曾国藩 （血祭 野焚 黑雨）全三册。曾国藩是中国近代史上有着巨大影响的人物。','唐浩明 著','65','春风文艺出版社',NULL,'100','20500323-1_a.jpg','毛泽东对友人黎锦熙说：“愚于近人，独服曾文正，观其收拾洪杨一役，完满无缺。使以今人易其位，其能如彼之完满乎？”','00010002','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('7','情感知识小说（男人帮+婚姻保卫战），《男人帮》这是一部情场知识喜剧小说。','唐浚，魏晓霞 著','48.1','春风文艺出版社',NULL,'100','22561316-1_a.jpg','《男人帮》这是一部情场知识喜剧小说。','00010002','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('9','林格伦作品选（9册/套）{最新精装典藏版}——长袜子皮皮之母林格伦作品精选集，累积销售1000多万册的儿童文学传世经典',NULL,'179.6',NULL,NULL,'100','21094590-1_a.jpg',null,'00020001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('10','白鹿原——中国首部当代名家名篇宣纸线装书，陈忠实先生亲笔签名签章限量珍藏版','陈忠实　著','360','春风文艺出版社',NULL,'100','22541642-1_a.jpg','白嘉轩，活的有自己的原则，硬气，不随波逐流，?然有很多地方落后于时代，但那是时代的局限，不能怪罪于他，他作为一个地主、族长、父亲、丈夫还是相当合格的，至少比鹿子霖磊落许多倍。 ','00010002','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('11','丁丁上学记套装（全二册，5000多位家长热评，小学生最佳学习方法原创读本，给你不一样的学习感觉！）','刘蕾','26.3','湖北教育出版社',NULL,'100','21065915-1_b.jpg','《丁丁上学记》是一套国内难得一见的小学生学习方法原创读本','00020001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('12','最后一次说爱你（美国纯爱疗伤小说天王最新力作，《分手信》粉丝钟爱的新故事，一本让你哭，让你笑，让你喜，让你悲，但就是放不下的书），主题歌《在你的笑容里看见天堂》','（美）米尔尼　著，全克林　译','18.2','译林出版社',NULL,'100','22504529-1_a.jpg','小说讲了一个相识、相爱、相扶、相守的爱情故事，也讲了人在面对生活中的伤痛时，释怀的诀窍……','00010002','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('13','用美国小孩的方法学英文（图解英语训练营全两册）',NULL,'48.1',NULL,NULL,'100','21035452-1_a.jpg',null,'00020001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('14','我爱写作文：小学生牛牛提高写作能力的36个趣味故事(上市1年多来，超过3万名家长指导孩子写作的趣味宝典)',NULL,'11.9',NULL,NULL,'100','20915608-1_a.jpg',null,'00010002','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('15','《大秦帝国》（全六部11卷平)。大秦帝国作为时代精神汇集的帝国，集中地体现了那个时代中华民族的强势生存精神。中华民族的整个文明体系其所以能够绵延如大河奔涌，秦帝国时代开创奠定的强势生存传统起了决定性的作用。','孙皓晖 著','255','河南文艺出版社',NULL,'100','20223971-1_a.jpg','《大秦帝国》是一部描述秦兴亡生灭过程的长卷历史小说。秦帝国崛起于铁血竞争的群雄列强之际，建立了一个强大统一的帝国，开创了一个全新的铁器文明。但她只有十五年生命，像流星一闪，轰鸣而逝。这巨大的历史落差与戏剧性的帝国命运中，隐藏了难以计数的神奇故事以及伟人名士的悲欢离合。','00010002','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('16','霍金经典著作套装（全4册）：时间简史（插图本）/果壳中的宇宙/大设计/霍金传（当当独家火热发售）',NULL,'108.8',NULL,NULL,'100','22564594-1_a.jpg','00010002',null,'2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('18','探索》（全14册）探索宇宙奥秘,让孩子的思维更加广阔。',NULL,'291.2',NULL,NULL,'100','22635929-1_a.jpg',null,'00010002','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('19','疯狂Java讲义精粹(含CD光盘1张)，最畅销的Java书籍。','李刚','60.8','电子工业出版社',NULL,'100','fkjava.jpg','《疯狂Java讲义精粹（含CD光盘1张）》是《疯狂Java讲义》的精粹版，　 本书同样保留了《疯狂Java讲义》的特性：　 本书基于Java 7完成，全面介绍了Java 7的新特性。','00010001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('20','疯狂Java讲义（附光盘 案例驱动 注解详细 李刚老师引爆编程激情）','李刚','79.2','电子工业出版社',NULL,'100','java.jpg','疯狂源自梦想，技术成就辉煌','00010001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('21','轻量级Java EE企业应用实战——Struts 2＋Spring＋Hibernate整合开发（附光盘）','李刚','89','电子工业出版社',NULL,'100','framework.jpg','本书是《轻量级J2EE企业应用实战》的第二版，同时还融合了《整合Struts+Hibernate+Spring应用开发详解》理论部分。实际上，本书凝结了前两本书的精华部分。','00010001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('22','经典Java EE企业应用实战——基于WebLogic/JBoss的JSF+EJB 3+JPA整合开发(含CD光盘1张)','李刚','59.2','电子工业出版社',NULL,'100','javaee.jpg','本书介绍了Java EE规范的三大主要规范JSF、EJB 3和JPA，其中JSF是Sun公司提供的JSF RI；EJB 3部分则包含Session Bean、Message Driven Bean的详细介绍。','00010001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('23','Struts 2.1权威指南——基于WebWork核心的MVC开发（含光盘1张）','李刚','63.8','电子工业出版社',NULL,'100','struts.jpg','本书是《Struts 2权威指南》的第二版，本书介绍的Struts 2是最新的Struts 2.1。','00010001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('24','疯狂Ajax讲义——Prototype/jQuery+DWR+Spring+Hibernate整合开发（含光盘一张）','李刚','50.3','电子工业出版社',NULL,'100','ajax.jpg','全书主要分为三个部分。第一部分介绍了XHTML、CSS、JavaScript和DOM编程等内容。第二部分详细介绍了Prototype、jQuery、DWR、AjaxTags等四个最常用的Ajax框架的用法，并针对每个框架提供了一个实用案例。','00010001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('25','疯狂XML讲义(含光盘1张)，包括DTD、Schema等技术的深入讲解。','李刚','48.8','电子工业出版社',NULL,'100','xml.jpg','本书主要以XML为核心，深入地介绍了XML的各种相关知识。','00010001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('26','疯狂Java：突破程序员基本功的16课(修订版)','李刚','44.2','电子工业出版社',NULL,'100','basic.jpg','《疯狂Java：突破程序员基本功的16课(修订版)》是Java领域著名研究专家、Java语言培训导师、“疯狂Java”创始人李刚老师的又一倾心力作。','00010001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('27','疯狂Android讲义(含CD光盘1张)','李刚','60.6','电子工业出版社',NULL,'100','android.jpg','　本书全面地介绍了Android应用开发的相关知识，全书内容覆盖了Android用户界面编程、Android四大组件、Android资源访问、图形/图像处理、事件处理机制、Android输入/输出处理、音频/视频多媒体应用开发、OpenGL与3D应用开发、网络通信编程、Android平台的Web Service、传感器应用开发、GPS应用开发、Google Map服务等。','00010001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('28','肖申克的救赎。本书是斯蒂芬·金最为人精精乐道的杰出代表作，收入了他的四部中篇小说。其英文版一经推出，即登上《纽约时报》畅销书排行榜的冠军之位，当年在美国狂销二十八万册。目前，这本书已经被翻译成三十一种语言，同时创下了收录的四篇小说中有三篇被改编成轰动一时的电影的记录。','（美）金 著，施寄青，赵永芬，齐若兰','19.9','人民文学出版社',NULL,'100','9198692-1_l.jpg','本书是斯蒂芬·金最为人精精乐道的杰出代表作，收入了他的四部中篇小说。其英文版一经推出，即登上《纽约时报》畅销书排行榜的冠军之位，当年在美国狂销二十八万册。目前，这本书已经被翻译成三十一种语言，同时创下了收录的四篇小说中有三篇被改编成轰动一时的电影的记录。其中最为人精精乐道的便是曾获奥斯卡奖七项提名、被称为电影史上最完美影片的《肖申克救赎》（又译《刺激一九九五》）。','00020001','2012-06-11');
insert into `ec_ARTICLE` (`ID`, `TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('29','达·芬奇密码。让人绞尽脑汁的密码，就隐藏在列昂纳多·达·芬奇的艺术作品当中；令人绝望的角逐，就在遍布欧洲的大教堂和城堡里展开；令人震惊的事实真相，在掩盖了数百年之后，终于被撩起了神秘的面纱。','（美）布朗 著，朱振武 等译','16.3','人民文学出版社',NULL,'100','20559673-1_a.jpg','　《达·芬奇密码》引人入胜。对热爱探究历史的人、喜爱耍弄诡计的人、热衷猜谜的人以及任何醉心于离奇故事的人而言，它几近完美。','00020001','2012-06-11');

insert into `ec_ARTICLE` (`TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('计算机基础(一)','朱振武 等译','16.3','人民文学出版社',NULL,'100','20970893-1_a.jpg','　诡计的人、几近完美。','00010003','2012-06-11');
insert into `ec_ARTICLE` (`TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('计算机基础(二)','朱振武 等译','16.3','人民文学出版社',NULL,'100','20970893-1_a.jpg','　诡计的人、几近完美。','00010003','2012-06-11');
insert into `ec_ARTICLE` (`TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('计算机基础(三)','朱振武 等译','16.3','人民文学出版社',NULL,'100','20970893-1_a.jpg','　诡计的人、几近完美。','00010003','2012-06-11');
insert into `ec_ARTICLE` (`TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('计算机基础(四)','朱振武 等译','16.3','人民文学出版社',NULL,'100','20970893-1_a.jpg','　诡计的人、几近完美。','00010003','2012-06-11');


insert into `ec_ARTICLE` (`TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('计算机教材(一)','朱振武 等译','56.3','人民文学出版社',NULL,'100','20915608-1_a.jpg','　诡计的人、几近完美。','00010004','2012-06-11');
insert into `ec_ARTICLE` (`TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('计算机教材(二)','朱振武 等译','46.3','人民文学出版社',NULL,'100','22564594-1_a.jpg','　诡计的人、几近完美。','00010004','2012-06-11');
insert into `ec_ARTICLE` (`TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('计算机教材(三)','朱振武 等译','76.3','人民文学出版社',NULL,'100','20915608-1_a.jpg','　诡计的人、几近完美。','00010004','2012-06-11');
insert into `ec_ARTICLE` (`TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('计算机教材(四)','朱振武 等译','56.3','人民文学出版社',NULL,'100','22564594-1_a.jpg','　诡计的人、几近完美。','00010004','2012-06-11');
insert into `ec_ARTICLE` (`TITLE`, `supplier`, `PRICE`, `locality`, `putaway_date`, `storage`, `IMAGE`, `DESCRIPTION`, `TYPE_CODE`, `CREATE_DATE`) values('计算机教材(五)','朱振武 等译','66.3','人民文学出版社',NULL,'100','22564594-1_a.jpg','　诡计的人、几近完美。','00010004','2012-06-11');


select * from ec_article_type where length(code)=4;
select * from ec_article_type where code like '0001%';
select * from ec_article;
select * from ec_article_type;

show create table ec_article;
show create table ec_article_type;

create table ec_car(
    id int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    article_code varchar(20),
    article_pices double,
    article_numb int,
    user_id int not null
);

show create table ec_user;
select name from ec_user where id=1;
select * from ec_article_type  where length(code)=4;
select * from ec_article_type where code like '0001%' and length(CODE)>4;


select * from ec_article where id=1 limit 0,60 ;
select * from ec_article where type_code like '0%' limit 0,9;
select * from ec_article where type_code like '0%' limit 9,9;

select count(*) from ec_article where type_code like '%'
show create table ec_car;
show create table ec_article;
alter table ec_car change article_code article_id int(10) after id;
alter table ec_car drop column article_pices;

select a.image,a.title,a.price,c.article_numb,c.user_id,a.id from ec_article a inner join ec_car c where a.id=c.article_id and c.user_id=2;
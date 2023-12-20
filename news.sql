/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : news

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 20/12/2023 09:42:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻编号',
  `NEWSTITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `NEWSCONTENT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻内容',
  `USERID` int(11) NOT NULL COMMENT '新闻发布人名称',
  `CREATETIME` datetime NULL DEFAULT NULL COMMENT '新闻发布时间',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `USERID`(`USERID`) USING BTREE,
  CONSTRAINT `USERID` FOREIGN KEY (`USERID`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '恭喜EDG夺冠！！！', 'EDG2021年夺得英雄联盟世界赛总冠军！恭喜！！祝贺！！！', 1, '2021-12-18 18:25:07');
INSERT INTO `news` VALUES (2, '墨西哥UFO', '墨西哥首次发现外星人遗骸', 2, '2023-11-07 20:09:24');
INSERT INTO `news` VALUES (3, '日本排放核污水，污染大海', '日本不顾国际组织和他国反对意见，坚持排放核污水入海，造成污染严重！', 2, '2023-10-04 22:21:27');
INSERT INTO `news` VALUES (6, '世界杯足球赛落户中国', '国际足球联合会宣布，下一届世界杯足球赛将在中国举办，这是中国足球迈向世界舞台的重要里程碑。', 2, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (7, '中国科学家发现新型病毒', '中国科学家在最新的研究中发现了一种新型病毒，引起了全球卫生领域的高度关注。', 1, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (8, '亚洲地区经济增长持续向好', '亚洲地区多个国家的经济增长保持良好势头，为全球经济复苏贡献了重要力量。', 3, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (9, '中国教育改革取得新进展', '中国教育改革在各个领域取得了新的进展，为培养更优秀的人才提供了良好环境。', 1, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (10, '国际合作推动环境保护', '国际社会加强合作，共同推动环境保护事业，为地球的可持续发展做出了积极贡献。', 1, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (11, '世界各地举办文化艺术节', '世界各地相继举办了文化艺术节，展示了各国独特的文化魅力和艺术创造力。', 3, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (12, '中国企业在国际市场上崭露头角', '中国企业通过创新和国际化战略，逐渐在国际市场上崭露头角，成为全球经济的重要参与者。', 1, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (13, '全球关注气候变化问题', '全球各国纷纷关注气候变化问题，加大减排力度，共同应对气候变化挑战。', 5, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (14, '中国医生援助非洲抗击疟疾', '中国医生积极援助非洲国家抗击疟疾，为当地人民的健康事业作出了重要贡献。', 5, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (15, '科技创新推动经济发展', '科技创新不断推动经济发展，为社会带来了新的机遇和变革。', 1, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (16, '全球贸易合作继续扩大', '全球各国之间的贸易合作不断扩大，为经济增长和国际交流注入了新的动力。', 5, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (17, '中国文化走向世界', '中国文化在国际舞台上获得越来越多的关注和认可，为增进各国人民的相互理解起到了重要作用。', 1, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (18, '世界各地举办体育赛事', '世界各地相继举办了多个体育赛事，激发了人们对体育运动的热爱和参与热情。', 6, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (19, '全球旅游业持续发展', '全球旅游业持续发展，为旅游目的地国家带来了经济收入和就业机会。', 6, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (20, '中国加强网络安全保护', '中国加强网络安全保护，采取一系列措施保障网络空间的安全和稳定。', 6, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (21, '国际合作推动医药研发', '国际合作在医药研发领域取得重要突破，为人类健康事业作出了贡献。', 1, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (22, '世界各国加强反恐合作', '世界各国加强反恐合作，共同维护地区和平与稳定。', 1, '2023-12-14 11:17:08');
INSERT INTO `news` VALUES (24, '周杰伦2023年7月发布新歌', '新专辑名为最伟大的作品，其中包含12首歌', 8, '2023-12-14 13:04:31');
INSERT INTO `news` VALUES (25, '小米澎湃OS发布', '小米全新自研系统澎湃OS，采用全新架构设计，流畅度大大提升。', 1, '2023-12-14 13:10:17');
INSERT INTO `news` VALUES (26, '中国天眼观测全宇宙', '中国天眼，世界上最大的单口径射电望远镜，持续以其强大的观测能力为全人类探索宇宙奥秘。', 3, '2023-12-17 01:14:46');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `favorites` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `role` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色（1是管理员，2是普通用户）',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '段奇乐', '123456', 20, '打游戏', '13839524495', '男', '1');
INSERT INTO `user` VALUES (2, '周杰伦', '12345', 21, '弹尤克里里', '18533985673', '男', '1');
INSERT INTO `user` VALUES (3, '王力宏', '123456', 22, '看电影', '13955729481', '男', '0');
INSERT INTO `user` VALUES (5, '方大同', 'abcdef', 21, '创作歌曲', '18967792621', '男', '0');
INSERT INTO `user` VALUES (6, '孙燕姿', '1234', 21, '看歌剧', '18977796845', '女', '0');
INSERT INTO `user` VALUES (7, '陶喆', 'melody', 28, '写歌', '16958473984', '男', '0');
INSERT INTO `user` VALUES (8, '薛之谦', '123456', 20, '篮球', '13939524499', '男', '0');
INSERT INTO `user` VALUES (10, '梁静茹', '1234', 25, '羽毛球', '15878933268', '女', '1');
INSERT INTO `user` VALUES (12, '科比', '2424', 24, '篮球', '12468752595', '男', '0');
INSERT INTO `user` VALUES (14, '赵云', '123456', 20, '篮球', '15894356276', '男', '0');
INSERT INTO `user` VALUES (15, '刘备', '123456', 43, '乒乓球', '17961457189', '男', '0');
INSERT INTO `user` VALUES (16, '关羽', 'guanyu', 42, '耍大刀', '17935145631', '男', '0');
INSERT INTO `user` VALUES (17, '武松', '123456', 26, '打老虎', '13697255589', '男', '0');
INSERT INTO `user` VALUES (19, '于禁', '123456', 23, '乒乓球', '13939524499', '男', '0');
INSERT INTO `user` VALUES (24, '周星驰', '123456', 28, '拍电影', '15699156824', '男', '0');
INSERT INTO `user` VALUES (25, '张三', '123456', NULL, NULL, NULL, NULL, '1');

SET FOREIGN_KEY_CHECKS = 1;

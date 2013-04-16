CREATE TABLE `Users` (
`GUID` varchar(200) NOT NULL,
`LoginName` varchar(200) NOT NULL COMMENT '登录名',
`Email` varchar(200) NOT NULL COMMENT '邮箱，支付宝帐号，用于收款',
`Password` varchar(200) NOT NULL COMMENT '密码',
`StageName` varchar(200) NOT NULL COMMENT '艺名',
`CreateTime` datetime NOT NULL COMMENT '用户注册时间',
`State` int NOT NULL COMMENT '状态\r\n0：禁用\r\n1：正常',
PRIMARY KEY (`GUID`) ,
UNIQUE INDEX (`GUID`)
);

CREATE TABLE `Addresses` (
`GUID` varchar(200) NOT NULL,
`UserID` varchar(200) NOT NULL,
`Consignee` varchar(200) NOT NULL COMMENT '收货人',
`Province` varchar(200) NOT NULL COMMENT '省',
`City` varchar(200) NOT NULL COMMENT '市',
`County` varchar(200) NOT NULL COMMENT '区/县',
`StreetAddress` varchar(200) NOT NULL COMMENT '街道地址',
`ZipCode` varchar(200) NOT NULL COMMENT '邮编',
`Mobile` varchar(200) NOT NULL COMMENT '手机号码',
`Phone` varchar(200) NOT NULL COMMENT '电话号码',
`IsDefault` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否默认地址',
PRIMARY KEY (`GUID`) 
);

CREATE TABLE `Orders` (
`GUID` varchar(200) NOT NULL,
`UserID` varchar(200) NOT NULL,
`DesignWorkID` varchar(200) NOT NULL COMMENT '设计ID',
`State` int NOT NULL COMMENT '状态\r\n1：等待买家付款\r\n2：买家已付款，等待卖家发货\r\n3：卖家已发货，等待买家确认\r\n4：交易成功结束\r\n5：交易中途关闭(已结束，未成功完成)',
`RefundState` int NULL COMMENT '退款状态\r\n0：未发生退款\r\n1：退款协议等待卖家确认中\r\n2：卖家不同意协议，等待买家修改\r\n3：退款成功\r\n4：退款关闭',
`WaitBuyerPayTime` datetime NULL COMMENT '创建时间/等待买家付款时间',
`WaitSellerSendGoodsTime` datetime NULL COMMENT '付款时间/买家已付款，等待卖家发货时间',
`WaitBuyerConfirmGoodsTime` datetime NULL COMMENT '发货时间/卖家已发货，等待买家确认时间',
`TradeFinishedTime` datetime NULL COMMENT '收款时间/交易成功结束时间',
`TradeClosedTime` datetime NULL COMMENT '交易关闭时间',
`RefundWaitSellerAgreeTime` datetime NULL COMMENT '买家申请退款时间/退款协议等待卖家确认时间',
`RefundSellerFefuseBuyerTime` datetime NULL COMMENT '卖家拒绝退款时间/等待买家修改时间',
`RefundSuccessTime` datetime NULL COMMENT '退款成功时间',
`RefundClosedTime` datetime NULL COMMENT '退款关闭时间',
`Subject` varchar(200) NOT NULL COMMENT '商品名称',
`Price` decimal(18,8) NOT NULL COMMENT '单价',
`Quantity` int NULL COMMENT '数量',
`Body` varchar(400) NULL COMMENT '商品描述',
`Consignee` varchar(200) NULL COMMENT '收件人姓名',
`Address` varchar(200) NULL COMMENT '收件地址',
`ZipCode` varchar(200) NULL COMMENT '邮编',
`Mobile` varchar(200) NULL COMMENT '手机号',
`Phone` varchar(200) NULL COMMENT '座机号',
`PayType` int NULL COMMENT '支付平台\r\n1：Alipay',
`PayOrderNo` varchar(200) NULL COMMENT '支付平台内流水号',
PRIMARY KEY (`GUID`) 
);

CREATE TABLE `DesignWorks` (
`GUID` varchar(200) NOT NULL,
`DesignerID` varchar(200) NOT NULL COMMENT '设计者ID',
`MaterialID` varchar(200) NOT NULL COMMENT '原料ID',
`SalesGoal` int NOT NULL COMMENT '销售目标',
`BasePrice` decimal(18,8) NOT NULL COMMENT '底价/单件',
`SellingPrice` decimal(18,8) NOT NULL COMMENT '售价/单件',
`StartTime` datetime NOT NULL COMMENT '创建时间/活动开始时间',
`EndTime` datetime NOT NULL COMMENT '活动截止时间',
`Title` varchar(200) NOT NULL COMMENT '活动标题',
`Description` varchar(5000) NOT NULL COMMENT '活动说明',
`Url` varchar(200) NULL COMMENT 'Url',
`SalesVolume` int NULL COMMENT '销售量/统计值',
`State` int NOT NULL COMMENT '状态\r\n-1：预售不足\r\n0：设计中\r\n1：预售中\r\n2：生产中\r\n3：发货中\r\n4：收款中\r\n5：返款中\r\n6：归档',
`ProcurementCost` decimal(18,8) NULL COMMENT '采购成本',
`ProductionCost` decimal(18,8) NULL COMMENT '生产成本',
`SendCost` decimal(18,8) NULL COMMENT '发货成本',
`CompletionTime` datetime NULL COMMENT '所有交易完成时间',
PRIMARY KEY (`GUID`) 
);

CREATE TABLE `Materials` (
`GUID` varchar(200) NOT NULL,
`TypeID` varchar(200) NOT NULL COMMENT '类型\r\n1：短袖T恤\r\n2：长袖T恤\r\n3：背心\r\n4：连帽衫',
`Name` varchar(200) NOT NULL COMMENT '原料编号',
`Price` decimal(18,8) NOT NULL DEFAULT 0 COMMENT '目前均价',
`Description` varchar(5000) NOT NULL,
`PictureNumber` int NOT NULL COMMENT '需要上传图片张数',
`State` int NOT NULL COMMENT '状态\r\n0：停产\r\n1：正常\r\n2：缺货\r\n3：停用/未启用',
PRIMARY KEY (`GUID`) 
);

CREATE TABLE `MaterialPriceLogs` (
`GUID` varchar(200) NOT NULL,
`MaterialID` varchar(200) NOT NULL,
`Price` decimal(18,8) NOT NULL COMMENT '价格',
`CreateTime` datetime NOT NULL COMMENT '录入时间',
PRIMARY KEY (`GUID`) 
);

CREATE TABLE `SingleLogin` (
`GUID` varchar(200) NOT NULL,
`UserID` varchar(200) NOT NULL,
`LoginTime` datetime NOT NULL COMMENT '登陆时间',
PRIMARY KEY (`GUID`) 
);

CREATE TABLE `MaterialTypes` (
`GUID` varchar(200) NOT NULL,
`ParentID` varchar(200) NULL,
`Index` int NOT NULL,
`Name` varchar(200) NOT NULL COMMENT '类型名称',
`IsLeafNode` bit NOT NULL DEFAULT b'1' COMMENT '是否是叶子节点',
`State` int NOT NULL COMMENT '状态\r\n0：停用\r\n1：正常\r\n',
PRIMARY KEY (`GUID`) 
);

CREATE TABLE `OrderDetails` (
`GUID` varchar(200) NOT NULL,
`OrderID` varchar(200) NOT NULL,
`Size` varchar(200) NULL COMMENT '尺码',
`Number` int NOT NULL COMMENT '购买数量',
PRIMARY KEY (`GUID`) 
);

CREATE TABLE `MaterialColors` (
`GUID` varchar(200) NOT NULL,
`MaterialID` varchar(200) NOT NULL,
`ColorName` varchar(200) NOT NULL,
`ColorCode` varchar(200) NOT NULL,
`IsDefault` bit NOT NULL DEFAULT b'0' COMMENT '是否是默认颜色',
`State` int NOT NULL COMMENT '状态\r\n0：停产\r\n1：正常\r\n2：缺货',
PRIMARY KEY (`GUID`) 
);

CREATE TABLE `MaterialPictures` (
`GUID` varchar(200) NOT NULL,
`MaterialID` varchar(200) NOT NULL,
`Name` varchar(200) NOT NULL COMMENT '图片名称(例：正面，背面)',
`Index` int NOT NULL COMMENT '排列序号',
`FileName` varchar(200) NOT NULL COMMENT '底图文件名',
`Width` int NOT NULL COMMENT '图片宽度',
`Height` int NOT NULL COMMENT '图片高度',
`Top` int NOT NULL COMMENT '上传图片距离上边界距离',
`Left` int NOT NULL COMMENT '上传图片距离左边界距离',
`UploadWidth` int NOT NULL COMMENT '上传图片宽度',
`UploadHeight` int NOT NULL COMMENT '上传图片高度',
PRIMARY KEY (`GUID`) 
);

CREATE TABLE `MaterialSizes` (
`GUID` varchar(200) NOT NULL,
`MaterialID` varchar(200) NOT NULL,
`SizeName` varchar(200) NOT NULL,
`IsDefault` bit NOT NULL,
PRIMARY KEY (`GUID`) 
);


ALTER TABLE `Addresses` ADD FOREIGN KEY (`UserID`) REFERENCES `Users` (`GUID`);
ALTER TABLE `DesignWorks` ADD FOREIGN KEY (`DesignerID`) REFERENCES `Users` (`GUID`);
ALTER TABLE `MaterialPriceLogs` ADD FOREIGN KEY (`MaterialID`) REFERENCES `Materials` (`GUID`);
ALTER TABLE `SingleLogin` ADD FOREIGN KEY (`UserID`) REFERENCES `Users` (`GUID`);
ALTER TABLE `Materials` ADD FOREIGN KEY (`TypeID`) REFERENCES `MaterialTypes` (`GUID`);
ALTER TABLE `DesignWorks` ADD FOREIGN KEY (`MaterialID`) REFERENCES `Materials` (`GUID`);
ALTER TABLE `OrderDetails` ADD FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`GUID`);
ALTER TABLE `Orders` ADD FOREIGN KEY (`DesignWorkID`) REFERENCES `DesignWorks` (`GUID`);
ALTER TABLE `MaterialColors` ADD FOREIGN KEY (`MaterialID`) REFERENCES `Materials` (`GUID`);
ALTER TABLE `MaterialPictures` ADD FOREIGN KEY (`MaterialID`) REFERENCES `Materials` (`GUID`);
ALTER TABLE `MaterialSizes` ADD FOREIGN KEY (`MaterialID`) REFERENCES `Materials` (`GUID`);
ALTER TABLE `Orders` ADD FOREIGN KEY (`UserID`) REFERENCES `Users` (`GUID`);


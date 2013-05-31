ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[DesignWorks] DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[MaterialPriceLogs] DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[SingleLogin] DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[Materials] DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[DesignWorks] DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[MaterialColors] DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[MaterialPictures] DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[MaterialSizes] DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT []
GO

DROP INDEX [] ON [dbo].[Users]
GO

ALTER TABLE [dbo].[Users]DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[Addresses]DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[Orders]DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[DesignWorks]DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[Materials]DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[MaterialPriceLogs]DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[SingleLogin]DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[MaterialTypes]DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[OrderDetails]DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[MaterialColors]DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[MaterialPictures]DROP CONSTRAINT []
GO
ALTER TABLE [dbo].[MaterialSizes]DROP CONSTRAINT []
GO

DROP TABLE [dbo].[Users]
GO
DROP TABLE [dbo].[Addresses]
GO
DROP TABLE [dbo].[Orders]
GO
DROP TABLE [dbo].[DesignWorks]
GO
DROP TABLE [dbo].[Materials]
GO
DROP TABLE [dbo].[MaterialPriceLogs]
GO
DROP TABLE [dbo].[SingleLogin]
GO
DROP TABLE [dbo].[MaterialTypes]
GO
DROP TABLE [dbo].[OrderDetails]
GO
DROP TABLE [dbo].[MaterialColors]
GO
DROP TABLE [dbo].[MaterialPictures]
GO
DROP TABLE [dbo].[MaterialSizes]
GO

CREATE TABLE [dbo].[Users] (
[GUID] nvarchar(200) NOT NULL,
[LoginName] nvarchar(200) NOT NULL,
[Email] nvarchar(200) NOT NULL,
[Password] nvarchar(200) NOT NULL,
[StageName] nvarchar(200) NOT NULL,
[CreateTime] datetime2(7) NOT NULL,
[State] int NOT NULL,
PRIMARY KEY ([GUID]) 
)
GO

CREATE UNIQUE INDEX ON [dbo].[Users] ([GUID] )
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Users', 
'COLUMN', N'LoginName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'登录名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'LoginName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登录名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'LoginName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Users', 
'COLUMN', N'Email')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'邮箱，支付宝帐号，用于收款'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'Email'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'邮箱，支付宝帐号，用于收款'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'Email'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Users', 
'COLUMN', N'Password')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'密码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'Password'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'密码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'Password'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Users', 
'COLUMN', N'StageName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'艺名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'StageName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'艺名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'StageName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Users', 
'COLUMN', N'CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户注册时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户注册时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'CreateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Users', 
'COLUMN', N'State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态
0：禁用
1：正常'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态
0：禁用
1：正常'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'State'
GO

CREATE TABLE [dbo].[Addresses] (
[GUID] nvarchar(200) NOT NULL,
[UserID] nvarchar(200) NOT NULL,
[Consignee] nvarchar(200) NOT NULL,
[Province] nvarchar(200) NOT NULL,
[City] nvarchar(200) NOT NULL,
[County] nvarchar(200) NOT NULL,
[StreetAddress] nvarchar(1000) NOT NULL,
[ZipCode] nvarchar(200) NOT NULL,
[Mobile] nvarchar(200) NOT NULL,
[Phone] nvarchar(200) NOT NULL,
[IsDefault] bit NOT NULL DEFAULT 0,
PRIMARY KEY ([GUID]) 
)
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'Consignee')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'收货人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Consignee'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'收货人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Consignee'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'Province')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'省'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Province'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'省'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Province'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'City')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'市'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'City'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'市'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'City'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'County')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'区/县'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'County'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'区/县'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'County'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'StreetAddress')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'街道地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'StreetAddress'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'街道地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'StreetAddress'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'ZipCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'邮编'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'ZipCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'邮编'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'ZipCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'Mobile')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'手机号码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Mobile'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'手机号码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Mobile'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'Phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'电话号码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'电话号码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'IsDefault')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否默认地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'IsDefault'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否默认地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'IsDefault'
GO

CREATE TABLE [dbo].[Orders] (
[GUID] nvarchar(200) NOT NULL,
[UserID] nvarchar(200) NOT NULL,
[DesignWorkID] nvarchar(200) NOT NULL,
[State] int NOT NULL,
[RefundState] int NULL,
[WaitBuyerPayTime] datetime2(7) NULL,
[WaitSellerSendGoodsTime] datetime2(7) NULL,
[WaitBuyerConfirmGoodsTime] datetime2(7) NULL,
[TradeFinishedTime] datetime2(7) NULL,
[TradeClosedTime] datetime2(7) NULL,
[RefundWaitSellerAgreeTime] datetime2(7) NULL,
[RefundSellerFefuseBuyerTime] datetime2(7) NULL,
[RefundSuccessTime] datetime2(7) NULL,
[RefundClosedTime] datetime2(7) NULL,
[Subject] nvarchar(200) NOT NULL,
[Price] decimal(18,8) NOT NULL,
[Quantity] int NULL,
[Body] nvarchar(MAX) NULL,
[Consignee] nvarchar(200) NULL,
[Address] nvarchar(200) NULL,
[ZipCode] nvarchar(200) NULL,
[Mobile] nvarchar(200) NULL,
[Phone] nvarchar(200) NULL,
[PayType] int NULL,
[PayOrderNo] nvarchar(200) NULL,
PRIMARY KEY ([GUID]) 
)
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'DesignWorkID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设计ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'DesignWorkID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设计ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'DesignWorkID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态
1：等待买家付款
2：买家已付款，等待卖家发货
3：卖家已发货，等待买家确认
4：交易成功结束
5：交易中途关闭(已结束，未成功完成)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态
1：等待买家付款
2：买家已付款，等待卖家发货
3：卖家已发货，等待买家确认
4：交易成功结束
5：交易中途关闭(已结束，未成功完成)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'RefundState')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'退款状态
0：未发生退款
1：退款协议等待卖家确认中
2：卖家不同意协议，等待买家修改
3：退款成功
4：退款关闭'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundState'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'退款状态
0：未发生退款
1：退款协议等待卖家确认中
2：卖家不同意协议，等待买家修改
3：退款成功
4：退款关闭'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundState'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'WaitBuyerPayTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间/等待买家付款时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'WaitBuyerPayTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间/等待买家付款时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'WaitBuyerPayTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'WaitSellerSendGoodsTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'付款时间/买家已付款，等待卖家发货时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'WaitSellerSendGoodsTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'付款时间/买家已付款，等待卖家发货时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'WaitSellerSendGoodsTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'WaitBuyerConfirmGoodsTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'发货时间/卖家已发货，等待买家确认时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'WaitBuyerConfirmGoodsTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发货时间/卖家已发货，等待买家确认时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'WaitBuyerConfirmGoodsTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'TradeFinishedTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'收款时间/交易成功结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'TradeFinishedTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'收款时间/交易成功结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'TradeFinishedTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'TradeClosedTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'交易关闭时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'TradeClosedTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'交易关闭时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'TradeClosedTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'RefundWaitSellerAgreeTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'买家申请退款时间/退款协议等待卖家确认时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundWaitSellerAgreeTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'买家申请退款时间/退款协议等待卖家确认时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundWaitSellerAgreeTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'RefundSellerFefuseBuyerTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'卖家拒绝退款时间/等待买家修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundSellerFefuseBuyerTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'卖家拒绝退款时间/等待买家修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundSellerFefuseBuyerTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'RefundSuccessTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'退款成功时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundSuccessTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'退款成功时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundSuccessTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'RefundClosedTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'退款关闭时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundClosedTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'退款关闭时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundClosedTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Subject')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'商品名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Subject'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'商品名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Subject'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Price')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'单价'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Price'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'单价'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Price'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Quantity')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Quantity'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Quantity'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Body')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'商品描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Body'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'商品描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Body'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Consignee')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'收件人姓名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Consignee'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'收件人姓名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Consignee'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Address')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'收件地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Address'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'收件地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Address'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'ZipCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'邮编'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'ZipCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'邮编'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'ZipCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Mobile')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'手机号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Mobile'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'手机号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Mobile'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'座机号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'座机号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'PayType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'支付平台
1：Alipay'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'PayType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'支付平台
1：Alipay'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'PayType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'PayOrderNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'支付平台内流水号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'PayOrderNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'支付平台内流水号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'PayOrderNo'
GO

CREATE TABLE [dbo].[DesignWorks] (
[GUID] nvarchar(200) NOT NULL,
[DesignerID] nvarchar(200) NOT NULL,
[MaterialID] nvarchar(200) NOT NULL,
[SalesGoal] int NOT NULL,
[BasePrice] decimal(18,8) NOT NULL,
[SellingPrice] decimal(18,8) NOT NULL,
[StartTime] datetime2(7) NOT NULL,
[EndTime] datetime2(7) NOT NULL,
[Title] nvarchar(200) NOT NULL,
[Description] nvarchar(MAX) NOT NULL,
[Url] nvarchar(200) NULL,
[SalesVolume] int NULL,
[State] int NOT NULL,
[ProcurementCost] decimal(18,8) NULL,
[ProductionCost] decimal(18,8) NULL,
[SendCost] decimal(18,8) NULL,
[CompletionTime] datetime2(7) NULL,
PRIMARY KEY ([GUID]) 
)
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'DesignerID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设计者ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'DesignerID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设计者ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'DesignerID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'MaterialID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'原料ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'MaterialID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'原料ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'MaterialID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'SalesGoal')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'销售目标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SalesGoal'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'销售目标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SalesGoal'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'BasePrice')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'底价/单件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'BasePrice'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'底价/单件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'BasePrice'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'SellingPrice')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'售价/单件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SellingPrice'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'售价/单件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SellingPrice'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'StartTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间/活动开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'StartTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间/活动开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'StartTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'EndTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'活动截止时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'EndTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'活动截止时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'EndTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'Title')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'活动标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'Title'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'活动标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'Title'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'Description')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'活动说明'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'Description'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'活动说明'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'Description'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'Url')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'Url'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'Url'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Url'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'Url'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'SalesVolume')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'销售量/统计值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SalesVolume'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'销售量/统计值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SalesVolume'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态
-1：预售不足
0：设计中
1：预售中
2：生产中
3：发货中
4：收款中
5：返款中
6：归档'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态
-1：预售不足
0：设计中
1：预售中
2：生产中
3：发货中
4：收款中
5：返款中
6：归档'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'ProcurementCost')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'采购成本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'ProcurementCost'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'采购成本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'ProcurementCost'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'ProductionCost')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'生产成本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'ProductionCost'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生产成本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'ProductionCost'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'SendCost')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'发货成本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SendCost'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发货成本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SendCost'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'CompletionTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'所有交易完成时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'CompletionTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'所有交易完成时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'CompletionTime'
GO

CREATE TABLE [dbo].[Materials] (
[GUID] nvarchar(200) NOT NULL,
[TypeID] nvarchar(200) NOT NULL,
[Name] nvarchar(200) NOT NULL,
[Price] decimal(18,8) NOT NULL DEFAULT 0,
[Description] nvarchar(MAX) NOT NULL,
[PictureNumber] int NOT NULL,
[State] int NOT NULL,
PRIMARY KEY ([GUID]) 
)
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Materials', 
'COLUMN', N'TypeID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型
1：短袖T恤
2：长袖T恤
3：背心
4：连帽衫'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'TypeID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型
1：短袖T恤
2：长袖T恤
3：背心
4：连帽衫'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'TypeID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Materials', 
'COLUMN', N'Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'原料编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'原料编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Materials', 
'COLUMN', N'Price')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'目前均价'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'Price'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'目前均价'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'Price'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Materials', 
'COLUMN', N'PictureNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'需要上传图片张数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'PictureNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'需要上传图片张数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'PictureNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Materials', 
'COLUMN', N'State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态
0：停产
1：正常
2：缺货
3：停用/未启用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态
0：停产
1：正常
2：缺货
3：停用/未启用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'State'
GO

CREATE TABLE [dbo].[MaterialPriceLogs] (
[GUID] nvarchar(200) NOT NULL,
[MaterialID] nvarchar(200) NOT NULL,
[Price] decimal(18,8) NOT NULL,
[CreateTime] datetime2(7) NOT NULL,
PRIMARY KEY ([GUID]) 
)
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPriceLogs', 
'COLUMN', N'Price')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'价格'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPriceLogs'
, @level2type = 'COLUMN', @level2name = N'Price'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'价格'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPriceLogs'
, @level2type = 'COLUMN', @level2name = N'Price'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPriceLogs', 
'COLUMN', N'CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'录入时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPriceLogs'
, @level2type = 'COLUMN', @level2name = N'CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'录入时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPriceLogs'
, @level2type = 'COLUMN', @level2name = N'CreateTime'
GO

CREATE TABLE [dbo].[SingleLogin] (
[GUID] nvarchar(200) NOT NULL,
[UserID] nvarchar(200) NOT NULL,
[LoginTime] datetime2(7) NOT NULL,
PRIMARY KEY ([GUID]) 
)
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SingleLogin', 
'COLUMN', N'LoginTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'登陆时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SingleLogin'
, @level2type = 'COLUMN', @level2name = N'LoginTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登陆时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SingleLogin'
, @level2type = 'COLUMN', @level2name = N'LoginTime'
GO

CREATE TABLE [dbo].[MaterialTypes] (
[GUID] nvarchar(200) NOT NULL,
[ParentID] nvarchar(200) NULL,
[Index] int NOT NULL,
[Name] nvarchar(200) NOT NULL,
[IsLeafNode] bit NOT NULL DEFAULT 1,
[State] int NOT NULL,
PRIMARY KEY ([GUID]) 
)
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialTypes', 
'COLUMN', N'Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialTypes'
, @level2type = 'COLUMN', @level2name = N'Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialTypes'
, @level2type = 'COLUMN', @level2name = N'Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialTypes', 
'COLUMN', N'IsLeafNode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否是叶子节点'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialTypes'
, @level2type = 'COLUMN', @level2name = N'IsLeafNode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否是叶子节点'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialTypes'
, @level2type = 'COLUMN', @level2name = N'IsLeafNode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialTypes', 
'COLUMN', N'State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态
0：停用
1：正常
'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialTypes'
, @level2type = 'COLUMN', @level2name = N'State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态
0：停用
1：正常
'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialTypes'
, @level2type = 'COLUMN', @level2name = N'State'
GO

CREATE TABLE [dbo].[OrderDetails] (
[GUID] nvarchar(200) NOT NULL,
[OrderID] nvarchar(200) NOT NULL,
[Size] nvarchar(200) NULL,
[Number] int NOT NULL,
PRIMARY KEY ([GUID]) 
)
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'OrderDetails', 
'COLUMN', N'Size')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'尺码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OrderDetails'
, @level2type = 'COLUMN', @level2name = N'Size'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'尺码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OrderDetails'
, @level2type = 'COLUMN', @level2name = N'Size'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'OrderDetails', 
'COLUMN', N'Number')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'购买数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OrderDetails'
, @level2type = 'COLUMN', @level2name = N'Number'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'购买数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OrderDetails'
, @level2type = 'COLUMN', @level2name = N'Number'
GO

CREATE TABLE [dbo].[MaterialColors] (
[GUID] nvarchar(200) NOT NULL,
[MaterialID] nvarchar(200) NOT NULL,
[ColorName] nvarchar(200) NOT NULL,
[ColorCode] nvarchar(200) NOT NULL,
[IsDefault] bit NOT NULL DEFAULT 0,
[State] int NOT NULL,
PRIMARY KEY ([GUID]) 
)
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialColors', 
'COLUMN', N'IsDefault')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否是默认颜色'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialColors'
, @level2type = 'COLUMN', @level2name = N'IsDefault'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否是默认颜色'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialColors'
, @level2type = 'COLUMN', @level2name = N'IsDefault'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialColors', 
'COLUMN', N'State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态
0：停产
1：正常
2：缺货'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialColors'
, @level2type = 'COLUMN', @level2name = N'State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态
0：停产
1：正常
2：缺货'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialColors'
, @level2type = 'COLUMN', @level2name = N'State'
GO

CREATE TABLE [dbo].[MaterialPictures] (
[GUID] nvarchar(200) NOT NULL,
[MaterialID] nvarchar(200) NOT NULL,
[Name] nvarchar(200) NOT NULL,
[Index] int NOT NULL,
[FileName] nvarchar(200) NOT NULL,
[Width] int NOT NULL,
[Height] int NOT NULL,
[Top] int NOT NULL,
[Left] int NOT NULL,
[UploadWidth] int NOT NULL,
[UploadHeight] int NOT NULL,
PRIMARY KEY ([GUID]) 
)
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'图片名称(例：正面，背面)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'图片名称(例：正面，背面)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'Index')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排列序号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Index'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排列序号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Index'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'FileName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'底图文件名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'FileName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'底图文件名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'FileName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'Width')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'图片宽度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Width'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'图片宽度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Width'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'Height')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'图片高度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Height'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'图片高度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Height'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'Top')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上传图片距离上边界距离'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Top'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传图片距离上边界距离'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Top'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'Left')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上传图片距离左边界距离'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Left'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传图片距离左边界距离'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Left'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'UploadWidth')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上传图片宽度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'UploadWidth'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传图片宽度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'UploadWidth'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'UploadHeight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上传图片高度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'UploadHeight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传图片高度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'UploadHeight'
GO

CREATE TABLE [dbo].[MaterialSizes] (
[GUID] nvarchar(200) NOT NULL,
[MaterialID] nvarchar(200) NOT NULL,
[SizeName] nvarchar(200) NOT NULL,
[IsDefault] bit NOT NULL,
PRIMARY KEY ([GUID]) 
)
GO


ALTER TABLE [dbo].[Addresses] ADD FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([GUID])
GO
ALTER TABLE [dbo].[DesignWorks] ADD FOREIGN KEY ([DesignerID]) REFERENCES [dbo].[Users] ([GUID])
GO
ALTER TABLE [dbo].[MaterialPriceLogs] ADD FOREIGN KEY ([MaterialID]) REFERENCES [dbo].[Materials] ([GUID])
GO
ALTER TABLE [dbo].[SingleLogin] ADD FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([GUID])
GO
ALTER TABLE [dbo].[Materials] ADD FOREIGN KEY ([TypeID]) REFERENCES [dbo].[MaterialTypes] ([GUID])
GO
ALTER TABLE [dbo].[DesignWorks] ADD FOREIGN KEY ([MaterialID]) REFERENCES [dbo].[Materials] ([GUID])
GO
ALTER TABLE [dbo].[OrderDetails] ADD FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([GUID])
GO
ALTER TABLE [dbo].[Orders] ADD FOREIGN KEY ([DesignWorkID]) REFERENCES [dbo].[DesignWorks] ([GUID])
GO
ALTER TABLE [dbo].[MaterialColors] ADD FOREIGN KEY ([MaterialID]) REFERENCES [dbo].[Materials] ([GUID])
GO
ALTER TABLE [dbo].[MaterialPictures] ADD FOREIGN KEY ([MaterialID]) REFERENCES [dbo].[Materials] ([GUID])
GO
ALTER TABLE [dbo].[MaterialSizes] ADD FOREIGN KEY ([MaterialID]) REFERENCES [dbo].[Materials] ([GUID])
GO
ALTER TABLE [dbo].[Orders] ADD FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([GUID])
GO


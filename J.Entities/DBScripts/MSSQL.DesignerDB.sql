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
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'��¼��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'LoginName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'��¼��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'LoginName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Users', 
'COLUMN', N'Email')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'���䣬֧�����ʺţ������տ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'Email'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'���䣬֧�����ʺţ������տ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'Email'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Users', 
'COLUMN', N'Password')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'Password'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'Password'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Users', 
'COLUMN', N'StageName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'StageName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'StageName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Users', 
'COLUMN', N'CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�û�ע��ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�û�ע��ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'CreateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Users', 
'COLUMN', N'State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'״̬
0������
1������'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Users'
, @level2type = 'COLUMN', @level2name = N'State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'״̬
0������
1������'
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
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ջ���'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Consignee'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ջ���'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Consignee'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'Province')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ʡ'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Province'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ʡ'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Province'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'City')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'City'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'City'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'County')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'��/��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'County'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'��/��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'County'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'StreetAddress')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ֵ���ַ'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'StreetAddress'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ֵ���ַ'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'StreetAddress'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'ZipCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ʱ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'ZipCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ʱ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'ZipCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'Mobile')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ֻ�����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Mobile'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ֻ�����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Mobile'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'Phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�绰����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�绰����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'Phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Addresses', 
'COLUMN', N'IsDefault')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�Ƿ�Ĭ�ϵ�ַ'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Addresses'
, @level2type = 'COLUMN', @level2name = N'IsDefault'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�Ƿ�Ĭ�ϵ�ַ'
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
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'���ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'DesignWorkID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'���ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'DesignWorkID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'״̬
1���ȴ���Ҹ���
2������Ѹ���ȴ����ҷ���
3�������ѷ������ȴ����ȷ��
4�����׳ɹ�����
5��������;�ر�(�ѽ�����δ�ɹ����)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'״̬
1���ȴ���Ҹ���
2������Ѹ���ȴ����ҷ���
3�������ѷ������ȴ����ȷ��
4�����׳ɹ�����
5��������;�ر�(�ѽ�����δ�ɹ����)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'RefundState')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�˿�״̬
0��δ�����˿�
1���˿�Э��ȴ�����ȷ����
2�����Ҳ�ͬ��Э�飬�ȴ�����޸�
3���˿�ɹ�
4���˿�ر�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundState'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�˿�״̬
0��δ�����˿�
1���˿�Э��ȴ�����ȷ����
2�����Ҳ�ͬ��Э�飬�ȴ�����޸�
3���˿�ɹ�
4���˿�ر�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundState'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'WaitBuyerPayTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'����ʱ��/�ȴ���Ҹ���ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'WaitBuyerPayTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'����ʱ��/�ȴ���Ҹ���ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'WaitBuyerPayTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'WaitSellerSendGoodsTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'����ʱ��/����Ѹ���ȴ����ҷ���ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'WaitSellerSendGoodsTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'����ʱ��/����Ѹ���ȴ����ҷ���ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'WaitSellerSendGoodsTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'WaitBuyerConfirmGoodsTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'����ʱ��/�����ѷ������ȴ����ȷ��ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'WaitBuyerConfirmGoodsTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'����ʱ��/�����ѷ������ȴ����ȷ��ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'WaitBuyerConfirmGoodsTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'TradeFinishedTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�տ�ʱ��/���׳ɹ�����ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'TradeFinishedTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�տ�ʱ��/���׳ɹ�����ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'TradeFinishedTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'TradeClosedTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'���׹ر�ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'TradeClosedTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'���׹ر�ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'TradeClosedTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'RefundWaitSellerAgreeTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'��������˿�ʱ��/�˿�Э��ȴ�����ȷ��ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundWaitSellerAgreeTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'��������˿�ʱ��/�˿�Э��ȴ�����ȷ��ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundWaitSellerAgreeTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'RefundSellerFefuseBuyerTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'���Ҿܾ��˿�ʱ��/�ȴ�����޸�ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundSellerFefuseBuyerTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'���Ҿܾ��˿�ʱ��/�ȴ�����޸�ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundSellerFefuseBuyerTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'RefundSuccessTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�˿�ɹ�ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundSuccessTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�˿�ɹ�ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundSuccessTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'RefundClosedTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�˿�ر�ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundClosedTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�˿�ر�ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'RefundClosedTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Subject')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'��Ʒ����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Subject'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'��Ʒ����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Subject'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Price')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Price'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Price'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Quantity')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Quantity'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Quantity'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Body')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'��Ʒ����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Body'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'��Ʒ����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Body'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Consignee')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ռ�������'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Consignee'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ռ�������'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Consignee'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Address')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ռ���ַ'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Address'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ռ���ַ'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Address'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'ZipCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ʱ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'ZipCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ʱ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'ZipCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Mobile')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ֻ���'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Mobile'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ֻ���'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Mobile'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'Phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'������'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'������'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'Phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'PayType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'֧��ƽ̨
1��Alipay'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'PayType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'֧��ƽ̨
1��Alipay'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'PayType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Orders', 
'COLUMN', N'PayOrderNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'֧��ƽ̨����ˮ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Orders'
, @level2type = 'COLUMN', @level2name = N'PayOrderNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'֧��ƽ̨����ˮ��'
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
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�����ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'DesignerID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�����ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'DesignerID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'MaterialID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ԭ��ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'MaterialID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ԭ��ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'MaterialID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'SalesGoal')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'����Ŀ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SalesGoal'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'����Ŀ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SalesGoal'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'BasePrice')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�׼�/����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'BasePrice'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�׼�/����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'BasePrice'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'SellingPrice')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ۼ�/����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SellingPrice'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ۼ�/����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SellingPrice'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'StartTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'����ʱ��/���ʼʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'StartTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'����ʱ��/���ʼʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'StartTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'EndTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'���ֹʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'EndTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'���ֹʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'EndTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'Title')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'Title'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'Title'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'Description')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�˵��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'Description'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�˵��'
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
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'������/ͳ��ֵ'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SalesVolume'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'������/ͳ��ֵ'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SalesVolume'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'״̬
-1��Ԥ�۲���
0�������
1��Ԥ����
2��������
3��������
4���տ���
5��������
6���鵵'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'״̬
-1��Ԥ�۲���
0�������
1��Ԥ����
2��������
3��������
4���տ���
5��������
6���鵵'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'ProcurementCost')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ɹ��ɱ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'ProcurementCost'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ɹ��ɱ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'ProcurementCost'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'ProductionCost')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�����ɱ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'ProductionCost'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�����ɱ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'ProductionCost'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'SendCost')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�����ɱ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SendCost'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�����ɱ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'SendCost'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DesignWorks', 
'COLUMN', N'CompletionTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'���н������ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DesignWorks'
, @level2type = 'COLUMN', @level2name = N'CompletionTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'���н������ʱ��'
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
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'����
1������T��
2������T��
3������
4����ñ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'TypeID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'����
1������T��
2������T��
3������
4����ñ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'TypeID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Materials', 
'COLUMN', N'Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ԭ�ϱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ԭ�ϱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Materials', 
'COLUMN', N'Price')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'Ŀǰ����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'Price'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Ŀǰ����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'Price'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Materials', 
'COLUMN', N'PictureNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'��Ҫ�ϴ�ͼƬ����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'PictureNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'��Ҫ�ϴ�ͼƬ����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'PictureNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Materials', 
'COLUMN', N'State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'״̬
0��ͣ��
1������
2��ȱ��
3��ͣ��/δ����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Materials'
, @level2type = 'COLUMN', @level2name = N'State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'״̬
0��ͣ��
1������
2��ȱ��
3��ͣ��/δ����'
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
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�۸�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPriceLogs'
, @level2type = 'COLUMN', @level2name = N'Price'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�۸�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPriceLogs'
, @level2type = 'COLUMN', @level2name = N'Price'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPriceLogs', 
'COLUMN', N'CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'¼��ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPriceLogs'
, @level2type = 'COLUMN', @level2name = N'CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'¼��ʱ��'
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
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'��½ʱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SingleLogin'
, @level2type = 'COLUMN', @level2name = N'LoginTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'��½ʱ��'
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
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'��������'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialTypes'
, @level2type = 'COLUMN', @level2name = N'Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'��������'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialTypes'
, @level2type = 'COLUMN', @level2name = N'Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialTypes', 
'COLUMN', N'IsLeafNode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�Ƿ���Ҷ�ӽڵ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialTypes'
, @level2type = 'COLUMN', @level2name = N'IsLeafNode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�Ƿ���Ҷ�ӽڵ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialTypes'
, @level2type = 'COLUMN', @level2name = N'IsLeafNode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialTypes', 
'COLUMN', N'State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'״̬
0��ͣ��
1������
'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialTypes'
, @level2type = 'COLUMN', @level2name = N'State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'״̬
0��ͣ��
1������
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
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OrderDetails'
, @level2type = 'COLUMN', @level2name = N'Size'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OrderDetails'
, @level2type = 'COLUMN', @level2name = N'Size'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'OrderDetails', 
'COLUMN', N'Number')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'��������'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OrderDetails'
, @level2type = 'COLUMN', @level2name = N'Number'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'��������'
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
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�Ƿ���Ĭ����ɫ'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialColors'
, @level2type = 'COLUMN', @level2name = N'IsDefault'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�Ƿ���Ĭ����ɫ'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialColors'
, @level2type = 'COLUMN', @level2name = N'IsDefault'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialColors', 
'COLUMN', N'State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'״̬
0��ͣ��
1������
2��ȱ��'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialColors'
, @level2type = 'COLUMN', @level2name = N'State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'״̬
0��ͣ��
1������
2��ȱ��'
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
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ͼƬ����(�������棬����)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ͼƬ����(�������棬����)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'Index')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�������'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Index'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�������'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Index'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'FileName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'��ͼ�ļ���'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'FileName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'��ͼ�ļ���'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'FileName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'Width')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ͼƬ���'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Width'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ͼƬ���'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Width'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'Height')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ͼƬ�߶�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Height'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ͼƬ�߶�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Height'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'Top')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ϴ�ͼƬ�����ϱ߽����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Top'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ϴ�ͼƬ�����ϱ߽����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Top'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'Left')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ϴ�ͼƬ������߽����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Left'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ϴ�ͼƬ������߽����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'Left'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'UploadWidth')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ϴ�ͼƬ���'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'UploadWidth'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ϴ�ͼƬ���'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'UploadWidth'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'MaterialPictures', 
'COLUMN', N'UploadHeight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�ϴ�ͼƬ�߶�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'MaterialPictures'
, @level2type = 'COLUMN', @level2name = N'UploadHeight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�ϴ�ͼƬ�߶�'
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


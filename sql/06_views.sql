SET NOCOUNT ON;
GO
USE [dnmembership]
GO
/****** Object:  View [dbo].[VIX_CashIncomeTotals]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VIX_CashIncomeTotals]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VIX_CashIncomeTotals]
WITH SCHEMABINDING
AS
SELECT AccountID, SUM(CAST(CashAmount AS bigint)) AS CashAmount, COUNT_BIG(*) AS CashIncomeCount
FROM dbo.CashIncome
GROUP BY AccountID;
' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_CashIncomeTotals]    Script Date: 11/14/2026 8:51:03 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VIX_CashIncomeTotals]') AND name = N'IX_UC_VIX_CashIncomeTotals')
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_CashIncomeTotals] ON [dbo].[VIX_CashIncomeTotals]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [dnmembership]
GO
/****** Object:  View [dbo].[VIX_CashOutgoTotals]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VIX_CashOutgoTotals]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VIX_CashOutgoTotals]
WITH SCHEMABINDING
AS
SELECT AccountID, SUM(CAST(CashAmount AS bigint)) AS CashAmount, COUNT_BIG(*) AS CashIncomeCount
FROM dbo.CashOutgo
GROUP BY AccountID;
' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_CashOutgoTotals]    Script Date: 11/14/2026 8:51:03 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VIX_CashOutgoTotals]') AND name = N'IX_UC_VIX_CashOutgoTotals')
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_CashOutgoTotals] ON [dbo].[VIX_CashOutgoTotals]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [dnmembership]
GO
/****** Object:  View [dbo].[VIX_CharacterCount]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VIX_CharacterCount]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VIX_CharacterCount]
WITH SCHEMABINDING
AS
SELECT AccountID, WorldID, COUNT_BIG(*) AS CharacterCount
FROM dbo.Characters
WHERE DeleteFlag = CAST(0 AS bit)
GROUP BY AccountID, WorldID
' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_CharacterCount]    Script Date: 11/14/2026 8:51:03 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VIX_CharacterCount]') AND name = N'IX_UC_VIX_CharacterCount')
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_CharacterCount] ON [dbo].[VIX_CharacterCount]
(
	[AccountID] ASC,
	[WorldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnmembership]
GO
/****** Object:  View [dbo].[VIX_ClientIPConnectCounts]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VIX_ClientIPConnectCounts]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VIX_ClientIPConnectCounts]
WITH SCHEMABINDING
AS
SELECT IP, COUNT_BIG(*) AS ConnectCount
FROM dbo.ClientIPConnectCounts
GROUP BY IP;
' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_ClientIPConnectCounts]    Script Date: 11/14/2026 8:51:03 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VIX_ClientIPConnectCounts]') AND name = N'IX_UC_VIX_ClientIPConnectCounts')
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_ClientIPConnectCounts] ON [dbo].[VIX_ClientIPConnectCounts]
(
	[IP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DataFG1]
GO
USE [dnmembership]
GO
/****** Object:  View [dbo].[VIX_EventScheduleDetailForPetal]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VIX_EventScheduleDetailForPetal]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VIX_EventScheduleDetailForPetal]
WITH SCHEMABINDING
AS
SELECT ESD.AccountID, ES.EventConditionID, COUNT_BIG(*) AS Cnt
FROM dbo.EventScheduleForPetal ES
	INNER JOIN dbo.EventScheduleDetailForPetal ESD ON ES.EventScheduleID = ESD.EventScheduleID
WHERE ES.EventConditionID IS NOT NULL
GROUP BY ESD.AccountID, ES.EventConditionID
' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_EventScheduleDetailForPetal]    Script Date: 11/14/2026 8:51:03 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VIX_EventScheduleDetailForPetal]') AND name = N'IX_UC_VIX_EventScheduleDetailForPetal')
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_EventScheduleDetailForPetal] ON [dbo].[VIX_EventScheduleDetailForPetal]
(
	[AccountID] ASC,
	[EventConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnmembership]
GO
/****** Object:  View [dbo].[VIX_GiveFailItems]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VIX_GiveFailItems]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VIX_GiveFailItems]
WITH SCHEMABINDING
AS
SELECT SI.SelectedItemID, SI.PurchaseOrderDetailID, SI.ItemID, SI.ItemOption, PO.CharacterID, PO.ReceiverCharacterID
FROM dbo.PurchaseOrders PO
	INNER JOIN dbo.PurchaseOrderDetails PD ON PO.PurchaseOrderID = PD.PurchaseOrderID
	INNER JOIN dbo.SelectedItems SI ON PD.PurchaseOrderDetailID = SI.PurchaseOrderDetailID
WHERE PO.OrderStatusCode = 2 AND SI.GiveFailFlag = CAST(1 AS bit);
' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_GiveFailItems]    Script Date: 11/14/2026 8:51:03 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VIX_GiveFailItems]') AND name = N'IX_UC_VIX_GiveFailItems')
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_GiveFailItems] ON [dbo].[VIX_GiveFailItems]
(
	[SelectedItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_NN_VIX_GiveFailItems_CharacterID]    Script Date: 11/14/2026 8:51:10 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VIX_GiveFailItems]') AND name = N'IX_NN_VIX_GiveFailItems_CharacterID')
CREATE NONCLUSTERED INDEX [IX_NN_VIX_GiveFailItems_CharacterID] ON [dbo].[VIX_GiveFailItems]
(
	[CharacterID] ASC
)
INCLUDE([PurchaseOrderDetailID],[ItemID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_NN_VIX_GiveFailItems_ReceiverCharacterID]    Script Date: 11/14/2026 8:51:10 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VIX_GiveFailItems]') AND name = N'IX_NN_VIX_GiveFailItems_ReceiverCharacterID')
CREATE NONCLUSTERED INDEX [IX_NN_VIX_GiveFailItems_ReceiverCharacterID] ON [dbo].[VIX_GiveFailItems]
(
	[ReceiverCharacterID] ASC
)
INCLUDE([PurchaseOrderDetailID],[ItemID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnmembership]
GO
/****** Object:  View [dbo].[VIX_PetalIncome]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VIX_PetalIncome]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VIX_PetalIncome]
WITH SCHEMABINDING
AS
SELECT AccountID, SUM(CAST(PetalAmount AS bigint)) AS PetalAmount, COUNT_BIG(*) AS Cnt
FROM dbo.PetalIncome
GROUP BY AccountID
' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_PetalIncome]    Script Date: 11/14/2026 8:51:03 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VIX_PetalIncome]') AND name = N'IX_UC_VIX_PetalIncome')
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_PetalIncome] ON [dbo].[VIX_PetalIncome]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnmembership]
GO
/****** Object:  View [dbo].[VIX_PetalOutgo]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VIX_PetalOutgo]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VIX_PetalOutgo]
WITH SCHEMABINDING
AS
SELECT PTI.AccountID, SUM(CAST(PTO.PetalAmount AS bigint)) AS PetalAmount, COUNT_BIG(*) AS Cnt
FROM dbo.PetalOutgo PTO
	INNER JOIN dbo.PetalIncome PTI ON PTO.PetalIncomeID = PTI.PetalIncomeID
GROUP BY PTI.AccountID
' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_PetalOutgo]    Script Date: 11/14/2026 8:51:03 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VIX_PetalOutgo]') AND name = N'IX_UC_VIX_PetalOutgo')
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_PetalOutgo] ON [dbo].[VIX_PetalOutgo]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnmembership]
GO
/****** Object:  View [dbo].[VIX_PetalOutgoTotal]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VIX_PetalOutgoTotal]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VIX_PetalOutgoTotal]
WITH SCHEMABINDING
AS
SELECT PetalIncomeID, SUM(PetalAmount) AS PetalAmount, COUNT_BIG(*) AS Cnt
FROM dbo.PetalOutgo
GROUP BY PetalIncomeID
' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UN_VIX_PetalOutgoTotal]    Script Date: 11/14/2026 8:51:03 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VIX_PetalOutgoTotal]') AND name = N'IX_UN_VIX_PetalOutgoTotal')
CREATE UNIQUE CLUSTERED INDEX [IX_UN_VIX_PetalOutgoTotal] ON [dbo].[VIX_PetalOutgoTotal]
(
	[PetalIncomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnserverlog]
GO
/****** Object:  View [dbo].[V_CommonLogs]    Script Date: 11/14/2026 8:57:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_CommonLogs]
AS
SELECT LogDate, LogType, ServerType, WorldID, AccountID, CharacterID, SessionID, LogText FROM dbo.CommonLogs20140921 UNION ALL
SELECT LogDate, LogType, ServerType, WorldID, AccountID, CharacterID, SessionID, LogText FROM dbo.CommonLogs20140922 UNION ALL
SELECT LogDate, LogType, ServerType, WorldID, AccountID, CharacterID, SessionID, LogText FROM dbo.CommonLogs20140924 UNION ALL
SELECT LogDate, LogType, ServerType, WorldID, AccountID, CharacterID, SessionID, LogText FROM dbo.CommonLogs20140925 UNION ALL
SELECT LogDate, LogType, ServerType, WorldID, AccountID, CharacterID, SessionID, LogText FROM dbo.CommonLogs20140926 UNION ALL
SELECT LogDate, LogType, ServerType, WorldID, AccountID, CharacterID, SessionID, LogText FROM dbo.CommonLogs20141003 
GO
USE [dnserverlog]
GO
/****** Object:  View [dbo].[V_ServerPingLogs]    Script Date: 11/14/2026 8:57:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_ServerPingLogs]
AS
SELECT * FROM dbo.ServerPingLogs20140921 UNION ALL
SELECT * FROM dbo.ServerPingLogs20140922 UNION ALL
SELECT * FROM dbo.ServerPingLogs20140924 UNION ALL
SELECT * FROM dbo.ServerPingLogs20140926 UNION ALL
SELECT * FROM dbo.ServerPingLogs20141003 
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[VIX_TotalRUCount]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_TotalRUCount]
WITH SCHEMABINDING
AS
SELECT SUM(RUCount) AS TotalRUCount, COUNT_BIG(*) AS Cnt FROM dbo.ST_DailyDashboard
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_TotalRUCount]    Script Date: 11/14/2026 9:00:07 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_TotalRUCount] ON [dbo].[VIX_TotalRUCount]
(
	[TotalRUCount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_AccountLoginLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_AccountLoginLogs]
	AS
	SELECT * FROM DNStaging.dbo.AccountLoginLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLoginLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_AccountLogoutLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_AccountLogoutLogs]
	AS
	SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.AccountLogoutLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_AchieveMissions]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_AchieveMissions]
AS
SELECT DA.AccountID, DA.AccountName, DC.WorldID, DC.CharacterID, DC.CharacterName, DM.MissionID, DM.MissionName, DM.MissionScore
FROM dbo.SS_AchieveMissions SS WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON SS.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimAccounts DA WITH (NOLOCK) ON DC.AccountID = DA.AccountID
	INNER JOIN dbo.DimMissions DM WITH (NOLOCK) ON SS.MissionID = DM.MissionID
WHERE DC.DeleteFlag = CAST(0 AS bit)
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_Appellations]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Appellations]
AS
SELECT DA.AccountID, DA.AccountName, DC.WorldID, DC.CharacterID, DC.CharacterName, DM.AppellationID, DM.AppellationName
FROM dbo.SS_Appellations SS WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON SS.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimAccounts DA WITH (NOLOCK) ON DC.AccountID = DA.AccountID
	INNER JOIN dbo.DimAppellations DM WITH (NOLOCK) ON SS.AppellationID = DM.AppellationID
WHERE DC.DeleteFlag = CAST(0 AS bit)
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_CUCountLogs]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_CUCountLogs]
	AS
	SELECT * FROM DNStaging.dbo.CUCountLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.CUCountLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_CashRebirthCoinLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_CashRebirthCoinLogs]
	AS
	SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.CashRebirthCoinLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_CharacterActionLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_CharacterActionLogs]
	AS
	SELECT * FROM DNStaging.dbo.CharacterActionLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterActionLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_CharacterLevelLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_CharacterLevelLogs]
	AS
	SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLevelLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_CharacterLoginLogs]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_CharacterLoginLogs]
	AS
	SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLoginLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_CharacterLogoutLogs]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_CharacterLogoutLogs]
	AS
	SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.CharacterLogoutLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_CharactersForNexon]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CharactersForNexon]
AS
SELECT MC.AccountName, MC.CharacterID, MC.CharacterName, MC.CharacterLevel, MC.JobCode, MC.GuildName, MC.WorldID, W.WorldName, NULL AS CharacterIDForNexon
FROM dbo.MirroredCharacters MC WITH (NOLOCK)
	INNER JOIN dbo.DimWorlds W WITH (NOLOCK) ON MC.WorldID = W.WorldID;
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_CoinLogs]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_CoinLogs]
	AS
	SELECT * FROM DNStaging.dbo.CoinLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.CoinLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_DarkLairLogs]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_DarkLairLogs]
	AS
	SELECT * FROM DNStaging.dbo.DarkLairLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.DarkLairLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_DarkLairRank]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DarkLairRank]
AS
SELECT DLR.WorldID, DLR.MapID, DLR.PartySize, DLR.PartyName, DLR.PlayRound, DLR.PlayTime, DLR.LogDate, DLR.WorldRank, DLR.TotalRank, DC1.CharacterName AS CharacterName1, DJ1.JobName AS JobName1, DC2.CharacterName AS CharacterName2, DJ2.JobName AS JobName2, DC3.CharacterName AS CharacterName3, DJ3.JobName AS JobName3 , DC4.CharacterName AS CharacterName4, DJ4.JobName AS JobName4
FROM dbo.DarkLairRank DLR WITH(NOLOCK)
	LEFT OUTER JOIN dbo.DimCharacters DC1 WITH(NOLOCK) ON DLR.CharacterID1 = DC1.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC2 WITH(NOLOCK) ON DLR.CharacterID2 = DC2.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC3 WITH(NOLOCK) ON DLR.CharacterID3 = DC3.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC4 WITH(NOLOCK) ON DLR.CharacterID4 = DC4.CharacterID
	LEFT OUTER JOIN dbo.DimJobs DJ1 WITH(NOLOCK) ON DLR.JobCode1 = DJ1.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ2 WITH(NOLOCK) ON DLR.JobCode2 = DJ2.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ3 WITH(NOLOCK) ON DLR.JobCode3 = DJ3.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ4 WITH(NOLOCK) ON DLR.JobCode4 = DJ4.JobCode
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_DimCharacters]    Script Date: 11/14/2026 9:00:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DimCharacters]
AS
SELECT C1.CharacterID, C1.AccountID, C1.CharacterName, C1.WorldID, C2.CharacterClassCode, C2.CharacterIndex, C2.VillageFirstVisitFlag
	, C2.SkillResetFlag, C2.CharacterLevel, C2.CharacterExp, C2.MissionScore, C2.JobCode, C2.Coin, C2.WarehouseCoin, C2.SkillPoint, C2.LastLoginDate
	, C1.CreateDate, C1.DeleteFlag, C3.DeleteDate, C3.CharacterName AS DeleteCharacterName, C3.DeletePrivateIP, C3.DeletePublicIP, C2.AccountLevelCode
	, C2.PCRoomRebirthCoin, C2.RebirthCoin
FROM dbo.TempCharacters1 C1
	INNER JOIN dbo.TempCharacters2 C2 ON C1.CharacterID = C2.CharacterID
	LEFT OUTER JOIN dbo.TempDeletedCharacters C3 ON C1.CharacterID = C3.CharacterID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_FairyLevelLogs]    Script Date: 11/14/2026 9:00:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_FairyLevelLogs]
	AS
	SELECT * FROM DNStaging.dbo.FairyLevelLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.FairyLevelLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_FatigueLogs]    Script Date: 11/14/2026 9:00:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_FatigueLogs]
	AS
	SELECT * FROM DNStaging.dbo.FatigueLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.FatigueLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_FieldAttachmentDeleteLogs]    Script Date: 11/14/2026 9:00:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_FieldAttachmentDeleteLogs]
	AS
	SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.FieldAttachmentDeleteLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_FieldDeleteLogs]    Script Date: 11/14/2026 9:00:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_FieldDeleteLogs]
	AS
	SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.FieldDeleteLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_FieldLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_FieldLogs]
	AS
	SELECT * FROM DNStaging.dbo.FieldLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.FieldLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_HiddenCashShopLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_HiddenCashShopLogs]
	AS
	SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.HiddenCashShopLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_ItemAttributeLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_ItemAttributeLogs]
	AS
	SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.ItemAttributeLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_ItemLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_ItemLogs]
	AS
	SELECT * FROM DNStaging.dbo.ItemLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.ItemLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_JobChangeLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_JobChangeLogs]
	AS
	SELECT * FROM DNStaging.dbo.JobChangeLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.JobChangeLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_MailLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_MailLogs]
	AS
	SELECT * FROM DNStaging.dbo.MailLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.MailLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_MapStayLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_MapStayLogs]
	AS
	SELECT * FROM DNStaging.dbo.MapStayLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.MapStayLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_MissionAchieveLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_MissionAchieveLogs]
	AS
	SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.MissionAchieveLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_MobileAuthenticationLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_MobileAuthenticationLogs]
	AS
	SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.MobileAuthenticationLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_MonthlyRank_NestClearTime]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_MonthlyRank_NestClearTime]
AS
SELECT R.CharacterID1, DC1.CharacterName AS CharacterName1, R.CharacterLevel1, R.JobCode1, DJ1.JobName AS JobName1
	 , R.CharacterID2, DC2.CharacterName AS CharacterName2, R.CharacterLevel2, R.JobCode2, DJ2.JobName AS JobName2
	 , R.CharacterID3, DC3.CharacterName AS CharacterName3, R.CharacterLevel3, R.JobCode3, DJ3.JobName AS JobName3
	 , R.CharacterID4, DC4.CharacterName AS CharacterName4, R.CharacterLevel4, R.JobCode4, DJ4.JobName AS JobName4
	 , R.CharacterID5, DC5.CharacterName AS CharacterName5, R.CharacterLevel5, R.JobCode5, DJ5.JobName AS JobName5
	 , R.CharacterID6, DC6.CharacterName AS CharacterName6, R.CharacterLevel6, R.JobCode6, DJ6.JobName AS JobName6
	 , R.CharacterID7, DC7.CharacterName AS CharacterName7, R.CharacterLevel7, R.JobCode7, DJ7.JobName AS JobName7
	 , R.CharacterID8, DC8.CharacterName AS CharacterName8, R.CharacterLevel8, R.JobCode8, DJ8.JobName AS JobName8
	 , R.StageID, DS.StageName, R.ClearTime, R.TotalRanking
FROM dbo.MonthlyRank_NestClearTime R WITH (NOLOCK)
	LEFT OUTER JOIN dbo.DimCharacters DC1 WITH (NOLOCK) ON R.CharacterID1 = DC1.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC2 WITH (NOLOCK) ON R.CharacterID2 = DC2.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC3 WITH (NOLOCK) ON R.CharacterID3 = DC3.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC4 WITH (NOLOCK) ON R.CharacterID4 = DC4.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC5 WITH (NOLOCK) ON R.CharacterID5 = DC5.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC6 WITH (NOLOCK) ON R.CharacterID6 = DC6.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC7 WITH (NOLOCK) ON R.CharacterID7 = DC7.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC8 WITH (NOLOCK) ON R.CharacterID8 = DC8.CharacterID
	LEFT OUTER JOIN dbo.DimJobs DJ1 WITH (NOLOCK) ON R.JobCode1 = DJ1.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ2 WITH (NOLOCK) ON R.JobCode2 = DJ2.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ3 WITH (NOLOCK) ON R.JobCode3 = DJ3.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ4 WITH (NOLOCK) ON R.JobCode4 = DJ4.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ5 WITH (NOLOCK) ON R.JobCode5 = DJ5.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ6 WITH (NOLOCK) ON R.JobCode6 = DJ6.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ7 WITH (NOLOCK) ON R.JobCode7 = DJ7.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ8 WITH (NOLOCK) ON R.JobCode8 = DJ8.JobCode
	INNER JOIN dbo.DimStages DS WITH (NOLOCK) ON R.StageID = DS.StageID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_MonthlyRank_PVPKillDeath]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_MonthlyRank_PVPKillDeath]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank
FROM dbo.MonthlyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_MonthlyRank_PVPKillDeath_2]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_MonthlyRank_PVPKillDeath_2]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank, R.vsAcademicKOWin, R.vsAcademicKOLose
FROM dbo.MonthlyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_MonthlyRank_PVPKillDeath_3]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_MonthlyRank_PVPKillDeath_3]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank, R.vsAcademicKOWin, R.vsAcademicKOLose, R.vsKaliKOWin, R.vsKaliKOLose
FROM dbo.MonthlyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_MonthlyRank_PVPKillDeath_4]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_MonthlyRank_PVPKillDeath_4]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank, R.vsAcademicKOWin, R.vsAcademicKOLose, R.vsKaliKOWin, R.vsKaliKOLose, DJ2.JobCode AS CharacterClassCode, DJ2.JobName AS CharacterClassName
FROM dbo.MonthlyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
	INNER JOIN dbo.DimJobs DJ2 WITH (NOLOCK) ON DC.CharacterClassCode = DJ2.JobCode
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_MonthlyRank_StageClearTime]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_MonthlyRank_StageClearTime]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.StageID, DS.StageName, R.CharacterLevel, R.JobCode, DJ.JobName, R.ClearTime, R.ClearDate, R.TotalRank, R.WorldRank, R.WorldCharacterClassRank, R.CharacterClassRank
FROM dbo.MonthlyRank_StageClearTime R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
	INNER JOIN dbo.DimStages DS WITH (NOLOCK) ON R.StageID = DS.StageID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_MonthlyRank_StageClearTime_2]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_MonthlyRank_StageClearTime_2]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.StageID, DS.StageName, R.CharacterLevel, R.JobCode, DJ.JobName, R.ClearTime, R.ClearDate, R.TotalRank, R.WorldRank, R.WorldCharacterClassRank, R.CharacterClassRank, DJ2.JobCode AS CharacterClassCode, DJ2.JobName AS CharacterClassName
FROM dbo.MonthlyRank_StageClearTime R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
	INNER JOIN dbo.DimStages DS WITH (NOLOCK) ON R.StageID = DS.StageID
	INNER JOIN dbo.DimJobs DJ2 WITH (NOLOCK) ON DC.CharacterClassCode = DJ2.JobCode
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_NestDeathLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_NestDeathLogs]
	AS
	SELECT * FROM DNStaging.dbo.NestDeathLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.NestDeathLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_NestGateClearLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_NestGateClearLogs]
	AS
	SELECT * FROM DNStaging.dbo.NestGateClearLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.NestGateClearLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PCRoomCharacterLoginLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_PCRoomCharacterLoginLogs]
	AS
	SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLoginLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PCRoomCharacterLogoutLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_PCRoomCharacterLogoutLogs]
	AS
	SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.PCRoomCharacterLogoutLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PVPEndLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_PVPEndLogs]
	AS
	SELECT * FROM DNStaging.dbo.PVPEndLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.PVPEndLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PVPLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_PVPLogs]
	AS
	SELECT * FROM DNStaging.dbo.PVPLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.PVPLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PartyLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_PartyLogs]
	AS
	SELECT * FROM DNStaging.dbo.PartyLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.PartyLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PastMonthlyRank_NestClearTime]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PastMonthlyRank_NestClearTime]
AS
SELECT R.BasisDate
	 , R.CharacterID1, DC1.CharacterName AS CharacterName1, R.CharacterLevel1, R.JobCode1, DJ1.JobName AS JobName1
	 , R.CharacterID2, DC2.CharacterName AS CharacterName2, R.CharacterLevel2, R.JobCode2, DJ2.JobName AS JobName2
	 , R.CharacterID3, DC3.CharacterName AS CharacterName3, R.CharacterLevel3, R.JobCode3, DJ3.JobName AS JobName3
	 , R.CharacterID4, DC4.CharacterName AS CharacterName4, R.CharacterLevel4, R.JobCode4, DJ4.JobName AS JobName4
	 , R.CharacterID5, DC5.CharacterName AS CharacterName5, R.CharacterLevel5, R.JobCode5, DJ5.JobName AS JobName5
	 , R.CharacterID6, DC6.CharacterName AS CharacterName6, R.CharacterLevel6, R.JobCode6, DJ6.JobName AS JobName6
	 , R.CharacterID7, DC7.CharacterName AS CharacterName7, R.CharacterLevel7, R.JobCode7, DJ7.JobName AS JobName7
	 , R.CharacterID8, DC8.CharacterName AS CharacterName8, R.CharacterLevel8, R.JobCode8, DJ8.JobName AS JobName8
	 , R.StageID, DS.StageName, R.ClearTime, R.TotalRanking
FROM dbo.PastMonthlyRank_NestClearTime R WITH (NOLOCK)
	LEFT OUTER JOIN dbo.DimCharacters DC1 WITH (NOLOCK) ON R.CharacterID1 = DC1.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC2 WITH (NOLOCK) ON R.CharacterID2 = DC2.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC3 WITH (NOLOCK) ON R.CharacterID3 = DC3.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC4 WITH (NOLOCK) ON R.CharacterID4 = DC4.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC5 WITH (NOLOCK) ON R.CharacterID5 = DC5.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC6 WITH (NOLOCK) ON R.CharacterID6 = DC6.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC7 WITH (NOLOCK) ON R.CharacterID7 = DC7.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC8 WITH (NOLOCK) ON R.CharacterID8 = DC8.CharacterID
	LEFT OUTER JOIN dbo.DimJobs DJ1 WITH (NOLOCK) ON R.JobCode1 = DJ1.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ2 WITH (NOLOCK) ON R.JobCode2 = DJ2.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ3 WITH (NOLOCK) ON R.JobCode3 = DJ3.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ4 WITH (NOLOCK) ON R.JobCode4 = DJ4.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ5 WITH (NOLOCK) ON R.JobCode5 = DJ5.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ6 WITH (NOLOCK) ON R.JobCode6 = DJ6.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ7 WITH (NOLOCK) ON R.JobCode7 = DJ7.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ8 WITH (NOLOCK) ON R.JobCode8 = DJ8.JobCode
	INNER JOIN dbo.DimStages DS WITH (NOLOCK) ON R.StageID = DS.StageID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PastMonthlyRank_PVPKillDeath]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PastMonthlyRank_PVPKillDeath]
AS
SELECT R.BasisDate, R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank
FROM dbo.PastMonthlyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PastMonthlyRank_PVPKillDeath_2]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PastMonthlyRank_PVPKillDeath_2]
AS
SELECT R.BasisDate, R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank, R.vsAcademicKOWin, R.vsAcademicKOLose
FROM dbo.PastMonthlyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PastMonthlyRank_PVPKillDeath_3]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PastMonthlyRank_PVPKillDeath_3]
AS
SELECT R.BasisDate, R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank, R.vsAcademicKOWin, R.vsAcademicKOLose, R.vsKaliKOWin, R.vsKaliKOLose
FROM dbo.PastMonthlyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PastMonthlyRank_StageClearTime]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PastMonthlyRank_StageClearTime]
AS
SELECT R.BasisDate, R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.StageID, DS.StageName, R.CharacterLevel, R.JobCode, DJ.JobName, R.ClearTime, R.ClearDate, R.TotalRank, R.WorldRank, R.WorldCharacterClassRank, R.CharacterClassRank
FROM dbo.PastMonthlyRank_StageClearTime R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
	INNER JOIN dbo.DimStages DS WITH (NOLOCK) ON R.StageID = DS.StageID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PastWeeklyRank_NestClearTime]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PastWeeklyRank_NestClearTime]
AS
SELECT R.BasisDate
	 , R.CharacterID1, DC1.CharacterName AS CharacterName1, R.CharacterLevel1, R.JobCode1, DJ1.JobName AS JobName1
	 , R.CharacterID2, DC2.CharacterName AS CharacterName2, R.CharacterLevel2, R.JobCode2, DJ2.JobName AS JobName2
	 , R.CharacterID3, DC3.CharacterName AS CharacterName3, R.CharacterLevel3, R.JobCode3, DJ3.JobName AS JobName3
	 , R.CharacterID4, DC4.CharacterName AS CharacterName4, R.CharacterLevel4, R.JobCode4, DJ4.JobName AS JobName4
	 , R.CharacterID5, DC5.CharacterName AS CharacterName5, R.CharacterLevel5, R.JobCode5, DJ5.JobName AS JobName5
	 , R.CharacterID6, DC6.CharacterName AS CharacterName6, R.CharacterLevel6, R.JobCode6, DJ6.JobName AS JobName6
	 , R.CharacterID7, DC7.CharacterName AS CharacterName7, R.CharacterLevel7, R.JobCode7, DJ7.JobName AS JobName7
	 , R.CharacterID8, DC8.CharacterName AS CharacterName8, R.CharacterLevel8, R.JobCode8, DJ8.JobName AS JobName8
	 , R.StageID, DS.StageName, R.ClearTime, R.TotalRanking
FROM dbo.PastWeeklyRank_NestClearTime R WITH (NOLOCK)
	LEFT OUTER JOIN dbo.DimCharacters DC1 WITH (NOLOCK) ON R.CharacterID1 = DC1.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC2 WITH (NOLOCK) ON R.CharacterID2 = DC2.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC3 WITH (NOLOCK) ON R.CharacterID3 = DC3.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC4 WITH (NOLOCK) ON R.CharacterID4 = DC4.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC5 WITH (NOLOCK) ON R.CharacterID5 = DC5.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC6 WITH (NOLOCK) ON R.CharacterID6 = DC6.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC7 WITH (NOLOCK) ON R.CharacterID7 = DC7.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC8 WITH (NOLOCK) ON R.CharacterID8 = DC8.CharacterID
	LEFT OUTER JOIN dbo.DimJobs DJ1 WITH (NOLOCK) ON R.JobCode1 = DJ1.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ2 WITH (NOLOCK) ON R.JobCode2 = DJ2.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ3 WITH (NOLOCK) ON R.JobCode3 = DJ3.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ4 WITH (NOLOCK) ON R.JobCode4 = DJ4.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ5 WITH (NOLOCK) ON R.JobCode5 = DJ5.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ6 WITH (NOLOCK) ON R.JobCode6 = DJ6.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ7 WITH (NOLOCK) ON R.JobCode7 = DJ7.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ8 WITH (NOLOCK) ON R.JobCode8 = DJ8.JobCode
	INNER JOIN dbo.DimStages DS WITH (NOLOCK) ON R.StageID = DS.StageID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PastWeeklyRank_PVPKillDeath]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PastWeeklyRank_PVPKillDeath]
AS
SELECT R.BasisDate, R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank
FROM dbo.PastWeeklyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PastWeeklyRank_PVPKillDeath_2]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PastWeeklyRank_PVPKillDeath_2]
AS
SELECT R.BasisDate, R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank, R.vsAcademicKOWin, R.vsAcademicKOLose
FROM dbo.PastWeeklyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PastWeeklyRank_PVPKillDeath_3]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PastWeeklyRank_PVPKillDeath_3]
AS
SELECT R.BasisDate, R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank, R.vsAcademicKOWin, R.vsAcademicKOLose, R.vsKaliKOWin, R.vsKaliKOLose
FROM dbo.PastWeeklyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PastWeeklyRank_StageClearTime]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PastWeeklyRank_StageClearTime]
AS
SELECT R.BasisDate, R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.StageID, DS.StageName, R.CharacterLevel, R.JobCode, DJ.JobName, R.ClearTime, R.ClearDate, R.TotalRank, R.WorldRank, R.WorldCharacterClassRank, R.CharacterClassRank
FROM dbo.PastWeeklyRank_StageClearTime R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
	INNER JOIN dbo.DimStages DS WITH (NOLOCK) ON R.StageID = DS.StageID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PetSkillLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_PetSkillLogs]
	AS
	SELECT * FROM DNStaging.dbo.PetSkillLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.PetSkillLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_PointLogs]    Script Date: 11/14/2026 9:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_PointLogs]
	AS
	SELECT * FROM DNStaging.dbo.PointLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.PointLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_QuestCompleteLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_QuestCompleteLogs]
	AS
	SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.QuestCompleteLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_Rank_MissionScore]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Rank_MissionScore]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.MissionScore, R.TotalRank, R.WorldRank, R.WorldCharacterClassRank, R.CharacterClassRank
FROM dbo.Rank_MissionScore R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_RepetitionQuestCompleteLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_RepetitionQuestCompleteLogs]
	AS
	SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.RepetitionQuestCompleteLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_SkillLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_SkillLogs]
	AS
	SELECT * FROM DNStaging.dbo.SkillLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.SkillLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_SkillPointLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_SkillPointLogs]
	AS
	SELECT * FROM DNStaging.dbo.SkillPointLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.SkillPointLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_StageEndLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_StageEndLogs]
	AS
	SELECT * FROM DNStaging.dbo.StageEndLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.StageEndLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_StageLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_StageLogs]
	AS
	SELECT * FROM DNStaging.dbo.StageLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.StageLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_StageRewardLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_StageRewardLogs]
	AS
	SELECT * FROM DNStaging.dbo.StageRewardLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.StageRewardLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_TeacherAndPupilLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_TeacherAndPupilLogs]
	AS
	SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.TeacherAndPupilLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_TradeRegisterLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_TradeRegisterLogs]
	AS
	SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.TradeRegisterLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_TradeSuccessLogs]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[V_TradeSuccessLogs]
	AS
	SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20130913 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20130914 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20130915 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20130916 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20130917 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20130918 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20130919 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20130920 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20130921 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20131003 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20131004 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20131005 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20131006 UNION ALL
SELECT * FROM DNStaging.dbo.TradeSuccessLogs_20131007
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_WeeklyDarkLairRank]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_WeeklyDarkLairRank]
AS
SELECT DLR.WorldID, DLR.MapID, DLR.PartySize, DLR.PartyName, DLR.PlayRound, DLR.PlayTime, DLR.LogDate, DLR.WorldRank, DLR.TotalRank, DC1.CharacterName AS CharacterName1, DJ1.JobName AS JobName1, DC2.CharacterName AS CharacterName2, DJ2.JobName AS JobName2, DC3.CharacterName AS CharacterName3, DJ3.JobName AS JobName3 , DC4.CharacterName AS CharacterName4, DJ4.JobName AS JobName4
FROM dbo.WeeklyDarkLairRank DLR WITH(NOLOCK)
	LEFT OUTER JOIN dbo.DimCharacters DC1 WITH(NOLOCK) ON DLR.CharacterID1 = DC1.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC2 WITH(NOLOCK) ON DLR.CharacterID2 = DC2.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC3 WITH(NOLOCK) ON DLR.CharacterID3 = DC3.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC4 WITH(NOLOCK) ON DLR.CharacterID4 = DC4.CharacterID
	LEFT OUTER JOIN dbo.DimJobs DJ1 WITH(NOLOCK) ON DLR.JobCode1 = DJ1.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ2 WITH(NOLOCK) ON DLR.JobCode2 = DJ2.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ3 WITH(NOLOCK) ON DLR.JobCode3 = DJ3.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ4 WITH(NOLOCK) ON DLR.JobCode4 = DJ4.JobCode
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_WeeklyRank_NestClearTime]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_WeeklyRank_NestClearTime]
AS
SELECT R.CharacterID1, DC1.CharacterName AS CharacterName1, R.CharacterLevel1, R.JobCode1, DJ1.JobName AS JobName1
	 , R.CharacterID2, DC2.CharacterName AS CharacterName2, R.CharacterLevel2, R.JobCode2, DJ2.JobName AS JobName2
	 , R.CharacterID3, DC3.CharacterName AS CharacterName3, R.CharacterLevel3, R.JobCode3, DJ3.JobName AS JobName3
	 , R.CharacterID4, DC4.CharacterName AS CharacterName4, R.CharacterLevel4, R.JobCode4, DJ4.JobName AS JobName4
	 , R.CharacterID5, DC5.CharacterName AS CharacterName5, R.CharacterLevel5, R.JobCode5, DJ5.JobName AS JobName5
	 , R.CharacterID6, DC6.CharacterName AS CharacterName6, R.CharacterLevel6, R.JobCode6, DJ6.JobName AS JobName6
	 , R.CharacterID7, DC7.CharacterName AS CharacterName7, R.CharacterLevel7, R.JobCode7, DJ7.JobName AS JobName7
	 , R.CharacterID8, DC8.CharacterName AS CharacterName8, R.CharacterLevel8, R.JobCode8, DJ8.JobName AS JobName8
	 , R.StageID, DS.StageName, R.ClearTime, R.TotalRanking
FROM dbo.WeeklyRank_NestClearTime R WITH (NOLOCK)
	LEFT OUTER JOIN dbo.DimCharacters DC1 WITH (NOLOCK) ON R.CharacterID1 = DC1.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC2 WITH (NOLOCK) ON R.CharacterID2 = DC2.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC3 WITH (NOLOCK) ON R.CharacterID3 = DC3.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC4 WITH (NOLOCK) ON R.CharacterID4 = DC4.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC5 WITH (NOLOCK) ON R.CharacterID5 = DC5.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC6 WITH (NOLOCK) ON R.CharacterID6 = DC6.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC7 WITH (NOLOCK) ON R.CharacterID7 = DC7.CharacterID
	LEFT OUTER JOIN dbo.DimCharacters DC8 WITH (NOLOCK) ON R.CharacterID8 = DC8.CharacterID
	LEFT OUTER JOIN dbo.DimJobs DJ1 WITH (NOLOCK) ON R.JobCode1 = DJ1.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ2 WITH (NOLOCK) ON R.JobCode2 = DJ2.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ3 WITH (NOLOCK) ON R.JobCode3 = DJ3.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ4 WITH (NOLOCK) ON R.JobCode4 = DJ4.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ5 WITH (NOLOCK) ON R.JobCode5 = DJ5.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ6 WITH (NOLOCK) ON R.JobCode6 = DJ6.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ7 WITH (NOLOCK) ON R.JobCode7 = DJ7.JobCode
	LEFT OUTER JOIN dbo.DimJobs DJ8 WITH (NOLOCK) ON R.JobCode8 = DJ8.JobCode
	INNER JOIN dbo.DimStages DS WITH (NOLOCK) ON R.StageID = DS.StageID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_WeeklyRank_PVPKillDeath]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_WeeklyRank_PVPKillDeath]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank
FROM dbo.WeeklyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_WeeklyRank_PVPKillDeath_2]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_WeeklyRank_PVPKillDeath_2]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank, R.vsAcademicKOWin, R.vsAcademicKOLose
FROM dbo.WeeklyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_WeeklyRank_PVPKillDeath_3]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_WeeklyRank_PVPKillDeath_3]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank, R.vsAcademicKOWin, R.vsAcademicKOLose, R.vsKaliKOWin, R.vsKaliKOLose
FROM dbo.WeeklyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_WeeklyRank_PVPKillDeath_4]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_WeeklyRank_PVPKillDeath_4]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.CharacterLevel, R.JobCode, DJ.JobName, R.PVPLevel, R.KillCount, R.DeathCount, R.vsWarriorKOWin, R.vsWarriorKOLose, R.vsArcherKOWin, R.vsArcherKOLose, R.vsSorceressKOWin, R.vsSorceressKOLose, R.vsClericKOWin, R.vsClericKOLose, R.TotalKillRank, R.WorldKillRank, R.WorldCharacterClassKillRank, R.CharacterClassKillRank, R.TotalDeathRank, R.WorldDeathRank, R.WorldCharacterClassDeathRank, R.CharacterClassDeathRank, R.vsAcademicKOWin, R.vsAcademicKOLose, R.vsKaliKOWin, R.vsKaliKOLose, DJ2.JobCode AS CharacterClassCode, DJ2.JobName AS CharacterClassName
FROM dbo.WeeklyRank_PVPKillDeath R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
	INNER JOIN dbo.DimJobs DJ2 WITH (NOLOCK) ON DC.CharacterClassCode = DJ2.JobCode
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_WeeklyRank_StageClearTime]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_WeeklyRank_StageClearTime]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.StageID, DS.StageName, R.CharacterLevel, R.JobCode, DJ.JobName, R.ClearTime, R.ClearDate, R.TotalRank, R.WorldRank, R.WorldCharacterClassRank, R.CharacterClassRank
FROM dbo.WeeklyRank_StageClearTime R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
	INNER JOIN dbo.DimStages DS WITH (NOLOCK) ON R.StageID = DS.StageID
GO
USE [dnstaging]
GO
/****** Object:  View [dbo].[V_WeeklyRank_StageClearTime_2]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_WeeklyRank_StageClearTime_2]
AS
SELECT R.CharacterID, DC.CharacterName, R.WorldID, DW.WorldName, R.StageID, DS.StageName, R.CharacterLevel, R.JobCode, DJ.JobName, R.ClearTime, R.ClearDate, R.TotalRank, R.WorldRank, R.WorldCharacterClassRank, R.CharacterClassRank, DJ2.JobCode AS CharacterClassCode, DJ2.JobName AS CharacterClassName
FROM dbo.WeeklyRank_StageClearTime R WITH (NOLOCK)
	INNER JOIN dbo.DimCharacters DC WITH (NOLOCK) ON R.CharacterID = DC.CharacterID
	INNER JOIN dbo.DimJobs DJ WITH (NOLOCK) ON R.JobCode = DJ.JobCode
	INNER JOIN dbo.DimWorlds DW WITH (NOLOCK) ON R.WorldID = DW.WorldID
	INNER JOIN dbo.DimStages DS WITH (NOLOCK) ON R.StageID = DS.StageID
	INNER JOIN dbo.DimJobs DJ2 WITH (NOLOCK) ON DC.CharacterClassCode = DJ2.JobCode
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_AlteiaReceiveTicketTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_AlteiaReceiveTicketTotals] 
					WITH SCHEMABINDING AS
						SELECT ReceiveCharacterID AS CharacterID, COUNT_BIG(*) AS ReceiveTicketCount
						FROM dbo.AlteiaSendTickets 
						GROUP BY ReceiveCharacterID;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_AlteiaReceiveTicketTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_AlteiaReceiveTicketTotals] ON [dbo].[VIX_AlteiaReceiveTicketTotals]
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DataFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_AlteiaSendTicketTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_AlteiaSendTicketTotals] 
					WITH SCHEMABINDING AS
						SELECT CharacterID, COUNT_BIG(*) AS SendTicketCount
						FROM dbo.AlteiaSendTickets 
						GROUP BY CharacterID;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_AlteiaSendTicketTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_AlteiaSendTicketTotals] ON [dbo].[VIX_AlteiaSendTicketTotals]
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DataFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_AuctionBiddingCount]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_AuctionBiddingCount] AS
SELECT A.AuctionID, MAX(BiddingPrice) AS MaxBiddingPrice, COUNT(*) AS BiddingCount, MAX(BiddingID) AS LastBiddingID
FROM dbo.AuctionBidding A
GROUP BY A.AuctionID
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_CashRebirthCoinTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_CashRebirthCoinTotals]
WITH SCHEMABINDING
AS
SELECT CharacterID, SUM(RemainCoinCount) AS RemainCoinCount, COUNT_BIG(*) AS cnt
FROM dbo.CashRebirthCoins
GROUP BY CharacterID
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_CashRebirthCoinTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_CashRebirthCoinTotals] ON [dbo].[VIX_CashRebirthCoinTotals]
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_DNGirlFanCount]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_DNGirlFanCount] WITH SCHEMABINDING AS
SELECT DGI.DNGirlCharacterID, COUNT_BIG(*) CharacterCount, SUM(CASE WHEN FanFlag = CAST(1 AS bit) THEN 1 ELSE 0 END) FanCount, SUM(Intimacy) TotalFanIntimacy
FROM dbo.DNGirlIntimacy DGI
GROUP BY DGI.DNGirlCharacterID;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_DNGirlFanCount]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_DNGirlFanCount] ON [dbo].[VIX_DNGirlFanCount]
(
	[DNGirlCharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DataFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_DailyLikeCount]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_DailyLikeCount] 
WITH SCHEMABINDING AS
SELECT DL.CharacterID, COUNT_BIG(*) AS LikeCount
FROM dbo.DailyLikes DL
GROUP BY DL.CharacterID
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_DragonJewelCount]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_DragonJewelCount] WITH SCHEMABINDING AS
SELECT DJ.ParentItemSerial, COUNT_BIG(*) DragonJewelCount
FROM dbo.DragonJewels DJ
GROUP BY DJ.ParentItemSerial
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_FieldAttachmentCount]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_FieldAttachmentCount]
WITH SCHEMABINDING
AS
SELECT FarmID, FieldIndex, AttachedItemID, COUNT_BIG(*) AS AttachedItemCount
FROM dbo.FieldAttachments
GROUP BY FarmID, FieldIndex, AttachedItemID
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_FieldAttachmentCount]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_FieldAttachmentCount] ON [dbo].[VIX_FieldAttachmentCount]
(
	[FarmID] ASC,
	[FieldIndex] ASC,
	[AttachedItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_FieldCountByCharacter]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_FieldCountByCharacter]
WITH SCHEMABINDING
AS
SELECT CharacterID, FarmID, COUNT_BIG(*) AS FieldCount
FROM dbo.Fields
GROUP BY CharacterID, FarmID;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_FieldCountByCharacter]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_FieldCountByCharacter] ON [dbo].[VIX_FieldCountByCharacter]
(
	[CharacterID] ASC,
	[FarmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_FriendGroupTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_FriendGroupTotals]
WITH SCHEMABINDING
AS
SELECT CharacterID, COUNT_BIG(*) AS FriendGroupCount
FROM dbo.FriendGroups
GROUP BY CharacterID
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_FriendGroupTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_FriendGroupTotals] ON [dbo].[VIX_FriendGroupTotals]
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_FriendTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_FriendTotals] WITH SCHEMABINDING AS
SELECT FR.CharacterID, COUNT_BIG(*) AS FriendCount
FROM dbo.Friends FR
	INNER JOIN dbo.Characters CH ON FR.FriendCharacterID = CH.CharacterID
WHERE CH.DeleteFlag = CAST(0 AS bit) AND (FR.FriendStatusCode = 1 OR FR.FriendCharacterID IS NULL)
GROUP BY FR.CharacterID
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_FriendTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_FriendTotals] ON [dbo].[VIX_FriendTotals]
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DataFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_GambleParticipantesTotal]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_GambleParticipantesTotal]
WITH SCHEMABINDING AS
	SELECT GambleID, COUNT_BIG(*) AS GambleParticipantesCount
	FROM dbo.GambleParticipantes 
	GROUP BY GambleID
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_GambleParticipantesTotal_GambleID]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_GambleParticipantesTotal_GambleID] ON [dbo].[VIX_GambleParticipantesTotal]
(
	[GambleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DataFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_GlobalEventEntryCount]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_GlobalEventEntryCount]
WITH SCHEMABINDING
AS
SELECT GlobalEventScheduleID, SUM(EntryCount) AS EntryCountSum, COUNT_BIG(*) AS EntryCountTotal
  FROM dbo.GlobalEventEntryCount
 GROUP BY GlobalEventScheduleID;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_GlobalEventEntryCount]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_GlobalEventEntryCount] ON [dbo].[VIX_GlobalEventEntryCount]
(
	[GlobalEventScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_GuildDepotSize]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_GuildDepotSize]
WITH SCHEMABINDING
AS
SELECT GuildID, COUNT_BIG(*) AS GuildDepotSize
FROM dbo.GuildDepots
GROUP BY GuildID;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_GuildDepotSize]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_GuildDepotSize] ON [dbo].[VIX_GuildDepotSize]
(
	[GuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_GuildHistoryCount]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_GuildHistoryCount]
WITH SCHEMABINDING
AS
SELECT GuildID, COUNT_BIG(*) AS RecordCount
FROM dbo.GuildHistory
WHERE GuildHistoryCode < 254
GROUP BY GuildID
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_GuildHistoryCount]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_GuildHistoryCount] ON [dbo].[VIX_GuildHistoryCount]
(
	[GuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_GuildMemberCountByTeamColor]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_GuildMemberCountByTeamColor]
WITH SCHEMABINDING
AS
SELECT G.GuildWarScheduleID, G.TeamColorCode, COUNT_BIG(*) AS MemberCount
  FROM dbo.Guilds G
       INNER JOIN dbo.GuildMembers GM ON G.GuildID = GM.GuildID
 WHERE G.TeamColorCode IS NOT NULL
GROUP BY G.GuildWarScheduleID, G.TeamColorCode;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_GuildMemberCountByTeamColor]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_GuildMemberCountByTeamColor] ON [dbo].[VIX_GuildMemberCountByTeamColor]
(
	[GuildWarScheduleID] ASC,
	[TeamColorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DataFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_GuildMemberTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_GuildMemberTotals]
WITH SCHEMABINDING AS
SELECT GM.GuildID, COUNT_BIG(*) AS GuildMemberCount
FROM dbo.Guilds G
	INNER JOIN dbo.GuildMembers GM ON G.GuildID = GM.GuildID
WHERE G.CloseFlag = CAST(0 AS bit)
GROUP BY GM.GuildID
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_GuildMemberTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_GuildMemberTotals] ON [dbo].[VIX_GuildMemberTotals]
(
	[GuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DataFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_GuildWarOpeningPointForCharacter]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_GuildWarOpeningPointForCharacter]
                    WITH SCHEMABINDING
                    AS
                    SELECT CharacterID, SUM(OpeningPoint) AS OpeningPoint, COUNT_BIG(*) AS Cnt
                    FROM dbo.GuildWarOpeningPointRecord
                    GROUP BY CharacterID;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_GuildWarOpeningPointForCharacter]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_GuildWarOpeningPointForCharacter] ON [dbo].[VIX_GuildWarOpeningPointForCharacter]
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_GuildWarOpeningPointForGuild]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_GuildWarOpeningPointForGuild] WITH SCHEMABINDING AS
                    SELECT GuildID, SUM(OpeningPoint) AS OpeningPoint, COUNT_BIG(*) AS Cnt
                    FROM dbo.GuildWarOpeningPointRecord
                    GROUP BY GuildID
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_GuildWarOpeningPointForGuild]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_GuildWarOpeningPointForGuild] ON [dbo].[VIX_GuildWarOpeningPointForGuild]
(
	[GuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_GuildWarOpeningPointForTeam]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_GuildWarOpeningPointForTeam]
                    WITH SCHEMABINDING
                    AS
                    SELECT TeamColorCode, SUM(OpeningPoint) AS OpeningPoint, COUNT_BIG(*) AS Cnt
                    FROM dbo.GuildWarOpeningPointRecord
                    GROUP BY TeamColorCode;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_GuildWarOpeningPointForTeam]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_GuildWarOpeningPointForTeam] ON [dbo].[VIX_GuildWarOpeningPointForTeam]
(
	[TeamColorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_MailAttachItemCounts]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_MailAttachItemCounts] WITH SCHEMABINDING AS
SELECT MailID, ReceiveFlag, COUNT_BIG(*) AS MailAttachItemCount
FROM dbo.MailAttachItems
GROUP BY MailID, ReceiveFlag
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_MailAttachItemCounts]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_MailAttachItemCounts] ON [dbo].[VIX_MailAttachItemCounts]
(
	[MailID] ASC,
	[ReceiveFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_MonthlyDonation]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_MonthlyDonation]
WITH SCHEMABINDING
AS
SELECT DN.CharacterID, DN.DonationAmount, DN.DonateDate
FROM dbo.DailyDonation DN
	INNER JOIN dbo.Characters CH ON DN.CharacterID = CH.CharacterID
WHERE CH.DeleteFlag = CAST(0 AS bit) AND AccountLevelCode = 0;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_MonthlyDonation]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_MonthlyDonation] ON [dbo].[VIX_MonthlyDonation]
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DataFG1]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_NN_VIX_MonthlyDonation_DonationAmount_DonateDate]    Script Date: 11/14/2026 8:54:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_NN_VIX_MonthlyDonation_DonationAmount_DonateDate] ON [dbo].[VIX_MonthlyDonation]
(
	[DonationAmount] DESC,
	[DonateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_PVPLadderRanking]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_PVPLadderRanking]
WITH SCHEMABINDING
AS
SELECT A.PVPLadderCode, A.CharacterID, B.CharacterName, C.JobCode, A.PVPLadderGradePoint, A.Win, A.Lose, A.Draw
	, CASE (A.Win + A.Lose + A.Draw)
		WHEN 0 THEN 0
		ELSE A.Win * 10000 / (A.Win + A.Lose + A.Draw)
	END AS WinRatio
FROM dbo.PVPLadderScores A
	INNER JOIN dbo.Characters B ON A.CharacterID = B.CharacterID
	INNER JOIN dbo.CharacterStatus C ON A.CharacterID = C.CharacterID
WHERE A.Win > 0 OR A.Lose > 0 OR A.Draw > 0;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_PVPLadderRanking]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_PVPLadderRanking] ON [dbo].[VIX_PVPLadderRanking]
(
	[PVPLadderCode] ASC,
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_NN_VIX_PVPLadderRanking_PVPLadderCode_PVPLadderGradePoint_WinRatio_Lose]    Script Date: 11/14/2026 8:54:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_NN_VIX_PVPLadderRanking_PVPLadderCode_PVPLadderGradePoint_WinRatio_Lose] ON [dbo].[VIX_PVPLadderRanking]
(
	[PVPLadderCode] ASC,
	[PVPLadderGradePoint] DESC,
	[WinRatio] DESC,
	[Lose] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_PartyDNGirlCount]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_PartyDNGirlCount]
WITH SCHEMABINDING AS
SELECT PartyID, COUNT_BIG(*) AS PartyDNGirlCount
FROM dbo.PartyJoins PJ WITH(NOLOCK) 
	LEFT OUTER JOIN dbo.Characters CH WITH(NOLOCK) ON PJ.CharacterID = CH.CharacterID
WHERE CH.AccountLevelCode = 120
GROUP BY PartyID;
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_PartyMemberCount]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_PartyMemberCount]
WITH SCHEMABINDING AS
SELECT PartyID, COUNT_BIG(*) AS PartyMemberCount, MAX(CharacterTypeCode) AS CharacterTypeCode
FROM dbo.PartyJoins
GROUP BY PartyID;
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_PotentialBoxStat]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_PotentialBoxStat]
WITH SCHEMABINDING
AS
SELECT PeriodicResetValue, COUNT_BIG(*) AS Cnt
FROM dbo.PeriodicReset
WHERE PeriodicResetCode = 32
GROUP BY PeriodicResetValue
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_PotentialBoxStat]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_PotentialBoxStat] ON [dbo].[VIX_PotentialBoxStat]
(
	[PeriodicResetValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_PupilCount]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_PupilCount]
WITH SCHEMABINDING
AS
SELECT TeacherCharacterID, COUNT_BIG(*) AS PupilCount
FROM dbo.TeachersAndPupils
WHERE GraduateFlag = CAST(0 AS bit)
GROUP BY TeacherCharacterID
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_PupilCount]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_PupilCount] ON [dbo].[VIX_PupilCount]
(
	[TeacherCharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_TeacherCount]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_TeacherCount]
WITH SCHEMABINDING
AS
SELECT PupilCharacterID, COUNT_BIG(*) AS TeacherCount
FROM dbo.TeachersAndPupils
WHERE GraduateFlag = CAST(0 AS bit)
GROUP BY PupilCharacterID
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_TeacherCountt]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_TeacherCountt] ON [dbo].[VIX_TeacherCount]
(
	[PupilCharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_TotalPvPRoomMemberCount]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_TotalPvPRoomMemberCount]
WITH SCHEMABINDING AS
SELECT TotalPvPRoomID, COUNT_BIG(*) AS PvPRoomMemberCount
FROM dbo.TotalPvPRoomMembers
WHERE ObserverFlag = 0
GROUP BY TotalPvPRoomID
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_TotalPvPRoomMemberCount_TotalPvPRoomID]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_TotalPvPRoomMemberCount_TotalPvPRoomID] ON [dbo].[VIX_TotalPvPRoomMemberCount]
(
	[TotalPvPRoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DataFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_TradeItems]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_TradeItems]
WITH SCHEMABINDING AS
SELECT ItemID, COUNT_BIG(*) AS TradeCount
FROM dbo.Trade
WHERE TradeStatusCode = 0
GROUP BY ItemID
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_TradeItems]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_TradeItems] ON [dbo].[VIX_TradeItems]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[VIX_TradeTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIX_TradeTotals]
WITH SCHEMABINDING AS
SELECT CharacterID, TradeStatusCode, SUM(CAST(RegisterCommission AS bigint)) AS RegisterCommission, SUM(CAST(TradeCommission AS bigint)) AS TradeCommission, COUNT_BIG(*) AS TradeCount
FROM dbo.Trade
GROUP BY CharacterID, TradeStatusCode;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_UC_VIX_TradeTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_UC_VIX_TradeTotals] ON [dbo].[VIX_TradeTotals]
(
	[CharacterID] ASC,
	[TradeStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexFG1]
GO
USE [dnworld]
GO
/****** Object:  View [dbo].[V_Characters]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Characters]
AS
SELECT CH.WorldID
     , CH.CharacterID
	 , CH.AccountID
	 , CH.AccountName
	 , CH.AccountLevelCode
	 , CH.CharacterName
	 , CH.CharacterClassCode
	 , CH.CharacterIndex
 	 , CH.VillageFirstVisitFlag
	 , CH.DefaultBody
	 , CH.DefaultLeg
	 , CH.DefaultHand
	 , CH.DefaultFoot
	 , CH.DeleteFlag
	 , CH.SkillResetFlag
	 , CH.DeleteDate
	 , CHS.CharacterLevel
	 , CHS.CharacterExp
	 , CHS.MissionScore
	 , CHS.JobCode
	 , CHS.HairColor
	 , CHS.EyeColor
	 , CHS.SkinColor
	 , CHS.LastMapID
	 , CHS.LastVillageMapID
	 , CHS.LastDarkLairVillageMapID
	 , CHS.LastVillageGateNumber
	 , CHS.PositionX
	 , CHS.PositionY
	 , CHS.PositionZ
	 , CHS.Rotate
	 , CHS.Coin
	 , CHS.WarehouseCoin
	 , CHS.LastRebirthCoinDate
	 , CHS.RebirthCoin
	 , CHS.PCRoomRebirthCoin
	 , CHS.SkillPoint
	 , CHS.LastFatigueDate
	 , CHS.Fatigue
	 , CHS.PCRoomFatigue
	 , CHS.WeeklyFatigue
	 , CHS.ViewCashEquip1Flag
	 , CHS.ViewCashEquip2Flag
	 , CHS.CheckSumBin
	 , CHS.LastLogoutDate
	 , CHS.LastLoginDate
	 , CHS.EventFatigue
	 , CHS.EventFatigueGainDate
	 , CHS.VIPFatigue
  FROM dbo.Characters CH
      INNER JOIN dbo.CharacterStatus CHS ON CH.CharacterID = CHS.CharacterID
GO

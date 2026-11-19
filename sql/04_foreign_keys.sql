SET NOCOUNT ON;
GO
USE [dngsm]
GO
ALTER TABLE [dbo].[BoardAttachment]  WITH CHECK ADD  CONSTRAINT [FK_BoardAttachment_BoardMain] FOREIGN KEY([BoardSeq])
REFERENCES [dbo].[BoardMain] ([BoardSeq])
GO
ALTER TABLE [dbo].[BoardAttachment] CHECK CONSTRAINT [FK_BoardAttachment_BoardMain]
GO
ALTER TABLE [dbo].[BoardComments]  WITH CHECK ADD  CONSTRAINT [FK_BoardComments_BoardMain] FOREIGN KEY([BoardSeq])
REFERENCES [dbo].[BoardMain] ([BoardSeq])
GO
ALTER TABLE [dbo].[BoardComments] CHECK CONSTRAINT [FK_BoardComments_BoardMain]
GO
ALTER TABLE [dbo].[ItemGroupForGivingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ItemGroupsForGiving_ItemGroupForGivingDetails_ItemGroupID] FOREIGN KEY([ItemGroupID])
REFERENCES [dbo].[ItemGroupsForGiving] ([ItemGroupID])
GO
ALTER TABLE [dbo].[ItemGroupForGivingDetails] CHECK CONSTRAINT [FK_ItemGroupsForGiving_ItemGroupForGivingDetails_ItemGroupID]
GO
ALTER TABLE [dbo].[MailAttachItems]  WITH CHECK ADD  CONSTRAINT [FK_SendMailLog_MailAttachItems_AuditLogID] FOREIGN KEY([AuditLogID])
REFERENCES [dbo].[SendMailLog] ([AuditLogID])
GO
ALTER TABLE [dbo].[MailAttachItems] CHECK CONSTRAINT [FK_SendMailLog_MailAttachItems_AuditLogID]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Menus_ParentMenuID] FOREIGN KEY([ParentMenuID])
REFERENCES [dbo].[Menus] ([MenuID])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_Menus_Menus_ParentMenuID]
GO
ALTER TABLE [dbo].[SendMailLog]  WITH CHECK ADD  CONSTRAINT [FK_AuditLogs_SendMailLog_AuditLogID] FOREIGN KEY([AuditLogID])
REFERENCES [dbo].[AuditLogs] ([AuditLogID])
GO
ALTER TABLE [dbo].[SendMailLog] CHECK CONSTRAINT [FK_AuditLogs_SendMailLog_AuditLogID]
GO
ALTER TABLE [dbo].[UsedMenuByRole]  WITH CHECK ADD  CONSTRAINT [FK_Menus_UsedMenuByRole_MenuID] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menus] ([MenuID])
GO
ALTER TABLE [dbo].[UsedMenuByRole] CHECK CONSTRAINT [FK_Menus_UsedMenuByRole_MenuID]
GO
ALTER TABLE [dbo].[UsedMenuByRole]  WITH CHECK ADD  CONSTRAINT [FK_Roles_UsedMenuByRole_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UsedMenuByRole] CHECK CONSTRAINT [FK_Roles_UsedMenuByRole_RoleID]
GO
USE [dnmembership]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Restraints_CanceledRestraints_RestraintID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CanceledRestraints]'))
ALTER TABLE [dbo].[CanceledRestraints]  WITH CHECK ADD  CONSTRAINT [FK_Restraints_CanceledRestraints_RestraintID] FOREIGN KEY([RestraintID])
REFERENCES [dbo].[Restraints] ([RestraintID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Restraints_CanceledRestraints_RestraintID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CanceledRestraints]'))
ALTER TABLE [dbo].[CanceledRestraints] CHECK CONSTRAINT [FK_Restraints_CanceledRestraints_RestraintID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_CashIncome_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CashIncome]'))
ALTER TABLE [dbo].[CashIncome]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_CashIncome_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_CashIncome_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CashIncome]'))
ALTER TABLE [dbo].[CashIncome] CHECK CONSTRAINT [FK_Accounts_CashIncome_AccountID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_CashOutgo_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CashOutgo]'))
ALTER TABLE [dbo].[CashOutgo]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_CashOutgo_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_CashOutgo_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CashOutgo]'))
ALTER TABLE [dbo].[CashOutgo] CHECK CONSTRAINT [FK_Accounts_CashOutgo_AccountID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrders_CashOutgo_PurchaseOrderID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CashOutgo]'))
ALTER TABLE [dbo].[CashOutgo]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_CashOutgo_PurchaseOrderID] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrders] ([PurchaseOrderID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrders_CashOutgo_PurchaseOrderID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CashOutgo]'))
ALTER TABLE [dbo].[CashOutgo] CHECK CONSTRAINT [FK_PurchaseOrders_CashOutgo_PurchaseOrderID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_CharacterDeleteReviveLogs_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CharacterDeleteReviveLogs]'))
ALTER TABLE [dbo].[CharacterDeleteReviveLogs]  WITH CHECK ADD  CONSTRAINT [FK_Characters_CharacterDeleteReviveLogs_CharacterID] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Characters] ([CharacterID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_CharacterDeleteReviveLogs_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CharacterDeleteReviveLogs]'))
ALTER TABLE [dbo].[CharacterDeleteReviveLogs] CHECK CONSTRAINT [FK_Characters_CharacterDeleteReviveLogs_CharacterID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_CharacterNameChangeLogs_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CharacterNameChangeLogs]'))
ALTER TABLE [dbo].[CharacterNameChangeLogs]  WITH CHECK ADD  CONSTRAINT [FK_Characters_CharacterNameChangeLogs_CharacterID] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Characters] ([CharacterID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_CharacterNameChangeLogs_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CharacterNameChangeLogs]'))
ALTER TABLE [dbo].[CharacterNameChangeLogs] CHECK CONSTRAINT [FK_Characters_CharacterNameChangeLogs_CharacterID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Characters_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Characters]'))
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Characters_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Characters_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Characters]'))
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [FK_Accounts_Characters_AccountID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CodeKinds_Codes_codeColumnName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Codes]'))
ALTER TABLE [dbo].[Codes]  WITH CHECK ADD  CONSTRAINT [FK_CodeKinds_Codes_codeColumnName] FOREIGN KEY([codeColumnName])
REFERENCES [dbo].[CodeKinds] ([codeColumnName])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CodeKinds_Codes_codeColumnName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Codes]'))
ALTER TABLE [dbo].[Codes] CHECK CONSTRAINT [FK_CodeKinds_Codes_codeColumnName]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DNAuth_CertifyingStep]') AND parent_object_id = OBJECT_ID(N'[dbo].[DNAuth]'))
ALTER TABLE [dbo].[DNAuth] CHECK CONSTRAINT [CK_DNAuth_CertifyingStep]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DNEvents_DNEventSchedules_DNEventID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DNEventSchedules]'))
ALTER TABLE [dbo].[DNEventSchedules]  WITH NOCHECK ADD  CONSTRAINT [FK_DNEvents_DNEventSchedules_DNEventID] FOREIGN KEY([DNEventID])
REFERENCES [dbo].[DNEvents] ([DNEventID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DNEvents_DNEventSchedules_DNEventID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DNEventSchedules]'))
ALTER TABLE [dbo].[DNEventSchedules] CHECK CONSTRAINT [FK_DNEvents_DNEventSchedules_DNEventID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DNEventDetails_DNEvents_DNEventDetailID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DNEvents]'))
ALTER TABLE [dbo].[DNEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_DNEventDetails_DNEvents_DNEventDetailID] FOREIGN KEY([DNEventDetailID])
REFERENCES [dbo].[DNEventDetails] ([DNEventDetailID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DNEventDetails_DNEvents_DNEventDetailID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DNEvents]'))
ALTER TABLE [dbo].[DNEvents] CHECK CONSTRAINT [FK_DNEventDetails_DNEvents_DNEventDetailID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_DeletedCharacters_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DeletedCharacters]'))
ALTER TABLE [dbo].[DeletedCharacters]  WITH CHECK ADD  CONSTRAINT [FK_Characters_DeletedCharacters_CharacterID] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Characters] ([CharacterID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_DeletedCharacters_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DeletedCharacters]'))
ALTER TABLE [dbo].[DeletedCharacters] CHECK CONSTRAINT [FK_Characters_DeletedCharacters_CharacterID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Employees_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Employees_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Employees_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Accounts_Employees_AccountID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventRewards_EventRewardItems_EventRewardID]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventRewardItems]'))
ALTER TABLE [dbo].[EventRewardItems]  WITH CHECK ADD  CONSTRAINT [FK_EventRewards_EventRewardItems_EventRewardID] FOREIGN KEY([EventRewardID])
REFERENCES [dbo].[EventRewards] ([EventRewardID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventRewards_EventRewardItems_EventRewardID]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventRewardItems]'))
ALTER TABLE [dbo].[EventRewardItems] CHECK CONSTRAINT [FK_EventRewards_EventRewardItems_EventRewardID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventRewards_EventRewardReceivers_EventRewardID]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventRewardReceivers]'))
ALTER TABLE [dbo].[EventRewardReceivers]  WITH CHECK ADD  CONSTRAINT [FK_EventRewards_EventRewardReceivers_EventRewardID] FOREIGN KEY([EventRewardID])
REFERENCES [dbo].[EventRewards] ([EventRewardID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventRewards_EventRewardReceivers_EventRewardID]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventRewardReceivers]'))
ALTER TABLE [dbo].[EventRewardReceivers] CHECK CONSTRAINT [FK_EventRewards_EventRewardReceivers_EventRewardID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventRewards_EventRewardTargets_EventRewardID]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventRewardTargets]'))
ALTER TABLE [dbo].[EventRewardTargets]  WITH CHECK ADD  CONSTRAINT [FK_EventRewards_EventRewardTargets_EventRewardID] FOREIGN KEY([EventRewardID])
REFERENCES [dbo].[EventRewards] ([EventRewardID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventRewards_EventRewardTargets_EventRewardID]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventRewardTargets]'))
ALTER TABLE [dbo].[EventRewardTargets] CHECK CONSTRAINT [FK_EventRewards_EventRewardTargets_EventRewardID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventScheduleForPetal_EventScheduleDetailForPetal_EventScheduleID]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventScheduleDetailForPetal]'))
ALTER TABLE [dbo].[EventScheduleDetailForPetal]  WITH CHECK ADD  CONSTRAINT [FK_EventScheduleForPetal_EventScheduleDetailForPetal_EventScheduleID] FOREIGN KEY([EventScheduleID])
REFERENCES [dbo].[EventScheduleForPetal] ([EventScheduleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventScheduleForPetal_EventScheduleDetailForPetal_EventScheduleID]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventScheduleDetailForPetal]'))
ALTER TABLE [dbo].[EventScheduleDetailForPetal] CHECK CONSTRAINT [FK_EventScheduleForPetal_EventScheduleDetailForPetal_EventScheduleID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventConditionForPetal_EventScheduleForPetal_EventConditionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventScheduleForPetal]'))
ALTER TABLE [dbo].[EventScheduleForPetal]  WITH CHECK ADD  CONSTRAINT [FK_EventConditionForPetal_EventScheduleForPetal_EventConditionID] FOREIGN KEY([EventConditionID])
REFERENCES [dbo].[EventConditionForPetal] ([EventConditionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventConditionForPetal_EventScheduleForPetal_EventConditionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventScheduleForPetal]'))
ALTER TABLE [dbo].[EventScheduleForPetal] CHECK CONSTRAINT [FK_EventConditionForPetal_EventScheduleForPetal_EventConditionID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Introducers_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Introducers]'))
ALTER TABLE [dbo].[Introducers]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Introducers_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Introducers_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Introducers]'))
ALTER TABLE [dbo].[Introducers] CHECK CONSTRAINT [FK_Accounts_Introducers_AccountID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Introducers_IntroducedAccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Introducers]'))
ALTER TABLE [dbo].[Introducers]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Introducers_IntroducedAccountID] FOREIGN KEY([IntroducedAccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Introducers_IntroducedAccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Introducers]'))
ALTER TABLE [dbo].[Introducers] CHECK CONSTRAINT [FK_Accounts_Introducers_IntroducedAccountID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_MobileAuthentication_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[MobileAuthentication]'))
ALTER TABLE [dbo].[MobileAuthentication]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_MobileAuthentication_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_MobileAuthentication_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[MobileAuthentication]'))
ALTER TABLE [dbo].[MobileAuthentication] CHECK CONSTRAINT [FK_Accounts_MobileAuthentication_AccountID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_PetalIncome_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PetalIncome]'))
ALTER TABLE [dbo].[PetalIncome]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_PetalIncome_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_PetalIncome_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PetalIncome]'))
ALTER TABLE [dbo].[PetalIncome] CHECK CONSTRAINT [FK_Accounts_PetalIncome_AccountID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrderDetails_PetalIncome_PurchaseOrderDetailID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PetalIncome]'))
ALTER TABLE [dbo].[PetalIncome]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetails_PetalIncome_PurchaseOrderDetailID] FOREIGN KEY([PurchaseOrderDetailID])
REFERENCES [dbo].[PurchaseOrderDetails] ([PurchaseOrderDetailID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrderDetails_PetalIncome_PurchaseOrderDetailID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PetalIncome]'))
ALTER TABLE [dbo].[PetalIncome] CHECK CONSTRAINT [FK_PurchaseOrderDetails_PetalIncome_PurchaseOrderDetailID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PetalIncome_PetalOutgo_PetalIncomeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PetalOutgo]'))
ALTER TABLE [dbo].[PetalOutgo]  WITH CHECK ADD  CONSTRAINT [FK_PetalIncome_PetalOutgo_PetalIncomeID] FOREIGN KEY([PetalIncomeID])
REFERENCES [dbo].[PetalIncome] ([PetalIncomeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PetalIncome_PetalOutgo_PetalIncomeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PetalOutgo]'))
ALTER TABLE [dbo].[PetalOutgo] CHECK CONSTRAINT [FK_PetalIncome_PetalOutgo_PetalIncomeID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrders_PetalOutgo_PurchaseOrderID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PetalOutgo]'))
ALTER TABLE [dbo].[PetalOutgo]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_PetalOutgo_PurchaseOrderID] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrders] ([PurchaseOrderID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrders_PetalOutgo_PurchaseOrderID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PetalOutgo]'))
ALTER TABLE [dbo].[PetalOutgo] CHECK CONSTRAINT [FK_PurchaseOrders_PetalOutgo_PurchaseOrderID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrders_PurchaseOrderDetails_PurchaseOrderID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseOrderDetails]'))
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_PurchaseOrderDetails_PurchaseOrderID] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrders] ([PurchaseOrderID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrders_PurchaseOrderDetails_PurchaseOrderID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseOrderDetails]'))
ALTER TABLE [dbo].[PurchaseOrderDetails] CHECK CONSTRAINT [FK_PurchaseOrders_PurchaseOrderDetails_PurchaseOrderID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_PurchaseOrders_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseOrders]'))
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_Characters_PurchaseOrders_CharacterID] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Characters] ([CharacterID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_PurchaseOrders_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseOrders]'))
ALTER TABLE [dbo].[PurchaseOrders] CHECK CONSTRAINT [FK_Characters_PurchaseOrders_CharacterID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_PurchaseOrders_ReceiverCharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseOrders]'))
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_Characters_PurchaseOrders_ReceiverCharacterID] FOREIGN KEY([ReceiverCharacterID])
REFERENCES [dbo].[Characters] ([CharacterID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_PurchaseOrders_ReceiverCharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseOrders]'))
ALTER TABLE [dbo].[PurchaseOrders] CHECK CONSTRAINT [FK_Characters_PurchaseOrders_ReceiverCharacterID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Restraints_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Restraints]'))
ALTER TABLE [dbo].[Restraints]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Restraints_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Restraints_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Restraints]'))
ALTER TABLE [dbo].[Restraints] CHECK CONSTRAINT [FK_Accounts_Restraints_AccountID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_Restraints_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Restraints]'))
ALTER TABLE [dbo].[Restraints]  WITH CHECK ADD  CONSTRAINT [FK_Characters_Restraints_CharacterID] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Characters] ([CharacterID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_Restraints_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Restraints]'))
ALTER TABLE [dbo].[Restraints] CHECK CONSTRAINT [FK_Characters_Restraints_CharacterID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_SecondAuthLogs_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecondAuthLogs]'))
ALTER TABLE [dbo].[SecondAuthLogs]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_SecondAuthLogs_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_SecondAuthLogs_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecondAuthLogs]'))
ALTER TABLE [dbo].[SecondAuthLogs] CHECK CONSTRAINT [FK_Accounts_SecondAuthLogs_AccountID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrderDetails_SelectedItems_PurchaseOrderDetailID]') AND parent_object_id = OBJECT_ID(N'[dbo].[SelectedItems]'))
ALTER TABLE [dbo].[SelectedItems]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetails_SelectedItems_PurchaseOrderDetailID] FOREIGN KEY([PurchaseOrderDetailID])
REFERENCES [dbo].[PurchaseOrderDetails] ([PurchaseOrderDetailID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrderDetails_SelectedItems_PurchaseOrderDetailID]') AND parent_object_id = OBJECT_ID(N'[dbo].[SelectedItems]'))
ALTER TABLE [dbo].[SelectedItems] CHECK CONSTRAINT [FK_PurchaseOrderDetails_SelectedItems_PurchaseOrderDetailID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TemporaryBlock_TemporaryOpenedIPs_TemporaryBlockID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TemporaryOpenedIPs]'))
ALTER TABLE [dbo].[TemporaryOpenedIPs]  WITH CHECK ADD  CONSTRAINT [FK_TemporaryBlock_TemporaryOpenedIPs_TemporaryBlockID] FOREIGN KEY([TemporaryBlockID])
REFERENCES [dbo].[TemporaryBlock] ([TemporaryBlockID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TemporaryBlock_TemporaryOpenedIPs_TemporaryBlockID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TemporaryOpenedIPs]'))
ALTER TABLE [dbo].[TemporaryOpenedIPs] CHECK CONSTRAINT [FK_TemporaryBlock_TemporaryOpenedIPs_TemporaryBlockID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_TestAccounts_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TestAccounts]'))
ALTER TABLE [dbo].[TestAccounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_TestAccounts_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_TestAccounts_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TestAccounts]'))
ALTER TABLE [dbo].[TestAccounts] CHECK CONSTRAINT [FK_Accounts_TestAccounts_AccountID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VIPPoints_VIPPointLogs_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[VIPPointLogs]'))
ALTER TABLE [dbo].[VIPPointLogs]  WITH CHECK ADD  CONSTRAINT [FK_VIPPoints_VIPPointLogs_CharacterID] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[VIPPoints] ([CharacterID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VIPPoints_VIPPointLogs_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[VIPPointLogs]'))
ALTER TABLE [dbo].[VIPPointLogs] CHECK CONSTRAINT [FK_VIPPoints_VIPPointLogs_CharacterID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_VIPPoints_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[VIPPoints]'))
ALTER TABLE [dbo].[VIPPoints]  WITH CHECK ADD  CONSTRAINT [FK_Characters_VIPPoints_CharacterID] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Characters] ([CharacterID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Characters_VIPPoints_CharacterID]') AND parent_object_id = OBJECT_ID(N'[dbo].[VIPPoints]'))
ALTER TABLE [dbo].[VIPPoints] CHECK CONSTRAINT [FK_Characters_VIPPoints_CharacterID]
GO
USE [dnserverlog]
GO
ALTER TABLE [dbo].[CommonLogs20140921] CHECK CONSTRAINT [CK_CommonLogs20140921_LogDate]
GO
ALTER TABLE [dbo].[CommonLogs20140922] CHECK CONSTRAINT [CK_CommonLogs20140922_LogDate]
GO
ALTER TABLE [dbo].[CommonLogs20140924] CHECK CONSTRAINT [CK_CommonLogs20140924_LogDate]
GO
ALTER TABLE [dbo].[CommonLogs20140925] CHECK CONSTRAINT [CK_CommonLogs20140925_LogDate]
GO
ALTER TABLE [dbo].[CommonLogs20140926] CHECK CONSTRAINT [CK_CommonLogs20140926_LogDate]
GO
ALTER TABLE [dbo].[CommonLogs20141003] CHECK CONSTRAINT [CK_CommonLogs20141003_LogDate]
GO
ALTER TABLE [dbo].[ServerPingLogs20140921] CHECK CONSTRAINT [CK_ServerPingLogs20140921_LogDate]
GO
ALTER TABLE [dbo].[ServerPingLogs20140922] CHECK CONSTRAINT [CK_ServerPingLogs20140922_LogDate]
GO
ALTER TABLE [dbo].[ServerPingLogs20140924] CHECK CONSTRAINT [CK_ServerPingLogs20140924_LogDate]
GO
ALTER TABLE [dbo].[ServerPingLogs20140926] CHECK CONSTRAINT [CK_ServerPingLogs20140926_LogDate]
GO
ALTER TABLE [dbo].[ServerPingLogs20141003] CHECK CONSTRAINT [CK_ServerPingLogs20141003_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130829] CHECK CONSTRAINT [CK_SpeedHackLogs20130829_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130830] CHECK CONSTRAINT [CK_SpeedHackLogs20130830_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130831] CHECK CONSTRAINT [CK_SpeedHackLogs20130831_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130901] CHECK CONSTRAINT [CK_SpeedHackLogs20130901_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130902] CHECK CONSTRAINT [CK_SpeedHackLogs20130902_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130903] CHECK CONSTRAINT [CK_SpeedHackLogs20130903_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130904] CHECK CONSTRAINT [CK_SpeedHackLogs20130904_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130905] CHECK CONSTRAINT [CK_SpeedHackLogs20130905_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130906] CHECK CONSTRAINT [CK_SpeedHackLogs20130906_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130907] CHECK CONSTRAINT [CK_SpeedHackLogs20130907_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130908] CHECK CONSTRAINT [CK_SpeedHackLogs20130908_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130909] CHECK CONSTRAINT [CK_SpeedHackLogs20130909_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130910] CHECK CONSTRAINT [CK_SpeedHackLogs20130910_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130911] CHECK CONSTRAINT [CK_SpeedHackLogs20130911_LogDate]
GO
ALTER TABLE [dbo].[SpeedHackLogs20130912] CHECK CONSTRAINT [CK_SpeedHackLogs20130912_LogDate]
GO
USE [dnstaging]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20130913] CHECK CONSTRAINT [CK_AccountLoginLogs_20130913_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20130914] CHECK CONSTRAINT [CK_AccountLoginLogs_20130914_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20130915] CHECK CONSTRAINT [CK_AccountLoginLogs_20130915_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20130916] CHECK CONSTRAINT [CK_AccountLoginLogs_20130916_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20130917] CHECK CONSTRAINT [CK_AccountLoginLogs_20130917_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20130918] CHECK CONSTRAINT [CK_AccountLoginLogs_20130918_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20130919] CHECK CONSTRAINT [CK_AccountLoginLogs_20130919_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20130920] CHECK CONSTRAINT [CK_AccountLoginLogs_20130920_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20130921] CHECK CONSTRAINT [CK_AccountLoginLogs_20130921_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20131003] CHECK CONSTRAINT [CK_AccountLoginLogs_20131003_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20131004] CHECK CONSTRAINT [CK_AccountLoginLogs_20131004_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20131005] CHECK CONSTRAINT [CK_AccountLoginLogs_20131005_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20131006] CHECK CONSTRAINT [CK_AccountLoginLogs_20131006_LoginDate]
GO
ALTER TABLE [dbo].[AccountLoginLogs_20131007] CHECK CONSTRAINT [CK_AccountLoginLogs_20131007_LoginDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20130913] CHECK CONSTRAINT [CK_AccountLogoutLogs_20130913_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20130914] CHECK CONSTRAINT [CK_AccountLogoutLogs_20130914_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20130915] CHECK CONSTRAINT [CK_AccountLogoutLogs_20130915_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20130916] CHECK CONSTRAINT [CK_AccountLogoutLogs_20130916_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20130917] CHECK CONSTRAINT [CK_AccountLogoutLogs_20130917_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20130918] CHECK CONSTRAINT [CK_AccountLogoutLogs_20130918_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20130919] CHECK CONSTRAINT [CK_AccountLogoutLogs_20130919_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20130920] CHECK CONSTRAINT [CK_AccountLogoutLogs_20130920_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20130921] CHECK CONSTRAINT [CK_AccountLogoutLogs_20130921_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20131003] CHECK CONSTRAINT [CK_AccountLogoutLogs_20131003_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20131004] CHECK CONSTRAINT [CK_AccountLogoutLogs_20131004_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20131005] CHECK CONSTRAINT [CK_AccountLogoutLogs_20131005_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20131006] CHECK CONSTRAINT [CK_AccountLogoutLogs_20131006_LogoutDate]
GO
ALTER TABLE [dbo].[AccountLogoutLogs_20131007] CHECK CONSTRAINT [CK_AccountLogoutLogs_20131007_LogoutDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20130913] CHECK CONSTRAINT [CK_CUCountLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20130914] CHECK CONSTRAINT [CK_CUCountLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20130915] CHECK CONSTRAINT [CK_CUCountLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20130916] CHECK CONSTRAINT [CK_CUCountLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20130917] CHECK CONSTRAINT [CK_CUCountLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20130918] CHECK CONSTRAINT [CK_CUCountLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20130919] CHECK CONSTRAINT [CK_CUCountLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20130920] CHECK CONSTRAINT [CK_CUCountLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20130921] CHECK CONSTRAINT [CK_CUCountLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20131003] CHECK CONSTRAINT [CK_CUCountLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20131004] CHECK CONSTRAINT [CK_CUCountLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20131005] CHECK CONSTRAINT [CK_CUCountLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20131006] CHECK CONSTRAINT [CK_CUCountLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[CUCountLogs_20131007] CHECK CONSTRAINT [CK_CUCountLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20130913] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20130914] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20130915] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20130916] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20130917] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20130918] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20130919] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20130920] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20130921] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20131003] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20131004] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20131005] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20131006] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[CashRebirthCoinLogs_20131007] CHECK CONSTRAINT [CK_CashRebirthCoinLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20130913] CHECK CONSTRAINT [CK_CharacterActionLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20130914] CHECK CONSTRAINT [CK_CharacterActionLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20130915] CHECK CONSTRAINT [CK_CharacterActionLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20130916] CHECK CONSTRAINT [CK_CharacterActionLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20130917] CHECK CONSTRAINT [CK_CharacterActionLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20130918] CHECK CONSTRAINT [CK_CharacterActionLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20130919] CHECK CONSTRAINT [CK_CharacterActionLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20130920] CHECK CONSTRAINT [CK_CharacterActionLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20130921] CHECK CONSTRAINT [CK_CharacterActionLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20131003] CHECK CONSTRAINT [CK_CharacterActionLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20131004] CHECK CONSTRAINT [CK_CharacterActionLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20131005] CHECK CONSTRAINT [CK_CharacterActionLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20131006] CHECK CONSTRAINT [CK_CharacterActionLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[CharacterActionLogs_20131007] CHECK CONSTRAINT [CK_CharacterActionLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20130913] CHECK CONSTRAINT [CK_CharacterLevelLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20130914] CHECK CONSTRAINT [CK_CharacterLevelLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20130915] CHECK CONSTRAINT [CK_CharacterLevelLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20130916] CHECK CONSTRAINT [CK_CharacterLevelLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20130917] CHECK CONSTRAINT [CK_CharacterLevelLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20130918] CHECK CONSTRAINT [CK_CharacterLevelLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20130919] CHECK CONSTRAINT [CK_CharacterLevelLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20130920] CHECK CONSTRAINT [CK_CharacterLevelLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20130921] CHECK CONSTRAINT [CK_CharacterLevelLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20131003] CHECK CONSTRAINT [CK_CharacterLevelLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20131004] CHECK CONSTRAINT [CK_CharacterLevelLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20131005] CHECK CONSTRAINT [CK_CharacterLevelLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20131006] CHECK CONSTRAINT [CK_CharacterLevelLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[CharacterLevelLogs_20131007] CHECK CONSTRAINT [CK_CharacterLevelLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20130913] CHECK CONSTRAINT [CK_CharacterLoginLogs_20130913_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20130914] CHECK CONSTRAINT [CK_CharacterLoginLogs_20130914_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20130915] CHECK CONSTRAINT [CK_CharacterLoginLogs_20130915_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20130916] CHECK CONSTRAINT [CK_CharacterLoginLogs_20130916_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20130917] CHECK CONSTRAINT [CK_CharacterLoginLogs_20130917_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20130918] CHECK CONSTRAINT [CK_CharacterLoginLogs_20130918_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20130919] CHECK CONSTRAINT [CK_CharacterLoginLogs_20130919_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20130920] CHECK CONSTRAINT [CK_CharacterLoginLogs_20130920_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20130921] CHECK CONSTRAINT [CK_CharacterLoginLogs_20130921_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20131003] CHECK CONSTRAINT [CK_CharacterLoginLogs_20131003_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20131004] CHECK CONSTRAINT [CK_CharacterLoginLogs_20131004_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20131005] CHECK CONSTRAINT [CK_CharacterLoginLogs_20131005_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20131006] CHECK CONSTRAINT [CK_CharacterLoginLogs_20131006_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLoginLogs_20131007] CHECK CONSTRAINT [CK_CharacterLoginLogs_20131007_LoginDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20130913] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20130913_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20130914] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20130914_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20130915] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20130915_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20130916] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20130916_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20130917] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20130917_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20130918] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20130918_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20130919] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20130919_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20130920] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20130920_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20130921] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20130921_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20131003] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20131003_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20131004] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20131004_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20131005] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20131005_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20131006] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20131006_LogoutDate]
GO
ALTER TABLE [dbo].[CharacterLogoutLogs_20131007] CHECK CONSTRAINT [CK_CharacterLogoutLogs_20131007_LogoutDate]
GO
ALTER TABLE [dbo].[Codes]  WITH CHECK ADD  CONSTRAINT [FK_CodeKinds_Codes_codeColumnName] FOREIGN KEY([codeColumnName])
REFERENCES [dbo].[CodeKinds] ([codeColumnName])
GO
ALTER TABLE [dbo].[Codes] CHECK CONSTRAINT [FK_CodeKinds_Codes_codeColumnName]
GO
ALTER TABLE [dbo].[CoinLogs_20130913] CHECK CONSTRAINT [CK_CoinLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20130914] CHECK CONSTRAINT [CK_CoinLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20130915] CHECK CONSTRAINT [CK_CoinLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20130916] CHECK CONSTRAINT [CK_CoinLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20130917] CHECK CONSTRAINT [CK_CoinLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20130918] CHECK CONSTRAINT [CK_CoinLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20130919] CHECK CONSTRAINT [CK_CoinLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20130920] CHECK CONSTRAINT [CK_CoinLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20130921] CHECK CONSTRAINT [CK_CoinLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20131003] CHECK CONSTRAINT [CK_CoinLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20131004] CHECK CONSTRAINT [CK_CoinLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20131005] CHECK CONSTRAINT [CK_CoinLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20131006] CHECK CONSTRAINT [CK_CoinLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[CoinLogs_20131007] CHECK CONSTRAINT [CK_CoinLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20130913] CHECK CONSTRAINT [CK_DarkLairLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20130914] CHECK CONSTRAINT [CK_DarkLairLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20130915] CHECK CONSTRAINT [CK_DarkLairLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20130916] CHECK CONSTRAINT [CK_DarkLairLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20130917] CHECK CONSTRAINT [CK_DarkLairLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20130918] CHECK CONSTRAINT [CK_DarkLairLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20130919] CHECK CONSTRAINT [CK_DarkLairLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20130920] CHECK CONSTRAINT [CK_DarkLairLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20130921] CHECK CONSTRAINT [CK_DarkLairLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20131003] CHECK CONSTRAINT [CK_DarkLairLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20131004] CHECK CONSTRAINT [CK_DarkLairLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20131005] CHECK CONSTRAINT [CK_DarkLairLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20131006] CHECK CONSTRAINT [CK_DarkLairLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[DarkLairLogs_20131007] CHECK CONSTRAINT [CK_DarkLairLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[EventResults]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventResults_EventID] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([EventID])
GO
ALTER TABLE [dbo].[EventResults] CHECK CONSTRAINT [FK_Events_EventResults_EventID]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20130913] CHECK CONSTRAINT [CK_FairyLevelLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20130914] CHECK CONSTRAINT [CK_FairyLevelLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20130915] CHECK CONSTRAINT [CK_FairyLevelLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20130916] CHECK CONSTRAINT [CK_FairyLevelLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20130917] CHECK CONSTRAINT [CK_FairyLevelLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20130918] CHECK CONSTRAINT [CK_FairyLevelLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20130919] CHECK CONSTRAINT [CK_FairyLevelLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20130920] CHECK CONSTRAINT [CK_FairyLevelLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20130921] CHECK CONSTRAINT [CK_FairyLevelLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20131003] CHECK CONSTRAINT [CK_FairyLevelLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20131004] CHECK CONSTRAINT [CK_FairyLevelLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20131005] CHECK CONSTRAINT [CK_FairyLevelLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20131006] CHECK CONSTRAINT [CK_FairyLevelLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[FairyLevelLogs_20131007] CHECK CONSTRAINT [CK_FairyLevelLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20130913] CHECK CONSTRAINT [CK_FatigueLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20130914] CHECK CONSTRAINT [CK_FatigueLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20130915] CHECK CONSTRAINT [CK_FatigueLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20130916] CHECK CONSTRAINT [CK_FatigueLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20130917] CHECK CONSTRAINT [CK_FatigueLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20130918] CHECK CONSTRAINT [CK_FatigueLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20130919] CHECK CONSTRAINT [CK_FatigueLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20130920] CHECK CONSTRAINT [CK_FatigueLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20130921] CHECK CONSTRAINT [CK_FatigueLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20131003] CHECK CONSTRAINT [CK_FatigueLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20131004] CHECK CONSTRAINT [CK_FatigueLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20131005] CHECK CONSTRAINT [CK_FatigueLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20131006] CHECK CONSTRAINT [CK_FatigueLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[FatigueLogs_20131007] CHECK CONSTRAINT [CK_FatigueLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20130913] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20130914] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20130915] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20130916] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20130917] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20130918] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20130919] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20130920] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20130921] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20131003] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20131004] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20131005] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20131006] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[FieldAttachmentDeleteLogs_20131007] CHECK CONSTRAINT [CK_FieldAttachmentDeleteLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20130913] CHECK CONSTRAINT [CK_FieldDeleteLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20130914] CHECK CONSTRAINT [CK_FieldDeleteLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20130915] CHECK CONSTRAINT [CK_FieldDeleteLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20130916] CHECK CONSTRAINT [CK_FieldDeleteLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20130917] CHECK CONSTRAINT [CK_FieldDeleteLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20130918] CHECK CONSTRAINT [CK_FieldDeleteLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20130919] CHECK CONSTRAINT [CK_FieldDeleteLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20130920] CHECK CONSTRAINT [CK_FieldDeleteLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20130921] CHECK CONSTRAINT [CK_FieldDeleteLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20131003] CHECK CONSTRAINT [CK_FieldDeleteLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20131004] CHECK CONSTRAINT [CK_FieldDeleteLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20131005] CHECK CONSTRAINT [CK_FieldDeleteLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20131006] CHECK CONSTRAINT [CK_FieldDeleteLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[FieldDeleteLogs_20131007] CHECK CONSTRAINT [CK_FieldDeleteLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20130913] CHECK CONSTRAINT [CK_FieldLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20130914] CHECK CONSTRAINT [CK_FieldLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20130915] CHECK CONSTRAINT [CK_FieldLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20130916] CHECK CONSTRAINT [CK_FieldLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20130917] CHECK CONSTRAINT [CK_FieldLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20130918] CHECK CONSTRAINT [CK_FieldLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20130919] CHECK CONSTRAINT [CK_FieldLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20130920] CHECK CONSTRAINT [CK_FieldLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20130921] CHECK CONSTRAINT [CK_FieldLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20131003] CHECK CONSTRAINT [CK_FieldLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20131004] CHECK CONSTRAINT [CK_FieldLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20131005] CHECK CONSTRAINT [CK_FieldLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20131006] CHECK CONSTRAINT [CK_FieldLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[FieldLogs_20131007] CHECK CONSTRAINT [CK_FieldLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20130913] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20130914] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20130915] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20130916] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20130917] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20130918] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20130919] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20130920] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20130921] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20131003] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20131004] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20131005] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20131006] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[HiddenCashShopLogs_20131007] CHECK CONSTRAINT [CK_HiddenCashShopLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20130913] CHECK CONSTRAINT [CK_ItemAttributeLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20130914] CHECK CONSTRAINT [CK_ItemAttributeLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20130915] CHECK CONSTRAINT [CK_ItemAttributeLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20130916] CHECK CONSTRAINT [CK_ItemAttributeLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20130917] CHECK CONSTRAINT [CK_ItemAttributeLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20130918] CHECK CONSTRAINT [CK_ItemAttributeLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20130919] CHECK CONSTRAINT [CK_ItemAttributeLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20130920] CHECK CONSTRAINT [CK_ItemAttributeLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20130921] CHECK CONSTRAINT [CK_ItemAttributeLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20131003] CHECK CONSTRAINT [CK_ItemAttributeLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20131004] CHECK CONSTRAINT [CK_ItemAttributeLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20131005] CHECK CONSTRAINT [CK_ItemAttributeLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20131006] CHECK CONSTRAINT [CK_ItemAttributeLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[ItemAttributeLogs_20131007] CHECK CONSTRAINT [CK_ItemAttributeLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20130913] CHECK CONSTRAINT [CK_ItemLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20130914] CHECK CONSTRAINT [CK_ItemLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20130915] CHECK CONSTRAINT [CK_ItemLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20130916] CHECK CONSTRAINT [CK_ItemLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20130917] CHECK CONSTRAINT [CK_ItemLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20130918] CHECK CONSTRAINT [CK_ItemLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20130919] CHECK CONSTRAINT [CK_ItemLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20130920] CHECK CONSTRAINT [CK_ItemLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20130921] CHECK CONSTRAINT [CK_ItemLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20131003] CHECK CONSTRAINT [CK_ItemLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20131004] CHECK CONSTRAINT [CK_ItemLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20131005] CHECK CONSTRAINT [CK_ItemLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20131006] CHECK CONSTRAINT [CK_ItemLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[ItemLogs_20131007] CHECK CONSTRAINT [CK_ItemLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20130913] CHECK CONSTRAINT [CK_JobChangeLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20130914] CHECK CONSTRAINT [CK_JobChangeLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20130915] CHECK CONSTRAINT [CK_JobChangeLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20130916] CHECK CONSTRAINT [CK_JobChangeLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20130917] CHECK CONSTRAINT [CK_JobChangeLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20130918] CHECK CONSTRAINT [CK_JobChangeLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20130919] CHECK CONSTRAINT [CK_JobChangeLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20130920] CHECK CONSTRAINT [CK_JobChangeLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20130921] CHECK CONSTRAINT [CK_JobChangeLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20131003] CHECK CONSTRAINT [CK_JobChangeLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20131004] CHECK CONSTRAINT [CK_JobChangeLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20131005] CHECK CONSTRAINT [CK_JobChangeLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20131006] CHECK CONSTRAINT [CK_JobChangeLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[JobChangeLogs_20131007] CHECK CONSTRAINT [CK_JobChangeLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[LogLifespan] CHECK CONSTRAINT [CK_LogLifespan_Lifespan]
GO
ALTER TABLE [dbo].[MailLogs_20130913] CHECK CONSTRAINT [CK_MailLogs_20130913_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20130914] CHECK CONSTRAINT [CK_MailLogs_20130914_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20130915] CHECK CONSTRAINT [CK_MailLogs_20130915_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20130916] CHECK CONSTRAINT [CK_MailLogs_20130916_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20130917] CHECK CONSTRAINT [CK_MailLogs_20130917_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20130918] CHECK CONSTRAINT [CK_MailLogs_20130918_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20130919] CHECK CONSTRAINT [CK_MailLogs_20130919_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20130920] CHECK CONSTRAINT [CK_MailLogs_20130920_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20130921] CHECK CONSTRAINT [CK_MailLogs_20130921_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20131003] CHECK CONSTRAINT [CK_MailLogs_20131003_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20131004] CHECK CONSTRAINT [CK_MailLogs_20131004_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20131005] CHECK CONSTRAINT [CK_MailLogs_20131005_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20131006] CHECK CONSTRAINT [CK_MailLogs_20131006_SendDate]
GO
ALTER TABLE [dbo].[MailLogs_20131007] CHECK CONSTRAINT [CK_MailLogs_20131007_SendDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20130913] CHECK CONSTRAINT [CK_MapStayLogs_20130913_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20130914] CHECK CONSTRAINT [CK_MapStayLogs_20130914_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20130915] CHECK CONSTRAINT [CK_MapStayLogs_20130915_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20130916] CHECK CONSTRAINT [CK_MapStayLogs_20130916_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20130917] CHECK CONSTRAINT [CK_MapStayLogs_20130917_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20130918] CHECK CONSTRAINT [CK_MapStayLogs_20130918_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20130919] CHECK CONSTRAINT [CK_MapStayLogs_20130919_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20130920] CHECK CONSTRAINT [CK_MapStayLogs_20130920_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20130921] CHECK CONSTRAINT [CK_MapStayLogs_20130921_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20131003] CHECK CONSTRAINT [CK_MapStayLogs_20131003_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20131004] CHECK CONSTRAINT [CK_MapStayLogs_20131004_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20131005] CHECK CONSTRAINT [CK_MapStayLogs_20131005_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20131006] CHECK CONSTRAINT [CK_MapStayLogs_20131006_ExitDate]
GO
ALTER TABLE [dbo].[MapStayLogs_20131007] CHECK CONSTRAINT [CK_MapStayLogs_20131007_ExitDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20130913] CHECK CONSTRAINT [CK_MissionAchieveLogs_20130913_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20130914] CHECK CONSTRAINT [CK_MissionAchieveLogs_20130914_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20130915] CHECK CONSTRAINT [CK_MissionAchieveLogs_20130915_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20130916] CHECK CONSTRAINT [CK_MissionAchieveLogs_20130916_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20130917] CHECK CONSTRAINT [CK_MissionAchieveLogs_20130917_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20130918] CHECK CONSTRAINT [CK_MissionAchieveLogs_20130918_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20130919] CHECK CONSTRAINT [CK_MissionAchieveLogs_20130919_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20130920] CHECK CONSTRAINT [CK_MissionAchieveLogs_20130920_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20130921] CHECK CONSTRAINT [CK_MissionAchieveLogs_20130921_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20131003] CHECK CONSTRAINT [CK_MissionAchieveLogs_20131003_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20131004] CHECK CONSTRAINT [CK_MissionAchieveLogs_20131004_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20131005] CHECK CONSTRAINT [CK_MissionAchieveLogs_20131005_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20131006] CHECK CONSTRAINT [CK_MissionAchieveLogs_20131006_AchieveDate]
GO
ALTER TABLE [dbo].[MissionAchieveLogs_20131007] CHECK CONSTRAINT [CK_MissionAchieveLogs_20131007_AchieveDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20130913] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20130914] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20130915] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20130916] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20130917] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20130918] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20130919] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20130920] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20130921] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20131003] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20131004] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20131005] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20131006] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[MobileAuthenticationLogs_20131007] CHECK CONSTRAINT [CK_MobileAuthenticationLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20130913] CHECK CONSTRAINT [CK_NestDeathLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20130914] CHECK CONSTRAINT [CK_NestDeathLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20130915] CHECK CONSTRAINT [CK_NestDeathLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20130916] CHECK CONSTRAINT [CK_NestDeathLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20130917] CHECK CONSTRAINT [CK_NestDeathLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20130918] CHECK CONSTRAINT [CK_NestDeathLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20130919] CHECK CONSTRAINT [CK_NestDeathLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20130920] CHECK CONSTRAINT [CK_NestDeathLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20130921] CHECK CONSTRAINT [CK_NestDeathLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20131003] CHECK CONSTRAINT [CK_NestDeathLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20131004] CHECK CONSTRAINT [CK_NestDeathLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20131005] CHECK CONSTRAINT [CK_NestDeathLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20131006] CHECK CONSTRAINT [CK_NestDeathLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[NestDeathLogs_20131007] CHECK CONSTRAINT [CK_NestDeathLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20130913] CHECK CONSTRAINT [CK_NestGateClearLogs_20130913_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20130914] CHECK CONSTRAINT [CK_NestGateClearLogs_20130914_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20130915] CHECK CONSTRAINT [CK_NestGateClearLogs_20130915_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20130916] CHECK CONSTRAINT [CK_NestGateClearLogs_20130916_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20130917] CHECK CONSTRAINT [CK_NestGateClearLogs_20130917_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20130918] CHECK CONSTRAINT [CK_NestGateClearLogs_20130918_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20130919] CHECK CONSTRAINT [CK_NestGateClearLogs_20130919_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20130920] CHECK CONSTRAINT [CK_NestGateClearLogs_20130920_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20130921] CHECK CONSTRAINT [CK_NestGateClearLogs_20130921_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20131003] CHECK CONSTRAINT [CK_NestGateClearLogs_20131003_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20131004] CHECK CONSTRAINT [CK_NestGateClearLogs_20131004_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20131005] CHECK CONSTRAINT [CK_NestGateClearLogs_20131005_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20131006] CHECK CONSTRAINT [CK_NestGateClearLogs_20131006_NestGateStartDate]
GO
ALTER TABLE [dbo].[NestGateClearLogs_20131007] CHECK CONSTRAINT [CK_NestGateClearLogs_20131007_NestGateStartDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20130913] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20130913_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20130914] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20130914_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20130915] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20130915_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20130916] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20130916_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20130917] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20130917_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20130918] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20130918_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20130919] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20130919_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20130920] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20130920_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20130921] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20130921_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20131003] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20131003_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20131004] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20131004_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20131005] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20131005_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20131006] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20131006_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLoginLogs_20131007] CHECK CONSTRAINT [CK_PCRoomCharacterLoginLogs_20131007_LoginDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20130913] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20130913_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20130914] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20130914_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20130915] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20130915_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20130916] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20130916_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20130917] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20130917_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20130918] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20130918_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20130919] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20130919_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20130920] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20130920_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20130921] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20130921_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20131003] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20131003_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20131004] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20131004_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20131005] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20131005_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20131006] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20131006_LogoutDate]
GO
ALTER TABLE [dbo].[PCRoomCharacterLogoutLogs_20131007] CHECK CONSTRAINT [CK_PCRoomCharacterLogoutLogs_20131007_LogoutDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20130913] CHECK CONSTRAINT [CK_PVPEndLogs_20130913_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20130914] CHECK CONSTRAINT [CK_PVPEndLogs_20130914_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20130915] CHECK CONSTRAINT [CK_PVPEndLogs_20130915_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20130916] CHECK CONSTRAINT [CK_PVPEndLogs_20130916_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20130917] CHECK CONSTRAINT [CK_PVPEndLogs_20130917_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20130918] CHECK CONSTRAINT [CK_PVPEndLogs_20130918_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20130919] CHECK CONSTRAINT [CK_PVPEndLogs_20130919_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20130920] CHECK CONSTRAINT [CK_PVPEndLogs_20130920_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20130921] CHECK CONSTRAINT [CK_PVPEndLogs_20130921_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20131003] CHECK CONSTRAINT [CK_PVPEndLogs_20131003_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20131004] CHECK CONSTRAINT [CK_PVPEndLogs_20131004_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20131005] CHECK CONSTRAINT [CK_PVPEndLogs_20131005_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20131006] CHECK CONSTRAINT [CK_PVPEndLogs_20131006_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPEndLogs_20131007] CHECK CONSTRAINT [CK_PVPEndLogs_20131007_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20130913] CHECK CONSTRAINT [CK_PVPLogs_20130913_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20130914] CHECK CONSTRAINT [CK_PVPLogs_20130914_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20130915] CHECK CONSTRAINT [CK_PVPLogs_20130915_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20130916] CHECK CONSTRAINT [CK_PVPLogs_20130916_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20130917] CHECK CONSTRAINT [CK_PVPLogs_20130917_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20130918] CHECK CONSTRAINT [CK_PVPLogs_20130918_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20130919] CHECK CONSTRAINT [CK_PVPLogs_20130919_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20130920] CHECK CONSTRAINT [CK_PVPLogs_20130920_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20130921] CHECK CONSTRAINT [CK_PVPLogs_20130921_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20131003] CHECK CONSTRAINT [CK_PVPLogs_20131003_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20131004] CHECK CONSTRAINT [CK_PVPLogs_20131004_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20131005] CHECK CONSTRAINT [CK_PVPLogs_20131005_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20131006] CHECK CONSTRAINT [CK_PVPLogs_20131006_PVPStartDate]
GO
ALTER TABLE [dbo].[PVPLogs_20131007] CHECK CONSTRAINT [CK_PVPLogs_20131007_PVPStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20130913] CHECK CONSTRAINT [CK_PartyLogs_20130913_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20130914] CHECK CONSTRAINT [CK_PartyLogs_20130914_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20130915] CHECK CONSTRAINT [CK_PartyLogs_20130915_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20130916] CHECK CONSTRAINT [CK_PartyLogs_20130916_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20130917] CHECK CONSTRAINT [CK_PartyLogs_20130917_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20130918] CHECK CONSTRAINT [CK_PartyLogs_20130918_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20130919] CHECK CONSTRAINT [CK_PartyLogs_20130919_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20130920] CHECK CONSTRAINT [CK_PartyLogs_20130920_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20130921] CHECK CONSTRAINT [CK_PartyLogs_20130921_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20131003] CHECK CONSTRAINT [CK_PartyLogs_20131003_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20131004] CHECK CONSTRAINT [CK_PartyLogs_20131004_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20131005] CHECK CONSTRAINT [CK_PartyLogs_20131005_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20131006] CHECK CONSTRAINT [CK_PartyLogs_20131006_PartyStartDate]
GO
ALTER TABLE [dbo].[PartyLogs_20131007] CHECK CONSTRAINT [CK_PartyLogs_20131007_PartyStartDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20130913] CHECK CONSTRAINT [CK_PetSkillLogs_20130913_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20130914] CHECK CONSTRAINT [CK_PetSkillLogs_20130914_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20130915] CHECK CONSTRAINT [CK_PetSkillLogs_20130915_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20130916] CHECK CONSTRAINT [CK_PetSkillLogs_20130916_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20130917] CHECK CONSTRAINT [CK_PetSkillLogs_20130917_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20130918] CHECK CONSTRAINT [CK_PetSkillLogs_20130918_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20130919] CHECK CONSTRAINT [CK_PetSkillLogs_20130919_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20130920] CHECK CONSTRAINT [CK_PetSkillLogs_20130920_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20130921] CHECK CONSTRAINT [CK_PetSkillLogs_20130921_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20131003] CHECK CONSTRAINT [CK_PetSkillLogs_20131003_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20131004] CHECK CONSTRAINT [CK_PetSkillLogs_20131004_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20131005] CHECK CONSTRAINT [CK_PetSkillLogs_20131005_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20131006] CHECK CONSTRAINT [CK_PetSkillLogs_20131006_BasisDate]
GO
ALTER TABLE [dbo].[PetSkillLogs_20131007] CHECK CONSTRAINT [CK_PetSkillLogs_20131007_BasisDate]
GO
ALTER TABLE [dbo].[PointLogs_20130913] CHECK CONSTRAINT [CK_PointLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20130914] CHECK CONSTRAINT [CK_PointLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20130915] CHECK CONSTRAINT [CK_PointLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20130916] CHECK CONSTRAINT [CK_PointLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20130917] CHECK CONSTRAINT [CK_PointLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20130918] CHECK CONSTRAINT [CK_PointLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20130919] CHECK CONSTRAINT [CK_PointLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20130920] CHECK CONSTRAINT [CK_PointLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20130921] CHECK CONSTRAINT [CK_PointLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20131003] CHECK CONSTRAINT [CK_PointLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20131004] CHECK CONSTRAINT [CK_PointLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20131005] CHECK CONSTRAINT [CK_PointLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20131006] CHECK CONSTRAINT [CK_PointLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[PointLogs_20131007] CHECK CONSTRAINT [CK_PointLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20130913] CHECK CONSTRAINT [CK_QuestCompleteLogs_20130913_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20130914] CHECK CONSTRAINT [CK_QuestCompleteLogs_20130914_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20130915] CHECK CONSTRAINT [CK_QuestCompleteLogs_20130915_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20130916] CHECK CONSTRAINT [CK_QuestCompleteLogs_20130916_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20130917] CHECK CONSTRAINT [CK_QuestCompleteLogs_20130917_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20130918] CHECK CONSTRAINT [CK_QuestCompleteLogs_20130918_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20130919] CHECK CONSTRAINT [CK_QuestCompleteLogs_20130919_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20130920] CHECK CONSTRAINT [CK_QuestCompleteLogs_20130920_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20130921] CHECK CONSTRAINT [CK_QuestCompleteLogs_20130921_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20131003] CHECK CONSTRAINT [CK_QuestCompleteLogs_20131003_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20131004] CHECK CONSTRAINT [CK_QuestCompleteLogs_20131004_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20131005] CHECK CONSTRAINT [CK_QuestCompleteLogs_20131005_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20131006] CHECK CONSTRAINT [CK_QuestCompleteLogs_20131006_CompleteDate]
GO
ALTER TABLE [dbo].[QuestCompleteLogs_20131007] CHECK CONSTRAINT [CK_QuestCompleteLogs_20131007_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20130913] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20130913_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20130914] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20130914_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20130915] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20130915_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20130916] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20130916_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20130917] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20130917_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20130918] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20130918_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20130919] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20130919_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20130920] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20130920_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20130921] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20130921_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20131003] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20131003_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20131004] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20131004_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20131005] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20131005_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20131006] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20131006_CompleteDate]
GO
ALTER TABLE [dbo].[RepetitionQuestCompleteLogs_20131007] CHECK CONSTRAINT [CK_RepetitionQuestCompleteLogs_20131007_CompleteDate]
GO
ALTER TABLE [dbo].[SkillLogs_20130913] CHECK CONSTRAINT [CK_SkillLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20130914] CHECK CONSTRAINT [CK_SkillLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20130915] CHECK CONSTRAINT [CK_SkillLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20130916] CHECK CONSTRAINT [CK_SkillLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20130917] CHECK CONSTRAINT [CK_SkillLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20130918] CHECK CONSTRAINT [CK_SkillLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20130919] CHECK CONSTRAINT [CK_SkillLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20130920] CHECK CONSTRAINT [CK_SkillLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20130921] CHECK CONSTRAINT [CK_SkillLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20131003] CHECK CONSTRAINT [CK_SkillLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20131004] CHECK CONSTRAINT [CK_SkillLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20131005] CHECK CONSTRAINT [CK_SkillLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20131006] CHECK CONSTRAINT [CK_SkillLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[SkillLogs_20131007] CHECK CONSTRAINT [CK_SkillLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20130913] CHECK CONSTRAINT [CK_SkillPointLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20130914] CHECK CONSTRAINT [CK_SkillPointLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20130915] CHECK CONSTRAINT [CK_SkillPointLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20130916] CHECK CONSTRAINT [CK_SkillPointLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20130917] CHECK CONSTRAINT [CK_SkillPointLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20130918] CHECK CONSTRAINT [CK_SkillPointLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20130919] CHECK CONSTRAINT [CK_SkillPointLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20130920] CHECK CONSTRAINT [CK_SkillPointLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20130921] CHECK CONSTRAINT [CK_SkillPointLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20131003] CHECK CONSTRAINT [CK_SkillPointLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20131004] CHECK CONSTRAINT [CK_SkillPointLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20131005] CHECK CONSTRAINT [CK_SkillPointLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20131006] CHECK CONSTRAINT [CK_SkillPointLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[SkillPointLogs_20131007] CHECK CONSTRAINT [CK_SkillPointLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20130913] CHECK CONSTRAINT [CK_StageEndLogs_20130913_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20130914] CHECK CONSTRAINT [CK_StageEndLogs_20130914_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20130915] CHECK CONSTRAINT [CK_StageEndLogs_20130915_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20130916] CHECK CONSTRAINT [CK_StageEndLogs_20130916_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20130917] CHECK CONSTRAINT [CK_StageEndLogs_20130917_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20130918] CHECK CONSTRAINT [CK_StageEndLogs_20130918_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20130919] CHECK CONSTRAINT [CK_StageEndLogs_20130919_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20130920] CHECK CONSTRAINT [CK_StageEndLogs_20130920_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20130921] CHECK CONSTRAINT [CK_StageEndLogs_20130921_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20131003] CHECK CONSTRAINT [CK_StageEndLogs_20131003_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20131004] CHECK CONSTRAINT [CK_StageEndLogs_20131004_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20131005] CHECK CONSTRAINT [CK_StageEndLogs_20131005_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20131006] CHECK CONSTRAINT [CK_StageEndLogs_20131006_StageStartDate]
GO
ALTER TABLE [dbo].[StageEndLogs_20131007] CHECK CONSTRAINT [CK_StageEndLogs_20131007_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20130913] CHECK CONSTRAINT [CK_StageLogs_20130913_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20130914] CHECK CONSTRAINT [CK_StageLogs_20130914_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20130915] CHECK CONSTRAINT [CK_StageLogs_20130915_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20130916] CHECK CONSTRAINT [CK_StageLogs_20130916_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20130917] CHECK CONSTRAINT [CK_StageLogs_20130917_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20130918] CHECK CONSTRAINT [CK_StageLogs_20130918_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20130919] CHECK CONSTRAINT [CK_StageLogs_20130919_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20130920] CHECK CONSTRAINT [CK_StageLogs_20130920_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20130921] CHECK CONSTRAINT [CK_StageLogs_20130921_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20131003] CHECK CONSTRAINT [CK_StageLogs_20131003_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20131004] CHECK CONSTRAINT [CK_StageLogs_20131004_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20131005] CHECK CONSTRAINT [CK_StageLogs_20131005_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20131006] CHECK CONSTRAINT [CK_StageLogs_20131006_StageStartDate]
GO
ALTER TABLE [dbo].[StageLogs_20131007] CHECK CONSTRAINT [CK_StageLogs_20131007_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20130913] CHECK CONSTRAINT [CK_StageRewardLogs_20130913_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20130914] CHECK CONSTRAINT [CK_StageRewardLogs_20130914_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20130915] CHECK CONSTRAINT [CK_StageRewardLogs_20130915_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20130916] CHECK CONSTRAINT [CK_StageRewardLogs_20130916_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20130917] CHECK CONSTRAINT [CK_StageRewardLogs_20130917_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20130918] CHECK CONSTRAINT [CK_StageRewardLogs_20130918_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20130919] CHECK CONSTRAINT [CK_StageRewardLogs_20130919_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20130920] CHECK CONSTRAINT [CK_StageRewardLogs_20130920_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20130921] CHECK CONSTRAINT [CK_StageRewardLogs_20130921_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20131003] CHECK CONSTRAINT [CK_StageRewardLogs_20131003_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20131004] CHECK CONSTRAINT [CK_StageRewardLogs_20131004_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20131005] CHECK CONSTRAINT [CK_StageRewardLogs_20131005_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20131006] CHECK CONSTRAINT [CK_StageRewardLogs_20131006_StageStartDate]
GO
ALTER TABLE [dbo].[StageRewardLogs_20131007] CHECK CONSTRAINT [CK_StageRewardLogs_20131007_StageStartDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20130913] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20130913_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20130914] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20130914_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20130915] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20130915_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20130916] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20130916_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20130917] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20130917_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20130918] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20130918_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20130919] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20130919_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20130920] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20130920_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20130921] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20130921_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20131003] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20131003_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20131004] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20131004_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20131005] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20131005_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20131006] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20131006_LogDate]
GO
ALTER TABLE [dbo].[TeacherAndPupilLogs_20131007] CHECK CONSTRAINT [CK_TeacherAndPupilLogs_20131007_LogDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20130913] CHECK CONSTRAINT [CK_TradeRegisterLogs_20130913_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20130914] CHECK CONSTRAINT [CK_TradeRegisterLogs_20130914_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20130915] CHECK CONSTRAINT [CK_TradeRegisterLogs_20130915_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20130916] CHECK CONSTRAINT [CK_TradeRegisterLogs_20130916_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20130917] CHECK CONSTRAINT [CK_TradeRegisterLogs_20130917_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20130918] CHECK CONSTRAINT [CK_TradeRegisterLogs_20130918_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20130919] CHECK CONSTRAINT [CK_TradeRegisterLogs_20130919_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20130920] CHECK CONSTRAINT [CK_TradeRegisterLogs_20130920_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20130921] CHECK CONSTRAINT [CK_TradeRegisterLogs_20130921_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20131003] CHECK CONSTRAINT [CK_TradeRegisterLogs_20131003_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20131004] CHECK CONSTRAINT [CK_TradeRegisterLogs_20131004_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20131005] CHECK CONSTRAINT [CK_TradeRegisterLogs_20131005_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20131006] CHECK CONSTRAINT [CK_TradeRegisterLogs_20131006_RegisterDate]
GO
ALTER TABLE [dbo].[TradeRegisterLogs_20131007] CHECK CONSTRAINT [CK_TradeRegisterLogs_20131007_RegisterDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20130913] CHECK CONSTRAINT [CK_TradeSuccessLogs_20130913_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20130914] CHECK CONSTRAINT [CK_TradeSuccessLogs_20130914_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20130915] CHECK CONSTRAINT [CK_TradeSuccessLogs_20130915_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20130916] CHECK CONSTRAINT [CK_TradeSuccessLogs_20130916_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20130917] CHECK CONSTRAINT [CK_TradeSuccessLogs_20130917_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20130918] CHECK CONSTRAINT [CK_TradeSuccessLogs_20130918_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20130919] CHECK CONSTRAINT [CK_TradeSuccessLogs_20130919_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20130920] CHECK CONSTRAINT [CK_TradeSuccessLogs_20130920_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20130921] CHECK CONSTRAINT [CK_TradeSuccessLogs_20130921_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20131003] CHECK CONSTRAINT [CK_TradeSuccessLogs_20131003_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20131004] CHECK CONSTRAINT [CK_TradeSuccessLogs_20131004_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20131005] CHECK CONSTRAINT [CK_TradeSuccessLogs_20131005_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20131006] CHECK CONSTRAINT [CK_TradeSuccessLogs_20131006_TradeDate]
GO
ALTER TABLE [dbo].[TradeSuccessLogs_20131007] CHECK CONSTRAINT [CK_TradeSuccessLogs_20131007_TradeDate]
GO
USE [dnworld]
GO
ALTER TABLE [dbo].[AssignMissionDetails]  WITH CHECK ADD  CONSTRAINT [FK_AssignMissions_AssignMissionDetails_CharacterID_MissionTypeCode] FOREIGN KEY([CharacterID], [MissionTypeCode])
REFERENCES [dbo].[AssignMissions] ([CharacterID], [MissionTypeCode])
GO
ALTER TABLE [dbo].[AssignMissionDetails] CHECK CONSTRAINT [FK_AssignMissions_AssignMissionDetails_CharacterID_MissionTypeCode]
GO
ALTER TABLE [dbo].[AttachItemsForMailSchedule]  WITH CHECK ADD  CONSTRAINT [FK_MailSchedules_AttachItemsForMailToAll_MailScheduleID] FOREIGN KEY([MailScheduleID])
REFERENCES [dbo].[MailSchedules] ([MailScheduleID])
GO
ALTER TABLE [dbo].[AttachItemsForMailSchedule] CHECK CONSTRAINT [FK_MailSchedules_AttachItemsForMailToAll_MailScheduleID]
GO
ALTER TABLE [dbo].[AuctionBidding]  WITH CHECK ADD  CONSTRAINT [FK_Auctions_AuctionBidding_AuctionID] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[AuctionBidding] CHECK CONSTRAINT [FK_Auctions_AuctionBidding_AuctionID]
GO
ALTER TABLE [dbo].[AuctionCancelReason]  WITH CHECK ADD  CONSTRAINT [FK_Auctions_AuctionCancelReason_AuctionID] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[AuctionCancelReason] CHECK CONSTRAINT [FK_Auctions_AuctionCancelReason_AuctionID]
GO
ALTER TABLE [dbo].[CashRebirthCoins] CHECK CONSTRAINT [CK_CashRebirthCoins_CoinCount]
GO
ALTER TABLE [dbo].[CharacterStatus] CHECK CONSTRAINT [CK_CharacterStatus_CharacterExp]
GO
ALTER TABLE [dbo].[CharacterStatus] CHECK CONSTRAINT [CK_CharacterStatus_CharacterLevel]
GO
ALTER TABLE [dbo].[CharacterStatus] CHECK CONSTRAINT [CK_CharacterStatus_Coin]
GO
ALTER TABLE [dbo].[CharacterStatus] CHECK CONSTRAINT [CK_CharacterStatus_MissionScore]
GO
ALTER TABLE [dbo].[CharacterStatus] CHECK CONSTRAINT [CK_CharacterStatus_PCRoomRebirthCoin]
GO
ALTER TABLE [dbo].[CharacterStatus] CHECK CONSTRAINT [CK_CharacterStatus_RebirthCoin]
GO
ALTER TABLE [dbo].[CharacterStatus] CHECK CONSTRAINT [CK_CharacterStatus_SkillPoint]
GO
ALTER TABLE [dbo].[CharacterStatus] CHECK CONSTRAINT [CK_CharacterStatus_WarehouseCoin]
GO
ALTER TABLE [dbo].[Codes]  WITH CHECK ADD  CONSTRAINT [FK_CodeKinds_Codes_codeColumnName] FOREIGN KEY([codeColumnName])
REFERENCES [dbo].[CodeKinds] ([codeColumnName])
GO
ALTER TABLE [dbo].[Codes] CHECK CONSTRAINT [FK_CodeKinds_Codes_codeColumnName]
GO
ALTER TABLE [dbo].[DWCTeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_DWCTeams_DWCTeamMembers] FOREIGN KEY([DWCTeamID])
REFERENCES [dbo].[DWCTeams] ([DWCTeamID])
GO
ALTER TABLE [dbo].[DWCTeamMembers] CHECK CONSTRAINT [FK_DWCTeams_DWCTeamMembers]
GO
ALTER TABLE [dbo].[DarkLairPartyMembers]  WITH CHECK ADD  CONSTRAINT [FK_DarkLairRanking_DarkLairPartyMembers_DarkLairRankingID] FOREIGN KEY([DarkLairRankingID])
REFERENCES [dbo].[DarkLairRanking] ([DarkLairRankingID])
GO
ALTER TABLE [dbo].[DarkLairPartyMembers] CHECK CONSTRAINT [FK_DarkLairRanking_DarkLairPartyMembers_DarkLairRankingID]
GO
ALTER TABLE [dbo].[DarkLairPersonalBest]  WITH CHECK ADD  CONSTRAINT [FK_DarkLairRanking_DarkLairPersonalBest_DarkLairRankingID] FOREIGN KEY([DarkLairRankingID])
REFERENCES [dbo].[DarkLairRanking] ([DarkLairRankingID])
GO
ALTER TABLE [dbo].[DarkLairPersonalBest] CHECK CONSTRAINT [FK_DarkLairRanking_DarkLairPersonalBest_DarkLairRankingID]
GO
ALTER TABLE [dbo].[FieldAttachments]  WITH CHECK ADD  CONSTRAINT [FK_Fields_FieldAttachments_FarmID_FieldIndex] FOREIGN KEY([FarmID], [FieldIndex])
REFERENCES [dbo].[Fields] ([FarmID], [FieldIndex])
GO
ALTER TABLE [dbo].[FieldAttachments] CHECK CONSTRAINT [FK_Fields_FieldAttachments_FarmID_FieldIndex]
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Farms_Fields_FarmID] FOREIGN KEY([FarmID])
REFERENCES [dbo].[Farms] ([FarmID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Farms_Fields_FarmID]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_FriendGroups_Friends_FriendGroupID] FOREIGN KEY([FriendGroupID])
REFERENCES [dbo].[FriendGroups] ([FriendGroupID])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_FriendGroups_Friends_FriendGroupID]
GO
ALTER TABLE [dbo].[GambleParticipantes]  WITH CHECK ADD  CONSTRAINT [FK_GambleIDs_GambleParticipantes_GambleID] FOREIGN KEY([GambleID])
REFERENCES [dbo].[GambleIDs] ([GambleID])
GO
ALTER TABLE [dbo].[GambleParticipantes] CHECK CONSTRAINT [FK_GambleIDs_GambleParticipantes_GambleID]
GO
ALTER TABLE [dbo].[GuildDepotHistory]  WITH CHECK ADD  CONSTRAINT [FK_Guilds_GuildDepotHistory_GuildID] FOREIGN KEY([GuildID])
REFERENCES [dbo].[Guilds] ([GuildID])
GO
ALTER TABLE [dbo].[GuildDepotHistory] CHECK CONSTRAINT [FK_Guilds_GuildDepotHistory_GuildID]
GO
ALTER TABLE [dbo].[GuildDepots]  WITH CHECK ADD  CONSTRAINT [FK_Guilds_GuildDepots_GuildID] FOREIGN KEY([GuildID])
REFERENCES [dbo].[Guilds] ([GuildID])
GO
ALTER TABLE [dbo].[GuildDepots] CHECK CONSTRAINT [FK_Guilds_GuildDepots_GuildID]
GO
ALTER TABLE [dbo].[GuildJoinCharacters]  WITH CHECK ADD  CONSTRAINT [FK_Guilds_GuildJoinCharacters_GuildID] FOREIGN KEY([GuildID])
REFERENCES [dbo].[Guilds] ([GuildID])
GO
ALTER TABLE [dbo].[GuildJoinCharacters] CHECK CONSTRAINT [FK_Guilds_GuildJoinCharacters_GuildID]
GO
ALTER TABLE [dbo].[GuildMemberRoles]  WITH CHECK ADD  CONSTRAINT [FK_Guilds_GuildMemberRoles_GuildID] FOREIGN KEY([GuildID])
REFERENCES [dbo].[Guilds] ([GuildID])
GO
ALTER TABLE [dbo].[GuildMemberRoles] CHECK CONSTRAINT [FK_Guilds_GuildMemberRoles_GuildID]
GO
ALTER TABLE [dbo].[GuildMembers]  WITH CHECK ADD  CONSTRAINT [FK_Guilds_GuildMembers_GuildID] FOREIGN KEY([GuildID])
REFERENCES [dbo].[Guilds] ([GuildID])
GO
ALTER TABLE [dbo].[GuildMembers] CHECK CONSTRAINT [FK_Guilds_GuildMembers_GuildID]
GO
ALTER TABLE [dbo].[GuildWarFinalResults]  WITH CHECK ADD  CONSTRAINT [FK_Guilds_GuildWarFinalResults_GuildID] FOREIGN KEY([GuildID])
REFERENCES [dbo].[Guilds] ([GuildID])
GO
ALTER TABLE [dbo].[GuildWarFinalResults] CHECK CONSTRAINT [FK_Guilds_GuildWarFinalResults_GuildID]
GO
ALTER TABLE [dbo].[GuildWarRewardForGuild]  WITH CHECK ADD  CONSTRAINT [FK_Guilds_GuildWarRewardForGuild_GuildID] FOREIGN KEY([GuildID])
REFERENCES [dbo].[Guilds] ([GuildID])
GO
ALTER TABLE [dbo].[GuildWarRewardForGuild] CHECK CONSTRAINT [FK_Guilds_GuildWarRewardForGuild_GuildID]
GO
ALTER TABLE [dbo].[Guilds] CHECK CONSTRAINT [CK_Guilds_DailyMissionPoint]
GO
ALTER TABLE [dbo].[Guilds] CHECK CONSTRAINT [CK_Guilds_DailyStagePoint]
GO
ALTER TABLE [dbo].[Guilds] CHECK CONSTRAINT [CK_Guilds_GuildCoin]
GO
ALTER TABLE [dbo].[Guilds] CHECK CONSTRAINT [CK_Guilds_GuildDepotSize]
GO
ALTER TABLE [dbo].[Guilds] CHECK CONSTRAINT [CK_Guilds_RemainGuildPoint]
GO
ALTER TABLE [dbo].[Guilds] CHECK CONSTRAINT [CK_Guilds_TotalGuildEXP]
GO
ALTER TABLE [dbo].[Guilds] CHECK CONSTRAINT [CK_Guilds_TotalGuildPoint]
GO
ALTER TABLE [dbo].[MailAttachItems]  WITH CHECK ADD  CONSTRAINT [FK_Mails_MailAttachItems_MailID] FOREIGN KEY([MailID])
REFERENCES [dbo].[Mails] ([MailID])
GO
ALTER TABLE [dbo].[MailAttachItems] CHECK CONSTRAINT [FK_Mails_MailAttachItems_MailID]
GO
ALTER TABLE [dbo].[ManufactureSkillRecipes]  WITH CHECK ADD  CONSTRAINT [FK_SecondarySkills_ManufactureSkillRecipes_CharacterID_SecondarySkillID] FOREIGN KEY([CharacterID], [SecondarySkillID])
REFERENCES [dbo].[SecondarySkills] ([CharacterID], [SecondarySkillID])
GO
ALTER TABLE [dbo].[ManufactureSkillRecipes] CHECK CONSTRAINT [FK_SecondarySkills_ManufactureSkillRecipes_CharacterID_SecondarySkillID]
GO
ALTER TABLE [dbo].[MaterializedItems] CHECK CONSTRAINT [CK_MaterializedItems_ItemLocationCode_ItemLocationIndex]
GO
ALTER TABLE [dbo].[MaterializedItems] CHECK CONSTRAINT [CK_MaterializedItems_ItemRemainCount]
GO
ALTER TABLE [dbo].[PVPTournamentResults]  WITH CHECK ADD  CONSTRAINT [FK_PVPTournamentIDs_PVPTournamentResults_PVPTournamentID] FOREIGN KEY([PVPTournamentID])
REFERENCES [dbo].[PVPTournamentIDs] ([PVPTournamentID])
GO
ALTER TABLE [dbo].[PVPTournamentResults] CHECK CONSTRAINT [FK_PVPTournamentIDs_PVPTournamentResults_PVPTournamentID]
GO
ALTER TABLE [dbo].[PartyJoins]  WITH CHECK ADD  CONSTRAINT [FK_Parties_PartyJoins_PartyID] FOREIGN KEY([PartyID])
REFERENCES [dbo].[Parties] ([PartyID])
GO
ALTER TABLE [dbo].[PartyJoins] CHECK CONSTRAINT [FK_Parties_PartyJoins_PartyID]
GO
ALTER TABLE [dbo].[PresetSkills]  WITH CHECK ADD  CONSTRAINT [FK_SkillPresets_PresetSkills_CharacterID_SkillPresetIndex] FOREIGN KEY([CharacterID], [SkillPresetIndex])
REFERENCES [dbo].[SkillPresets] ([CharacterID], [SkillPresetIndex])
GO
ALTER TABLE [dbo].[PresetSkills] CHECK CONSTRAINT [FK_SkillPresets_PresetSkills_CharacterID_SkillPresetIndex]
GO
ALTER TABLE [dbo].[PrivateChannelMembers]  WITH CHECK ADD  CONSTRAINT [FK_PrivateChannels_PrivateChannelMembers_PrivateChannelID] FOREIGN KEY([PrivateChannelID])
REFERENCES [dbo].[PrivateChannels] ([PrivateChannelID])
GO
ALTER TABLE [dbo].[PrivateChannelMembers] CHECK CONSTRAINT [FK_PrivateChannels_PrivateChannelMembers_PrivateChannelID]
GO
ALTER TABLE [dbo].[SecondarySkills] CHECK CONSTRAINT [CK_SecondarySkills_SecondarySkillExp]
GO
ALTER TABLE [dbo].[TeachersAndPupils]  WITH CHECK ADD  CONSTRAINT [FK_TeacherCharacters_TeachersAndPupils_TeacherCharacterID] FOREIGN KEY([TeacherCharacterID])
REFERENCES [dbo].[TeacherCharacters] ([TeacherCharacterID])
GO
ALTER TABLE [dbo].[TeachersAndPupils] CHECK CONSTRAINT [FK_TeacherCharacters_TeachersAndPupils_TeacherCharacterID]
GO
ALTER TABLE [dbo].[TotalPvPRoomMembers]  WITH CHECK ADD  CONSTRAINT [FK_TotalPvPRooms_TotalPvPRoomMembers_TotalPvPRoomID] FOREIGN KEY([TotalPvPRoomID])
REFERENCES [dbo].[TotalPvPRooms] ([TotalPvPRoomID])
GO
ALTER TABLE [dbo].[TotalPvPRoomMembers] CHECK CONSTRAINT [FK_TotalPvPRooms_TotalPvPRoomMembers_TotalPvPRoomID]
GO
ALTER TABLE [dbo].[WishAuctions]  WITH CHECK ADD  CONSTRAINT [FK_Auctions_WishAuctions_AuctionID] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[WishAuctions] CHECK CONSTRAINT [FK_Auctions_WishAuctions_AuctionID]
GO
ALTER TABLE [dbo].[WishItems]  WITH CHECK ADD  CONSTRAINT [FK_Mails_WishItems_MailID] FOREIGN KEY([MailID])
REFERENCES [dbo].[Mails] ([MailID])
GO
ALTER TABLE [dbo].[WishItems] CHECK CONSTRAINT [FK_Mails_WishItems_MailID]
GO
ALTER TABLE [dbo].[WishItems]  WITH CHECK ADD  CONSTRAINT [FK_WishProducts_WishItems_WishProductID] FOREIGN KEY([WishProductID])
REFERENCES [dbo].[WishProducts] ([WishProductID])
GO
ALTER TABLE [dbo].[WishItems] CHECK CONSTRAINT [FK_WishProducts_WishItems_WishProductID]
GO
ALTER TABLE [dbo].[WishProducts]  WITH CHECK ADD  CONSTRAINT [FK_Mails_WishProducts_MailID] FOREIGN KEY([MailID])
REFERENCES [dbo].[Mails] ([MailID])
GO
ALTER TABLE [dbo].[WishProducts] CHECK CONSTRAINT [FK_Mails_WishProducts_MailID]
GO

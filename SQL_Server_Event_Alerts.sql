USE [msdb]
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 010 - Setting database option RECOVERY', 
                        @message_id=0, 
                        @severity=10, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @event_description_keyword=N'Setting database option RECOVERY', 
                        @category_name=N'[Uncategorized]', 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 011 - Specified Database Object Not Found', 
                        @message_id=0, 
                        @severity=11, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 012 - Unused', 
                        @message_id=0, 
                        @severity=12, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 013 - User Transaction Syntax Error', 
                        @message_id=0, 
                        @severity=13, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 014 - Insufficient Permission', 
                        @message_id=0, 
                        @severity=14, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 015 - Syntax Error in SQL Statements', 
                        @message_id=0, 
                        @severity=15, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 016 - Miscellaneous User Error', 
                        @message_id=0, 
                        @severity=16, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 017 - Insufficient Resources', 
                        @message_id=0, 
                        @severity=17, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @category_name=N'[Uncategorized]', 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 018 - Nonfatal Internal Error', 
                        @message_id=0, 
                        @severity=18, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @category_name=N'[Uncategorized]', 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 019 - Fatal Error In Resource', 
                        @message_id=0, 
                        @severity=19, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @category_name=N'[Uncategorized]', 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 020 - Fatal Error in Current Process', 
                        @message_id=0, 
                        @severity=20, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @category_name=N'[Uncategorized]', 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 021 - Fatal Error in Database Processes', 
                        @message_id=0, 
                        @severity=21, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @category_name=N'[Uncategorized]', 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 022 - Fatal Error: Table Integrity Suspect', 
                        @message_id=0, 
                        @severity=22, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @category_name=N'[Uncategorized]', 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 023 - Fatal Error: Database Integrity Suspect', 
                        @message_id=0, 
                        @severity=23, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @category_name=N'[Uncategorized]', 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 024 - Fatal Error: Hardware Error', 
                        @message_id=0, 
                        @severity=24, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @category_name=N'[Uncategorized]', 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_alert @name=N'SQL Server Event Alert: Severity 025 - Fatal Error', 
                        @message_id=0, 
                        @severity=25, 
                        @enabled=1, 
                        @delay_between_responses=300, 
                        @include_event_description_in=1, 
                        @category_name=N'[Uncategorized]', 
                        @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 010 - Setting database option RECOVERY', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 011 - Specified Database Object Not Found', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 012 - Unused', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 013 - User Transaction Syntax Error', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 014 - Insufficient Permission', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 015 - Syntax Error in SQL Statements', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 016 - Miscellaneous User Error', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 017 - Insufficient Resources', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 018 - Nonfatal Internal Error', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 019 - Fatal Error In Resource', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 020 - Fatal Error in Current Process', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 021 - Fatal Error in Database Processes', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 022 - Fatal Error: Table Integrity Suspect', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 023 - Fatal Error: Database Integrity Suspect', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 024 - Fatal Error: Hardware Error', @operator_name=N'DDDatabase', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'SQL Server Event Alert: Severity 025 - Fatal Error', @operator_name=N'DDDatabase', @notification_method = 1
GO

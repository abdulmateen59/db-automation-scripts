USE [test_cases]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_check_table_exists]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_check_table_exists]
(
	@schemaName varchar(250)
	,@tableName varchar(250)
)

returns bit
as
begin
	declare @dynSqlCmd nvarchar(2000)
			,@_tableName varchar(1000)
			,@_count int
			,@_return bit

			set @dynSqlCmd = 'Use '
				+@schemaName
				+' SELECT  @cnt = count(*)  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @tableName'
		/*
		EXECUTE sp_executesql @dynSqlCmd
		, N'@tableName varchar(1000),@cnt int OUTPUT'
		,@tableName=@tableName
		,@cnt = @_count OUTPUT
		*/
		
		if (@_count > 1)
			set @_return = 1
		else
			set @_return = 0

	return @_return
end

GO
/****** Object:  Table [dbo].[t_global_pl_config]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_global_pl_config](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[algo_id] [int] NULL,
	[pl_table_name] [varchar](500) NULL,
	[result_table_name] [varchar](500) NULL,
	[sample_table_name] [varchar](500) NULL,
	[pl_type] [varchar](10) NULL,
	[sample_percent] [decimal](4, 2) NULL,
	[run_test] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_global_reasons_ratio]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_global_reasons_ratio](
	[id] [bigint] IDENTITY(84,1) NOT NULL,
	[algo_id] [int] NOT NULL,
	[algo_name] [varchar](100) NOT NULL,
	[reason_level] [int] NULL,
	[ryg_status] [varchar](30) NULL,
	[reason_weight] [decimal](4, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_global_tables_data_status]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_global_tables_data_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[algo_id] [int] NULL,
	[table_name] [varchar](500) NULL,
	[table_type] [varchar](10) NULL,
	[table_exists] [bit] NULL,
	[table_populated] [bit] NULL,
	[total_rows] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_global_variables]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_global_variables](
	[id] [int] IDENTITY(116,1) NOT NULL,
	[algo_id] [int] NULL,
	[var_key] [varchar](100) NULL,
	[var_value] [varchar](100) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[t_global_pl_config] ON 

INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (1, 12, N'pl_third_molar_stats_daily', N'results_third_molar', N't_temp_12_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 1)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (2, 12, N'pl_third_molar_stats_monthy', N'results_third_molar', N't_temp_12_pl_monthly_test_table', N'monthly', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (3, 12, N'pl_third_molar_stats_yearly', N'results_third_molar', N't_temp_12_pl_yearly_test_table', N'yearly', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (4, 11, N'pl_primary_tooth_stats_daily', N'results_primary_tooth_ext', N't_temp_11_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (5, 7, N'pl_multi_doctor_stats_daily', N'results_multi_doctor', N't_temp_07_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (6, 4, N'impossible_age_daily', N'procedure_performed', N't_temp_04_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (7, 13, N'pl_perio_scaling_stats_daily', N'results_perio_scaling_4a', N't_temp_13_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (8, 14, N'pl_simple_prophy_stats_daily', N'results_simple_prophy_4b', N't_temp_14_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (9, 15, N'pl_fmx_stats_daily', N'results_full_mouth_xrays', N't_temp_15_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (10, 16, N'pl_complex_perio_stats_daily', N'results_complex_perio', N't_temp_16_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (11, 18, N'pl_ext_upcode_axiomatic_stats_daily', N'surg_ext_final_results', N't_temp_18_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (12, 21, N'pl_over_use_of_b_or_l_filling_stats_daily', N'results_over_use_of_b_or_l_filling', N't_temp_21_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (13, 22, N'pl_sealants_instead_of_filling_stats_daily', N'results_sealants_instead_of_filling', N't_temp_22_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (14, 23, N'pl_cbu_stats_daily', N'results_cbu', N't_temp_23_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (15, 24, N'pl_deny_pulp_on_adult_stats_daily', N'results_deny_pulpotomy_on_adult', N't_temp_24_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (16, 25, N'pl_deny_otherxrays_if_fmx_done_stats_daily', N'results_deny_otherxrays_if_fmx_done', N't_temp_25_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (17, 26, N'pl_deny_pulp_on_adult_full_endo_stats_daily', N'results_deny_pulp_on_adult_full_endo', N't_temp_26_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (18, 27, N'pl_anesthesia_dangerous_dose_stats_daily', N'results_anesthesia_dangerous_dose', N't_temp_27_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
SET IDENTITY_INSERT [dbo].[t_global_pl_config] OFF
SET IDENTITY_INSERT [dbo].[t_global_reasons_ratio] ON 

INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (1, 14, N'Periodontal Maintenance vs. Prophy', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (2, 14, N'Periodontal Maintenance vs. Prophy', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (3, 14, N'Periodontal Maintenance vs. Prophy', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (4, 14, N'Periodontal Maintenance vs. Prophy', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (5, 12, N'Third Molar', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (6, 12, N'Third Molar', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (7, 11, N'Primary Tooth Extraction Coded as Adult Extraction', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (8, 11, N'Primary Tooth Extraction Coded as Adult Extraction', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (9, 7, N'multidoctor', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (10, 7, N'multidoctor', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (11, 7, N'multidoctor', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (12, 7, N'multidoctor', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (13, 15, N'Unjustified Full Mouth X-rays', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (14, 15, N'Unjustified Full Mouth X-rays', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (15, 15, N'Unjustified Full Mouth X-rays', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (16, 15, N'Unjustified Full Mouth X-rays', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (17, 15, N'Unjustified Full Mouth X-rays', 5, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (18, 16, N'Complex periodontal', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (19, 16, N'Complex periodontal', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (20, 16, N'Complex periodontal', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (21, 16, N'Complex periodontal', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (22, 16, N'Complex periodontal', 5, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (23, 13, N'Periodontal Scaling vs. Prophy', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (24, 13, N'Periodontal Scaling vs. Prophy', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (25, 13, N'Periodontal Scaling vs. Prophy', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (26, 13, N'Periodontal Scaling vs. Prophy', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (27, 13, N'Periodontal Scaling vs. Prophy', 5, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (28, 13, N'Periodontal Scaling vs. Prophy', 6, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (29, 13, N'Periodontal Scaling vs. Prophy', 7, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (30, 13, N'Periodontal Scaling vs. Prophy', 8, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (31, 13, N'Periodontal Scaling vs. Prophy', 9, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (32, 13, N'Periodontal Scaling vs. Prophy', 10, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (33, 16, N'Complex Periodontal', 6, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (34, 25, N'Deny other xray if FMX done', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (35, 25, N'Deny other xray if FMX done', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (36, 24, N'Deny Pulpotomy on adult', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (37, 24, N'Deny Pulpotomy on adult', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (38, 24, N'Deny Pulpotomy on adult', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (39, 22, N'Sealant instead of fill', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (40, 22, N'Sealant instead of fill', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (41, 22, N'Sealant instead of fill', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (42, 26, N'Deny Pulpotomy on adult followed by Full Endo', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (43, 26, N'Deny Pulpotomy on adult followed by Full Endo', 5, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (44, 26, N'Deny Pulpotomy on adult followed by Full Endo', 6, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (45, 23, N'Crown build up overall - Axiomatic', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (46, 23, N'Crown build up overall - Axiomatic', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (47, 23, N'Crown build up overall - Axiomatic', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (48, 23, N'Crown build up overall - Axiomatic', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (49, 23, N'Crown build up overall - Axiomatic', 5, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (50, 23, N'Crown build up overall - Axiomatic', 6, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (51, 17, N'Ratio of Simple Extraction to Complex Extraction - Statistical', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (52, 17, N'Ratio of Simple Extraction to Complex Extraction - Statistical', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (53, 17, N'Ratio of Simple Extraction to Complex Extraction - Statistical', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (54, 21, N'Overuse of B or L surface in fillings', 1, N'red', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (55, 21, N'Overuse of B or L surface in fillings', 2, N'red', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (56, 21, N'Overuse of B or L surface in fillings', 3, N'green', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (57, 27, N'Anesthesia Dangerous Dose', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (58, 27, N'Anesthesia Dangerous Dose', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (59, 14, N'Periodontal Maintenance vs. Prophy', 6, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (60, 18, N'Unjustified Surgical Extraction - Axiomatic', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (61, 18, N'Unjustified Surgical Extraction - Axiomatic', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (62, 18, N'Unjustified Surgical Extraction - Axiomatic', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (63, 18, N'Unjustified Surgical Extraction - Axiomatic', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (64, 18, N'Unjustified Surgical Extraction - Axiomatic', 5, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (65, 18, N'Unjustified Surgical Extraction - Axiomatic', 6, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (66, 18, N'Unjustified Surgical Extraction - Axiomatic', 7, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (67, 18, N'Unjustified Surgical Extraction - Axiomatic', 8, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (68, 18, N'Unjustified Surgical Extraction - Axiomatic', 9, NULL, CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (69, 20, N'Adjacent Fillings (Code Distribution)', 3, N'red', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (70, 20, N'Adjacent Fillings (Code Distribution)', 2, N'yellow', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (71, 20, N'Adjacent Fillings (Code Distribution)', 1, N'green', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (72, 4, N'Impossible Age', 1, N'red', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (73, 4, N'Impossible Age', 2, N'green', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (74, 8, N'Overactive - Axiomatic', 101, N'green', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (75, 8, N'Overactive - Axiomatic', 102, N'yellow', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (76, 8, N'Overactive - Axiomatic', 103, N'red', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (77, 19, N'Overactive - Code distribution', 101, N'green', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (78, 19, N'Overactive - Code distribution', 102, N'yellow', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (79, 19, N'Overactive - Code distribution', 103, N'red', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (83, 21, N'Overuse of B or L surface in fillings', 4, N'green', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (84, 28, N'D4363 Usage Model', 4, N'red', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (85, 28, N'D4363 Usage Model', 1, N'red', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (86, 28, N'D4363 Usage Model', 2, N'red', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (87, 28, N'D4363 Usage Model', 3, N'red', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (88, 28, N'D4363 Usage Model', 5, N'red', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (89, 28, N'D4363 Usage Model', 8, N'red', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (90, 28, N'D4363 Usage Model', 7, N'yellow', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (91, 28, N'D4363 Usage Model', 6, N'green', CAST(1.00 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[t_global_reasons_ratio] OFF
SET IDENTITY_INSERT [dbo].[t_global_tables_data_status] ON 

INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (96, 20, N'results_adjacent_filling_each_attend_yearly', N'res', 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (97, 20, N'results_adjacent_filling_each_attend_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (98, 20, N'results_adjacent_filling_each_attend_weekly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (99, 23, N'results_cbu', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (100, 25, N'results_deny_otherxrays_if_fmx_done', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (101, 26, N'results_deny_pulp_on_adult_full_endo', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (102, 24, N'results_deny_pulpotomy_on_adult', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (103, 17, N'results_ext_code_distribution', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (104, 15, N'results_full_mouth_xrays', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (105, 7, N'results_multi_doctor', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (106, 21, N'results_over_use_of_b_or_l_filling', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (107, 13, N'results_perio_scaling_4a', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (108, 11, N'results_primary_tooth_ext', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (109, 22, N'results_sealants_instead_of_filling', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (110, 14, N'results_simple_prophy_4b', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (111, 12, N'results_third_molar', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (112, 1, N'pic_doctor_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (113, 2, N'dwp_doctor_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (114, 19, N'overactive_code_distribution_yearly_by_attend', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (115, 19, N'overactive_inactive_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (116, 18, N'surg_ext_final_results', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (117, 0, N'procedure_performed', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (118, 17, N'results_ext_code_distribution_all_meansd', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (119, 27, N'results_anesthesia_dangerous_dose', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (120, 27, N'pl_anesthesia_dangerous_dose_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (121, 27, N'pl_anesthesia_dangerous_dose_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (122, 27, N'pl_anesthesia_dangerous_dose_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (123, 1, N'pic_doctor_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (124, 26, N'pl_deny_pulp_on_adult_full_endo_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (125, 26, N'pl_deny_pulp_on_adult_full_endo_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (126, 26, N'pl_deny_pulp_on_adult_full_endo_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (127, 1, N'pic_doctor_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (128, 2, N'dwp_doctor_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (129, 2, N'dwp_doctor_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (130, 7, N'pl_multi_doctor_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (131, 7, N'pl_multi_doctor_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (132, 7, N'pl_multi_doctor_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (133, 8, N'overactive_inactive', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (134, 8, N'overactive_inactive_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (135, 25, N'pl_deny_otherxrays_if_fmx_done_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (136, 25, N'pl_deny_otherxrays_if_fmx_done_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (137, 25, N'pl_deny_otherxrays_if_fmx_done_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (138, 24, N'pl_deny_pulp_on_adult_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (139, 11, N'pl_primary_tooth_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (140, 24, N'pl_deny_pulp_on_adult_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (141, 24, N'pl_deny_pulp_on_adult_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (142, 11, N'pl_primary_tooth_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (143, 11, N'pl_primary_tooth_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (144, 12, N'pl_third_molar_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (145, 12, N'pl_third_molar_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (146, 23, N'pl_cbu_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (147, 23, N'pl_cbu_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (148, 23, N'pl_cbu_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (149, 13, N'pl_perio_scaling_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (150, 13, N'pl_perio_scaling_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (151, 13, N'pl_perio_scaling_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (152, 14, N'pl_simple_prophy_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (153, 14, N'pl_simple_prophy_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (154, 14, N'pl_simple_prophy_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (155, 15, N'pl_fmx_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (156, 15, N'pl_fmx_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (157, 15, N'pl_fmx_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (158, 16, N'results_complex_perio', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (159, 16, N'pl_complex_perio_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (160, 16, N'pl_complex_perio_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (161, 16, N'pl_complex_perio_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (162, 18, N'pl_ext_upcode_axiomatic_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (163, 18, N'pl_ext_upcode_axiomatic_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (164, 18, N'pl_ext_upcode_axiomatic_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (165, 21, N'pl_over_use_of_b_or_l_filling_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (166, 21, N'pl_over_use_of_b_or_l_filling_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (167, 21, N'pl_over_use_of_b_or_l_filling_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (168, 22, N'pl_sealants_instead_of_filling_stats_daily', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (169, 22, N'pl_sealants_instead_of_filling_stats_monthly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (170, 22, N'pl_sealants_instead_of_filling_stats_yearly', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (171, 0, N'pic_dwp_anesthesia_adjustments', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (172, 0, N'ref_standard_procedures', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (173, 7, N'src_multiple_claims', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (174, 11, N'src_primary_tooth_ext', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (175, 12, N'src_ext_3rd_molar', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (176, 13, N'src_perio_scaling_4a', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (177, 14, N'src_simple_prophy_4b', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (178, 15, N'src_full_mouth_xrays', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (179, 16, N'src_complex_perio', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (180, 17, N'src_ext_code_distribution', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (181, 18, N'ext_upcode_procedure_performed_final', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (182, 19, N'overactive_inactive', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (183, 20, N'src_adjacent_filling', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (184, 21, N'src_over_use_of_b_or_l_history', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (185, 22, N'src_sealants_instead_of_filling_data_set_a', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (186, 23, N'cbu_procedure_performed', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (187, 24, N'src_deny_pulpotomy_algo_on_adult', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (188, 25, N'src_deny_otherxrays_if_fmx_done', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (189, 26, N'src_deny_pulpotomy_algo_on_adult', NULL, 0, 0, 0)
INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type], [table_exists], [table_populated], [total_rows]) VALUES (190, 27, N'src_anesthesia_dangerous_dose', NULL, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[t_global_tables_data_status] OFF
SET IDENTITY_INSERT [dbo].[t_global_variables] ON 

INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (13, 0, N'anesthesia_by_patient_weightage', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (14, 0, N'multisite_by_patient_weightage', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (15, 1, N'pl_daily_pic', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (16, 2, N'dwp_daily', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (17, 0, N'fillup_by_patient_weightage', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (79, 1, N'pl_monthly_pic', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (80, 1, N'pl_yearly_pic', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (81, 1, N'db_daily_pic', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (82, 1, N'db_monthly_pic', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (83, 1, N'db_yearly_pic', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (94, 2, N'pl_daily_dwp', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (95, 2, N'pl_monthly_dwp', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (96, 2, N'pl_yearly_dwp', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (97, 2, N'db_daily_dwp', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (98, 2, N'db_monthly_dwp', N'1')
INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (99, 2, N'db_yearly_dwp', N'1')
SET IDENTITY_INSERT [dbo].[t_global_variables] OFF
ALTER TABLE [dbo].[t_global_tables_data_status] ADD  DEFAULT (NULL) FOR [table_type]
GO
ALTER TABLE [dbo].[t_global_tables_data_status] ADD  DEFAULT ((0)) FOR [table_exists]
GO
ALTER TABLE [dbo].[t_global_tables_data_status] ADD  DEFAULT ((0)) FOR [table_populated]
GO
ALTER TABLE [dbo].[t_global_tables_data_status] ADD  DEFAULT ((0)) FOR [total_rows]
GO
ALTER TABLE [dbo].[t_global_tables_data_status]  WITH CHECK ADD CHECK  (([table_type]='mh' OR [table_type]='db' OR [table_type]='pl' OR [table_type]='res' OR [table_type]='src'))
GO
/****** Object:  StoredProcedure [db_owner].[t_mysp]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [db_owner].[t_mysp]
as
	select * from test_cases.dbo.t_report_result

/*

-- 
-- 12 results_third_molar
-- 13 results_perio_scaling_4a
-- 14 results_simple_prophy_4b
-- 15 results_full_mouth_xrays
-- 16 results_complex_perio
-- 17 results_ext_code_distribution *
-- 18 surg_ext_final_results
-- 19 
-- 20
-- 21 results_over_use_of_b_or_l_filling
-- 22 results_sealants_instead_of_filling
-- 23 results_cbu
-- 24 results_deny_pulpotomy_on_adult
-- 25 results_deny_otherxrays_if_fmx_done
-- 26 results_deny_pulp_on_adult_full_endo [issue]
-- 27 results_anesthesia_dangerous_dose *

select *
from
(
select	r.id, r.date_of_service, r.proc_code, r.status,r.ryg_status, r.paid_money, r.reason_level
		,f.condition_id, b.avg_paid_money
		,f.base_code
		,(
			case
				when r.status like 'dis%'
				then
					paid_money
				when r.status like 'allow%'
				then
					0
				else
					iif((r.paid_money - b.avg_paid_money)<0,0,(r.paid_money - b.avg_paid_money)) 
			end
		 ) as exp_recovered_money
		,iif(r.recovered_money is null, 0, r.recovered_money) as recovered_money
from	fl_production.dbo.results_third_molar as r
		left join
		fl_production.dbo.algos_conditions_reasons_flow as f
		on r.reason_level = f.condition_id and f.algo_id = 12
		left join
		fl_production.dbo.algos_base_code_avg_money as b
		on f.base_code = b.proc_code  and b.isactive = 1 and b.year =year(r.date_of_service) 
where	r.isactive = 1  
)  tab
where tab.recovered_money  <> round(tab.exp_recovered_money,2)

select	 count(*) -- 15199
from	fl_production.dbo.results_third_molar
where	isactive = 1

*/

GO
/****** Object:  StoredProcedure [dbo].[slackMsg]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Abdul Mateen>
-- Create date: <07/AUG/2018>
-- Description:	<Slack message sender>
-- =============================================
CREATE PROCEDURE [dbo].[slackMsg] -- Add the parameters for the stored procedure here
@Txt VARCHAR ( 8000 ),@Username VARCHAR ( 999 ),@Channel VARCHAR ( 999 ),@Emoji VARCHAR ( 999 ) AS BEGIN
	
	SET NOCOUNT ON;
	DECLARE
		@IP VARCHAR ( 100 ) =  CONVERT (
			VARCHAR ( 100 ),
		CONNECTIONPROPERTY ( 'local_net_address' ));
	DECLARE
		@Object AS INT;
	DECLARE
		@ResponseText AS VARCHAR ( 8000 );
	
	SET @Username = @Username + '   ' +@IP;
	DECLARE
		@Body AS VARCHAR ( 8000 ) = '{
		"text":	"' +@Txt + '" 
		,"channel":	"' +@Channel + '"
		,"icon_emoji": "' +@Emoji + '" 
		,"username": "' +@Username + '" 
		,"mrkdwn":  true 
		}' EXEC sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
	EXEC sp_OAMethod @Object,
	'open',
	NULL,
	'post',
	'https://hooks.slack.com/services/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',
	'false' EXEC sp_OAMethod @Object,
	'setRequestHeader',
	NULL,
	'Content-Type',
	'application/json' EXEC sp_OAMethod @Object,
	'send',
	NULL, @body EXEC sp_OAMethod @Object,
	'responseText', @ResponseText OUTPUT SELECT
@ResponseText EXEC sp_OADestroy @Object 
END
GO
/****** Object:  StoredProcedure [dbo].[t__________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

Create PROCEDURE [dbo].[t__________________]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

   END




GO
/****** Object:  StoredProcedure [dbo].[t__Drop_Tables]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Imran Abbas
-- Create date: 19 June 2018
-- Description:	FILL UP  Time Verification
-- =============================================
CREATE PROCEDURE [dbo].[t__Drop_Tables]
AS
BEGIN
	 
	DECLARE @t_table_name VARCHAR(5000) =''
	
	DECLARE table_name_in_cursor CURSOR LOCAL FORWARD_ONLY FOR 
		SELECT	TABLE_NAME as sample_table_name
		FROM	[test_cases].[INFORMATION_SCHEMA].[TABLES]
		WHERE	TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG='test_cases'
				AND TABLE_NAME LIKE 't_temp_%'	
		UNION
		select Distinct(sample_table_name) from test_cases.dbo.t_global_pl_config
					
				  

	OPEN table_name_in_cursor
	FETCH table_name_in_cursor INTO  @t_table_name
	
	WHILE @@FETCH_STATUS = 0
		BEGIN -- <<-- ALGO CORE PROCESSING STARTS	
			
			-- select @t_table_name

			EXECUTE [dbo].[t__fn_drop_table_if_exists]
			@_i_table_name = @t_table_name

			FETCH NEXT FROM table_name_in_cursor INTO   @t_table_name

		END	-- <<--  ALGO CORE PROCESSING ENDS
	
	CLOSE table_name_in_cursor 
	DEALLOCATE table_name_in_cursor
	-- <<=== ALGO CORE PROCESSING ENDS
	
END




GO
/****** Object:  StoredProcedure [dbo].[t__fn_drop_table_if_exists]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

CREATE PROCEDURE [dbo].[t__fn_drop_table_if_exists]
	@_i_table_name varchar(1000)
	
AS 
   BEGIN 
	
	 declare @dynSqlCmd nvarchar(2000)

	SET @dynSqlCmd =
	N'
		if(OBJECT_ID(''test_cases.dbo.'+@_i_table_name+''') IS NOT NULL)
			BEGIN
				DROP TABLE test_cases.dbo.'+@_i_table_name+'
			END
	'
	exec  sp_executesql @dynSqlCmd

	
   END





GO
/****** Object:  StoredProcedure [dbo].[t__fn_sum_recovered_money]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Imran Abbas Satti
-- Create date: 15-08-2018 
-- Description:	Recovered Money Calculation 
-- =============================================
CREATE PROCEDURE [dbo].[t__fn_sum_recovered_money]
	-- Add the parameters for the stored procedure here
	@in_res_tab_name varchar(500) 
	,@in_algo_id varchar(20)
	,@out_recovered_money_sum float OUTPUT
AS
BEGIN
	
	declare @dynSqlCmd nvarchar(2000)

	if(@in_res_tab_name = 'pic_doctor_stats_daily' or @in_res_tab_name = 'dwp_doctor_stats_daily')
		BEGIN
			set @dynSqlCmd =
			N'
			select @p_out_recovered_money_sum = sum(exp_recovered_money) 
			from 
				(
					select
						(
						case
							when ryg_status = ''green''
							then 0
							else
								round(income * excess_time_ratio,2)
						end
						) as exp_recovered_money
					from fl_production.dbo.'+@in_res_tab_name+'
					where isactive = 1
				) as tab
			'
		END
	ELSE IF(@in_res_tab_name = 'results_anesthesia_dangerous_dose')
		BEGIN
			set @dynSqlCmd =
			N'
				select @p_out_recovered_money_sum = sum(exp_recovered_money)
				from
				(
					select	
							(
								CASE
									when ryg_status = ''green''
									then	
										0
									else
										CASE
											when toxic_dose_ratio > 1
											then paid_money
											else
												ROUND(paid_money * toxic_dose_ratio,2)
										END
								END
					
						   ) as exp_recovered_money 
					from fl_production.dbo.results_anesthesia_dangerous_dose
				) as tab
			'
		END
	ELSE If(@in_res_tab_name = 'results_ext_code_distribution')
		BEGIN
			set @dynSqlCmd = 
			N'
			select @p_out_recovered_money_sum = sum(exp_saved_money)
			from
				(
					select	final_results*(max_amount_d7210-max_amount_d7140) as exp_saved_money 
					from	fl_production.dbo.results_ext_code_distribution
					where	isactive = 1
				) as tab
			'
		END
	ELSE If(@in_res_tab_name = 'results_multi_doctor')
		BEGIN
			set @dynSqlCmd = 
			N'
			select @p_out_recovered_money_sum = sum(exp_recovered_money)
			from
				(
						select
						( 
							case
							when ryg_status = ''red''
								then
									paid_money
								else
									0
							end 
						) as exp_recovered_money
						from	fl_production.dbo.results_multi_doctor
						where	isactive = 1
				) as tab
			'
		END
	ELSE If(@in_res_tab_name = 'results_adjacent_filling_each_attend_weekly')
		BEGIN
			set @dynSqlCmd = 
			N'
			select @p_out_recovered_money_sum = sum(exp_recovered_money)
			from
				(
					select
					( 
						case
						when ryg_status = ''red''
							then
								paid_money
							else
								0
						end 
					) as exp_recovered_money
					from	fl_production.dbo.results_adjacent_filling_each_attend_weekly
					where	isactive = 1
				) as tab
			'
		END
	ELSE
		BEGIN	
			set @dynSqlCmd =
			N'
			select @p_out_recovered_money_sum =sum(exp_recovered_money)
			from
			(
					select	
							(
								case
									when r.status like ''dis%''
									then
										paid_money
									when r.status like ''allow%''
									then
										0
									else
										iif((r.paid_money - b.avg_paid_money)<0,0,(r.paid_money - b.avg_paid_money)) 
								end
								) as exp_recovered_money
							,iif(r.recovered_money is null, 0, r.recovered_money) as recovered_money
					from	fl_production.dbo.'+@in_res_tab_name+' as r
							left join
							fl_production.dbo.algos_conditions_reasons_flow as f
							on r.reason_level = f.condition_id and f.algo_id ='+@in_algo_id+'
							left join
							fl_production.dbo.algos_base_code_avg_money as b
							on f.base_code = b.proc_code  and b.isactive = 1 and b.year =year(r.date_of_service) 
					where	r.isactive = 1  
			)  tab
			'
		END

	EXECUTE sp_executesql @dynSqlCmd
			,N'@p_out_recovered_money_sum float output'
			,@p_out_recovered_money_sum = @out_recovered_money_sum output
			set @out_recovered_money_sum = round(@out_recovered_money_sum,2)
	

END


GO
/****** Object:  StoredProcedure [dbo].[t__fn_update_report_table]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

CREATE PROCEDURE [dbo].[t__fn_update_report_table]
	@_i_algo_id INT = -1
	,@_i_test_case_name varchar(255)= ''

	,@_i_test_case_status bit = 0
	,@_i_test_case_detail varchar(1000)= ''

	
	,@_i_report_tab_name varchar(255)= ''
	,@_i_test_case_sp_name varchar(225) = 0 

	,@_i_exe_time int= null

	,@_i_type varchar(15)
	
	
	
AS 
   BEGIN 
	
	 declare @dynSqlCmd nvarchar(2000)

	 SET @dynSqlCmd ='INSERT INTO '
					+ @_i_report_tab_name
					+ '(algo_id, test_case_name, test_case_sp_name, test_case_status, test_case_detail,exe_time_min,tc_type)'
					+ 'VALUES (
					  @_algo_id, @_test_case_name,@_test_case_sp_name ,@_test_case_status,@_test_case_detail,@_exe_time,@_type
							   )'

	
	
	EXECUTE sp_executesql @dynSqlCmd
		,N'@_algo_id INT
		,@_test_case_name VARCHAR(255)
		,@_test_case_sp_name VARCHAR(255)
		,@_test_case_status INT
		,@_test_case_detail VARCHAR(1000)
		,@_exe_time INT 
		,@_type varchar(15)'
		,@_algo_id = @_i_algo_id
		,@_test_case_name = @_i_test_case_name
		,@_test_case_sp_name = @_i_test_case_sp_name
		,@_test_case_status = @_i_test_case_status
		,@_test_case_detail = @_i_test_case_detail
		,@_exe_time  = @_i_exe_time
		,@_type = @_i_type
	
		
   END




GO
/****** Object:  StoredProcedure [dbo].[t__generate_schema]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[t__generate_schema]
AS 
   BEGIN
	
	/*
		-- Generating Schema For Table [t_report]
	*/

	if(object_id(N'[test_cases].[dbo].[t_report]', 'U') is null)
		BEGIN
			CREATE TABLE [test_cases].[dbo].[t_report]
			(
				id INT identity(1,1) ,
				algo_id INT DEFAULT -1,

				test_case_name VARCHAR(250) DEFAULT NULL,
				test_case_sp_name  VARCHAR(250) DEFAULT NULL,
			
				test_case_status bit DEFAULT NULL,
				test_case_detail varchar(250) DEFAULT NULL,

				exe_time_min INT DEFAULT NULL,

				tc_process_date DATETIME2(0) DEFAULT NULL,
				is_sent bit default 0,

				tc_type varchar(15) default NULL,
			
				PRIMARY KEY (id)
			)

			ALTER TABLE [dbo].[t_report]  WITH CHECK ADD CHECK  (([tc_type]='res' OR [tc_type]='pl_daily' OR [tc_type]='pl_monthly' 
							OR [tc_type]='pl_yearly' OR [tc_type]='db_daily' OR [tc_type]='db_monthly'
							OR [tc_type]='db_yearly'  ))

		END

	/*
		-- Generating Schema For Table [t_global_reasons_ratio]
	*/
	if(object_id(N'[test_cases].[dbo].[t_global_tables_data_status]', 'U') is null)
		begin
			CREATE TABLE [dbo].[t_global_tables_data_status](
			[id] [int] IDENTITY(1,1) NOT NULL,
			[algo_id] [int] NULL,
			[table_name] [varchar](500) NULL,
			[table_type] [varchar](10) DEFAULT NULL,
			[table_exists] [bit] DEFAULT 0,
			[table_populated] [bit] DEFAULT 0,
			[total_rows] [int] DEFAULT 0
			) ON [PRIMARY]	
			
			ALTER TABLE [dbo].[t_global_tables_data_status]  WITH CHECK ADD CHECK  (([table_type]='mh' OR [table_type]='db' OR [table_type]='pl' OR [table_type]='res' OR [table_type]='src'))		
		
			SET IDENTITY_INSERT [dbo].[t_global_tables_data_status] ON 

			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (96, 20, N'results_adjacent_filling_each_attend_yearly', 'res')
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (97, 20, N'results_adjacent_filling_each_attend_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (98, 20, N'results_adjacent_filling_each_attend_weekly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (99, 23, N'results_cbu', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (100, 25, N'results_deny_otherxrays_if_fmx_done', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (101, 26, N'results_deny_pulp_on_adult_full_endo', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (102, 24, N'results_deny_pulpotomy_on_adult', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (103, 17, N'results_ext_code_distribution', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (104, 15, N'results_full_mouth_xrays', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (105, 7, N'results_multi_doctor', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (106, 21, N'results_over_use_of_b_or_l_filling', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (107, 13, N'results_perio_scaling_4a', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (108, 11, N'results_primary_tooth_ext', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (109, 22, N'results_sealants_instead_of_filling', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (110, 14, N'results_simple_prophy_4b', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (111, 12, N'results_third_molar', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (112, 1, N'pic_doctor_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (113, 2, N'dwp_doctor_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (114, 19, N'overactive_code_distribution_yearly_by_attend', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (115, 19, N'overactive_inactive_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (116, 18, N'surg_ext_final_results', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (117, 0, N'procedure_performed', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (118, 17, N'results_ext_code_distribution_all_meansd', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (119, 27, N'results_anesthesia_dangerous_dose', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (120, 27, N'pl_anesthesia_dangerous_dose_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (121, 27, N'pl_anesthesia_dangerous_dose_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (122, 27, N'pl_anesthesia_dangerous_dose_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (123, 1, N'pic_doctor_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (124, 26, N'pl_deny_pulp_on_adult_full_endo_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (125, 26, N'pl_deny_pulp_on_adult_full_endo_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (126, 26, N'pl_deny_pulp_on_adult_full_endo_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (127, 1, N'pic_doctor_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (128, 2, N'dwp_doctor_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (129, 2, N'dwp_doctor_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (130, 7, N'pl_multi_doctor_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (131, 7, N'pl_multi_doctor_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (132, 7, N'pl_multi_doctor_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (133, 8, N'overactive_inactive', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (134, 8, N'overactive_inactive_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (135, 25, N'pl_deny_otherxrays_if_fmx_done_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (136, 25, N'pl_deny_otherxrays_if_fmx_done_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (137, 25, N'pl_deny_otherxrays_if_fmx_done_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (138, 24, N'pl_deny_pulp_on_adult_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (139, 11, N'pl_primary_tooth_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (140, 24, N'pl_deny_pulp_on_adult_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (141, 24, N'pl_deny_pulp_on_adult_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (142, 11, N'pl_primary_tooth_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (143, 11, N'pl_primary_tooth_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (144, 12, N'pl_third_molar_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (145, 12, N'pl_third_molar_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (146, 23, N'pl_cbu_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (147, 23, N'pl_cbu_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (148, 23, N'pl_cbu_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (149, 13, N'pl_perio_scaling_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (150, 13, N'pl_perio_scaling_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (151, 13, N'pl_perio_scaling_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (152, 14, N'pl_simple_prophy_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (153, 14, N'pl_simple_prophy_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (154, 14, N'pl_simple_prophy_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (155, 15, N'pl_fmx_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (156, 15, N'pl_fmx_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (157, 15, N'pl_fmx_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (158, 16, N'results_complex_perio', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (159, 16, N'pl_complex_perio_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (160, 16, N'pl_complex_perio_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (161, 16, N'pl_complex_perio_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (162, 18, N'pl_ext_upcode_axiomatic_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (163, 18, N'pl_ext_upcode_axiomatic_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (164, 18, N'pl_ext_upcode_axiomatic_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (165, 21, N'pl_over_use_of_b_or_l_filling_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (166, 21, N'pl_over_use_of_b_or_l_filling_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (167, 21, N'pl_over_use_of_b_or_l_filling_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (168, 22, N'pl_sealants_instead_of_filling_stats_daily', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (169, 22, N'pl_sealants_instead_of_filling_stats_monthly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (170, 22, N'pl_sealants_instead_of_filling_stats_yearly', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (171, 0, N'pic_dwp_anesthesia_adjustments', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (172, 0, N'ref_standard_procedures', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (173, 7, N'src_multiple_claims', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (174, 11, N'src_primary_tooth_ext', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (175, 12, N'src_ext_3rd_molar', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (176, 13, N'src_perio_scaling_4a', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (177, 14, N'src_simple_prophy_4b', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (178, 15, N'src_full_mouth_xrays', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (179, 16, N'src_complex_perio', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (180, 17, N'src_ext_code_distribution', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (181, 18, N'ext_upcode_procedure_performed_final', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (182, 19, N'overactive_inactive', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (183, 20, N'src_adjacent_filling', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (184, 21, N'src_over_use_of_b_or_l_history', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (185, 22, N'src_sealants_instead_of_filling_data_set_a', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (186, 23, N'cbu_procedure_performed', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (187, 24, N'src_deny_pulpotomy_algo_on_adult', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (188, 25, N'src_deny_otherxrays_if_fmx_done', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (189, 26, N'src_deny_pulpotomy_algo_on_adult', NULL)
			INSERT [dbo].[t_global_tables_data_status] ([id], [algo_id], [table_name], [table_type]) VALUES (190, 27, N'src_anesthesia_dangerous_dose', NULL)
			SET IDENTITY_INSERT [dbo].[t_global_tables_data_status] OFF
			
		END

		/*
			-- Generating Schema For Table[t_global_reasons_ratio] --
		*/
		
		if(object_id(N'[test_cases].[dbo].[t_global_reasons_ratio]', 'U') is null)
		begin
			CREATE TABLE [dbo].[t_global_reasons_ratio](
				[id] [bigint] IDENTITY(84,1) NOT NULL,
				[algo_id] [int] NOT NULL,
				[algo_name] [varchar](100) NOT NULL,
				[reason_level] [int] NULL,
				[ryg_status] [varchar](30) NULL,
				[reason_weight] [decimal](4, 2) NOT NULL
			) ON [PRIMARY]	
			
			SET IDENTITY_INSERT [dbo].[t_global_reasons_ratio] ON
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (1, 14, N'Periodontal Maintenance vs. Prophy', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (2, 14, N'Periodontal Maintenance vs. Prophy', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (3, 14, N'Periodontal Maintenance vs. Prophy', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (4, 14, N'Periodontal Maintenance vs. Prophy', 4, NULL, CAST(1.00 AS Decimal(4, 2))) 
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (5, 12, N'Third Molar', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (6, 12, N'Third Molar', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (7, 11, N'Primary Tooth Extraction Coded as Adult Extraction', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (8, 11, N'Primary Tooth Extraction Coded as Adult Extraction', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (9, 7, N'multidoctor', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (10, 7, N'multidoctor', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (11, 7, N'multidoctor', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (12, 7, N'multidoctor', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (13, 15, N'Unjustified Full Mouth X-rays', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (14, 15, N'Unjustified Full Mouth X-rays', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (15, 15, N'Unjustified Full Mouth X-rays', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (16, 15, N'Unjustified Full Mouth X-rays', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (17, 15, N'Unjustified Full Mouth X-rays', 5, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (18, 16, N'Complex periodontal', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (19, 16, N'Complex periodontal', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (20, 16, N'Complex periodontal', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (21, 16, N'Complex periodontal', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (22, 16, N'Complex periodontal', 5, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (23, 13, N'Periodontal Scaling vs. Prophy', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (24, 13, N'Periodontal Scaling vs. Prophy', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (25, 13, N'Periodontal Scaling vs. Prophy', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (26, 13, N'Periodontal Scaling vs. Prophy', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (27, 13, N'Periodontal Scaling vs. Prophy', 5, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (28, 13, N'Periodontal Scaling vs. Prophy', 6, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (29, 13, N'Periodontal Scaling vs. Prophy', 7, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (30, 13, N'Periodontal Scaling vs. Prophy', 8, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (31, 13, N'Periodontal Scaling vs. Prophy', 9, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (32, 13, N'Periodontal Scaling vs. Prophy', 10, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (33, 16, N'Complex Periodontal', 6, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (34, 25, N'Deny other xray if FMX done', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (35, 25, N'Deny other xray if FMX done', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (36, 24, N'Deny Pulpotomy on adult', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (37, 24, N'Deny Pulpotomy on adult', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (38, 24, N'Deny Pulpotomy on adult', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (39, 22, N'Sealant instead of fill', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (40, 22, N'Sealant instead of fill', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (41, 22, N'Sealant instead of fill', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (42, 26, N'Deny Pulpotomy on adult followed by Full Endo', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (43, 26, N'Deny Pulpotomy on adult followed by Full Endo', 5, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (44, 26, N'Deny Pulpotomy on adult followed by Full Endo', 6, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (45, 23, N'Crown build up overall - Axiomatic', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (46, 23, N'Crown build up overall - Axiomatic', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (47, 23, N'Crown build up overall - Axiomatic', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (48, 23, N'Crown build up overall - Axiomatic', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (49, 23, N'Crown build up overall - Axiomatic', 5, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (50, 23, N'Crown build up overall - Axiomatic', 6, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (51, 17, N'Ratio of Simple Extraction to Complex Extraction - Statistical', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (52, 17, N'Ratio of Simple Extraction to Complex Extraction - Statistical', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (53, 17, N'Ratio of Simple Extraction to Complex Extraction - Statistical', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (54, 21, N'Overuse of B or L surface in fillings', 1, N'red', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (55, 21, N'Overuse of B or L surface in fillings', 2, N'red', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (56, 21, N'Overuse of B or L surface in fillings', 3, N'green', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (57, 27, N'Anesthesia Dangerous Dose', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (58, 27, N'Anesthesia Dangerous Dose', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (59, 14, N'Periodontal Maintenance vs. Prophy', 6, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (60, 18, N'Unjustified Surgical Extraction - Axiomatic', 1, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (61, 18, N'Unjustified Surgical Extraction - Axiomatic', 2, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (62, 18, N'Unjustified Surgical Extraction - Axiomatic', 3, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (63, 18, N'Unjustified Surgical Extraction - Axiomatic', 4, NULL, CAST(1.00 AS Decimal(4, 2)))
			
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (64, 18, N'Unjustified Surgical Extraction - Axiomatic', 5, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (65, 18, N'Unjustified Surgical Extraction - Axiomatic', 6, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (66, 18, N'Unjustified Surgical Extraction - Axiomatic', 7, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (67, 18, N'Unjustified Surgical Extraction - Axiomatic', 8, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (68, 18, N'Unjustified Surgical Extraction - Axiomatic', 9, NULL, CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (69, 20, N'Adjacent Fillings (Code Distribution)', 3, N'red', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (70, 20, N'Adjacent Fillings (Code Distribution)', 2, N'yellow', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (71, 20, N'Adjacent Fillings (Code Distribution)', 1, N'green', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (72, 4, N'Impossible Age', 1, N'red', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (73, 4, N'Impossible Age', 2, N'green', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (74, 8, N'Overactive - Axiomatic', 101, N'green', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (75, 8, N'Overactive - Axiomatic', 102, N'yellow', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (76, 8, N'Overactive - Axiomatic', 103, N'red', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (77, 19, N'Overactive - Code distribution', 101, N'green', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (78, 19, N'Overactive - Code distribution', 102, N'yellow', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (79, 19, N'Overactive - Code distribution', 103, N'red', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (83, 21, N'Overuse of B or L surface in fillings', 4, N'green', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (84, 28, N'D4363 Usage Model', 4, N'red', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (85, 28, N'D4363 Usage Model', 1, N'red', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (86, 28, N'D4363 Usage Model', 2, N'red', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (87, 28, N'D4363 Usage Model', 3, N'red', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (88, 28, N'D4363 Usage Model', 5, N'red', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (89, 28, N'D4363 Usage Model', 8, N'red', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (90, 28, N'D4363 Usage Model', 7, N'yellow', CAST(1.00 AS Decimal(4, 2)))
			INSERT [dbo].[t_global_reasons_ratio] ([id], [algo_id], [algo_name], [reason_level], [ryg_status], [reason_weight]) VALUES (91, 28, N'D4363 Usage Model', 6, N'green', CAST(1.00 AS Decimal(4, 2)))
			SET IDENTITY_INSERT [dbo].[t_global_reasons_ratio] OFF
		END


		/*
			-- Generating Schema For Table [t_global_variables]
		*/
		if(object_id(N'[test_cases].[dbo].[t_global_variables]', 'U') is null)
			BEGIN
				CREATE TABLE [dbo].[t_global_variables](
					[id] [int] IDENTITY(116,1) NOT NULL,
					[algo_id] [int] NULL,
					[var_key] [varchar](100) NULL,
					[var_value] [varchar](100) NULL
				) ON [PRIMARY]
				SET IDENTITY_INSERT [dbo].[t_global_variables] ON 
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (13, 0, N'anesthesia_by_patient_weightage', N'1')
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (14, 0, N'multisite_by_patient_weightage', N'1')

				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (15, 1, N'pl_daily_pic', N'1')
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (16, 2, N'dwp_daily', N'1')
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (17, 0, N'fillup_by_patient_weightage', N'1')

				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (79, 1, N'pl_monthly_pic', N'1')
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (80, 1, N'pl_yearly_pic', N'1')
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (81, 1, N'db_daily_pic', N'1')
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (82, 1, N'db_monthly_pic', N'1')
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (83, 1, N'db_yearly_pic', N'1')

				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (94, 2, N'pl_daily_dwp', N'1')
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (95, 2, N'pl_monthly_dwp', N'1')
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (96, 2, N'pl_yearly_dwp', N'1')
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (97, 2, N'db_daily_dwp', N'1')
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (98, 2, N'db_monthly_dwp', N'1')
				INSERT [dbo].[t_global_variables] ([id], [algo_id], [var_key], [var_value]) VALUES (99, 2, N'db_yearly_dwp', N'1')
				SET IDENTITY_INSERT [dbo].[t_global_variables] OFF
			END





		/*
			-- Generating Schema For Table [t_global_pl_config] --
		*/
		if(object_id(N'[test_cases].[dbo].[t_global_pl_config]', 'U') is null)
		BEGIN
			CREATE TABLE [dbo].[t_global_pl_config](
			[id] [int] IDENTITY(1,1) NOT NULL,
			[algo_id] [int] NULL,
			[pl_table_name] [varchar](500) NULL,
			[result_table_name] [varchar](500) NULL,
			[sample_table_name] [varchar](500) NULL,
			[pl_type] [varchar](10) NULL,
			[sample_percent] [decimal](4, 2) NULL,
			[run_test] [bit] NOT NULL
			) ON [PRIMARY]

			SET IDENTITY_INSERT [dbo].[t_global_pl_config] ON 

			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (1, 12, N'pl_third_molar_stats_daily', N'results_third_molar', N't_temp_12_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 1)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (2, 12, N'pl_third_molar_stats_monthy', N'results_third_molar', N't_temp_12_pl_monthly_test_table', N'monthly', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (3, 12, N'pl_third_molar_stats_yearly', N'results_third_molar', N't_temp_12_pl_yearly_test_table', N'yearly', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (4, 11, N'pl_primary_tooth_stats_daily', N'results_primary_tooth_ext', N't_temp_11_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (5, 7, N'pl_multi_doctor_stats_daily', N'results_multi_doctor', N't_temp_07_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (6, 4, N'impossible_age_daily', N'procedure_performed', N't_temp_04_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (7, 13, N'pl_perio_scaling_stats_daily', N'results_perio_scaling_4a', N't_temp_13_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (8, 14, N'pl_simple_prophy_stats_daily', N'results_simple_prophy_4b', N't_temp_14_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (9, 15, N'pl_fmx_stats_daily', N'results_full_mouth_xrays', N't_temp_15_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (10, 16, N'pl_complex_perio_stats_daily', N'results_complex_perio', N't_temp_16_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (11, 18, N'pl_ext_upcode_axiomatic_stats_daily', N'surg_ext_final_results', N't_temp_18_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (12, 21, N'pl_over_use_of_b_or_l_filling_stats_daily', N'results_over_use_of_b_or_l_filling', N't_temp_21_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (13, 22, N'pl_sealants_instead_of_filling_stats_daily', N'results_sealants_instead_of_filling', N't_temp_22_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (14, 23, N'pl_cbu_stats_daily', N'results_cbu', N't_temp_23_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (15, 24, N'pl_deny_pulp_on_adult_stats_daily', N'results_deny_pulpotomy_on_adult', N't_temp_24_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (16, 25, N'pl_deny_otherxrays_if_fmx_done_stats_daily', N'results_deny_otherxrays_if_fmx_done', N't_temp_25_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (17, 26, N'pl_deny_pulp_on_adult_full_endo_stats_daily', N'results_deny_pulp_on_adult_full_endo', N't_temp_26_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			INSERT [dbo].[t_global_pl_config] ([id], [algo_id], [pl_table_name], [result_table_name], [sample_table_name], [pl_type], [sample_percent], [run_test]) VALUES (18, 27, N'pl_anesthesia_dangerous_dose_stats_daily', N'results_anesthesia_dangerous_dose', N't_temp_27_pl_daily_test_table', N'daily', CAST(0.20 AS Decimal(4, 2)), 0)
			
			SET IDENTITY_INSERT [dbo].[t_global_pl_config] OFF

		END




		

		

   END




GO
/****** Object:  StoredProcedure [dbo].[t__RUN_pl_daily_tes_table_gen_testcases]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[t__RUN_pl_daily_tes_table_gen_testcases] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	DECLARE @dynamicQuery NVARCHAR(4000)

	/* Below variables are used in generating sample Table */
	DECLARE  @sampleLimit int = 0
			,@total_count_pl_table int = 0
			,@max_process_date DATETIME2 (0)


	/* Below variables are used for holding cursor data */
	DECLARE  @cur_pl_table_name VARCHAR(5000)
			,@cur_pl_result_table_name VARCHAR(5000)
			,@cur_pl_sample_table_name VARCHAR(5000)
			,@cur_pl_type VARCHAR(10)
			,@cur_pl_sample_percent float 

	DECLARE cur_validate_pl_table CURSOR LOCAL  FORWARD_ONLY FOR 
		SELECT	 pl_table_name
				,result_table_name
				,sample_table_name
				,pl_type
				,sample_percent
		FROM	[test_cases].[dbo].t_global_pl_config
		WHERE	run_test = 1
				AND pl_type = 'daily'
	
	OPEN cur_validate_pl_table

	FETCH FROM  cur_validate_pl_table 
	INTO	 @cur_pl_table_name
			,@cur_pl_result_table_name
			,@cur_pl_sample_table_name
			,@cur_pl_type
			,@cur_pl_sample_percent

	WHILE @@FETCH_STATUS = 0
		BEGIN
		-- BLOCK A [GENERATING SAMPLE TABLE]
		-- ================================================================================
		-->> BLOCK A STARTS 

			/* Below dynamic query will delete sample table id exists and
				will generate the shema for sample table */
			set @dynamicQuery = 
			N'
			if(OBJECT_ID(''test_cases.dbo.'+@cur_pl_sample_table_name+''') IS NOT NULL)
			BEGIN
				DROP TABLE test_cases.dbo.'+@cur_pl_sample_table_name+'
			END

			create table test_cases.dbo.'+@cur_pl_sample_table_name+'
			(
				 id int identity
				,res_id int
				,attend VARCHAR(250) default null
				,date_of_service datetime2 null

				,act_proc_count INT DEFAULT 0
				,exp_proc_count INT DEFAULT 0

				,act_patient_count INT DEFAULT 0
				,exp_patient_count INT DEFAULT 0

				,act_paid_money float default 0
				,exp_paid_money float default 0

				,act_recovered_money float
				,exp_recovered_money float NOT NULL DEFAULT 0

				,act_ryg_status VARCHAR(15)
				,exp_ryg_status VARCHAR(15)

				,act_num_of_violations int not null default 0
				,exp_num_of_violations int not null default 0

				,test_status BIT DEFAULT NULL 
			)
			'
			EXECUTE sp_executesql @dynamicQuery
			

			/* Below dynamic query will get max process date and 
				total records for pl table */
			set @dynamicQuery =
			N'
				SELECT @_max_process_date = max(process_date)
				FROM  [fl_production].[dbo].['+@cur_pl_table_name+']
				WHERE isactive = 1

				SELECT  @_total_count_pl_table = COUNT(*)
				FROM [fl_production].[dbo].['+@cur_pl_table_name+']
				WHERE isactive = 1 and process_date = @_max_process_date
			'
			
			EXECUTE  sp_executesql @dynamicQuery
					 ,N'@_total_count_pl_table INT OUTPUT, @_max_process_date datetime2(0) OUTPUT'
					,@_total_count_pl_table = @total_count_pl_table OUTPUT 
					,@_max_process_date  = @max_process_date OUTPUT
		
			
			
			/* Calculating Limit value for sampling using percentage in config table */
			SET	@sampleLimit = @total_count_pl_table * 	@cur_pl_sample_percent /100
			IF @sampleLimit < 1
				SET @sampleLimit = 25


			/*	Inserting rows from pl table to sample table */
			set @dynamicQuery = 
			N'
			INSERT INTO [test_cases].[dbo].['+@cur_pl_sample_table_name+']
			(
				 res_id
				,attend
				,date_of_service
				,act_proc_count
				,act_patient_count
				,act_paid_money
				,act_recovered_money
				,act_ryg_status
				,act_num_of_violations
			)
			SELECT TOP('+cast(@sampleLimit as varchar)+')
				 id
				,attend
				,date_of_service
				,proc_count
				,patient_count
				,income
				,iif(recovered_money IS NULL,0,recovered_money)
				,ryg_status
				,number_of_violations
			FROM	[fl_production].[dbo].['+@cur_pl_table_name+']
			WHERE	isactive = 1
					AND process_date = @__max_process_date
					AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) 
						< ('+CAST(@sampleLimit+1 as VARCHAR)+')
			'
			EXECUTE sp_executesql @dynamicQuery
					,N'@__max_process_date datetime2(0) '
					,@__max_process_date = @max_process_date 

			Declare @_count int = 0
		-- << BLOCK A ENDS
		-- ================================================================================
		-- BLOCK B [VALIDATING COLUMNS IN SAMPLE TABLE]
		-- ================================================================================
		-- >> BLOCK B STARTS
			set @dynamicQuery =
			N'
				/* Below Variables are used for evaluating column values */
				DECLARE @tmp_exp_proc_count INT = 0
						,@tmp_exp_patient_count INT = 0
						,@tmp_exp_paid_money FLOAT 
						,@tmp_exp_recovered_money FLOAT 
						,@tmp_exp_ryg_status VARCHAR(15)
						,@tmp_r_check INT = 0
						,@tmp_y_check INT = 0
						,@tmp_g_check INT = 0
						,@tmp_exp_num_of_violations INT = 0
				
				/* Below Variable are used for holding cursor data */
				DECLARE	
						@cur_id_row INT = 0
						,@cur_row_attend VARCHAR(50)
						,@cur_row_dos DATETIME2(0)

				DECLARE cur_test_sample_row CURSOR LOCAL  FORWARD_ONLY FOR 
					SELECT id,attend, date_of_service
					FROM   [test_cases].[dbo].['+@cur_pl_sample_table_name+']
				

				-- >> --------------------------------------
				-- >>  CORE PROCESSING STARTS
				-- >> --------------------------------------
				OPEN cur_test_sample_row

				FETCH FROM cur_test_sample_row
				INTO @cur_id_row, @cur_row_attend, @cur_row_dos

				WHILE @@FETCH_STATUS = 0
					BEGIN
					
						SELECT	@tmp_exp_proc_count = COUNT(*) 
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+']
						WHERE	isactive = 1
								AND attend = @cur_row_attend
								AND date_of_service = @cur_row_dos
								
						SELECT	@tmp_exp_patient_count = COUNT(DISTINCT(mid)) 
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+']
						WHERE	isactive = 1
								AND attend = @cur_row_attend
								AND date_of_service = @cur_row_dos
								
						SELECT	@tmp_exp_paid_money = ROUND(SUM(paid_money),2)
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+'] 
						WHERE	isactive = 1
								AND attend = @cur_row_attend
								AND date_of_service = @cur_row_dos

						SELECT	@tmp_exp_recovered_money = ROUND(SUM(recovered_money),2)
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+'] 
						WHERE	isactive = 1
								AND attend = @cur_row_attend
								AND date_of_service = @cur_row_dos
							
						
						SELECT	@tmp_r_check = COUNT(*)
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+']  
						WHERE	isactive = 1 
								AND attend = @cur_row_attend 
								AND date_of_service =  @cur_row_dos
								AND ryg_status=''red''

						SELECT	@tmp_y_check = COUNT(*)
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+']  
						WHERE	isactive = 1 
								AND attend = @cur_row_attend 
								AND date_of_service =  @cur_row_dos
								AND ryg_status=''yellow''
						
						IF(@tmp_r_check != 0)
							BEGIN
								SET @tmp_exp_ryg_status=''red''
							END
						ELSE
							BEGIN
								IF(@tmp_y_check != 0)
									BEGIN
										SET @tmp_exp_ryg_status=''yellow''
									END
								ELSE
									BEGIN
										SET @tmp_exp_ryg_status=''green''
									END
							END
						SET @tmp_exp_num_of_violations = @tmp_r_check

						/*          */
						
						UPDATE [test_cases].[dbo].['+@cur_pl_sample_table_name+']
						SET		exp_proc_count = @tmp_exp_proc_count
								,exp_patient_count = @tmp_exp_patient_count
								,exp_paid_money = @tmp_exp_paid_money
								,exp_ryg_status = @tmp_exp_ryg_status
								,exp_num_of_violations =  @tmp_exp_num_of_violations
						WHERE	id = @cur_id_row
						
						FETCH NEXT FROM cur_test_sample_row
						INTO @cur_id_row ,@cur_row_attend, @cur_row_dos
					END

				CLOSE cur_test_sample_row
				DEALLOCATE cur_test_sample_row
				-- << -------------------------------------------
				-- << CORE PROCESSING ENDS
				-- << -------------------------------------------
			'
			EXECUTE (@dynamicQuery)


			SET @dynamicQuery = 
			N'
				UPDATE [test_cases].[dbo].['+@cur_pl_sample_table_name+']
				SET		test_status = 1
				WHERE	act_proc_count = exp_proc_count
						AND act_patient_count = exp_patient_count
						AND act_paid_money = exp_paid_money
						AND act_recovered_money = exp_recovered_money
						AND act_ryg_status = exp_ryg_status
						AND act_num_of_violations = exp_num_of_violations

				UPDATE [test_cases].[dbo].['+@cur_pl_sample_table_name+']
				SET		test_status = 0
				WHERE	test_status is null
			'
			EXECUTE (@dynamicQuery)

			/*For Updating PL Daily Report Table*/
			SET @dynamicQuery = 
			N'
				
			'


			
		-- << BLOCK B ENDS

			FETCH NEXT FROM  cur_validate_pl_table 
			INTO	@cur_pl_table_name
					,@cur_pl_result_table_name
					,@cur_pl_sample_table_name
					,@cur_pl_type
					,@cur_pl_sample_percent
		END

	CLOSE cur_validate_pl_table
	DEALLOCATE cur_validate_pl_table

END






GO
/****** Object:  StoredProcedure [dbo].[t__RUN_result_test_table_gen_testcases]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = root@192.168.0.167.
*/

CREATE PROCEDURE [dbo].[t__RUN_result_test_table_gen_testcases]
AS 
   BEGIN

		DECLARE	@out_success bit
		DECLARE @out_test_status bit
		DECLARE @test_detail nvarchar(255)

		----------------------------------------------
		Declare @start datetime; 
		Declare @executionTimeInMin int;
		
	/* Not Implemented Yet
		EXEC [test_cases].[dbo].[t_indp_01_check_table_data_status]
	*/
		
		------------------------------------ Verifying Overall table Stats --------------------
		set @start  = getdate();
		EXEC [test_cases].[dbo].[t_indp_02_verify_pivot_stats]
		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 0000
						,@_i_test_case_name ='Verifying Overall Stats'
						,@_i_test_case_status = 1
						,@_i_test_case_detail = '[test_cases].[dbo].[t_pivot_table]'
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_indp_02_verify_pivot_stats'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';
		
		-------------------------------------- temp procedure performed table generation ----------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t__temp_ProPerf_table_gen
		   @out_success OUTPUT
		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 0000
						,@_i_test_case_name ='N/A'
						,@_i_test_case_status = @out_success
						,@_i_test_case_detail = 'N/A'
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't__temp_ProPerf_table_gen'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';
	
		-----------------------------------------[ Average Money Validation ]-----------------------------------------------------
		
		set @start  = getdate();
		EXECUTE [test_cases].[dbo].[t_indp_03a_avg_money_test_table_gen]
		   @out_success OUTPUT

		EXECUTE [test_cases].[dbo].[t_indp_03b_avg_money_validation]
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 0000
						,@_i_test_case_name ='N/A'
						,@_i_test_case_status = @out_success
						,@_i_test_case_detail = 'N/A'
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't__00_avg_money_validation'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';

	
		------------------------------------------------------	ALOG NO. 00	------------------------------------------------------
		set @start  = getdate();

		EXECUTE [dbo].t_00_pic_dwp_anesthesia_ByPatient_test_table_gen
		   @out_success OUTPUT

		EXECUTE [dbo].t_00_pic_dwp_anesthesia_ByPatient_validation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 00
						,@_i_test_case_name ='Verifying anesthesia time in table[fl_production.dbo.pic_dwp_anesthesia_adjustments] by generating test table[test_cases.dbo.t_temp_pic_dwp_anesthesia_ByPatient_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_00_pic_dwp_ProPerf_table_gen/t_00_pic_dwp_anesthesia_ByPatient_test_table_gen/t_00_pic_dwp_anesthesia_ByPatient_validation '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';



		set @start  = getdate();
		EXECUTE [dbo].t_00_pic_dwp_fillup_ByPatient_test_table_gen
		   @out_success OUTPUT

		EXECUTE [dbo].t_00_pic_dwp_fillup_ByPatient_validation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXECUTE	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 00
						,@_i_test_case_name = 'Verifying fillup time in table[fl_production.dbo.pic_dwp_fillup_time_by_mid] by generating test table[test_cases.dbo.t_temp_pic_dwp_fillup_ByPatient_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_00_pic_dwp_fillup_ByPatient_test_table_gen/t_00_pic_dwp_fillup_ByPatient_validation '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';


		set @start  = getdate();
		EXECUTE [dbo].t_00_pic_dwp_multisite_test_table_gen
		   @out_success OUTPUT

		EXECUTE [dbo].t_00_pic_dwp_multisite_BYpatient_validation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXECUTE	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 00
						,@_i_test_case_name = 'Verifying multisite time in table[fl_production.dbo.pic_dwp_multisites_adjustments] by generating test table[test_cases.dbo.t_temp_multisite_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_00_pic_dwp_multisite_test_table_gen/t_00_pic_dwp_multisite_Bypatient_validation'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';



		------------------------------------------------------	ALOG NO. 1	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_01_pic_pldaily_test_table_gen
		   @out_success OUTPUT

		EXECUTE [dbo].t_01_pic_pldaily_columnValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 01
						,@_i_test_case_name ='Verifying table fl_production.dbo.[pic_doctor_stats_daily]  by using test table [dbo].[t_temp_01_pic_pldaily_test_table].'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_01_pic_pldaily_test_table_gen/t_01_pic_pldaily_columnValidation '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';



		------------------------------------------------------	ALOG NO. 2	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_02_dwp_pldaily_test_table_gen
		   @out_success OUTPUT

		EXECUTE [dbo].t_02_dwp_pldaily_columnValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 01
						,@_i_test_case_name ='Verifying table fl_production.dbo.[dwp_doctor_stats_daily] by using test table [dbo].[t_temp_02_dwp_pldaily_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_01_pic_pldaily_test_table_gen/t_01_pic_pldaily_columnValidation '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';



		------------------------------------------------------	ALOG NO. 7	-----------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_07_multidoctor_ts2_tc1A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_07_multidoctor_ts2_tc1B_reasons
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 07
						,@_i_test_case_name ='Verifying result table [fl_production.dbo.results_multi_doctor] by using test table [test_cases.dbo.t_temp_multidoctor_ts1_tc5].'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_07_multidoctor_ts2_tc1A_testTableGen/t_07_multidoctor_ts2_tc1B_resReasonsValidation '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';



		------------------------------------------------------	ALOG NO. 11	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_11_primToothExt_ts2_tc1A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_11_primToothExt_ts2_tc5B_resReasonsValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 11
						,@_i_test_case_name ='Verifying Columns for result table[emihealth.primtoothExt] by generating test table[test_cases.dbo.t_temp_11_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_11_primToothExt_ts2_tc5A_testTableGen/t_11_primToothExt_ts2_tc5B_resReasonsValidation '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';


		------------------------------------------------------	ALOG NO. 12	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_12_thirdmolar_ts2_tc3A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_12_thirdmolar_ts2_tc3B_resReasonsValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 12
						,@_i_test_case_name ='Verifying Columns for result table[fl_production.dbo.results_third_molar] by generating test table[test_cases.dbo.t_temp_thirdmolar_ts1_tc5]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_12_thirdmolar_ts2_tc3A_testTableGen/t_12_thirdmolar_ts2_tc3B_resReasonsValidation'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';


		------------------------------------------------------	ALOG NO. 13	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_13_simpleProphy4a_ts2_tc5A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_13_simpleProphy4a_ts2_tc5B_resReasonsValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 13
						,@_i_test_case_name ='Verifying Columns for result table[fl_production.dbo.results_perio_scaling_4a] by generating test table[test_cases.dbo.t_temp_13_simpleProphy4a_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_13_simpleProphy4a_ts2_tc5A_testTableGen/t_13_simpleProphy4a_ts2_tc5B_resReasonsValidation'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';


		------------------------------------------------------	ALOG NO. 14	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_14_simpleProphy4b_ts1_tc5A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_14_simpleProphy4b_ts1_tc5B_reasons
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 14
						,@_i_test_case_name ='Verifying Columns for result table[fl_production.dbo.results_simple_prophy_4b] by generating test table[test_cases.dbo.t_temp_4b_ts1_tc5]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_14_simpleProphy4b_ts1_tc5A_testTableGen/t_14_simpleProphy4b_ts1_tc5B_reasons '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';


		


		

		------------------------------------------------------	ALOG NO. 16	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_16_complexPerio_ts2_tc2A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_16_complexPerio_ts2_tc2B_resReasonsValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 16
						,@_i_test_case_name ='Verifying Columns for result table[fl_production.dbo.results_complex_perio] by generating test table[test_cases.dbo.t_temp_16_complex_perio_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_16_complexPerio_ts2_tc2A_testTableGen/t_16_complexPerio_ts2_tc2B_resReasonsValidation'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';



		------------------------------------------------------	ALOG NO. 17	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_17_simpCompExtCodeDist_step1_src_table_gen

		EXECUTE [dbo].t_17_simpCompExtCodeDist_step2A_test_table_gen
		   @out_success OUTPUT

		EXECUTE [dbo].t_17_simpCompExtCodeDist_step2B_validation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 17
						,@_i_test_case_name ='Verifying source table[fl_production.dbo.results_ext_code_distribution] using test table[test_cases.dbo.t_temp_17_simpCompCodeDist_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_17_simpCompExtCodeDist_step1_src_table_gen/ t_17_simpCompExtCodeDist_step2_test_table_gen/t_17_simpCompExtCodeDist_step2_validation'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';



		set @start  = getdate();
		EXECUTE [dbo].t_17_simpCompExtCodeDist_step3A_meansd_test_table_gen
		   @out_success OUTPUT

		EXECUTE [dbo].t_17_simpCompExtCodeDist_step3B_meansd_validation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXECUTE	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 17
						,@_i_test_case_name = 'Verifying all mean table[fl_production.dbo.results_ext_code_distribution_all_meansd] using test table[test_cases.dbo.t_temp_17_simpCompExtCodeDist_meansd_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_17_simpCompExtCodeDist_step3_meansd_test_table_gen/t_17_simpCompExtCodeDist_step3_meansd_validation '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';


		------------------------------------------------------	ALOG NO. 18	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_18_extUpcodeAxomatic_ts2_tc1B_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_18_extUpcodeAxomatic_ts2_tc1C_resReasonsValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 18
						,@_i_test_case_name ='Verifying result table[fl_production.dbo.surg_ext_final_results] using test table[test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_18_extUpcodeAxomatic_ts2_tc1A_srcTableGen/t_18_extUpcodeAxomatic_ts2_tc1B_testTableGen/t_18_extUpcodeAxomatic_ts2_tc1C_resReasonsValidation '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';



		------------------------------------------------------	ALOG NO. 19	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_19_overactInactCodeDist_ts2_tc5A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_19_overactInactCodeDist_ts2_tc5B_reasons
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 19
						,@_i_test_case_name ='Verifying result table[fl_production.dbo.overactive_code_distribution_yearly_by_attend] using test table[test_cases.dbo.t_temp_19_overactiveInactive_result_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_19_overactInactCodeDist_ts2_tc5A_testTableGen/ t_19_overactInactCodeDist_ts2_tc5B_reasons'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';



		------------------------------------------------------	ALOG NO. 20	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_20_adjFillingCodeDist_ts2_tc1A_resultWeekTestTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_20_adjFillingCodeDist_ts2_tc1B_resultWeekTableValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 20
						,@_i_test_case_name = 'Verifying weekly result table[fl_production.dbo.results_adjacent_filling_each_attend_weekly] using test table[test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_20_adjFillingCodeDist_ts2_tc1A_resultWeekTestTableGen/t_20_adjFillingCodeDist_ts2_tc1B_resultWeekTableValidation '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';


		
		------------------------------------------------------	ALOG NO. 21	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_21_overuseOfBorL_ts2_tc1A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_21_overuseOfBorL_ts2_tc1B_resReasonsValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 21
						,@_i_test_case_name = 'Verifying Columns for result table[fl_production.dbo.results_over_use_of_b_or_l_filling] by generating test table[test_cases.dbo.t_temp_21_overuseOfBorL_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_21_overuseOfBorL_ts2_tc1A_testTableGen/t_21_overuseOfBorL_ts2_tc1B_resReasonsValidation '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';


		
		------------------------------------------------------	ALOG NO. 22	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_22_sealantInsteadOfFill_ts2_tc2A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_22_sealantInsteadOfFill_ts2_tc2B_resReasonsValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 22
						,@_i_test_case_name = 'Verifying Columns for result table[fl_production.dbo.results_sealants_instead_of_filling] by generating test table[test_cases.dbo.t_temp_22_sealant_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_22_sealantInsteadOfFill_ts2_tc2A_testTableGen/t_22_sealantInsteadOfFill_ts2_tc2B_resReasonsValidation'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';



		------------------------------------------------------	ALOG NO. 23	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_23_cbu_ts2_tc1A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_23_cbu_ts2_tc1B_resReasonsValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 23
						,@_i_test_case_name = 'Verifying Columns for result table[fl_production.dbo.results_cbu] by generating test table[test_cases.dbo.t_temp_23_cbu_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_23_cbu_ts2_tc1A_testTableGen/t_23_cbu_ts2_tc1B_resReasonsValidation'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';

		

		------------------------------------------------------	ALOG NO. 24	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_24_denyPulpOnAdult_ts2_tc5A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_24_denyPulpOnAdult_ts2_tc5B_resReasonsValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 24
						,@_i_test_case_name = 'Verifying weekly result table[fl_production.dbo.results_deny_pulpotomy_on_adult] using test table[test_cases.dbo.t_temp_24_denyPulpOnAdult_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_24_denyPulpOnAdult_ts2_tc5A_testTableGen/t_24_denyPulpOnAdult_ts2_tc5B_resReasonsValidation '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';

	
		
		------------------------------------------------------	ALOG NO. 25	------------------------------------------------------

		set @start  = getdate();
		EXECUTE [dbo].[t_25_denyOtherXray_ts2_tc2A_testTableGen]
		   @out_success OUTPUT

		EXECUTE [dbo].[t_25_denyOtherXray_ts2_tc2B_resReasonsValidation]
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 25
						,@_i_test_case_name = 'Verifying result table[fl_production.dbo.results_deny_otherxrays_if_fmx_done] using test table[test_cases.dbo.t_temp_25_denyOtherXray_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_25_denyOtherXray_ts2_tc2A_testTableGen/t_25_denyOtherXray_ts2_tc2B_resReasonsValidation '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';

		
		------------------------------------------------------	ALOG NO. 26	------------------------------------------------------

		set @start  = getdate();
		EXECUTE [dbo].[t_26_denyPulpOnAdultEndo_ts2_tc5A_testTableGen] 
		   @out_success OUTPUT

		EXECUTE [dbo].[t_26_denyPulpOnAdultEndo_ts2_tc5B_resReasonsValidation] 
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 26 
						,@_i_test_case_name = 'Verifying result tablefl_production.dbo.results_deny_pulp_on_adult_full_endo] using test table[test_cases.dbo.t_temp_26_denyPulpOnAdultEndo_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_26_denyPulpOnAdultEndo_ts2_tc5A_testTableGen/t_26_denyPulpOnAdultEndo_ts2_tc5B_resReasonsValidation] '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';


		------------------------------------------------------	ALOG NO. 27	------------------------------------------------------

		set @start  = getdate();
		EXECUTE [dbo].[t_27_anesthesiaDangDose_ts2_tc1A_srcTableGen]
			@out_success OUTPUT

		EXECUTE [dbo].[t_27_anesthesiaDangDose_ts2_tc1B_testTableGen] 
		   @out_success OUTPUT

		EXECUTE [dbo].[t_27_anesthesiaDangDose_ts2_tc1C_resReasonsValidation] 
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 27 
						,@_i_test_case_name = 'Verifying result table[fl_production.dbo.results_anesthesia_dangerous_dose] using test table[test_cases.dbo.t_temp_27_anesthesiaDangDose_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_27_anesthesiaDangDose_ts2_tc1A_srcTableGen/t_27_anesthesiaDangDose_ts2_tc1B_testTableGen/t_27_anesthesiaDangDose_ts2_tc1C_resReasonsValidation ] '
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';



		------------------------------------------------------	ALOG NO. 4	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_04_impAge_ts2_tc1A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_04_impAge_ts2_tc1B_resReasonValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 04
						,@_i_test_case_name ='Verifying table[emihealth.procedure_performed] column[impossible_age_status] by generating test table[test_cases.dbo.t_temp_04_impAge_result_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 'Verifying table[fl_production.dbo.procedure_performed] column[impossible_age_status] by generating test table[test_cases.dbo.t_temp_04_impAge_result_test_table]'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';


		------------------------------------------------------	ALOG NO. 15	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_15_unJustFMX_ts2_tc1A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_15_unJustFMX_ts2_tc5B_resReasonsValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 15
						,@_i_test_case_name ='Verifying Columns for result table[emihealth.results_full_mouth_xrays] by generating test table[test_cases.dbo.t_temp_15_unJustFMX_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_15_unJustFMX_ts2_tc1A_testTableGen / t_15_unJustFMX_ts2_tc5B_resReasonsValidation'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';

		------------------------------------------------------	ALOG NO. 8	------------------------------------------------------
		set @start  = getdate();
		EXECUTE [dbo].t_08_overactiveInactiveAxio_ts2_tc5A_testTableGen
		   @out_success OUTPUT

		EXECUTE [dbo].t_08_overactiveInactiveAxio_ts2_tc5B_resReasonsValidation
		   @out_success OUTPUT
		  ,@out_test_status OUTPUT
		  ,@test_detail OUTPUT

		SET @executionTimeInMin = DATEDIFF(mi,@start,GETDATE());	
		EXEC	[dbo].t__fn_update_report_table 
						 @_i_algo_id = 08
						,@_i_test_case_name ='Verifying Columns for result table[fl_production.dbo.overactive_inactive] by generating test table[test_cases.dbo.t_temp_08_overactiveInactive_result_test_table]'
						,@_i_test_case_status = @out_test_status
						,@_i_test_case_detail = @test_detail
						,@_i_report_tab_name = '[dbo].[t_report]'
						,@_i_test_case_sp_name  = 't_08_overactiveInactiveAxio_ts2_tc5A_testTableGen/t_08_overactiveInactiveAxio_ts2_tc5B_reasons'
						,@_i_exe_time=@executionTimeInMin, @_i_type = 'res';



	-------------------------------------------------------------------------------------------------------------------------------------------------

	
	
		update	[dbo].t_report 
		set		tc_process_date = GETDATE();

		/*
		DECLARE @Column1Name VARCHAR(255)
		DECLARE @Query VARCHAR(2048)
		SET @Column1Name = '[sep=,' + CHAR(13) + CHAR(10) + 'Status]'
		Set @query = 'Set NOCOUNT ON; SELECT Case when test_case_status=1 Then ''Passed'' Else ''Failed'' END as ' + @Column1Name +' ,[test_case_name],exe_time_min,test_case_detail FROM t_report WITH (NOLOCK) where is_sent=0'
   

		EXEC msdb.dbo.sp_send_dbmail
			@profile_name = 'SMTPEmail',
			@recipients = 'sonia.sabeen@zigron.com;saba.riaz@zigron.com;imran.abbas@zigron.com;abdul.mateen@zigron.com',
		@execute_query_database = 'test_cases',
			@query = @Query,
			@subject = 'EmailNotification',
			@attach_query_result_as_file = 1,
			@body = 'Please find attached Automation Test Details : ',
		@body_format='HTML',
			@importance = 'HIGH',
			@query_result_separator = ',',
		@query_result_width = 32767,
		@query_result_header = 1,
		@query_result_no_padding=1,
		@query_attachment_filename='TestResults.xls',
			@file_attachments = '' -- nvarchar(max);

		update	[dbo].t_report 
		set		is_sent = 1 where is_sent=0;

	*/
END





GO
/****** Object:  StoredProcedure [dbo].[t__tc_check_table_data_status]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[t__tc_check_table_data_status]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUT
	,@out_test_status bit = 0 OUT
	,@out_test_detail varchar(255)= '' OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON
	 -- -----------------------------------------------------------------
	-- Variables Below Are Used For Holding Data From Test Table
	-- -----------------------------------------------------------------
	DECLARE @t_id INT = 0
			,@t_attend VARCHAR(50) = ''
			,@t_mid VARCHAR(50) =''
			,@t_dos DATETIME2(0)
			,@t_sum_of_all_proc_mins int =0
			,@t_patient_count int = 0
			,@t_working_hours int = 0
			,@t_num_of_operatories int = 0
	-- -----------------------------------------------------------------
	-- Variables Below Are Used With In Loop For Pocessing
	-- -----------------------------------------------------------------  
	DECLARE @temp_exp_anesthesia_time int =0
			,@temp_exp_multisite_time int = 0
			,@temp_exp_fill_time int = 0
			,@temp_exp_setup_plus_cleanup int = 0
			,@temp_exp_chair_time int = 0
			,@temp_exp_total_min_per_day int = 0
			,@temp_exp_maximum_time int = 0 

	DECLARE @temp_exp_setup_time int = 0
			,@temp_exp_cleanup_time int = 0
			,@temp_exp_chair_time_plus_20_percent int = 0
			,@temp_exp_excess_time int = 0
			,@temp_exp_final_time int = 0
			,@temp_exp_excess_time_ratio int = 0
  
   
	-- -----------------------------------------------------------------
	-- Variables Below Are Used In Marking Ambigous Results
	-- -----------------------------------------------------------------
	DECLARE @_test_detail VARCHAR(250) = 'OK'
	DECLARE @temp_count INT= 0
	DECLARE @count_total_records INT = 0
			,@count_defective_records INT = 0
  
  
	-- ------------------------------------------------------------------
  
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT id,attend,date_of_service,sum_of_all_proc_mins, patient_count, working_hours, num_of_operatories 
			FROM [dbo].[t_temp_01_pic_pldaily_test_table] 		    

	
	OPEN test_row_cursor
	FETCH test_row_cursor INTO  @t_id, @t_attend,@t_dos,@t_sum_of_all_proc_mins
								,@t_patient_count,@t_working_hours,@t_num_of_operatories
	-- ===>>ALGO CORE PROCESSING STARTS
	
	WHILE @@FETCH_STATUS = 0
		BEGIN -- [1]
			 -- anesthesia time 
             
		SELECT 	@temp_exp_anesthesia_time = SUM(total_adjustment_pic) 
		FROM 	fl_production.dbo.[pic_dwp_anesthesia_adjustments]
		WHERE 	attend = @t_attend AND date_of_service = @t_dos AND isactive = 1
				   	    
            -- multisite time 
             
		SELECT 	@temp_exp_multisite_time = SUM(min_to_subtract)
		FROM 	fl_production.dbo.[pic_dwp_multisites_adjustments] 
		WHERE 	attend = @t_attend AND date_of_service = @t_dos AND isactive = 1
				    
			  
	    -- fill_time
		
		SELECT @temp_exp_fill_time=SUM(minutes_subtract)
		FROM 	fl_production.dbo.[pic_dwp_fillup_time_by_mid] 
		WHERE 	attend = @t_attend AND date_of_service = @t_dos AND isactive = 1
		
	    -- setup and cleanup time
		SET @temp_exp_setup_time =  @t_patient_count * 2
		SET @temp_exp_cleanup_time = IIF(
											(@t_patient_count - @t_num_of_operatories)>-1
											,(@t_patient_count - @t_num_of_operatories)*16
											,0
										 )
	   
	    -- total min per day
		SET @temp_exp_total_min_per_day =IIF(
												 (@t_working_hours * @t_num_of_operatories*60)<0
												 ,0
												 ,@t_working_hours * @t_num_of_operatories*60
											)


	    -- maximum time
		SET @temp_exp_maximum_time = IIF(
											(@t_working_hours * 60)<0
											,0
											,(@t_working_hours * 60)
										)
	    -- chair time and exp_chair_time_plus_20_percent
		SET @temp_exp_chair_time = @temp_exp_total_min_per_day - @temp_exp_setup_time - @temp_exp_cleanup_time 
		SET @temp_exp_chair_time_plus_20_percent = @temp_exp_chair_time + (0.2 * @temp_exp_total_min_per_day)
		
	    -- final time
		SET @temp_exp_final_time = IIF(@t_sum_of_all_proc_mins IS NULL,0,@t_sum_of_all_proc_mins)
								   + IIF(@temp_exp_anesthesia_time IS null ,0,@temp_exp_anesthesia_time) 
								   - IIF(@temp_exp_multisite_time IS NULL,0,@temp_exp_multisite_time) 
								   - IIF(@temp_exp_fill_time IS NULL,0,@temp_exp_fill_time) 
	    -- excess time
		SET @temp_exp_excess_time = IIF(@temp_exp_final_time is NULL,0,@temp_exp_final_time) 
									- IIF(@temp_exp_chair_time_plus_20_percent IS NULL,0,@temp_exp_chair_time_plus_20_percent)
		
	    -- exp_excess_time_ratio
		SET @temp_exp_excess_time_ratio = IIF(@temp_exp_excess_time IS NULL,0,@temp_exp_excess_time)
															/
											(
												IIF(@temp_exp_excess_time IS NULL,0,@temp_exp_excess_time) 
														+ 
												(@temp_exp_total_min_per_day + @temp_exp_total_min_per_day*0.2)
											);
	    
		
		UPDATE 	[dbo].[t_temp_01_pic_pldaily_test_table]  
		SET 	exp_anesthesia_time = @temp_exp_anesthesia_time
				,exp_multisite_time = @temp_exp_multisite_time
				,exp_fill_time = @temp_exp_fill_time
			
				,exp_setup_time = @temp_exp_setup_time
				,exp_cleanup_time = @temp_exp_cleanup_time
				,exp_setup_plus_cleanup = @temp_exp_setup_time + @temp_exp_cleanup_time
				,exp_chair_time = @temp_exp_chair_time
				,exp_total_min_per_day = @temp_exp_total_min_per_day
				
				,exp_chair_time_plus_20_percent = @temp_exp_chair_time_plus_20_percent
				,exp_final_time = @temp_exp_final_time
				,exp_excess_time = @temp_exp_excess_time 
				,exp_excess_time_ratio = ROUND(@temp_exp_excess_time_ratio,2)	
		WHERE 	id = @t_id
			
		
		
		IF(@temp_exp_final_time > @temp_exp_total_min_per_day + 0.2*@temp_exp_total_min_per_day)
			BEGIN
				UPDATE 	[dbo].[t_temp_01_pic_pldaily_test_table]   
				SET 	exp_ryg_status = 'red' 
				WHERE 	id = @t_id 
			END
		ELSE IF(@temp_exp_final_time > @temp_exp_total_min_per_day AND @temp_exp_final_time <= @temp_exp_total_min_per_day + 0.2 * @temp_exp_total_min_per_day)
			BEGIN
			UPDATE 	[dbo].[t_temp_01_pic_pldaily_test_table]   
			SET 	exp_ryg_status = 'yellow' 
			WHERE 	id = @t_id 
			END
		ELSE
			BEGIN
			UPDATE 	[dbo].[t_temp_01_pic_pldaily_test_table]   
			SET 	exp_ryg_status = 'green' 
			WHERE 	id = @t_id 
			END
		
	FETCH test_row_cursor INTO  @t_id, @t_attend,@t_dos,@t_sum_of_all_proc_mins
								,@t_patient_count,@t_working_hours,@t_num_of_operatories
		
		END	-- [1]
	
	CLOSE test_row_cursor 
	DEALLOCATE test_row_cursor
	
  
	-- <<=== ALGO CORE PROCESSING ENDS
 
	-- MARKING AMBIGUOUS RECORDS(status column and test detail)
	-- Chunck A
	
	UPDATE	 [dbo].[t_temp_01_pic_pldaily_test_table]
	SET		test_status=1
			,test_detail='OK'
	WHERE	act_ryg_status != exp_ryg_status

	UPDATE	 [dbo].[t_temp_01_pic_pldaily_test_table]
	SET		test_status=0
			,test_detail='Not Ok'
	WHERE	act_ryg_status != exp_ryg_status

	-- ---------------------------------------------------------------------------------
	
	
	-- ------------------------------------------------------------------------------------------------------------------
	SELECT @count_total_records  = COUNT(*) 
	FROM [dbo].[t_temp_01_pic_pldaily_test_table]

	SELECT @count_defective_records = COUNT(*) 
	FROM [dbo].[t_temp_01_pic_pldaily_test_table] 
	WHERE test_status=0
	
	SET @temp_count=0
	SELECT @temp_count = COUNT(*) 
	FROM [dbo].[t_temp_01_pic_pldaily_test_table] 
	WHERE  test_status IS NULL

	IF(@temp_count != 0)
		BEGIN
			SET @out_success=0
			SELECT @out_success
		END
	ELSE
		BEGIN
			SET @out_success= 1
			IF(@count_defective_records=0)
				BEGIN
					SET @out_test_status= 1
					SET @out_test_detail=cast(@count_total_records as varchar) +' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status= 0
					SET @out_test_detail=CAST(@count_defective_records as VARCHAR) + ' ambiguous records found out of '
											+ CAST(@count_total_records as VARCHAR)
				END 
		END 
		
END







GO
/****** Object:  StoredProcedure [dbo].[t__temp_ProPerf_table_gen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Imran Abbas
-- Create date: 11 June 2018
-- Description:	Creating mini procedure_performed table with required columns
-- =============================================
CREATE PROCEDURE [dbo].[t__temp_ProPerf_table_gen]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	DECLARE @temp_count INT = 0

	-- t_temp_procedure_performed
    IF (OBJECT_ID('[dbo].[t_temp_procedure_performed]') IS NOT NULL)
		DROP TABLE [dbo].[t_temp_procedure_performed]

	CREATE TABLE [dbo].[t_temp_procedure_performed]
	(
		id INT DEFAULT NULL
		,MID VARCHAR(50) DEFAULT NULL
		,attend VARCHAR(50) DEFAULT NULL
		,specialty VARCHAR(50) DEFAULT NULL
		,payer_id VARCHAR(50) DEFAULT NULL

		,date_of_service DATETIME2(0)
		,year INT DEFAULT NULL
		,proc_code VARCHAR(10) DEFAULT NULL
		,tooth_no VARCHAR(10) DEFAULT NULL
		,remarks VARCHAR(1000) DEFAULT NULL
		,quadrant VARCHAR(10) DEFAULT NULL
		,arch VARCHAR(10) DEFAULT NULL
		,paid_money float DEFAULT NULL
	)

	CREATE NONCLUSTERED INDEX ix__c__tpp__date_of_service
	ON [dbo].[t_temp_procedure_performed] (date_of_service asc,arch asc) 

	
	CREATE NONCLUSTERED INDEX ix__nc__tpp___mid
	ON [dbo].[t_temp_procedure_performed] (mid asc)
	

	/*
	CREATE NONCLUSTERED INDEX ix__nc__tpp___year
	ON [dbo].[t_temp_procedure_performed] (year asc)
	*/

	CREATE NONCLUSTERED INDEX ix__nc__tpp_final
	ON [dbo].[t_temp_procedure_performed] (tooth_no asc,proc_code asc) 
	  
	 

	INSERT INTO [dbo].[t_temp_procedure_performed]
	(
		id
		,MID
		,attend
		,specialty
		,payer_id

		,date_of_service
		,year

		,proc_code
		,tooth_no
		,remarks
		,quadrant
		,arch 
		,paid_money

	)
	SELECT 
		id
		,MID
		,attend
		,specialty
		,payer_id

		,date_of_service
		,year

		,proc_code
		,tooth_no
		,remarks
		,quadrant
		,arch
		,paid_money

	FROM fl_production.dbo.[procedure_performed]
	where is_invalid = 0

	SELECT @temp_count = COUNT(*) FROM  [dbo].[t_temp_procedure_performed]
	IF(@temp_count > 0 ) 
		SET @out_success=1
	ELSE 
		SET @out_success=0

END




GO
/****** Object:  StoredProcedure [dbo].[t_00____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

Create PROCEDURE [dbo].[t_00____________________]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

   END



GO
/****** Object:  StoredProcedure [dbo].[t_00_pic_dwp_anesthesia_ByPatient_test_table_gen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Imran Abbas 
-- Create date: 11 June 2018
-- Description:	Generating Test Table For Testing Anesthesia Time
-- =============================================
CREATE PROCEDURE [dbo].[t_00_pic_dwp_anesthesia_ByPatient_test_table_gen]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON

	DECLARE
		@reason_percent decimal(5, 2) 
		,@reason_total_count int = 0
		,@reason_sample_count int = 0
		,@selected_reason int = 0
		,@iterator int = 0
		,@temp_count int =0

	-- t_temp_pic_dwp_anesthesiaByPatient_test_table
	if(object_id(N'[dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]', 'U') is not null)
		DROP TABLE dbo.t_temp_pic_dwp_anesthesiaByPatient_test_table 
	  
	CREATE TABLE [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
	(
		id bigint IDENTITY(1,1), 
		res_id bigint DEFAULT NULL, 
		attend varchar(40)  DEFAULT NULL, 
		mid varchar(99) DEFAULT NULL, 
		proc_code varchar(99)  DEFAULT NULL, 
		date_of_service datetime2(0) DEFAULT NULL,

		act_per_tooth_service_adj int DEFAULT NULL,
		exp_per_tooth_service_adj int DEFAULT NULL,  
		

		act_per_area_service_adj int DEFAULT NULL, 
		exp_per_area_service_adj int DEFAULT NULL,
		
		act_other_service_adj int DEFAULT NULL, 
		exp_other_service_adj int DEFAULT NULL,
		
		act_total_adj int DEFAULT NULL, 
		exp_total_adj int DEFAULT NULL,

		test_status bit DEFAULT NULL, 
		test_detail varchar(255) DEFAULT NULL, 
		PRIMARY KEY (id)
	)    
	

	SELECT	 @reason_percent = var_value
	FROM	[dbo].[t_global_variables]
	WHERE	var_key = 'anesthesia_by_patient_weightage'

	SELECT	@reason_total_count = count(*)
	FROM	fl_production.dbo.results_simple_prophy_4b
	WHERE	reason_level = @selected_reason

			
	SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

	IF (@reason_sample_count <= 0)
        SET @reason_sample_count = 50
            
		
	INSERT  INTO [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
	(
		res_id 
		,attend 
		,MID
		,date_of_service

		,act_per_tooth_service_adj
		,act_per_area_service_adj
		,act_other_service_adj
		,act_total_adj		
	)	
	SELECT top (@reason_sample_count)
		id 
		,attend 
		,MID 
		,date_of_service

		,final_arch_u_adjustment+final_arch_l_adjustment
		,per_area_services_adjustment
		,other_services_adjustment
		,total_adjustment

    FROM fl_production.dbo.pic_dwp_anesthesia_adjustments
    WHERE isactive= 1 
    ORDER BY RAND()
                     
        	
      SELECT	@temp_count = count(*)
      FROM		[dbo].t_temp_pic_dwp_anesthesiaByPatient_test_table     


      IF (@temp_count > 0)
         SET @out_success = 1
      ELSE 
         SET @out_success = 0

	
END


GO
/****** Object:  StoredProcedure [dbo].[t_00_pic_dwp_anesthesia_ByPatient_validation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Imran Abbas
-- Create date: 11 May 2018
-- Description:	Anesthesia Time Verification
-- =============================================
CREATE PROCEDURE [dbo].[t_00_pic_dwp_anesthesia_ByPatient_validation]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUT
	,@out_test_status bit = 0 OUT
	,@out_test_detail varchar(255)= '' OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	 -- -----------------------------------------------------------------
	-- Variables Below Are Used For Holding Data From Test Table
	-- -----------------------------------------------------------------
	DECLARE @t_id INT = 0
	DECLARE @t_attend VARCHAR(50) = ''
	DECLARE @t_mid VARCHAR(50) =''
	DECLARE @t_dos DATETIME2(0)
  
	-- -----------------------------------------------------------------
	-- Variables Below Are Used With In Loop For Pocessing
	-- -----------------------------------------------------------------  
			-- Variables For Per Tooth Service --
	DECLARE @perTooth_count_distQuad_LA INT = 0
			,@perTooth_count_distTeeth_UL_Quad INT = 0
			,@perTooth_count_distTeeth_UR_Quad INT = 0
			,@perTooth_total_min INT = 0
			-- Variables For Per Area Service -- 
	DECLARE @perArea_count_distQuad INT = 0
			,@perArea_total_min INT = 0 
			--  Variables fro All Other  Services -- 
	DECLARE @allOtherService_count INT = 0
			,@allOtherService_total_min INT = 0
	DECLARE @minTable_count INT = 0
  
   
	-- -----------------------------------------------------------------
	-- Variables Below Are Used In Marking Ambigous Results
	-- -----------------------------------------------------------------
	DECLARE @_test_detail VARCHAR(250) = 'OK'
	DECLARE @temp_count INT= 0
	DECLARE @count_total_records INT = 0
			,@count_defective_records INT = 0
  
  
	-- ------------------------------------------------------------------
  
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT id,attend,MID,date_of_service 
			FROM [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table] 		    

  
	-- creating Mini table
	 
	IF(object_id(N'[dbo].[t_temp_pic_dwp_anesthesia_mini_table]', 'U') is not null)
		DROP TABLE [dbo].t_temp_pic_dwp_anesthesia_mini_table 

	CREATE TABLE [dbo].[t_temp_pic_dwp_anesthesia_mini_table]
	(
		MID  VARCHAR(50) DEFAULT NULL,
		proc_code VARCHAR(50) DEFAULT NULL,
		tooth_no VARCHAR(5) DEFAULT NULL,
		quadrent VARCHAR(5) DEFAULT NULL,
		arch VARCHAR(5) DEFAULT NULL,
		U VARCHAR(1) DEFAULT NULL,
		V VARCHAR(1) DEFAULT NULL,
		INDEX UV (U,V,tooth_no)
	)

	OPEN test_row_cursor
	FETCH test_row_cursor INTO  @t_id, @t_attend, @t_mid,@t_dos;
	-- ===>>ALGO CORE PROCESSING STARTS
	
	WHILE @@FETCH_STATUS = 0
		BEGIN			
			-- Checking Data From Test Table Is Valid Or Not		    
			IF(@t_attend='' OR @t_dos='' OR @t_mid='' OR @t_attend IS NULL OR @t_dos IS NULL OR @t_mid IS NULL )
				BEGIN -- [1]
					select 	@t_attend,@t_dos,@t_mid 
					UPDATE [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
					SET	exp_per_tooth_service_adj  = -1,
						exp_per_area_service_adj = -1,
						exp_other_service_adj = -1,
						exp_total_adj = -1,
						test_detail = 'Invalid Data'
					WHERE	id=@t_id
				END   -- [1] 
			ELSE
				BEGIN -- [1]
					TRUNCATE TABLE t_temp_pic_dwp_anesthesia_mini_table
					INSERT INTO [dbo].[t_temp_pic_dwp_anesthesia_mini_table](MID,proc_code,tooth_no,quadrent,arch,U,V)
					SELECT 
					a.mid,
					a.proc_code, 
					a.tooth_no,
					a.quadrant,
					a.arch,
					b.per_tooth_anesthesia_adjustment AS U, 
					b.per_area_anesthesia_adjustment AS V
					FROM [dbo].[t_temp_procedure_performed] AS a 
						INNER JOIN fl_production.dbo.[ref_standard_procedures] AS b 
						ON a.proc_code=b.proc_code  
					WHERE 
						a.attend=@t_attend AND 
						a.date_of_service=@t_dos AND 
						a.mid=@t_mid 		
					
					
					-- Checking Min Table IS Empty O Not.
					SET @minTable_count=0;
					SELECT	@minTable_count = count(*)
					FROM 	[dbo].[t_temp_pic_dwp_anesthesia_mini_table]

					IF(@minTable_count=0)
						BEGIN -- [2]
							UPDATE [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
							SET	exp_per_tooth_service_adj  = -2,
								exp_per_area_service_adj = -2,
								exp_other_service_adj = -2,
								exp_total_adj = -2,
								test_detail = 'Mini TABLE IS Empty.'
							WHERE	id=@t_id
						END  -- [2]
					ELSE
						BEGIN -- [2]
							-- =================================================
							-- 	PER TOOTH CALCULATION WHERE U=Y and V=Y
							-- =================================================
							SET @perTooth_count_distQuad_LA = 0
							SET @perTooth_count_distTeeth_UL_Quad = 0
							SET @perTooth_count_distTeeth_UR_Quad =0
							SET @perTooth_total_min =0
				
							-- Chunck A
							SELECT	@perTooth_count_distQuad_LA = COUNT(DISTINCT(quadrent))
							FROM 	t_temp_pic_dwp_anesthesia_mini_table
							WHERE 	U='Y'  AND V='Y' AND
									arch='L' AND
									(tooth_no != '' AND quadrent !='' AND arch !='')
					
							SET @perTooth_total_min = @perTooth_total_min + @perTooth_count_distQuad_LA
				
							-- Chunck B
							SELECT	@perTooth_count_distTeeth_UL_Quad = COUNT(DISTINCT(tooth_no))
							FROM 	t_temp_pic_dwp_anesthesia_mini_table
							WHERE 	U='Y' AND V='Y' AND
									arch='U' AND quadrent='UL' AND
									(tooth_no != '' AND quadrent !='' AND arch !='');
					
							IF(@perTooth_count_distTeeth_UL_Quad BETWEEN 1 AND 3)
								BEGIN
									SET @perTooth_total_min = @perTooth_total_min +1
								END
							IF(@perTooth_count_distTeeth_UL_Quad BETWEEN 4 AND 6)
								BEGIN
									SET @perTooth_total_min = @perTooth_total_min +2
								END
							IF(@perTooth_count_distTeeth_UL_Quad BETWEEN 7 AND 8)
								BEGIN
									SET @perTooth_total_min = @perTooth_total_min +3
								END
				
							-- Chunck C
							SELECT	@perTooth_count_distTeeth_UR_Quad = COUNT(DISTINCT(tooth_no))
							FROM 	t_temp_pic_dwp_anesthesia_mini_table
							WHERE 	U='Y'  AND V='Y' AND
									arch='U' AND quadrent='UR' AND
									(tooth_no != '' AND quadrent !='' AND arch !='')

							IF(@perTooth_count_distTeeth_UR_Quad BETWEEN 1 AND 3)
								BEGIN
									SET @perTooth_total_min = @perTooth_total_min +1
								END
							IF(@perTooth_count_distTeeth_UR_Quad BETWEEN 4 AND 6)
								BEGIN
									SET @perTooth_total_min = @perTooth_total_min +2
								END
							IF(@perTooth_count_distTeeth_UR_Quad BETWEEN 7 AND 8)
								BEGIN
									SET @perTooth_total_min = @perTooth_total_min +3
								END
							
							-- =================================================
							-- 	PER TOOTH CALCULATION WHERE U=Y and V=N
							-- =================================================
							SET @perTooth_count_distQuad_LA = 0;
							SET @perTooth_count_distTeeth_UL_Quad = 0;
							SET @perTooth_count_distTeeth_UR_Quad =0;
				
							-- Chunck A
							SELECT	@perTooth_count_distQuad_LA=COUNT(DISTINCT(quadrent))
							FROM 	t_temp_pic_dwp_anesthesia_mini_table
							WHERE 	U='Y' AND V='N' AND
									arch='L' and
									(tooth_no != '' AND quadrent !='' AND arch !='')
							SET @perTooth_total_min = @perTooth_total_min + @perTooth_count_distQuad_LA
				
							-- Chunck B
							SELECT	@perTooth_count_distTeeth_UL_Quad=COUNT(DISTINCT(tooth_no))
							FROM 	t_temp_pic_dwp_anesthesia_mini_table
							WHERE 	U='Y' AND V='N' AND
									arch='U' AND quadrent='UL' and
									(tooth_no != '' AND quadrent !='' AND arch !='')
					
							IF(@perTooth_count_distTeeth_UL_Quad BETWEEN 1 AND 3)
								BEGIN
									SET @perTooth_total_min = @perTooth_total_min +1
								END
							IF(@perTooth_count_distTeeth_UL_Quad BETWEEN 4 AND 6)
								BEGIN
									SET @perTooth_total_min = @perTooth_total_min +2
								END
							IF(@perTooth_count_distTeeth_UL_Quad BETWEEN 7 AND 8)
								BEGIN
									SET @perTooth_total_min = @perTooth_total_min +3;
								END
				
							-- Chunck C
							SELECT	@perTooth_count_distTeeth_UR_Quad = COUNT(DISTINCT(tooth_no))
							FROM 	t_temp_pic_dwp_anesthesia_mini_table
							WHERE 	U='Y' AND V='N' AND
									arch='U' AND quadrent='UR' and
									(tooth_no != '' AND quadrent !='' AND arch !='')
					
							IF(@perTooth_count_distTeeth_UR_Quad BETWEEN 1 AND 3)
								BEGIN
									SET @perTooth_total_min = @perTooth_total_min +1
								END
							IF(@perTooth_count_distTeeth_UR_Quad BETWEEN 4 AND 6)
								BEGIN
									SET @perTooth_total_min = @perTooth_total_min +2
								END
							IF(@perTooth_count_distTeeth_UR_Quad BETWEEN 7 AND 8)
								BEGIN
									SET @perTooth_total_min = @perTooth_total_min +3;
								END 
							
							



							-- =================================================
							-- 	PER AREA CALCULATION WHERE U=N and V=Y
							-- =================================================
							SET @perArea_count_distQuad=0;
							SET @perArea_total_min = 0;
				
							SELECT	@perArea_count_distQuad = COUNT(DISTINCT(quadrent))
							FROM 	t_temp_pic_dwp_anesthesia_mini_table
							WHERE 	U='N' AND V='Y' AND
									(tooth_no != '' AND quadrent !='' AND arch !='')
							SET @perArea_total_min = @perArea_count_distQuad
				
				
							-- =================================================
							-- 	All OTHER SERVICERS CALCULATION 
							-- =================================================
							SET @allOtherService_count = 0
							SET @allOtherService_total_min=0
				
							SELECT	@allOtherService_count = COUNT(DISTINCT(proc_code))
							FROM 	t_temp_pic_dwp_anesthesia_mini_table
							WHERE 	((U='N' AND V='Y') OR (U='Y' AND V='N')) AND
								tooth_no != '' AND quadrent !='' AND arch !=''
				
							SET @allOtherService_total_min = @allOtherService_count
				
							-- Updating Test Table
							UPDATE [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
							SET	exp_per_tooth_service_adj  = @perTooth_total_min,
								exp_per_area_service_adj = @perArea_total_min,
								exp_other_service_adj = @allOtherService_total_min
								-- ,exp_total_adj = @perTooth_total_min+@perArea_total_min+@allOtherService_total_min
								,test_detail = '--'
							WHERE	id=@t_id;
							
					END -- [2]
				
				END	 -- [1] 
				
			
		FETCH NEXT FROM test_row_cursor INTO  @t_id, @t_attend, @t_mid,@t_dos
		END	
	
	CLOSE test_row_cursor 
	DEALLOCATE test_row_cursor
	
  
	-- <<=== ALGO CORE PROCESSING ENDS
 
	-- MARKING AMBIGUOUS RECORDS(status column and test detail)
	-- Chunck A
	
	UPDATE	 [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
	SET		test_status=1
			-- ,test_detail='OK.'
	WHERE	act_per_tooth_service_adj = exp_per_tooth_service_adj  AND
	act_per_area_service_adj = exp_per_area_service_adj AND
	act_other_service_adj = exp_other_service_adj;
	
	UPDATE [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
	SET	test_status=0,
	test_detail='Actual(perTooth,perArea,allOther) and Expected(perTooth,perArea,allOther) columns values are Not equal.'
	WHERE act_per_tooth_service_adj != exp_per_tooth_service_adj  AND
	act_per_area_service_adj != exp_per_area_service_adj AND
	act_other_service_adj != exp_other_service_adj;
	-- ---------------------------------------------------------------------------------
	UPDATE [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
	SET	test_status=0,
	test_detail='Actual(perTooth,perArea) and Expected(perTooth,perArea) columns values are Not equal.'
	WHERE act_per_tooth_service_adj != exp_per_tooth_service_adj  AND
	act_per_area_service_adj != exp_per_area_service_adj AND
	act_other_service_adj = exp_other_service_adj;
	
	UPDATE [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
	SET	test_status=0,
	test_detail='Actual(perArea,allOther) and Expected(perArea,allOther) columns values are Not equal.'
	WHERE act_per_tooth_service_adj = exp_per_tooth_service_adj  AND
	act_per_area_service_adj != exp_per_area_service_adj AND
	act_other_service_adj != exp_other_service_adj;
	
	UPDATE [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
	SET	test_status=0,
	test_detail='Actual(perTooth,allOther) and Expected(perTooth,allOther) columns values are Not equal.'
	WHERE act_per_tooth_service_adj != exp_per_tooth_service_adj  AND
	act_per_area_service_adj = exp_per_area_service_adj AND
	act_other_service_adj != exp_other_service_adj;
	-- -------------------------------------------------------------------------------------------------------------------
	UPDATE [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
	SET	test_status=0,
	test_detail='Actual(perTooth) and Expected(perTooth) columns values are Not equal.'
	WHERE act_per_tooth_service_adj != exp_per_tooth_service_adj  AND
	act_per_area_service_adj = exp_per_area_service_adj AND
	act_other_service_adj = exp_other_service_adj;
	
	UPDATE [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
	SET	test_status=0,
	test_detail='Actual(perArea) and Expected(perArea) columns values are Not equal.'
	WHERE act_per_tooth_service_adj = exp_per_tooth_service_adj  AND
	act_per_area_service_adj != exp_per_area_service_adj AND
	act_other_service_adj = exp_other_service_adj;
	
	UPDATE [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]
	SET	test_status=0,
	test_detail='Actual(allOther) and Expected(perTooth,allOther) columns values are Not equal.'
	WHERE act_per_tooth_service_adj = exp_per_tooth_service_adj  AND
	act_per_area_service_adj = exp_per_area_service_adj AND
	act_other_service_adj != exp_other_service_adj;
	
	-- ------------------------------------------------------------------------------------------------------------------
	SELECT @count_total_records  = COUNT(*) 
	FROM [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table]

	SELECT @count_defective_records = COUNT(*) 
	FROM [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table] 
	WHERE test_status=0
	
	SET @temp_count=0
	SELECT @temp_count = COUNT(*) 
	FROM [dbo].[t_temp_pic_dwp_anesthesiaByPatient_test_table] 
	WHERE  test_status IS NULL

	IF(@temp_count != 0)
		BEGIN
			SET @out_success=0
			-- SELECT @out_success
		END
	ELSE
		BEGIN
			SET @out_success= 1
			IF(@count_defective_records=0)
				BEGIN
					SET @out_test_status= 1
					SET @out_test_detail=cast(@count_total_records as varchar) +' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status= 0
					SET @out_test_detail=CAST(@count_defective_records as VARCHAR) + ' ambiguous records found out of '
											+ CAST(@count_total_records as VARCHAR)
				END 
		END 
END


GO
/****** Object:  StoredProcedure [dbo].[t_00_pic_dwp_fillup_ByPatient_test_table_gen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Imran Abbas Satti
-- Create date: 14-06-2018 
-- Description:	Test Table Generation for Fill Up Time
-- =============================================
CREATE PROCEDURE [dbo].[t_00_pic_dwp_fillup_ByPatient_test_table_gen]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON

	DECLARE
		@reason_percent decimal(5, 2) 
		,@reason_total_count int = 0
		,@reason_sample_count int = 0
		,@selected_reason int = 0
		,@iterator int = 0
		,@temp_count int =0

	-- t_temp_pic_dwp_fillup_ByPatient_test_table
	if(object_id(N'[dbo].[t_temp_pic_dwp_fillup_ByPatient_test_table]', 'U') is not null)
		DROP TABLE dbo.t_temp_pic_dwp_fillup_ByPatient_test_table 
	  
	CREATE TABLE [dbo].[t_temp_pic_dwp_fillup_ByPatient_test_table]
	(
		id bigint IDENTITY(1,1), 
		res_id bigint DEFAULT NULL, 
		attend varchar(40)  DEFAULT NULL, 
		mid varchar(99) DEFAULT NULL, 
		date_of_service datetime2(0) DEFAULT NULL,

		act_min_sub int DEFAULT NULL,
		exp_min_sub int DEFAULT NULL,  
		
		test_status bit DEFAULT NULL, 
		test_detail varchar(255) DEFAULT NULL, 
		PRIMARY KEY (id)
	)    
	

	SELECT	 @reason_percent = var_value
	FROM	[dbo].[t_global_variables]
	WHERE	var_key = 'fillup_by_patient_weightage'

	SELECT	@reason_total_count = count(*)
	FROM	fl_production.dbo.results_simple_prophy_4b
	WHERE	reason_level = @selected_reason

			
	SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

	IF (@reason_sample_count <= 0)
        SET @reason_sample_count = 50
            
		
	INSERT  INTO [dbo].[t_temp_pic_dwp_fillup_ByPatient_test_table]
	(
		res_id 
		,attend 
		,MID
		,date_of_service
		,act_min_sub
			
	)	
	SELECT top (@reason_sample_count)
		id 
		,attend 
		,MID 
		,date_of_service
		,minutes_subtract

    FROM fl_production.dbo.[pic_dwp_fillup_time_by_mid]
    WHERE isactive= 1 
    ORDER BY RAND()
                     
        	
    SELECT	@temp_count = count(*)
    FROM		[dbo].t_temp_pic_dwp_fillup_ByPatient_test_table     


    IF (@temp_count > 0)
        SET @out_success = 1
    ELSE 
        SET @out_success = 0

	
END


GO
/****** Object:  StoredProcedure [dbo].[t_00_pic_dwp_fillup_ByPatient_validation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Imran Abbas
-- Create date: 19 June 2018
-- Description:	FILL UP  Time Verification
-- =============================================
CREATE PROCEDURE [dbo].[t_00_pic_dwp_fillup_ByPatient_validation]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUT
	,@out_test_status bit = 0 OUT
	,@out_test_detail varchar(255)= '' OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	 -- -----------------------------------------------------------------
	-- Variables Below Are Used For Holding Data From Test Table
	-- -----------------------------------------------------------------
	DECLARE @t_id INT = 0
	DECLARE @t_attend VARCHAR(50) = ''
	DECLARE @t_mid VARCHAR(50) =''
	DECLARE @t_dos DATETIME2(0)
  
	-- -----------------------------------------------------------------
	-- Variables Below Are Used With In Loop For Pocessing
	-- -----------------------------------------------------------------  
			
	DECLARE @count_tooth_with_surface_MorD INT = 0
			,@time_to_subtract INT = 0
	
	
  
   
	-- -----------------------------------------------------------------
	-- Variables Below Are Used In Marking Ambigous Results
	-- -----------------------------------------------------------------
	DECLARE @_test_detail VARCHAR(250) = 'OK'
	DECLARE @temp_count INT= 0
	DECLARE @count_total_records INT = 0
			,@count_defective_records INT = 0
  
  
	-- ------------------------------------------------------------------
  
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT id,attend,MID,date_of_service FROM [dbo].[t_temp_pic_dwp_fillup_ByPatient_test_table] 		    

  

	OPEN test_row_cursor
	FETCH test_row_cursor INTO  @t_id, @t_attend, @t_mid,@t_dos;
	
	WHILE @@FETCH_STATUS = 0
		BEGIN -- <<-- ALGO CORE PROCESSING STARTS	
			IF(@t_attend='' OR @t_dos='' OR @t_mid='' OR @t_attend IS NULL OR @t_dos IS NULL OR @t_mid IS NULL )
				BEGIN
					UPDATE test_cases.dbo.t_temp_pic_dwp_fillup_ByPatient_test_table
					SET	exp_min_sub = -1,
						test_detail = 'Invalid Data.'
					WHERE	id=@t_id
				END
		    ELSE
				BEGIN
					SELECT @count_tooth_with_surface_MorD = COUNT(DISTINCT(tooth_no))
					FROM 	fl_production.dbo.[procedure_performed]
					WHERE 	attend = @t_attend 
							AND MID = @t_mid 
							AND date_of_service = @t_dos 
							AND proc_code IN ('D2150', 'D2331', 'D2392') 
							AND (surface NOT LIKE '%M%' AND surface NOT LIKE '%D%') 
							AND surface !='' 
							AND (surface IS NOT NULL) 
							AND tooth_no != ''
							AND is_invalid=0

					SET @time_to_subtract = @count_tooth_with_surface_MorD * 2;
			
					UPDATE	test_cases.dbo.[t_temp_pic_dwp_fillup_ByPatient_test_table]
					SET		exp_min_sub = @time_to_subtract
					WHERE	id=@t_id  
				END 
						
			
			FETCH NEXT FROM test_row_cursor INTO  @t_id, @t_attend, @t_mid,@t_dos
		END	-- <<--  ALGO CORE PROCESSING ENDS
	
	CLOSE test_row_cursor 
	DEALLOCATE test_row_cursor
	
	-- <<=== ALGO CORE PROCESSING ENDS
 
	-- MARKING AMBIGUOUS RECORDS(status column and test detail)
	-- Chunck A
	
	
	UPDATE	 [dbo].[t_temp_pic_dwp_fillup_ByPatient_test_table]
	SET		test_status=1,
			test_detail='OK'
	WHERE	act_min_sub = act_min_sub

	UPDATE	 [dbo].[t_temp_pic_dwp_fillup_ByPatient_test_table]
	SET		test_status=0,
			test_detail='Diffrence b/w minutes to subtract'
	WHERE	act_min_sub != act_min_sub

	
	
	-- ------------------------------------------------------------------------------------------------------------------
	SELECT @count_total_records  = COUNT(*) 
	FROM [dbo].[t_temp_pic_dwp_fillup_ByPatient_test_table]

	SELECT @count_defective_records = COUNT(*) 
	FROM [dbo].[t_temp_pic_dwp_fillup_ByPatient_test_table] 
	WHERE test_status=0
	
	SET @temp_count=0
	SELECT @temp_count = COUNT(*) 
	FROM [dbo].[t_temp_pic_dwp_fillup_ByPatient_test_table] 
	WHERE  test_status IS NULL

	IF(@temp_count != 0)
		BEGIN
			SET @out_success=0
			SELECT @out_success
		END
	ELSE
		BEGIN
			SET @out_success= 1
			IF(@count_defective_records=0)
				BEGIN
					SET @out_test_status= 1
					SET @out_test_detail=cast(@count_total_records as varchar) +' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status= 0
					SET @out_test_detail=CAST(@count_defective_records as VARCHAR) + ' ambiguous records found out of '
											+ CAST(@count_total_records as VARCHAR)
				END 
		END 

END



GO
/****** Object:  StoredProcedure [dbo].[t_00_pic_dwp_multisite_ByPatient_validation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Imran Abbas
-- Create date: 19 June 2018
-- Description:	FILL UP  Time Verification
-- =============================================
CREATE PROCEDURE [dbo].[t_00_pic_dwp_multisite_ByPatient_validation]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUT
	,@out_test_status bit = 0 OUT
	,@out_test_detail varchar(255)= '' OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	 -- -----------------------------------------------------------------
	-- Variables Below Are Used For Holding Data From Test Table
	-- -----------------------------------------------------------------
	DECLARE @t_id INT = 0
	DECLARE @t_attend VARCHAR(50) = ''
	DECLARE @t_mid VARCHAR(50) =''
	DECLARE @t_dos DATETIME2(0)
  
	-- -----------------------------------------------------------------
	-- Variables Below Are Used With In Loop For Pocessing
	-- -----------------------------------------------------------------  
	declare @d1 int= 0, @d2 int= 0, @d3 int = 0 ,@d4 int= 0
		,@d5 int = 0, @d6 int= 0, @d7 int = 0, @d9 int= 0, @d10 int = 0
	
	
	-- -----------------------------------------------------------------
	-- Variables Below Are Used In Marking Ambigous Results
	-- -----------------------------------------------------------------
	DECLARE @_test_detail VARCHAR(250) = 'OK'
	DECLARE @temp_count INT= 0
	DECLARE @count_total_records INT = 0
			,@count_defective_records INT = 0
  
  
	-- ------------------------------------------------------------------
  
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT id,attend,MID,date_of_service FROM [dbo].[t_temp_pic_dwp_multisite_ByPatient_test_table] 		    

  

	OPEN test_row_cursor
	FETCH test_row_cursor INTO  @t_id, @t_attend, @t_mid,@t_dos
	
	WHILE @@FETCH_STATUS = 0
		BEGIN -- <<-- ALGO CORE PROCESSING STARTS	
			IF(@t_attend='' OR @t_dos='' OR @t_mid='' OR @t_attend IS NULL OR @t_dos IS NULL OR @t_mid IS NULL )
				BEGIN
					UPDATE test_cases.dbo.t_temp_pic_dwp_multisite_ByPatient_test_table
					SET	test_status = 0,
						test_detail = 'Invalid Data'
					WHERE	id=@t_id
				END
		    ELSE
				BEGIN
					select  @d1=sum(iif(proc_code= 'D1351' or proc_code = 'D1352',1,0))
							,@d2=sum(iif(proc_code BETWEEN 'D2140' AND 'D2999',1,0)) 
							,@d3=sum(iif(proc_code BETWEEN 'D3110' AND 'D3999',1,0))
							,@d4=sum(iif(proc_code BETWEEN 'D4210' AND 'D4999',1,0))
							,@d5=sum(iif(proc_code BETWEEN 'D5110' AND 'D5999',1,0)) 
							,@d6=sum(iif(proc_code BETWEEN 'D6010' AND 'D6999',1,0)) 
							,@d7=sum(iif(proc_code BETWEEN 'D7111' AND 'D7999',1,0)) 
							,@d9=sum(iif(proc_code BETWEEN 'D9110' AND 'D9999',1,0)) 
					from fl_production.dbo.procedure_performed
					where is_invalid = 0
							AND attend = @t_attend
							AND	mid = @t_mid
							ANd date_of_service = @t_dos

					UPDATE	test_cases.dbo.t_temp_pic_dwp_multisite_ByPatient_test_table
					SET		exp_d1 = iif( @d1 = 0, 0, @d1-1 )
							,exp_d2 = iif( @d2 = 0, 0, (@d2-1)*2 )
							,exp_d3 = iif( @d3 = 0, 0, (@d3-1)*2 )
							,exp_d4 = iif( @d4 = 0, 0, (@d4-1)*2 )
							,exp_d5 = iif( @d5 = 0, 0, (@d5-1)*2 )
							,exp_d6 = iif( @d6 = 0, 0, (@d6-1)*2 )
							,exp_d7 = iif( @d7 = 0, 0, (@d7-1)*2 )
							,exp_d9 = iif( @d9 = 0, 0, @d9-1) 
					WHERE	id=@t_id
				END 
				FETCH NEXT FROM test_row_cursor INTO  @t_id, @t_attend, @t_mid,@t_dos
		END	-- <<--  ALGO CORE PROCESSING ENDS
	
	CLOSE test_row_cursor 
	DEALLOCATE test_row_cursor


	-- <<=== ALGO CORE PROCESSING ENDS
 
	-- MARKING AMBIGUOUS RECORDS(status column and test detail)
	-- Chunck A
	
	
	UPDATE	 [dbo].[t_temp_pic_dwp_multisite_ByPatient_test_table]
	SET		test_status=1,
			test_detail='OK'
	WHERE	act_d1 = exp_d1
			AND act_d2 = exp_d2
			ANd act_d3 = exp_d3
			AND act_d4 = exp_d4
			AND act_d5 = exp_d5
			AND act_d6 = exp_d6
			AND act_d7 = exp_d7
			AND act_d9 = exp_d9

	UPDATE	 [dbo].[t_temp_pic_dwp_multisite_ByPatient_test_table]
	SET		test_status=0,
			test_detail='Issue'
	WHERE	test_status IS NULL

	-- Setting up out parameters
	-- ------------------------------------------------------------------------------------------------------------------
	SELECT @count_total_records  = COUNT(*) 
	FROM [dbo].[t_temp_pic_dwp_multisite_ByPatient_test_table]

	SELECT @count_defective_records = COUNT(*) 
	FROM [dbo].[t_temp_pic_dwp_multisite_ByPatient_test_table] 
	WHERE test_status = 0
	
	SET @temp_count = 0
	SELECT @temp_count = COUNT(*) 
	FROM [dbo].[t_temp_pic_dwp_multisite_ByPatient_test_table] 
	WHERE  test_status IS NULL

	IF(@temp_count != 0)
		BEGIN
			SET @out_success=0
			SELECT @out_success
		END
	ELSE
		BEGIN
			SET @out_success= 1
			IF(@count_defective_records=0)
				BEGIN
					SET @out_test_status= 1
					SET @out_test_detail=cast(@count_total_records as varchar) +' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status= 0
					SET @out_test_detail=CAST(@count_defective_records as VARCHAR) + ' ambiguous records found out of '
											+ CAST(@count_total_records as VARCHAR)
				END 
		END 
		
END




GO
/****** Object:  StoredProcedure [dbo].[t_00_pic_dwp_multisite_test_table_gen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Imran Abbas Satti
-- Create date: 14-06-2018 
-- Description:	Test Table Generation for Multisite Time
-- =============================================
CREATE PROCEDURE [dbo].[t_00_pic_dwp_multisite_test_table_gen]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON

	DECLARE
		@reason_percent decimal(5, 2) 
		,@reason_total_count int = 0
		,@reason_sample_count int = 0
		,@selected_reason int = 0
		,@iterator int = 0
		,@temp_count int =0

	-- t_temp_pic_dwp_multisite_ByPatient_test_table
	if(object_id(N'[dbo].[t_temp_pic_dwp_multisite_ByPatient_test_table]', 'U') is not null)
		DROP TABLE dbo.t_temp_pic_dwp_multisite_ByPatient_test_table 
	
	CREATE TABLE [dbo].[t_temp_pic_dwp_multisite_ByPatient_test_table]
	(
		id bigint IDENTITY(1,1), 
		res_id bigint DEFAULT NULL, 
		attend varchar(40)  DEFAULT NULL, 
		mid varchar(99) DEFAULT NULL, 
		date_of_service datetime2(0) DEFAULT NULL,

		act_d1 int DEFAULT NULL,
		exp_d1 int DEFAULT NULL,  
		
		act_d2 int DEFAULT NULL,
		exp_d2 int DEFAULT NULL,

		act_d3 int DEFAULT NULL,
		exp_d3 int DEFAULT NULL,

		act_d4 int DEFAULT NULL,
		exp_d4 int DEFAULT NULL,

		act_d5 int DEFAULT NULL,
		exp_d5 int DEFAULT NULL,

		act_d6 int DEFAULT NULL,
		exp_d6 int DEFAULT NULL,

		act_d7 int DEFAULT NULL,
		exp_d7 int DEFAULT NULL,

		-- act_d8 int DEFAULT NULL,
		-- exp_d8 int DEFAULT NULL,

		act_d9 int DEFAULT NULL,
		exp_d9 int DEFAULT NULL,

		test_status bit DEFAULT NULL, 
		test_detail varchar(255) DEFAULT NULL, 
		PRIMARY KEY (id)
	)    
	

	SELECT	 @reason_percent = var_value
	FROM	[dbo].[t_global_variables]
	WHERE	var_key = 'multisite_by_patient_weightage'

	SELECT	@reason_total_count = count(*)
	FROM	fl_production.dbo.results_simple_prophy_4b
	WHERE	reason_level = @selected_reason

			
	SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

	IF (@reason_sample_count <= 0)
        SET @reason_sample_count = 50
            
		
	INSERT  INTO [dbo].[t_temp_pic_dwp_multisite_ByPatient_test_table]
	(
		res_id 
		,attend 
		,MID
		,date_of_service

		,act_d1
		,act_d2
		,act_d3
		,act_d4
		,act_d5
		,act_d6
		,act_d7
		,act_d9
	)	
	SELECT top (@reason_sample_count)
		id 
		,attend 
		,MID 
		,date_of_service

		,d1
		,d2
		,d3
		,d4
		,d5
		,d6
		,d7
		,d9
    FROM fl_production.dbo.[pic_dwp_multisites_adjustments]
    WHERE isactive= 1 
    ORDER BY RAND()
                     
        	
    SELECT	@temp_count = count(*)
    FROM		[dbo].t_temp_pic_dwp_multisite_ByPatient_test_table     


    IF (@temp_count > 0)
        SET @out_success = 1
    ELSE 
        SET @out_success = 0

	
END



GO
/****** Object:  StoredProcedure [dbo].[t_01____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

Create PROCEDURE [dbo].[t_01____________________]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

   END



GO
/****** Object:  StoredProcedure [dbo].[t_01_pic_pldaily_columnValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Imran Abbas
-- Create date: 26 June 2018
-- Description:	PIC pl daily column validation
-- =============================================
CREATE PROCEDURE [dbo].[t_01_pic_pldaily_columnValidation]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUT
	,@out_test_status bit = 0 OUT
	,@out_test_detail varchar(255)= '' OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON
	 -- -----------------------------------------------------------------
	-- Variables Below Are Used For Holding Data From Test Table
	-- -----------------------------------------------------------------
	DECLARE @t_id INT = 0
			,@t_attend VARCHAR(50) = ''
			,@t_mid VARCHAR(50) =''
			,@t_dos DATETIME2(0)
			,@t_sum_of_all_proc_mins int =0
			,@t_patient_count int = 0
			,@t_working_hours int = 0
			,@t_num_of_operatories int = 0
	-- -----------------------------------------------------------------
	-- Variables Below Are Used With In Loop For Pocessing
	-- -----------------------------------------------------------------  
	DECLARE @temp_exp_anesthesia_time int =0
			,@temp_exp_multisite_time int = 0
			,@temp_exp_fill_time int = 0
			,@temp_exp_setup_plus_cleanup int = 0
			,@temp_exp_chair_time int = 0
			,@temp_exp_total_min_per_day int = 0
			,@temp_exp_maximum_time int = 0 

	DECLARE @temp_exp_setup_time int = 0
			,@temp_exp_cleanup_time int = 0
			,@temp_exp_chair_time_plus_20_percent int = 0
			,@temp_exp_excess_time int = 0
			,@temp_exp_final_time int = 0
			,@temp_exp_excess_time_ratio int = 0
  
   
	-- -----------------------------------------------------------------
	-- Variables Below Are Used In Marking Ambigous Results
	-- -----------------------------------------------------------------
	DECLARE @_test_detail VARCHAR(250) = 'OK'
	DECLARE @temp_count INT= 0
	DECLARE @count_total_records INT = 0
			,@count_defective_records INT = 0
  
  
	-- ------------------------------------------------------------------
  
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT id,attend,date_of_service,sum_of_all_proc_mins, patient_count, working_hours, num_of_operatories 
			FROM [dbo].[t_temp_01_pic_pldaily_test_table] 		    

	
	OPEN test_row_cursor
	FETCH test_row_cursor INTO  @t_id, @t_attend,@t_dos,@t_sum_of_all_proc_mins
								,@t_patient_count,@t_working_hours,@t_num_of_operatories
	-- ===>>ALGO CORE PROCESSING STARTS
	
	WHILE @@FETCH_STATUS = 0
		BEGIN -- [1]
			 -- anesthesia time 
             
		SELECT 	@temp_exp_anesthesia_time = SUM(total_adjustment_pic) 
		FROM 	fl_production.dbo.[pic_dwp_anesthesia_adjustments]
		WHERE 	attend = @t_attend AND date_of_service = @t_dos AND isactive = 1
				   	    
            -- multisite time 
             
		SELECT 	@temp_exp_multisite_time = SUM(min_to_subtract)
		FROM 	fl_production.dbo.[pic_dwp_multisites_adjustments] 
		WHERE 	attend = @t_attend AND date_of_service = @t_dos AND isactive = 1
				    
			  
	    -- fill_time
		
		SELECT @temp_exp_fill_time=SUM(minutes_subtract)
		FROM 	fl_production.dbo.[pic_dwp_fillup_time_by_mid] 
		WHERE 	attend = @t_attend AND date_of_service = @t_dos AND isactive = 1
		
	    -- setup and cleanup time
		SET @temp_exp_setup_time =  @t_patient_count * 2
		SET @temp_exp_cleanup_time = IIF(
											(@t_patient_count - @t_num_of_operatories)>-1
											,(@t_patient_count - @t_num_of_operatories)*16
											,0
										 )
	   
	    -- total min per day
		SET @temp_exp_total_min_per_day =IIF(
												 (@t_working_hours * @t_num_of_operatories*60)<0
												 ,0
												 ,@t_working_hours * @t_num_of_operatories*60
											)


	    -- maximum time
		SET @temp_exp_maximum_time = IIF(
											(@t_working_hours * 60)<0
											,0
											,(@t_working_hours * 60)
										)
	    -- chair time and exp_chair_time_plus_20_percent
		SET @temp_exp_chair_time = @temp_exp_total_min_per_day - @temp_exp_setup_time - @temp_exp_cleanup_time 
		SET @temp_exp_chair_time_plus_20_percent = @temp_exp_chair_time + (0.2 * @temp_exp_total_min_per_day)
		
	    -- final time
		SET @temp_exp_final_time = IIF(@t_sum_of_all_proc_mins IS NULL,0,@t_sum_of_all_proc_mins)
								   + IIF(@temp_exp_anesthesia_time IS null ,0,@temp_exp_anesthesia_time) 
								   - IIF(@temp_exp_multisite_time IS NULL,0,@temp_exp_multisite_time) 
								   - IIF(@temp_exp_fill_time IS NULL,0,@temp_exp_fill_time) 
	    -- excess time
		SET @temp_exp_excess_time = IIF(@temp_exp_final_time is NULL,0,@temp_exp_final_time) 
									- IIF(@temp_exp_chair_time_plus_20_percent IS NULL,0,@temp_exp_chair_time_plus_20_percent)
		
	    -- exp_excess_time_ratio
		SET @temp_exp_excess_time_ratio = IIF(@temp_exp_excess_time IS NULL,0,@temp_exp_excess_time)
															/
											(
												IIF(@temp_exp_excess_time IS NULL,0,@temp_exp_excess_time) 
														+ 
												(@temp_exp_total_min_per_day + @temp_exp_total_min_per_day*0.2)
											);
	    
		
		UPDATE 	[dbo].[t_temp_01_pic_pldaily_test_table]  
		SET 	exp_anesthesia_time = @temp_exp_anesthesia_time
				,exp_multisite_time = @temp_exp_multisite_time
				,exp_fill_time = @temp_exp_fill_time
			
				,exp_setup_time = @temp_exp_setup_time
				,exp_cleanup_time = @temp_exp_cleanup_time
				,exp_setup_plus_cleanup = @temp_exp_setup_time + @temp_exp_cleanup_time
				,exp_chair_time = @temp_exp_chair_time
				,exp_total_min_per_day = @temp_exp_total_min_per_day
				
				,exp_chair_time_plus_20_percent = @temp_exp_chair_time_plus_20_percent
				,exp_final_time = @temp_exp_final_time
				,exp_excess_time = @temp_exp_excess_time 
				,exp_excess_time_ratio = ROUND(@temp_exp_excess_time_ratio,2)	
		WHERE 	id = @t_id
			
		
		
		IF(@temp_exp_final_time > @temp_exp_total_min_per_day + 0.2*@temp_exp_total_min_per_day)
			BEGIN
				UPDATE 	[dbo].[t_temp_01_pic_pldaily_test_table]   
				SET 	exp_ryg_status = 'red' 
				WHERE 	id = @t_id 
			END
		ELSE IF(@temp_exp_final_time > @temp_exp_total_min_per_day AND @temp_exp_final_time <= @temp_exp_total_min_per_day + 0.2 * @temp_exp_total_min_per_day)
			BEGIN
			UPDATE 	[dbo].[t_temp_01_pic_pldaily_test_table]   
			SET 	exp_ryg_status = 'yellow' 
			WHERE 	id = @t_id 
			END
		ELSE
			BEGIN
			UPDATE 	[dbo].[t_temp_01_pic_pldaily_test_table]   
			SET 	exp_ryg_status = 'green' 
			WHERE 	id = @t_id 
			END
		
	FETCH test_row_cursor INTO  @t_id, @t_attend,@t_dos,@t_sum_of_all_proc_mins
								,@t_patient_count,@t_working_hours,@t_num_of_operatories
		
		END	-- [1]
	
	CLOSE test_row_cursor 
	DEALLOCATE test_row_cursor
	
  
	-- <<=== ALGO CORE PROCESSING ENDS
 
	-- MARKING AMBIGUOUS RECORDS(status column and test detail)
	-- Chunck A
	
	UPDATE	 [dbo].[t_temp_01_pic_pldaily_test_table]
	SET		test_status=1
			,test_detail='OK'
	WHERE	act_ryg_status != exp_ryg_status

	UPDATE	 [dbo].[t_temp_01_pic_pldaily_test_table]
	SET		test_status=0
			,test_detail='Not Ok'
	WHERE	act_ryg_status != exp_ryg_status

	-- ---------------------------------------------------------------------------------
	
	
	-- ------------------------------------------------------------------------------------------------------------------
	SELECT @count_total_records  = COUNT(*) 
	FROM [dbo].[t_temp_01_pic_pldaily_test_table]

	SELECT @count_defective_records = COUNT(*) 
	FROM [dbo].[t_temp_01_pic_pldaily_test_table] 
	WHERE test_status=0
	
	SET @temp_count=0
	SELECT @temp_count = COUNT(*) 
	FROM [dbo].[t_temp_01_pic_pldaily_test_table] 
	WHERE  test_status IS NULL

	IF(@temp_count != 0)
		BEGIN
			SET @out_success=0
			SELECT @out_success
		END
	ELSE
		BEGIN
			SET @out_success= 1
			IF(@count_defective_records=0)
				BEGIN
					SET @out_test_status= 1
					SET @out_test_detail=cast(@count_total_records as varchar) +' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status= 0
					SET @out_test_detail=CAST(@count_defective_records as VARCHAR) + ' ambiguous records found out of '
											+ CAST(@count_total_records as VARCHAR)
				END 
		END 
		
END




GO
/****** Object:  StoredProcedure [dbo].[t_01_pic_pldaily_test_table_gen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Imran Abbas Satti
-- Create date: 14-06-2018 
-- Description:	Test Table Generation for pic pl daily algo
-- =============================================
CREATE PROCEDURE [dbo].[t_01_pic_pldaily_test_table_gen] -- Add the parameters for the stored procedure here
@out_success BIT = 0 OUTPUT AS BEGIN-- SET NOCOUNT ON added to prevent extra result sets from
	
	SET NOCOUNT ON DECLARE
	@percent_value DECIMAL ( 5, 2 ),@total_count INT = 0,@sample_count INT = 0,@temp_count INT = 0,@max_process_date DATETIME2 ( 0 ) -- t_temp_01_pic_pldaily_test_table
	IF
		( object_id( N'[dbo].[t_temp_01_pic_pldaily_test_table]', 'U' ) IS NOT NULL ) DROP TABLE [dbo].[t_temp_01_pic_pldaily_test_table] CREATE TABLE [dbo].[t_temp_01_pic_pldaily_test_table] (
			id bigint IDENTITY ( 1, 1 ),
			res_id bigint DEFAULT NULL,
			attend VARCHAR ( 40 ) DEFAULT NULL,
-- mid varchar(99) DEFAULT NULL,
			date_of_service datetime2 ( 0 ) DEFAULT NULL,
			patient_count INT DEFAULT NULL,
			working_hours INT DEFAULT NULL,
			sum_of_all_proc_mins INT DEFAULT NULL,
			num_of_operatories BIGINT DEFAULT NULL,
			act_anesthesia_time INT DEFAULT NULL,
			exp_anesthesia_time INT DEFAULT NULL,
			act_multisite_time INT DEFAULT NULL,
			exp_multisite_time INT DEFAULT NULL,
			act_fill_time INT DEFAULT NULL,
			exp_fill_time INT DEFAULT NULL,
			act_setup_time INT DEFAULT NULL,
			exp_setup_time INT DEFAULT NULL,
			act_cleanup_time INT DEFAULT NULL,
			exp_cleanup_time INT DEFAULT NULL,
			act_setup_plus_cleanup INT DEFAULT NULL,
			exp_setup_plus_cleanup INT DEFAULT NULL,
			act_chair_time INT DEFAULT NULL,
			exp_chair_time INT DEFAULT NULL,
			act_total_min_per_day INT DEFAULT NULL,
			exp_total_min_per_day INT DEFAULT NULL,
			act_chair_time_plus_20_percent FLOAT,
			exp_chair_time_plus_20_percent FLOAT,
			act_final_time FLOAT,
			exp_final_time FLOAT,
			act_excess_time FLOAT,
			exp_excess_time FLOAT,
			act_excess_time_ratio FLOAT,
			exp_excess_time_ratio FLOAT,
			act_ryg_status VARCHAR ( 50 ),
			exp_ryg_status VARCHAR ( 50 ),
			test_status BIT DEFAULT NULL,
			test_detail VARCHAR ( 255 ) DEFAULT NULL,
			
		) SELECT
		@max_process_date = MAX ( process_date ) 
	FROM
		fl_production.dbo.[pic_doctor_stats_daily] 
	WHERE
		isactive = 1 SELECT
		@percent_value = var_value 
	FROM
		[dbo].[t_global_variables] 
	WHERE
		var_key = 'pl_daily_pic' SELECT
		@total_count = COUNT ( * ) 
	FROM
		fl_production.dbo.results_simple_prophy_4b 
	WHERE
		isactive = 1 
		AND process_date = @max_process_date 
		SET @sample_count = ( @total_count *@percent_value ) / 100;
	
	SET @sample_count = ( @total_count * @percent_value ) / 100
	IF
		( @sample_count <= 0 ) 
		SET @sample_count = 50 INSERT INTO [dbo].[t_temp_01_pic_pldaily_test_table] (
			res_id,
			attend,
			date_of_service,
			num_of_operatories,
			working_hours,
			sum_of_all_proc_mins,
			patient_count,
			act_anesthesia_time,
			act_multisite_time,
			act_fill_time,
			act_setup_time,
			act_cleanup_time,
			act_setup_plus_cleanup,
			act_chair_time,
			act_chair_time_plus_20_percent,
			act_total_min_per_day,
			act_excess_time,
			act_excess_time_ratio,
			act_final_time,
			act_ryg_status 
		) SELECT TOP
		( @sample_count ) id,
		attend,
		date_of_service,
		num_of_operatories,
		working_hours,
		sum_of_all_proc_mins,
		patient_count,
		anesthesia_time,
		multisite_time,
		fill_time,
		setup_time,
		cleanup_time,
		setup_plus_cleanup,
		chair_time,
		chair_time_plus_20_percent,
		total_min_per_day,
		excess_time,
		excess_time_ratio,
		final_time,
		ryg_status 
	FROM
		fl_production.dbo.[pic_doctor_stats_daily] 
	WHERE
		isactive = 1 
		AND ( ABS( CAST (( BINARY_CHECKSUM( * ) * RAND()) AS INT )) % 100 ) < ( @percent_value + 1 ) 
		AND process_date = @max_process_date SELECT
		@temp_count = COUNT ( * ) 
	FROM
		[dbo].[t_temp_01_pic_pldaily_test_table]
	IF
		( @temp_count > 0 ) 
		SET @out_success = 1 ELSE 
	SET @out_success = 0 
END
GO
/****** Object:  StoredProcedure [dbo].[t_02____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

Create PROCEDURE [dbo].[t_02____________________]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

   END




GO
/****** Object:  StoredProcedure [dbo].[t_02_dwp_pldaily_columnValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Imran Abbas
-- Create date: 27 June 2018
-- Description:	DWP pl daily column validation
-- =============================================
CREATE PROCEDURE [dbo].[t_02_dwp_pldaily_columnValidation]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUT
	,@out_test_status bit = 0 OUT
	,@out_test_detail varchar(255)= '' OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON
	 -- -----------------------------------------------------------------
	-- Variables Below Are Used For Holding Data From Test Table
	-- -----------------------------------------------------------------
	DECLARE @t_id INT = 0
			,@t_attend VARCHAR(50) = ''
			,@t_mid VARCHAR(50) =''
			,@t_dos DATETIME2(0)
			,@t_sum_of_all_proc_mins int =0
			,@t_patient_count int = 0
			,@t_working_hours int = 0
			,@t_num_of_operatories int = 0
	-- -----------------------------------------------------------------
	-- Variables Below Are Used With In Loop For Pocessing
	-- -----------------------------------------------------------------  
	DECLARE @tot_time float = 0
			,@avail_time float = 0
			,@chair_plus_time float = 0

	DECLARE @sub_time int = 0
			,@sum_time int = 0
			
  
   
	-- -----------------------------------------------------------------
	-- Variables Below Are Used In Marking Ambigous Results
	-- -----------------------------------------------------------------
	DECLARE @_test_detail VARCHAR(250) = 'OK'
	DECLARE @temp_count INT= 0
	DECLARE @count_total_records INT = 0
			,@count_defective_records INT = 0
  
  
	-- ------------------------------------------------------------------
  
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT id,attend,date_of_service 
			FROM [dbo].[t_temp_02_dwp_pldaily_test_table] 		    

	
	OPEN test_row_cursor
	FETCH test_row_cursor INTO  @t_id, @t_attend,@t_dos
	-- ===>>ALGO CORE PROCESSING STARTS
	
	WHILE @@FETCH_STATUS = 0
		BEGIN -- [1]
			SELECT	@sum_time = ( isnull(sum_of_all_proc_mins,0) + isnull(anesthesia_time,0) )  
			FROM	 [dbo].[t_temp_02_dwp_pldaily_test_table]
			WHERE	attend = @t_attend AND date_of_service = @t_dos

			SELECT	@sub_time = ( isnull(multisite_time,0) + isnull(fill_time,0) )
			FROM	[dbo].[t_temp_02_dwp_pldaily_test_table]
			WHERE	attend = @t_attend AND date_of_service = @t_dos 
			
			UPDATE   [dbo].[t_temp_02_dwp_pldaily_test_table]
		    SET		 exp_final_time  = @sum_time-@sub_time 
		    WHERE	 id=@t_id


			SELECT	@tot_time = ( isnull(final_time,0) - isnull(doc_wd_patient_max,0) )
			FROM	[dbo].[t_temp_02_dwp_pldaily_test_table]
			WHERE	attend = @t_attend AND date_of_service = @t_dos 

			
			IF (@tot_time > 0)
				BEGIN
					UPDATE	[dbo].[t_temp_02_dwp_pldaily_test_table]
					SET		exp_ryg_status='red'
							,exp_excess_time = @tot_time
							,test_detail='OK'
					WHERE	id=@t_id
				END
			ELSE 
				BEGIN	  
					IF (@tot_time > -96 AND @tot_time<=0)
						BEGIN
							UPDATE [dbo].[t_temp_02_dwp_pldaily_test_table] 
							SET		exp_ryg_status='yellow'
									,exp_excess_time = @tot_time 
									,test_detail='OK'
							WHERE	id=@t_id
						END
					ELSE
						BEGIN 	  
							UPDATE [dbo].[t_temp_02_dwp_pldaily_test_table] 
							SET		exp_ryg_status='green'
									,exp_excess_time = @tot_time 
									,test_detail='OK'
							WHERE	id=@t_id
						END
				END
			
			-- ------------------------
			FETCH NEXT FROM test_row_cursor INTO  @t_id, @t_attend,@t_dos
		END	-- [1]
	
	CLOSE test_row_cursor 
	DEALLOCATE test_row_cursor
	
  
	-- <<=== ALGO CORE PROCESSING ENDS
 
	-- MARKING AMBIGUOUS RECORDS(status column and test detail)
	
	UPDATE	 [dbo].[t_temp_02_dwp_pldaily_test_table]
	SET		test_status=1
	WHERE	act_ryg_status = exp_ryg_status

	UPDATE	 [dbo].[t_temp_02_dwp_pldaily_test_table]
	SET		test_status=0
	WHERE	act_ryg_status != exp_ryg_status

	-- ---------------------------------------------------------------------------------
	
	
	-- ------------------------------------------------------------------------------------------------------------------
	SELECT @count_total_records  = COUNT(*) 
	FROM [dbo].[t_temp_02_dwp_pldaily_test_table]

	SELECT @count_defective_records = COUNT(*) 
	FROM [dbo].[t_temp_02_dwp_pldaily_test_table] 
	WHERE test_status=0
	
	SET @temp_count=0
	SELECT @temp_count = COUNT(*) 
	FROM [dbo].[t_temp_02_dwp_pldaily_test_table] 
	WHERE  test_status IS NULL

	IF(@temp_count != 0)
		BEGIN
			SET @out_success=0
			SELECT @out_success
		END
	ELSE
		BEGIN
			SET @out_success= 1
			IF(@count_defective_records=0)
				BEGIN
					SET @out_test_status= 1
					SET @out_test_detail=cast(@count_total_records as varchar) +' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status= 0
					SET @out_test_detail=CAST(@count_defective_records as VARCHAR) + ' ambiguous records found out of '
											+ CAST(@count_total_records as VARCHAR)
				END 
		END 
	
END





GO
/****** Object:  StoredProcedure [dbo].[t_02_dwp_pldaily_test_table_gen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Imran Abbas Satti
-- Create date: 27-06-2018 
-- Description:	Test Table Generation for dwp pl daily algo
-- =============================================
CREATE PROCEDURE [dbo].[t_02_dwp_pldaily_test_table_gen]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON
	DECLARE
		@percent_value decimal(5, 2) 
		,@total_count int = 0
		,@sample_count int = 0
		,@temp_count int =0
		,@max_process_date DATETIME2(0)

	if(object_id(N'[dbo].[t_temp_02_dwp_pldaily_test_table]', 'U') is not null)
		DROP TABLE [dbo].[t_temp_02_dwp_pldaily_test_table]
	
	CREATE TABLE [dbo].[t_temp_02_dwp_pldaily_test_table]
	(
		id bigint IDENTITY(1,1), 
		res_id bigint DEFAULT NULL, 
		attend varchar(40)  DEFAULT NULL,
		date_of_service datetime2(0) DEFAULT NULL,


		patient_count INT DEFAULT NULL,
		anesthesia_time INT DEFAULT NULL,
		multisite_time INT DEFAULT NULL,
		fill_time INT DEFAULT NULL,
		sum_of_all_proc_mins INT DEFAULT NULL,
		doc_wd_patient_max float,
		final_time float,
		
		act_chair_time INT DEFAULT NULL,
		exp_chair_time INT DEFAULT NULL,
		
		act_excess_time FLOAT DEFAULT NULL,
		exp_excess_time FLOAT DEFAULT NULL,
		
		act_final_time INT DEFAULT NULL,
		exp_final_time INT DEFAULT NULL,
		
		
		act_ryg_status varchar(50) ,
		exp_ryg_status varchar(50),

		test_status bit DEFAULT NULL, 
		test_detail varchar(255) DEFAULT NULL
	)  
	

	SELECT	@max_process_date=max(process_date) 
	FROM	 fl_production.dbo.[dwp_doctor_stats_daily]
	WHERE	isactive = 1


	SELECT	 @percent_value = var_value
	FROM	[dbo].[t_global_variables]
	WHERE	var_key = 'pl_daily_dwp'

	SELECT	@total_count = count(*)
	FROM	fl_production.dbo.[dwp_doctor_stats_daily]
	WHERE	isactive = 1
			AND process_date = @max_process_date

	SET @sample_count=(@total_count*@percent_value)/100;
			
	SET @sample_count = (@total_count * @percent_value)  / 100

	IF (@sample_count <= 0)
        SET @sample_count = 50
	   

	INSERT  INTO [dbo].[t_temp_02_dwp_pldaily_test_table]
	(
		res_id, 
		attend,
		date_of_service,


		patient_count,
		anesthesia_time,
		multisite_time,
		fill_time,
		sum_of_all_proc_mins,
		doc_wd_patient_max,
		final_time,
		
		
		act_chair_time,
		act_excess_time,
		act_final_time,
		act_ryg_status

		
	)	
	SELECT top (@sample_count)
		id
		,attend
		,date_of_service

		,patient_count
		,anesthesia_time
		,multisite_time
		,fill_time
		,sum_of_all_proc_mins
		,doc_wd_patient_max
		,final_time

		
		,chair_time
		,excess_time
		,final_time
		,ryg_status
		
    FROM fl_production.dbo.[dwp_doctor_stats_daily]
    WHERE isactive= 1 
			AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@percent_value+1)
			AND process_date = @max_process_date
                     
        	
    SELECT	@temp_count = count(*)
    FROM	[dbo].[t_temp_02_dwp_pldaily_test_table]     

	
    IF (@temp_count > 0)
        SET @out_success = 1
    ELSE 
        SET @out_success = 0
END




GO
/****** Object:  StoredProcedure [dbo].[t_04____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

CREATE PROCEDURE [dbo].[t_04____________________]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

   END


GO
/****** Object:  StoredProcedure [dbo].[t_04_impAge_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

CREATE PROCEDURE [dbo].[t_04_impAge_TS2_RESULT_TABLE]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @tc_success int = 0

      DECLARE
         @tc_status int = 0

      DECLARE
         @tc_detail nvarchar(100) = N'No detail'

      DECLARE
         @start_time datetime2(0) = NULL

      SET @start_time = getdate()

      EXECUTE test_cases.dbo.t_04_impAge_ts2_tc1A_testTableGen

      EXECUTE test_cases.dbo.t_04_impAge_ts2_tc1B_resReasonValidation

      /* 
      *   SSMA error messages:
      *   M2SS0201: MySQL standard function TIMEDIFF is not supported in current SSMA version

      EXECUTE test_cases.dbo.t_update_report_table_fn 
         04, 
         'Verifying table[emihealth.procedure_performed] column[impossible_age_status] by generating test table[test_cases.dbo.t_temp_04_impAge_result_test_table]', 
         @tc_status, 
         @tc_detail, 
         TIMEDIFF(getdate(), @start_time), 
         't_report', 
         't_04_impAge_ts2_tc1A_testTableGen/t_04_impAge_ts2_tc1B_resReasonValidation'      */



   END


GO
/****** Object:  StoredProcedure [dbo].[t_04_impAge_ts2_tc1A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[t_04_impAge_ts2_tc1A_testTableGen]  
   @out_success bit  OUTPUT
AS 
   BEGIN

      SET  XACT_ABORT  ON
      SET  NOCOUNT  ON

      SET @out_success = NULL


      DECLARE
         @reason_percent decimal(5, 2)
		,@reason_total_count int
        ,@temp_count int
        ,@reason_sample_count int
        ,@selected_reason int
        ,@iterator int
		-- NEW
		,@max_process_date DATETIME2(0)

      
      if(object_id(N'[dbo].[t_temp_04_impAge_result_test_table]', 'U') is not null)
			DROP TABLE [dbo].[t_temp_04_impAge_result_test_table] 
	  

      CREATE TABLE [dbo].[t_temp_04_impAge_result_test_table]
      (
         id bigint IDENTITY(1,1), 
         res_id bigint DEFAULT NULL, 
         attend varchar(40)  DEFAULT NULL, 
         mid varchar(99) DEFAULT NULL, 
         proc_code varchar(99)  DEFAULT NULL, 
         patient_age varchar(99) DEFAULT NULL, 
		
         act_reason_level int DEFAULT NULL, 
         exp_reason_level int DEFAULT NULL, 
		
         act_ryg_status varchar(15) DEFAULT NULL, 
		 exp_ryg_status varchar(15) DEFAULT NULL, 

         test_status bit DEFAULT NULL, 
         test_detail varchar(255) DEFAULT NULL, 
         PRIMARY KEY (id)
      )    
	  -- NEW
      SELECT @max_process_date=max(process_date) 
	  FROM	 fl_production.dbo.procedure_performed
	  WHERE	is_invalid = 0

      SET @iterator = 1
      WHILE (@iterator < 3)
         BEGIN

            SET @selected_reason = @iterator

            SELECT	 @reason_percent = reason_weight
            FROM	[dbo].[t_global_reasons_ratio]
            WHERE	t_global_reasons_ratio.algo_id = 04 
					AND reason_level = @selected_reason

            SET @reason_total_count = 0
            SET @reason_sample_count = 0

            SELECT	@reason_total_count = count(*)
            FROM	fl_production.dbo.procedure_performed
            WHERE	reason_level = @selected_reason
					AND is_invalid = 0
					AND process_date =  @max_process_date


			SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

			IF (@reason_sample_count < 0)
               SET @reason_sample_count = 50

            
			INSERT  INTO [dbo].[t_temp_04_impAge_result_test_table](
				res_id, 
				attend, 
				MID, 
				proc_code, 
				patient_age,
				act_reason_level, 
				act_ryg_status)
			SELECT top (@reason_sample_count)
				id, 
				attend, 
				MID, 
				proc_code, 
				patient_age, 
				reason_level,
				impossible_age_status
                FROM fl_production.dbo.procedure_performed
                WHERE is_invalid = 0 AND reason_level = @selected_reason
				AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1)

                     
            SET @iterator = @iterator + 1

         END

      SELECT	@temp_count = count(*)
      FROM		[dbo].[t_temp_04_impAge_result_test_table]     


      IF (@temp_count > 0)
         SET @out_success = 1
      ELSE 
         SET @out_success = 0
   END








GO
/****** Object:  StoredProcedure [dbo].[t_04_impAge_ts2_tc1B_resReasonValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[t_04_impAge_ts2_tc1B_resReasonValidation]  
   @out_success bit  OUTPUT,
   @out_test_status bit  OUTPUT,
   @test_detail nvarchar(255)  OUTPUT
AS 
   BEGIN

      SET  XACT_ABORT  ON
      SET  NOCOUNT  ON

      SET @test_detail = NULL
      SET @out_test_status = NULL
      SET @out_success = NULL
-- ==============================================================================
--            			 Declaring All Variables 
-- ==============================================================================
-- For Holding Data From Cursor
      DECLARE
         @t_id bigint = 0
		 ,@t_attend nvarchar(40) = N''
         ,@t_mid nvarchar(99) = N''
         ,@t_specialty nvarchar(250) = N''
		 ,@t_dos datetime2(0) = NULL
         ,@t_proc_code nvarchar(99) = N''
         
         ,@t_patient_age int = 0
         ,@t_tooth_no nvarchar(99) = N''

-- For Holding Results of Queries
      DECLARE
		 @proc_code_exists int = 0
         ,@is_in_age_range int = 0
		,@p_min_age int = 0
		,@p_max_age int = 0

-- For setting Output parameters
      DECLARE
         @temp_count int = 0, 
         @count_total_records int = 0, 
         @count_defective_records int = 0
-- For Cursor
      DECLARE
          test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
            SELECT 
               id, 
               attend, 
               MID, 
               proc_code, 
               patient_age
            FROM [dbo].[t_temp_04_impAge_result_test_table]      

	OPEN test_row_cursor
	
	FETCH  FROM test_row_cursor
                INTO 
                  @t_id, 
                  @t_attend, 
                  @t_mid, 
                  @t_proc_code, 
                  @t_patient_age 

	
      WHILE @@FETCH_STATUS = 0
         BEGIN         
            SELECT @proc_code_exists = count(*) 
            FROM fl_production.dbo.[ref_standard_procedures]
            WHERE fl_production.dbo.[ref_standard_procedures].proc_code = @t_proc_code

            IF (@proc_code_exists  > 0)
               BEGIN
                  SELECT TOP (1) @p_min_age = min_age, @p_max_age = max_age
                  FROM fl_production.dbo.[ref_standard_procedures]
                  WHERE proc_code = @t_proc_code

                  IF ((@t_patient_age BETWEEN @p_min_age AND @p_max_age) AND (@t_patient_age < 116))
                     UPDATE	[dbo].[t_temp_04_impAge_result_test_table]
                     SET 	exp_ryg_status = 'green'
							,exp_reason_level = 1 
                     WHERE	id = @t_id                     
                  ELSE 
                     UPDATE [dbo].[t_temp_04_impAge_result_test_table]
                     SET	exp_ryg_status = 'red'
							,exp_reason_level = 2
                     WHERE	id = @t_id                   
				END
            ELSE 
				UPDATE [dbo].[t_temp_04_impAge_result_test_table]
                SET		exp_ryg_status = 'red'
						,exp_reason_level = 3
				WHERE	id = @t_id
				  
			FETCH NEXT FROM test_row_cursor
                INTO 
                  @t_id, 
                  @t_attend, 
                  @t_mid, 
                  @t_proc_code, 
                  @t_patient_age              
         END -- While ends

		 ClOSE test_row_cursor
		 DEALLOCATE test_row_cursor

      

      UPDATE [dbo].[t_temp_04_impAge_result_test_table]
      SET    test_status = 1
      WHERE  act_ryg_status = exp_ryg_status      

      UPDATE [dbo].[t_temp_04_impAge_result_test_table]
         SET 
            test_status = 0
      WHERE act_ryg_status <> exp_ryg_status      


      SELECT @count_total_records = count(*)
      FROM [dbo].[t_temp_04_impAge_result_test_table]      


      SELECT @count_defective_records = count(*)
      FROM [dbo].[t_temp_04_impAge_result_test_table]
      WHERE act_ryg_status <> exp_ryg_status      

      SET @temp_count = 0
     
      SELECT @temp_count = count(*)
      FROM [dbo].[t_temp_04_impAge_result_test_table]
      WHERE exp_ryg_status IS NULL      



      IF (@temp_count > 0)
         SET @out_success = 0
      ELSE 
         BEGIN
            SET @out_success = 1
            IF (@count_defective_records = 0)
               BEGIN
                  SET @out_test_status = 1
                  SET @test_detail = CAST(@count_total_records AS varchar(50)) 
									+ N' records are tested.No ambiguous record found.'
               END
            ELSE 
               BEGIN
                  SET @out_test_status = 0
                  SET @test_detail = CAST(@count_defective_records AS varchar(50)) 
									+ N' ambiguous records found out of ' + CAST(@count_total_records AS varchar(50))
               END
         END
   END


GO
/****** Object:  StoredProcedure [dbo].[t_07____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

Create PROCEDURE [dbo].[t_07____________________]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

   END



GO
/****** Object:  StoredProcedure [dbo].[t_07_multidoctor_ts2_tc1A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Imran Abbas
-- Create date: 25 June 2018
-- Description:	Test table generation for pic daily
-- =============================================
CREATE PROCEDURE [dbo].[t_07_multidoctor_ts2_tc1A_testTableGen]
  @out_success bit  OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON

	DECLARE @reason_percent DECIMAL(5,2),
			@reason_total_count int ,
			@temp_count INT,
			@reason_sample_count INT,
			@selected_reason INT,
			@iterator INT,
			@_ryg_status VARCHAR(99) 
			,@max_process_date DATETIME2(0)
 
	if(object_id(N'[dbo].[t_temp_07_multiDoctor_test_table]', 'U') is not null)
			
	DROP TABLE [dbo].[t_temp_07_multiDoctor_test_table]


	CREATE TABLE [dbo].[t_temp_07_multiDoctor_test_table]
	(
		id BIGINT IDENTITY(1,1),
		res_id BIGINT  DEFAULT NULL,
		attend VARCHAR(40) DEFAULT NULL,
		mid VARCHAR(99) DEFAULT NULL,
		date_of_service DATETIME DEFAULT NULL,
		patient_age INT DEFAULT 0,
		tooth_no Varchar(50) Default Null, 
		proc_code Varchar(50) Default Null, 

		act_reason_level INT DEFAULT NULL,
		exp_reason_level INT DEFAULT NULL,
		act_ryg_status VARCHAR(15) DEFAULT NULL,
		exp_ryg_status VARCHAR(15) DEFAULT NULL,
		test_status bit DEFAULT NULL,
		test_detail varchar(99) DEFAULT NULL,
		PRIMARY KEY (id)
	)

	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.[results_multi_doctor]
	WHERE	isactive  = 1

	SET @iterator = 1 -- 1
	WHILE(@iterator < 5) -- 5
	Begin

		SET @selected_reason = @iterator

		SELECT @reason_percent=reason_weight 
		FROM [dbo].[t_global_reasons_ratio]  
		WHERE algo_id=7 AND reason_level=@selected_reason;

		SET @reason_total_count=0;
		SET @reason_sample_count=0;
		
		
		SELECT  @reason_total_count= COUNT(*)  FROM fl_production.dbo.[results_multi_doctor]
		WHERE	reason_level = @selected_reason
				AND isactive = 1
				AND process_date = @max_process_date
			
		
		SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

		IF (@reason_sample_count < 0)
			BEGIN
				SET @reason_sample_count = 50
			END
           
		
		INSERT INTO [dbo].[t_temp_07_multiDoctor_test_table]
		(
			res_id,
			attend,
			MID,
			date_of_service,
			patient_age,
			tooth_no,
			proc_code,
			act_reason_level,
			act_ryg_status
		)
		SELECT top (@reason_sample_count)	
			id, 
			attend, 
			MID, 
			date_of_service, 
			patient_age,
			tooth_no,
			proc_code,
			reason_level, 
			ryg_status
		FROM 	fl_production.dbo.[results_multi_doctor]
		WHERE 	reason_level = @iterator
				AND isactive=1 
				AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1)


		SET @iterator = @iterator + 1
	END

	SELECT	@temp_count = count(*)
	FROM	dbo.[t_temp_07_multiDoctor_test_table]     


	IF (@temp_count > 0)
		BEGIN
			SET @out_success = 1
		END
	ELSE 
		BEGIN
			SET @out_success = 0
		END
END




GO
/****** Object:  StoredProcedure [dbo].[t_07_multiDoctor_ts2_tc1B_reasons]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Imran Abbas
-- Create date: 19 June 2018
-- Description:	FILL UP  Time Verification
-- =============================================
CREATE PROCEDURE [dbo].[t_07_multiDoctor_ts2_tc1B_reasons]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUT
	,@out_test_status bit = 0 OUT
	,@out_test_detail varchar(255)= '' OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	 -- -----------------------------------------------------------------
	-- Variables Below Are Used For Holding Data From Test Table
	-- -----------------------------------------------------------------
	DECLARE @t_id INT = 0
	DECLARE @t_attend VARCHAR(50) = ''
	DECLARE @t_mid VARCHAR(50) =''
	DECLARE @t_tooth_no VARCHAR(50) =''
	DECLARE @t_proc_code VARCHAR(50) =''
	DECLARE @t_dos DATETIME2(0)
  
	-- -----------------------------------------------------------------
	-- Variables Below Are Used With In Loop For Pocessing
	-- -----------------------------------------------------------------  
			
	DECLARE @has_2_or_Rmore_claim_ids INT = 0
			,@has_2_or_Rmore_claim_ids_same_toothno_codes INT = 0
			,@has_2_or_Rmore_claim_ids_same_toothno_codes_same_provider INT = 0
			
	
	-- -----------------------------------------------------------------
	-- Variables Below Are Used In Marking Ambigous Results
	-- -----------------------------------------------------------------
	
	DECLARE @temp_count INT= 0
	DECLARE @count_total_records INT = 0
			,@count_defective_records INT = 0
  
  
	-- ------------------------------------------------------------------
  
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT id,attend,MID,date_of_service,tooth_no,proc_code FROM [dbo].[t_temp_07_multiDoctor_test_table] 		    

  

	OPEN test_row_cursor
	FETCH test_row_cursor INTO  @t_id, @t_attend, @t_mid,@t_dos,@t_tooth_no, @t_proc_code
	
	WHILE @@FETCH_STATUS = 0
		BEGIN -- <<-- ALGO CORE PROCESSING STARTS	
			IF(@t_attend='' OR @t_dos='' OR @t_mid='' OR @t_attend IS NULL OR @t_dos IS NULL OR @t_mid IS NULL )
				BEGIN
					UPDATE test_cases.dbo.[t_temp_07_multiDoctor_test_table]
					SET	exp_reason_level = -1,
						test_detail = 'Invalid Data.'
					WHERE	id=@t_id
				END
		    ELSE
				BEGIN
				
					SELECT 	@has_2_or_Rmore_claim_ids = COUNT(*) 
					FROM 	fl_production.dbo.[src_multiple_claims] AS src 
					WHERE	MID=@t_mid AND date_of_service=@t_dos 
							AND claim_ids > 1 
							-- AND isactive=1

					IF(@has_2_or_Rmore_claim_ids = 0)
						BEGIN
							-- >> Reason 1
							UPDATE	test_cases.dbo.[t_temp_07_multiDoctor_test_table] 
							SET		exp_reason_level=1, test_detail='has less than two claim ids.' 
							WHERE	id=@t_id
						END
					ELSE
						BEGIN
							-- Below Query finds mids with same tooth no and proc_code
							SELECT	@has_2_or_Rmore_claim_ids_same_toothno_codes = COUNT(*)  
							FROM 	fl_production.dbo.[src_multiple_claims]
							WHERE	MID=@t_mid AND date_of_service=@t_dos 
									AND claim_ids > 1 AND tooth_no = @t_tooth_no AND proc_code = @t_proc_code
							
							IF(@has_2_or_Rmore_claim_ids_same_toothno_codes=0)
								BEGIN
									-- >> Reason 2
									UPDATE	[dbo].[t_temp_07_multiDoctor_test_table] 
									SET		exp_reason_level=2
											,test_detail='tooth no or proc code not same.' 
									WHERE	id=@t_id
								END
							ELSE
								BEGIN
									-- Below Query finds the providers (Attending ID) the same in each claim on the same DOS
									SELECT	@has_2_or_Rmore_claim_ids_same_toothno_codes_same_provider = COUNT(*)  
									FROM 	fl_production.dbo.[src_multiple_claims]
									WHERE	MID=@t_mid AND date_of_service=@t_dos 
											AND claim_ids > 1 AND tooth_no = @t_tooth_no AND proc_code = @t_proc_code
											AND attends > 1
											-- AND isactive=1 
									IF(@has_2_or_Rmore_claim_ids_same_toothno_codes_same_provider=0)
										BEGIN
											-- >> Reason 3
											UPDATE	test_cases.dbo.[t_temp_07_multiDoctor_test_table] 
											SET		exp_reason_level=3
													,test_detail='providers are same in each claim' 
											WHERE	id=@t_id
										END
									ELSE
										BEGIN
											-- >> Reason 4
											UPDATE	[dbo].[t_temp_07_multiDoctor_test_table] 
											SET		exp_reason_level=4
													,test_detail='providers are Not same in each claim' 
											WHERE	id=@t_id
										END
								END		 
						END 
					
				END 
						
			FETCH NEXT FROM test_row_cursor INTO  @t_id, @t_attend, @t_mid,@t_dos,@t_tooth_no, @t_proc_code
		END	-- <<--  ALGO CORE PROCESSING ENDS
	
	CLOSE test_row_cursor 
	DEALLOCATE test_row_cursor
	
	-- <<=== ALGO CORE PROCESSING ENDS
 
	-- MARKING AMBIGUOUS RECORDS(status column and test detail)
	-- Chunck A
	
	
	/*
	UPDATE	 [dbo].[t_temp_07_multiDoctor_test_table]
	SET		test_status=1,
			test_detail='OK'
	WHERE	act_min_sub = act_min_sub

	UPDATE	 [dbo].[t_temp_07_multiDoctor_test_table]
	SET		test_status=0,
			test_detail='Diffrence b/w minutes to subtract'
	WHERE	act_min_sub != act_min_sub

	
	
	-- ------------------------------------------------------------------------------------------------------------------
	SELECT @count_total_records  = COUNT(*) 
	FROM [dbo].[t_temp_07_multiDoctor_test_table]

	SELECT @count_defective_records = COUNT(*) 
	FROM [dbo].[t_temp_07_multiDoctor_test_table] 
	WHERE test_status=0
	
	SET @temp_count=0
	SELECT @temp_count = COUNT(*) 
	FROM [dbo].[t_temp_07_multiDoctor_test_table] 
	WHERE  test_status IS NULL

	IF(@temp_count != 0)
		BEGIN
			SET @out_success=0
			SELECT @out_success
		END
	ELSE
		BEGIN
			SET @out_success= 1
			IF(@count_defective_records=0)
				BEGIN
					SET @out_test_status= 1
					SET @out_test_detail=cast(@count_total_records as varchar) +' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status= 0
					SET @out_test_detail=CAST(@count_defective_records as VARCHAR) + ' ambiguous records found out of '
											+ CAST(@count_total_records as VARCHAR)
				END 
		END 
	*/
END




GO
/****** Object:  StoredProcedure [dbo].[t_08____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

Create PROCEDURE [dbo].[t_08____________________]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

   END



GO
/****** Object:  StoredProcedure [dbo].[t_08_overactiveInactiveAxio_ts2_tc5A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Imran Abbas
-- Create date: 27/4/2018 2:48:45 PM
-- Description:	Generating test table for algorithm 08 Overactive Inactive
-- =============================================
CREATE PROCEDURE [dbo].[t_08_overactiveInactiveAxio_ts2_tc5A_testTableGen]	 
	@out_success bit OUTPUT
	
AS
BEGIN
	SET  XACT_ABORT  ON
    SET  NOCOUNT  ON

	SET @out_success = NULL

	DECLARE
		@reason_percent decimal(5, 2)
		,@reason_total_count int
		,@temp_count int
		,@reason_sample_count int
		,@selected_reason int
		,@selected_ryg_status varchar(15)
		,@iterator int
		,@max_process_date DATETIME2(0)

	if(object_id(N'[dbo].[t_temp_08_overactiveInactive_result_test_table]', 'U') is not null)
		DROP TABLE [dbo].[t_temp_08_overactiveInactive_result_test_table] 
	  
	CREATE TABLE [dbo].[t_temp_08_overactiveInactive_result_test_table]
	(
		id int IDENTITY(1,1), 
		res_id int DEFAULT NULL, 
		attend varchar(40)  DEFAULT NULL, 
		specialty varchar(40)  DEFAULT NULL,
		payer_id varchar(40)  DEFAULT NULL,
		mid varchar(99) DEFAULT NULL, 
		year varchar(99) DEFAULT NULL, 
		
		act_total_num_of_visits int DEFAULT NULL, 
		exp_total_num_of_visits int DEFAULT NULL, 

		act_all_visits_incl_xrays int DEFAULT NULL, 
		exp_all_visits_incl_xrays int DEFAULT NULL, 
		
		act_ryg_status varchar(15) DEFAULT NULL, 
		exp_ryg_status varchar(15) DEFAULT NULL, 

		test_status bit DEFAULT NULL, 
		test_detail varchar(255) DEFAULT NULL, 
		PRIMARY KEY (id)
	)    
		
	SELECT	@max_process_date=max(process_date) 
	FROM	 fl_production.dbo.[overactive_inactive]
	WHERE	isactive = 1

	SET @iterator = 101
	WHILE (@iterator < 102) -- 104
		BEGIN
			SET @selected_reason = @iterator

			SELECT	 @reason_percent = reason_weight
					,@selected_ryg_status = ryg_status
			FROM	[dbo].[t_global_reasons_ratio]
			WHERE	algo_id = 08
					AND reason_level = @selected_reason

			SET @reason_total_count = 0
			SET @reason_sample_count = 0

			SELECT	@reason_total_count = count(*)
			FROM	fl_production.dbo.[overactive_inactive]
			WHERE	ryg_status = @selected_ryg_status
					AND process_date = @max_process_date
					AND isactive = 1

			
			SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

			IF (@reason_sample_count < 0)
               SET @reason_sample_count = 50
            
			INSERT  INTO [dbo].[t_temp_08_overactiveInactive_result_test_table]
			(
				res_id
				,attend
				,specialty
				,payer_id
				,MID
				,year

				,act_total_num_of_visits
				,act_all_visits_incl_xrays
				,act_ryg_status
				
			)	
			SELECT top (@reason_sample_count)
				id
				,attend
				,specialty
				,payer_id
				,MID
				,YEAR

				,total_num_of_visits
				,all_visits_incl_xrays
				,ryg_status
            FROM fl_production.dbo.[overactive_inactive]
            WHERE isactive= 1 AND 
				ryg_status = @selected_ryg_status
				AND total_num_of_visits != all_visits_incl_xrays 
				AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1)
                     
            SET @iterator = @iterator + 1


		-- 	select @selected_ryg_status, @reason_total_count,@reason_percent ,@reason_sample_count
         END

      SELECT	@temp_count = count(*)
      FROM		[dbo].[t_temp_08_overactiveInactive_result_test_table]     


      IF (@temp_count > 0)
         SET @out_success = 1
      ELSE 
         SET @out_success = 0
	
END



GO
/****** Object:  StoredProcedure [dbo].[t_08_overactiveInactiveAxio_ts2_tc5B_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Imran Abbas
-- Create date: 02 July 2018
-- Description:	Overactive Inactive Verification
-- =============================================
CREATE PROCEDURE [dbo].[t_08_overactiveInactiveAxio_ts2_tc5B_resReasonsValidation]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUT
	,@out_test_status bit = 0 OUT
	,@out_test_detail varchar(255)= '' OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	 -- -----------------------------------------------------------------
	-- Variables Below Are Used For Holding Data From Test Table
	-- -----------------------------------------------------------------
	DECLARE @t_id INT = 0
			,@t_attend VARCHAR(50) = ''
			,@t_specialty VARCHAR(20) = ''
			,@t_payer_id VARCHAR(20) = ''
			,@t_mid VARCHAR(50) =''
			,@t_year INT=0 
  
	-- -----------------------------------------------------------------
	-- Variables Below Are Used With In Loop For Pocessing
	-- -----------------------------------------------------------------  
	DECLARE @count_all_visits_incl_xrays INT = 0
			,@max_dos_D0120_D1110 datetime2(0)
			,@has_D0120_D1110_6_month_ago INT = 0
			,@attend_at_max_dos_D0120_D1110 VARCHAR(50) = 0 -- New Variable Declared
			,@id_mini_table INT = 0 
	-- -----------------------------------------------------------------
	-- Variables Below Are Used In Marking Ambigous Results
	-- -----------------------------------------------------------------
	DECLARE @_test_detail VARCHAR(250) = 'OK'
	DECLARE @temp_count INT= 0
	DECLARE @count_total_records INT = 0
			,@count_defective_records INT = 0
  
  
	-- ------------------------------------------------------------------
  
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT id,attend,specialty,payer_id,MID,year
			FROM [dbo].[t_temp_08_overactiveInactive_result_test_table] 		    

  
	-- creating Mini table
	 
	IF(object_id(N'[dbo].[t_temp_08_overactiveInactiveAxio_mini_table]', 'U') is not null)
		DROP TABLE [dbo].t_temp_08_overactiveInactiveAxio_mini_table 

	CREATE TABLE [dbo].[t_temp_08_overactiveInactiveAxio_mini_table]
	(
		id int IDENTITY(1,1),
		attend VARCHAR(50) DEFAULT NULL,
		specialty VARCHAR(50) DEFAULT NULL,
		payer_id VARCHAR(5) DEFAULT NULL,
		MID  VARCHAR(50) DEFAULT NULL,
		proc_code VARCHAR(50) DEFAULT NULL,
		date_of_service DATETIME2(0) DEFAULT NULL,
		year int DEFAULT NULL
	)

	OPEN test_row_cursor
	FETCH test_row_cursor INTO  @t_id, @t_attend, @t_specialty, @t_payer_id,@t_mid,@t_year
	-- ===>>ALGO CORE PROCESSING STARTS
	
	WHILE @@FETCH_STATUS = 0
		BEGIN
			TRUNCATE TABLE  [dbo].[t_temp_08_overactiveInactiveAxio_mini_table]
			INSERT INTO [dbo].[t_temp_08_overactiveInactiveAxio_mini_table]
			(
				attend
				,specialty
				,payer_id
				,MID
				,proc_code
				,year
				,date_of_service
			)
			SELECT 
				pp.attend
				,pp.specialty
				,pp.payer_id
				,pp.MID
				,pp.proc_code
				,pp.year
				,date_of_service
			FROM [dbo].[t_temp_procedure_performed] as pp
				INNER JOIN
				fl_production.dbo.[ref_standard_procedures] as ref
				ON	pp.proc_code=ref.proc_code
			WHERE
				year <= @t_year
				AND 
				mid = @t_mid
			-- -----------------------------

			SELECT 	@count_all_visits_incl_xrays = COUNT(DISTINCT(date_of_service))
			FROM 	[dbo].[t_temp_08_overactiveInactiveAxio_mini_table]
			WHERE 	attend = @t_attend
					AND specialty = @t_specialty
					-- and payer_id = @t_payer_id
					AND MID =@t_mid
					AND YEAR = @t_year
					AND proc_code NOT LIKE 'D8%'
		
			UPDATE 	[dbo].[t_temp_08_overactiveInactive_result_test_table]
			SET 	exp_all_visits_incl_xrays = @count_all_visits_incl_xrays
			WHERE 	id = @t_id


			IF(@count_all_visits_incl_xrays >= 5)
				BEGIN
					SELECT 	top(1)@max_dos_D0120_D1110 = date_of_service
					FROM 	[dbo].[t_temp_08_overactiveInactiveAxio_mini_table]
					WHERE 	proc_code IN ('D0120','D1110')
					ORDER by date_of_service DESC

					SELECT	top(1) @attend_at_max_dos_D0120_D1110 = attend
									,@id_mini_table = id
					FROM	[dbo].[t_temp_08_overactiveInactiveAxio_mini_table]
					WHERE  date_of_service = @max_dos_D0120_D1110
							AND proc_code IN ('D0120','D1110')

			
					IF (@max_dos_D0120_D1110 != NULL OR @max_dos_D0120_D1110 != '')
						BEGIN
							SELECT	@has_D0120_D1110_6_month_ago=COUNT(*)
							FROM 	[dbo].[t_temp_08_overactiveInactiveAxio_mini_table]
							WHERE 	id != @id_mini_table
								-- and date_of_service between date_sub(max_dos_D0120_D1110, interval 180 day) and max_dos_D0120_D1110
									AND (date_of_service BETWEEN DATEADD(DAY,-180,@max_dos_D0120_D1110) AND @max_dos_D0120_D1110)
									AND proc_code IN ('D0120','D1110')
									AND proc_code NOT LIKE 'D8%'
									AND attend = @attend_at_max_dos_D0120_D1110 
								
							-- select DATE_SUB(max_dos_D0120_D1110, INTERVAL 180 DAY),max_dos_D0120_D1110, has_D0120_D1110_6_month_ago;
							-- select @id_mini_table,@attend_at_max_dos_D0120_D1110, @has_D0120_D1110_6_month_ago,@max_dos_D0120_D1110

							IF (@has_D0120_D1110_6_month_ago != 0)
								BEGIN
									UPDATE [dbo].[t_temp_08_overactiveInactive_result_test_table]
									SET		exp_total_num_of_visits = @count_all_visits_incl_xrays - 1
											,test_detail = 'Found Other D0120_D1110'
									WHERE 	id = @t_id
								END
							ELSE
								BEGIN
									UPDATE 	[dbo].[t_temp_08_overactiveInactive_result_test_table]
									SET 	exp_total_num_of_visits = @count_all_visits_incl_xrays
											,test_detail = 'No Other D0120_D1110 found'
									WHERE 	id = @t_id
								END	
						END
					ELSE
						BEGIN
							UPDATE 	[dbo].[t_temp_08_overactiveInactive_result_test_table]
							SET 	exp_total_num_of_visits = @count_all_visits_incl_xrays
									,test_detail = 'No maximum date found'
							WHERE 	id = @t_id
						END
				END
			ELSE
				BEGIN
					UPDATE 	[dbo].[t_temp_08_overactiveInactive_result_test_table]
					SET 	exp_total_num_of_visits = @count_all_visits_incl_xrays
							,test_detail = 'Visits are less than 5'
					WHERE 	id = @t_id
				END

			FETCH NEXT FROM test_row_cursor INTO   @t_id, @t_attend, @t_specialty, @t_payer_id,@t_mid,@t_year
		END	
	
	CLOSE test_row_cursor 
	DEALLOCATE test_row_cursor

	-- <<=== ALGO CORE PROCESSING ENDS
	UPDATE 	[dbo].[t_temp_08_overactiveInactive_result_test_table]
	SET 	exp_ryg_status = 'red'
	WHERE 	exp_total_num_of_visits >= 8
		
	UPDATE 	[dbo].[t_temp_08_overactiveInactive_result_test_table]
	SET 	exp_ryg_status = 'yellow'
	WHERE 	exp_total_num_of_visits BETWEEN 6 AND 7
		
	UPDATE 	[dbo].[t_temp_08_overactiveInactive_result_test_table]
	SET 	exp_ryg_status = 'green'
	WHERE 	exp_total_num_of_visits <= 5
		
	
	
	UPDATE 	[dbo].[t_temp_08_overactiveInactive_result_test_table]
	SET 	test_status = 1
	WHERE 	act_ryg_status = exp_ryg_status
		
	UPDATE 	[dbo].[t_temp_08_overactiveInactive_result_test_table]
	SET 	test_status = 0
	WHERE 	act_ryg_status != exp_ryg_status
		




	-- MARKING AMBIGUOUS RECORDS(status column and test detail)
	
	-- ------------------------------------------------------------------------------------------------------------------
	
	SELECT @count_total_records  = COUNT(*) 
	FROM [dbo].[t_temp_08_overactiveInactive_result_test_table]

	SELECT @count_defective_records = COUNT(*) 
	FROM [dbo].[t_temp_08_overactiveInactive_result_test_table] 
	WHERE test_status=0
	
	SET @temp_count=0
	SELECT @temp_count = COUNT(*) 
	FROM [dbo].[t_temp_08_overactiveInactive_result_test_table] 
	WHERE  test_status IS NULL

	IF(@temp_count != 0)
		BEGIN
			SET @out_success=0
			SELECT @out_success
		END
	ELSE
		BEGIN
			SET @out_success= 1
			IF(@count_defective_records=0)
				BEGIN
					SET @out_test_status= 1
					SET @out_test_detail=cast(@count_total_records as varchar) +' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status= 0
					SET @out_test_detail=CAST(@count_defective_records as VARCHAR) + ' ambiguous records found out of '
											+ CAST(@count_total_records as VARCHAR)
				END 
		END 
END



GO
/****** Object:  StoredProcedure [dbo].[t_11____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

Create PROCEDURE [dbo].[t_11____________________]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

   END

GO
/****** Object:  StoredProcedure [dbo].[t_11_primToothExt_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

Create PROCEDURE [dbo].[t_11_primToothExt_TS2_RESULT_TABLE]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @tc_success int = 0

      DECLARE
         @tc_status int = 0

      DECLARE
         @tc_detail nvarchar(100) = N'No detail'

      DECLARE
         @start_time datetime2(0) = NULL

      SET @start_time = getdate()

      EXECUTE dbo.t_11_primToothExt_ts2_tc1A_testTableGen

      EXECUTE dbo.t_11_primToothExt_ts2_tc5B_resReasonsValidation

     



   END 



GO
/****** Object:  StoredProcedure [dbo].[t_11_primToothExt_ts2_tc1A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_11_primToothExt_ts2_tc1A_testTableGen]
  @out_success bit  OUTPUT
AS
BEGIN
	
	DECLARE @reason_percent DECIMAL(5,2),
			 @reason_total_count int ,
			 @temp_count INT,
			 @reason_sample_count INT,
			 @selected_reason INT,
			 @iterator INT,
			 @_ryg_status VARCHAR(99)
			 ,@max_process_date DATETIME2(0)
 
	if(object_id(N'[dbo].[t_temp_11_primToothExt_test_table]', 'U') is not null)
		BEGIN
			DROP TABLE [dbo].[t_temp_11_primToothExt_test_table]
		END

	
	CREATE TABLE [dbo].[t_temp_11_primToothExt_test_table]
	(
		id BIGINT IDENTITY(1,1),
		res_id BIGINT  DEFAULT NULL,
		attend VARCHAR(40) DEFAULT NULL,
		mid VARCHAR(99) DEFAULT NULL,
		date_of_service DATETIME DEFAULT NULL,
		patient_age INT DEFAULT 0,
		tooth_no Varchar(15) Default Null, 
		actual_reason_level INT DEFAULT NULL,
		expected_reason_level INT DEFAULT NULL,
		act_ryg_status VARCHAR(15) DEFAULT NULL,
		exp_ryg_status VARCHAR(15) DEFAULT NULL,
		test_status bit DEFAULT NULL,
		test_detail varchar(99) DEFAULT NULL,
		PRIMARY KEY (id)
	)

	SELECT	@max_process_date = max(process_date) 
	FROM	fl_production.dbo.[results_primary_tooth_ext]
	WHERE	isactive  = 1

	SET @iterator = 1
    WHILE(@iterator < 3) -- 3
	Begin

		SET	 @selected_reason = @iterator

		SELECT @reason_percent=reason_weight 
		FROM [dbo].[t_global_reasons_ratio]  
		WHERE algo_id=11 AND reason_level=@selected_reason

		SET @reason_total_count=0
		SET @reason_sample_count=0

		/*
		IF(@selected_reason = 1) 
			begin
				SELECT  @reason_total_count= COUNT(*)  FROM fl_production.dbo.[results_primary_tooth_ext]
				WHERE ryg_status='red'
				SET @_ryg_status = 'red'
			end
		ELSE
			begin
				SELECT @reason_total_count=COUNT(*)  FROM fl_production.dbo.[results_primary_tooth_ext] 
				WHERE ryg_status='green'
				SET @_ryg_status = 'green'
			end
		*/


		SELECT  @reason_total_count= COUNT(*)  
		FROM	fl_production.dbo.[results_primary_tooth_ext]
		WHERE	reason_level = @selected_reason
				AND isactive = 1
				AND process_date = @max_process_date

		SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

		IF (@reason_sample_count < 0)
			SET @reason_sample_count = 50
         
	

		INSERT INTO [dbo].[t_temp_11_primToothExt_test_table]
		(
			res_id,
			attend,
			MID,
			date_of_service,
			patient_age,
			tooth_no,
			actual_reason_level,
			act_ryg_status
		)
		SELECT top (@reason_sample_count)	
			id, 
			attend, 
			MID, 
			date_of_service, 
			patient_age,
			tooth_no,
	 		reason_level, 
			ryg_status
		FROM 	fl_production.dbo.[results_primary_tooth_ext]
		WHERE 	reason_level = @selected_reason
				AND process_date = @max_process_date
				AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1)
				AND isactive=1 

		SET @iterator = @iterator + 1;
	END



	SELECT	@temp_count = count(*)
    FROM	[dbo].[t_temp_11_primToothExt_test_table] 
	where	test_status is null    


      IF (@temp_count > 0)
         SET @out_success = 1
      ELSE 
         SET @out_success = 0
   END






GO
/****** Object:  StoredProcedure [dbo].[t_11_primToothExt_ts2_tc5B_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_11_primToothExt_ts2_tc5B_resReasonsValidation]
	-- Add the parameters for the stored procedure here
	 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	  SET NOCOUNT ON;
	  SET  XACT_ABORT  ON

    -- Insert statements for procedure here
	

	DECLARE @t_id BIGINT = 0 
	 ,@t_attend VARCHAR(99) = '' 
	 ,@t_mid VARCHAR(99) = ''
	 ,@t_dos DATETIME = NULL
	 ,@t_patient_age INT = 0
	 ,@exf_min_age int =11
	 , @t_tooth_no nvarchar(99) = N''
	 , @exf_max_age INT =11;


		
 	DECLARE @temp_count INT = 0,
	 @count_total_records INT = 0, 
	 @expected_reason_level INT = 0,
	 @actual_reason_level INT = 0,
	  @count_defective_records INT = 0;



	
 
 
	DECLARE
          test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 

		    SELECT 
				  id, 
                  attend, 
                  MID, 
                  date_of_service, 
                  patient_age,
				  tooth_no
            FROM [dbo].[t_temp_11_primToothExt_test_table];

	OPEN test_row_cursor
	
	FETCH  FROM test_row_cursor
                INTO 
                  @t_id, 
                  @t_attend, 
                  @t_mid, 
                  @t_dos, 
                  @t_patient_age,
				  @t_tooth_no
				  	

	WHILE @@FETCH_STATUS = 0
	
	BEGIN     
	
		IF ( ISNULL(@t_tooth_no,'') !=''  AND isnull(@t_patient_age,0) != 0 )
		--IF((@t_tooth_no !='') AND (@t_patient_age != 0) AND(@t_tooth_no IS NOT NULL) AND (@t_patient_age IS NOT NULL) )
		BEGIN 
			IF @t_tooth_no NOT IN('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T') 
				UPDATE dbo.t_temp_11_primToothExt_test_table SET expected_reason_level=-1, test_detail='Tooth No. is not in(A to T)' WHERE id=@t_id;
			ELSE 
				Begin
				
					SELECT @exf_max_age= max_age, @exf_min_age=min_age  FROM fl_production.dbo.primary_tooth_exfol_mapp WHERE tooth_no=@t_tooth_no;
					IF(@t_patient_age = @exf_max_age) 
						UPDATE dbo.t_temp_11_primToothExt_test_table SET expected_reason_level=2, exp_ryg_status = 'red' , test_detail=CONCAT('Patient Age is Equal to max_age(',@exf_max_age,') in exfoliation table.')  WHERE id=@t_id;
					ELSE
						Begin
							IF (@t_patient_age = @exf_min_age) 
								UPDATE dbo.t_temp_11_primToothExt_test_table SET expected_reason_level=2, exp_ryg_status = 'red' , test_detail=CONCAT('Patient Age is Equal to min_age(',@exf_min_age,')  in exfoliation table.')   WHERE id=@t_id;
							ELSE
								Begin
									IF (@t_patient_age BETWEEN @exf_min_age AND @exf_max_age)
										UPDATE dbo.t_temp_11_primToothExt_test_table SET expected_reason_level=2, exp_ryg_status = 'red' ,test_detail=CONCAT('Patient Age is b/w min_age(',@exf_min_age,') and max_age(',@exf_max_age,')')  WHERE id=@t_id;
									ELSE
										UPDATE dbo.t_temp_11_primToothExt_test_table SET expected_reason_level=1, exp_ryg_status = 'green',  test_detail=CONCAT('Patient Age is Not in  max_age(',@exf_min_age,') and min_age(',@exf_max_age,')') WHERE id=@t_id;
								END;
						END ;
				END ;
		END	;
		
		ELSE	
			UPDATE dbo.t_temp_11_primToothExt_test_table SET @expected_reason_level=-1, @test_detail='Invalid Data.' WHERE id=@t_id;
	
	   FETCH NEXT FROM test_row_cursor
                INTO 
                  @t_id, 
                  @t_attend, 
                  @t_mid, 
                  @t_dos, 
                  @t_patient_age,
				  @t_tooth_no;  
	END ;
	
		
    ClOSE test_row_cursor;
    DEALLOCATE test_row_cursor;


	

  UPDATE dbo.t_temp_11_primToothExt_test_table SET @out_test_status=1     WHERE actual_reason_level=expected_reason_level;
  UPDATE dbo.t_temp_11_primToothExt_test_table SET @out_test_status=0  WHERE actual_reason_level!= expected_reason_level;
  
  -- setting up records counts
  SELECT  @count_total_records=COUNT(*) FROM dbo.t_temp_11_primToothExt_test_table;
  SELECT   @count_defective_records=COUNT(*) FROM dbo.t_temp_11_primToothExt_test_table WHERE  actual_reason_level != expected_reason_level;
	 SET @temp_count=0;
  SELECT @temp_count=COUNT(*) FROM dbo.t_temp_11_primToothExt_test_table WHERE expected_reason_level IS NULL;

   IF(@temp_count=0) begin
			SET @out_test_status=1;
			SET @test_detail=CAST(@count_total_records AS varchar(50)) +
							 ' records are tested.No ambiguous record found.';
		end
		ELSE Begin
			SET @out_test_status=0;
			SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
							 ' ambiguous records found out of '+ 
							 CAST(@count_total_records  AS varchar(50)) ;
		
		END 

END







GO
/****** Object:  StoredProcedure [dbo].[t_12____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

Create PROCEDURE [dbo].[t_12____________________]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

   END


GO
/****** Object:  StoredProcedure [dbo].[t_12_thirdmolar_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

Create PROCEDURE [dbo].[t_12_thirdmolar_TS2_RESULT_TABLE]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @tc_success int = 0

      DECLARE
         @tc_status int = 0

      DECLARE
         @tc_detail nvarchar(100) = N'No detail'

      DECLARE
         @start_time datetime2(0) = NULL

      SET @start_time = getdate()

      EXECUTE dbo.t_12_thirdmolar_ts2_tc3A_testTableGen

      EXECUTE dbo.t_12_thirdmolar_ts2_tc3B_resReasonsValidation

     



   END 










 ;

GO
/****** Object:  StoredProcedure [dbo].[t_12_thirdmolar_ts2_tc3A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Imran Abbas Satti
-- Create date: 6/7/2018
-- Description:	Algo # 12 [third ] reason level test table generation
-- =============================================
CREATE PROCEDURE [dbo].[t_12_thirdmolar_ts2_tc3A_testTableGen] 
	@out_success bit OUTPUT
AS
BEGIN
	SET  XACT_ABORT  ON
    SET  NOCOUNT  ON

	SET @out_success = NULL

	DECLARE
		@reason_percent decimal(5, 2)
		,@reason_total_count int
		,@temp_count int
		,@reason_sample_count int
		,@selected_reason int
		,@iterator int
		,@max_process_date DATETIME2(0)


	if(object_id(N'[dbo].[t_temp_12_thirdMolar_result_test_table]', 'U') is not null)
		DROP TABLE [dbo].[t_temp_12_thirdMolar_result_test_table] 
	  
	CREATE TABLE [dbo].[t_temp_12_thirdMolar_result_test_table]
	(
		id bigint IDENTITY(1,1), 
		res_id bigint DEFAULT NULL, 
		attend varchar(40)  DEFAULT NULL, 
		mid varchar(99) DEFAULT NULL, 
		proc_code varchar(99)  DEFAULT NULL, 
		tooth_no varchar(99) DEFAULT NULL, 
		date_of_service datetime2(0) DEFAULT NULL,
		patient_age varchar(99) DEFAULT NULL, 
		
		act_reason_level int DEFAULT NULL, 
		exp_reason_level int DEFAULT NULL, 
		
		act_ryg_status varchar(15) DEFAULT NULL, 
		exp_ryg_status varchar(15) DEFAULT NULL, 
		
		act_status varchar(100) DEFAULT NULL,
		exp_status varchar(100) DEFAULT NULL,

		test_status bit DEFAULT NULL, 
		test_detail varchar(255) DEFAULT NULL, 
		PRIMARY KEY (id)
	)    

	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.[results_third_molar]
	WHERE	isactive = 1



	SET @iterator = 1
	WHILE (@iterator < 3)
		BEGIN
			SET @selected_reason = @iterator

			SELECT	 @reason_percent = reason_weight
			FROM	dbo.t_global_reasons_ratio
			WHERE	algo_id = 12 
					AND reason_level = @selected_reason

			SET @reason_total_count = 0
			SET @reason_sample_count = 0

			SELECT	@reason_total_count = count(*)
			FROM	fl_production.dbo.[results_third_molar]
			WHERE	reason_level = @selected_reason
					AND isactive = 1
					AND process_date = @max_process_date

			
			SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

			IF (@reason_sample_count <= 0)
               SET @reason_sample_count = 50
            
			
			INSERT  INTO [dbo].[t_temp_12_thirdMolar_result_test_table]
			(
				res_id 
				,attend 
				,MID
				,proc_code
				,tooth_no
				,date_of_service
				,act_reason_level
				,act_ryg_status
				,act_status
				
			)	
			SELECT top (@reason_sample_count)
				id 
				,attend 
				,MID
				,proc_code 
				,tooth_no
				,date_of_service
				,reason_level
				,ryg_status
				,status
            FROM	fl_production.dbo.[results_third_molar]
            WHERE	isactive= 1
					AND	reason_level = @selected_reason
					AND process_date = @max_process_date
					AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1)
     
                     
            SET @iterator = @iterator + 1

         END
		
      SELECT	@temp_count = count(*)
      FROM		[dbo].t_temp_12_thirdMolar_result_test_table     


      IF (@temp_count > 0)
         SET @out_success = 1
      ELSE 
         SET @out_success = 0
	
END



GO
/****** Object:  StoredProcedure [dbo].[t_12_thirdmolar_ts2_tc3B_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Imran Abbas Satti>
-- Create date: <19 June 2018>
-- Description:	<Third Molar Reasons Validation>
-- =============================================
CREATE PROCEDURE [dbo].[t_12_thirdmolar_ts2_tc3B_resReasonsValidation]
	-- Add the parameters for the stored procedure here
	 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
	
	DECLARE @t_id BIGINT = 0 
			,@t_attend VARCHAR(99) = '' 
			,@t_mid VARCHAR(99) = ''
			,@t_tooth_no varchar(99) = ''


		
	DECLARE @temp_count INT = 0,
			@count_total_records INT = 0, 
			@exp_reason_level INT = 0,
			@act_reason_level INT = 0,
			@count_defective_records INT = 0;
 
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT 
				id 
				,attend 
				,MID
				,tooth_no
			FROM [dbo].[t_temp_12_thirdMolar_result_test_table]


	OPEN test_row_cursor
	
	FETCH  FROM test_row_cursor INTO  @t_id, @t_attend, @t_mid, @t_tooth_no
				  	
	WHILE @@FETCH_STATUS = 0
	BEGIN -- <=== Algo Core Processing Starts    
		
		IF (@t_tooth_no IN ('01','1','16','17','32','51','66','67','82'))
			BEGIN
				UPDATE	[dbo].[t_temp_12_thirdMolar_result_test_table] 
				SET		exp_reason_level=1
						,exp_ryg_status = 'green'
						,test_detail='IN 1' 
				WHERE	 id=@t_id
			END
		ELSE
			BEGIN
				UPDATE	[dbo].[t_temp_12_thirdMolar_result_test_table] 
				SET		exp_reason_level=2
						,exp_ryg_status = 'red'
						,test_detail='IN 2' 
				WHERE	 id=@t_id
			END 

		FETCH NEXT FROM test_row_cursor INTO @t_id, @t_attend, @t_mid, @t_tooth_no
		
	END -- <=== Algo Core Processing Ends	
		
    ClOSE test_row_cursor
    DEALLOCATE test_row_cursor

	



	UPDATE	[dbo].[t_temp_12_thirdMolar_result_test_table]  
	SET		test_status=1     
	WHERE	act_reason_level=exp_reason_level

	UPDATE [dbo].[t_temp_12_thirdMolar_result_test_table]  
	SET		test_status=0  
	WHERE	 act_reason_level!= exp_reason_level

  -- setting up records counts
	SELECT	 @count_total_records = COUNT(*) 
	FROM	[dbo].[t_temp_12_thirdMolar_result_test_table]

	SELECT   @count_defective_records=COUNT(*) 
	FROM	[dbo].[t_temp_12_thirdMolar_result_test_table]  
	WHERE	act_reason_level != exp_reason_level

	SET @temp_count=0
	SELECT	 @temp_count=COUNT(*) 
	FROM	[dbo].[t_temp_12_thirdMolar_result_test_table]  
	WHERE	exp_reason_level IS NULL
	
	-- SETTING UP OUTPUT PARAMETERS
	IF(@temp_count > 0) 
		BEGIN
			SET @out_success=0	
		END
	ELSE 
		BEGIN
			SET @out_success=1
			IF(@count_defective_records = 0)
				BEGIN
					SET @out_test_status=1
		        	SET @test_detail=CAST(@count_total_records AS varchar(50)) +
								' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status=0
					SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
								' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) 
				END
		END 



END




GO
/****** Object:  StoredProcedure [dbo].[t_13____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_13____________________]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   
END


GO
/****** Object:  StoredProcedure [dbo].[t_13_simpleProphy4a_ts2_tc5A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Imran Abbas Satti
-- Create date: 6/7/2018
-- Description:	Algo # 14 [4a] reason level test table generation
-- =============================================
CREATE PROCEDURE [dbo].[t_13_simpleProphy4a_ts2_tc5A_testTableGen] 
	@out_success bit OUTPUT
AS
BEGIN
	SET  XACT_ABORT  ON
    SET  NOCOUNT  ON

	SET @out_success = NULL

	DECLARE
		@reason_percent decimal(5, 2)
		,@reason_total_count int
		,@temp_count int
		,@reason_sample_count int
		,@selected_reason int
		,@iterator int
		,@max_process_date DATETIME2(0)

	if(object_id(N'[dbo].[t_temp_13_simpleProphy4a_result_test_table]', 'U') is not null)
		DROP TABLE dbo.t_temp_13_simpleProphy4a_result_test_table 
	  
	CREATE TABLE [dbo].[t_temp_13_simpleProphy4a_result_test_table]
	(
		id bigint IDENTITY(1,1), 
		res_id bigint DEFAULT NULL, 
		attend varchar(40)  DEFAULT NULL, 
		mid varchar(99) DEFAULT NULL, 
		proc_code varchar(99)  DEFAULT NULL, 
		date_of_service datetime2(0) DEFAULT NULL,
		patient_age varchar(99) DEFAULT NULL, 
		
		act_reason_level int DEFAULT NULL, 
		exp_reason_level int DEFAULT NULL, 
		
		act_ryg_status varchar(15) DEFAULT NULL, 
		exp_ryg_status varchar(15) DEFAULT NULL, 
		
		act_status varchar(100) DEFAULT NULL,
		exp_status varchar(100) DEFAULT NULL,

		test_status bit DEFAULT NULL, 
		test_detail varchar(255) DEFAULT NULL, 
		PRIMARY KEY (id)
	)    

	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.[results_perio_scaling_4a]
	WHERE	isactive = 1


	SET @iterator = 1
	WHILE (@iterator < 11)
		BEGIN
			SET @selected_reason = @iterator

			SELECT	 @reason_percent = reason_weight
			FROM	dbo.t_global_reasons_ratio
			WHERE	algo_id = 13 
					AND reason_level = @selected_reason

			SET @reason_total_count = 0
			SET @reason_sample_count = 0

			SELECT	@reason_total_count = count(*)
			FROM	fl_production.dbo.[results_perio_scaling_4a]
			WHERE	reason_level = @selected_reason
					AND process_date = @max_process_date
					AND isactive = 1

			
			SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

			IF (@reason_sample_count <= 0)
               SET @reason_sample_count = 50
            

			INSERT  INTO [dbo].[t_temp_13_simpleProphy4a_result_test_table]
			(
				res_id 
				,attend 
				,MID
				,proc_code
				,date_of_service
				,act_reason_level
				,act_ryg_status
				,act_status
				
			)	
			SELECT top (@reason_sample_count)
				id 
				,attend 
				,MID
				,proc_code 
				,date_of_service
				,reason_level
				,ryg_status
				,status
            FROM fl_production.dbo.[results_perio_scaling_4a]
            WHERE isactive= 1 AND 
				reason_level = @selected_reason
				AND isactive  = 1
				AND process_date = @max_process_date
				AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1)
                     
            SET @iterator = @iterator + 1

         END
		
      SELECT	@temp_count = count(*)
      FROM		[dbo].[t_temp_13_simpleProphy4a_result_test_table]     


      IF (@temp_count > 0)
         SET @out_success = 1
      ELSE 
         SET @out_success = 0
	
END


GO
/****** Object:  StoredProcedure [dbo].[t_13_simpleProphy4a_ts2_tc5B_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Imran Abbas
-- Create date: 6/7/2018
-- Description:	Calculating Expected Reason Level For Sample Data
-- =============================================
CREATE PROCEDURE [dbo].[t_13_simpleProphy4a_ts2_tc5B_resReasonsValidation] 
	@out_success bit  OUTPUT,
    @out_test_status bit  OUTPUT,
    @out_test_detail nvarchar(255)  OUTPUT
	
AS
BEGIN

	SET  XACT_ABORT  ON
	SET NOCOUNT ON;

-- ==============================================================================
--            			 Declaring All Variables 
-- ==============================================================================

  -- ---------------------------------------------------------------------------
  -- Variables below are used for storting data from test Table
	DECLARE @t_id INT
			,@t_attend VARCHAR(50)
			,@t_mid VARCHAR(50)
			,@t_dos DATETIME2(0)
			,@t_proc_code VARCHAR(50)
  
  -- ------------------------------------------------------------------------------
  -- Variables below are used in if else blocks
	DECLARE @has_D0180 INTEGER 
			,@dos_recent_D0180 DATETIME2(0) 

			-- used in block where D0180 donot exists  
	DECLARE @has_D0180_anotherDoc INT
			,@is_dos_D4342_D4341_after_D0180 INT
			,@check_for_D42xx_others INT
			,@is_dos_D4341_43_before_D42xx_Others INT

			 -- used in block where D0180 donot exists  
	DECLARE @dos_D0180_anotherDoc DATETIME2(0)

			-- used in block where D0180 exists
	DECLARE @has_D0210_within_2years  INTEGER 
	DECLARE @dos_recent_D0210 DATETIME2(0)
   
  -- ----------------------------------------------------------------------------
  -- Variables below are used after loop to hold stats of tested records
	DECLARE @temp_count INT
			,@count_total_records INT
			,@count_defective_records INT
  
	DECLARE test_row_cursor CURSOR FOR 
			SELECT id,proc_code ,attend,MID,date_of_service 
			FROM [dbo].[t_temp_13_simpleProphy4a_result_test_table]
					    

	OPEN test_row_cursor ;
	FETCH test_row_cursor INTO  @t_id,@t_proc_code, @t_attend, @t_mid,@t_dos;

	WHILE @@FETCH_STATUS = 0
	BEGIN -- While Starts	
		-- ----------------------------------------------------------Outer if starts----------------------------------------------------------------
		IF ((@t_dos != '') AND (@t_dos IS NOT NULL) AND (@t_attend !='') AND (@t_mid !='') AND (@t_proc_code !='') AND (@t_attend IS NOT NULL) AND (@t_mid IS NOT NULL) AND (@t_proc_code IS NOT NULL))
			BEGIN -- checking D0180 Exists or not
				SELECT @has_D0180 = COUNT(*),@dos_recent_D0180 = MAX(date_of_service) 
				FROM fl_production.[dbo].[src_perio_scaling_4a] 
				WHERE proc_code='D0180' AND attend=@t_attend AND mid=@t_mid AND date_of_service <= @t_dos ;
				 
				IF(@has_D0180 = 0)
				-- =====================================================N0 D0180========================================================================
					BEGIN -- checking D0180 with another doctor
						SELECT @has_D0180_anotherDoc=COUNT(*) ,@dos_D0180_anotherDoc=MAX(date_of_service)
						FROM fl_production.[dbo].[src_perio_scaling_4a]
						WHERE proc_code='D0180' AND attend != @t_attend AND mid=@t_mid AND @t_dos>date_of_service;
						
						-- ------------------------------------------IF A Starts-----------------------------------------------------
						IF(@has_D0180_anotherDoc=0) 
							BEGIN -- >> REASON 1
								UPDATE [dbo].[t_temp_13_simpleProphy4a_result_test_table] 
								SET exp_reason_level=1,
									exp_ryg_status='red',
									-- exp_status='Disallow Codes D4342 , D4341',
									test_detail='No D0180 with other attend.'
								WHERE id=@t_id
							END
						ELSE
							BEGIN
							-- --------------------------------IF B Starts------------------------------------------------
							-- checking dos of D4342,D4341 is less then D0180
							IF(@t_dos>@dos_D0180_anotherDoc)
								BEGIN
									-- -----------------------IF C Starts -------------------------------------
									-- checking dos of D4342,D4341 is within one year after D0180
									IF(@t_dos BETWEEN (@dos_D0180_anotherDoc) AND (DATEADD(YEAR,1, @dos_D0180_anotherDoc)) )
										BEGIN
											-- Checking for D42xx, D4320, D4321, D4355, D4381
											SELECT @check_for_D42xx_others = count(*) 
											FROM fl_production.[dbo].[src_perio_scaling_4a]
											WHERE (proc_code LIKE 'D42%' OR proc_code IN('D4320','D4321','D4355','D4381')) AND mid=@t_mid
											AND date_of_service <= @t_dos;
											-- ---------------------- IF D Starts ---------------------
											IF(@check_for_D42xx_others=0)
												BEGIN -- >> REASON 3
													UPDATE [dbo].[t_temp_13_simpleProphy4a_result_test_table] 
													SET exp_reason_level=3,
														exp_ryg_status='green',
														-- exp_status='Allow Codes D4342 , D4341',
														test_detail='Code found in D42xx, D4320, D4321, D4355, D4381.'
														WHERE id=@t_id;
												END
											ELSE
												BEGIN
													-- Does DOS D4341, D4342 occur before DOS D42xx, D4320, D4321, D4355, D4381 ?
													SELECT @is_dos_D4341_43_before_D42xx_Others = count(*)
													FROM  fl_production.[dbo].[src_perio_scaling_4a]
													WHERE proc_code != @t_proc_code AND (proc_code IN('D4320','D4321','D4355','D4381') OR proc_code LIKE 'D42%') 
													AND mid=@t_mid 
													AND (date_of_service BETWEEN (DATEADD(YEAR,-1,@t_dos)) AND @t_dos);
													-- ------------- IF E Starts ---------------   
													IF(@is_dos_D4341_43_before_D42xx_Others=0) 
														BEGIN -- >> Reason 4
															UPDATE [dbo].[t_temp_13_simpleProphy4a_result_test_table] 
															SET exp_reason_level=4,
																exp_ryg_status='red',
																-- exp_status='Disallow Codes D4342 , D4341',
																test_detail='No DOS for D4341, D4342 occur before DOS D42xx, D4320, D4321, D4355, D4381.'
															WHERE id=@t_id;
														END
													ELSE
														BEGIN -- >> Reason 5
															UPDATE [dbo].[t_temp_13_simpleProphy4a_result_test_table] 
															SET exp_reason_level=5,
																exp_ryg_status='green',
																-- exp_status='Allow Codes D4342 , D4341',
																test_detail='DOS for D4341, D4342 occur before DOS D42xx, D4320, D4321, D4355, D4381.'
															WHERE id=@t_id; 
														END
												END
													-- ------------- IF E Starts ---------------  
										END
										-- ---------------------- IF D Ends ---------------------
									ELSE
										BEGIN -- >> REASON 2
											UPDATE [dbo].[t_temp_13_simpleProphy4a_result_test_table] 
											SET exp_reason_level=2,
												exp_ryg_status='red',
												-- exp_status='Disallow Codes D4342 , D4341',
												test_detail='DOS D4342, D4341 does not occurs within 1 year after DOS D0180 with the other doctor.'
											WHERE id=@t_id
										END
									-- -----------------------IF C Ends -------------------------------------
								END
							ELSE
								BEGIN
									-- >> REASON 1
									UPDATE [dbo].[t_temp_13_simpleProphy4a_result_test_table] 
									SET exp_reason_level=1,
										exp_ryg_status='red',
										-- exp_status='Disallow Codes D4342 , D4341',
										test_detail='Has D0180 with other attend but DOS D4342, D4341 does not occurs after DOS D0180.'
									WHERE id=@t_id;
								END
							-- ------------------------------------IF B Ends -------------------------------------------
							
							END
					-- ------------------------------------------------------IF A Ends-------------------------------------------------------------
					-- ======================================================================================================================================
					
					END
				ELSE
				-- ===================================================Yes D0180==========================================================================			
					BEGIN
						-- Checking DOS for D0210 exists or not
						SELECT  @dos_recent_D0210 = MAX(date_of_service)
						FROM fl_production.[dbo].[src_perio_scaling_4a]
						-- where mid=@t_mid and proc_code='D0210' and date_of_service <=@t_dos;
						WHERE mid=@t_mid AND proc_code='D0210' AND date_of_service <= @dos_recent_D0180;
						
						-- -------------------------------------------------------- IF "F" Starts -----------------------------------------------------------
						IF(@dos_recent_D0210 IS NULL OR @dos_recent_D0210='')
								BEGIN -- >> REASON 6
								UPDATE	[dbo].[t_temp_13_simpleProphy4a_result_test_table] 
								SET		exp_reason_level=6,
										exp_ryg_status='red',
										-- exp_status='Disallow Codes D4342 , D4341',
										test_detail='Has Null DOS for procedure code (D0210).'
								WHERE id=@t_id
							END
						ELSE
							BEGIN
								-- ----------------------------------------------- IF "G" Starts ---------------------------------------------------
								-- Checking if Full Mouth Xray D0210 is within 2 years of the date of the most current D0180 
								IF ( NOT(@dos_recent_D0210 BETWEEN (DATEADD(YEAR,-2,@dos_recent_D0180)) AND (@dos_recent_D0180) ) )
								-- if ( Not(@dos_recent_D0210 BETWEEN (@dos_recent_D0180) AND (DATE_ADD(@dos_recent_D0180,INTERVAL 2 YEAR)) ))then
									BEGIN -- >> REASON 6
										UPDATE	 [dbo].[t_temp_13_simpleProphy4a_result_test_table] 
										SET		exp_reason_level=6,
												exp_ryg_status='red',
												-- exp_status='Disallow Codes D4342 , D4341',
												test_detail= 'DOS of D0210 '
																+ '['+cast(@dos_recent_D0210 as varchar)+']'
																+ 'is not within 2 years of the DOS of the most recent D0180 '
																+ '['+ cast(@dos_recent_D0180 as varchar)+']'
										WHERE id=@t_id;
									END
								ELSE
									BEGIN
										-- -----------------------------------IF "H" Starts ------------------------------------------
										-- Compare DOS D4342, D4341 occurs within 1 year after DOS D0180?
										-- if (Not(@t_dos BETWEEN (@dos_recent_D0180) AND (DATE_ADD(@dos_recent_D0180,INTERVAL 1 YEAR))))THEN
										IF ( NOT(	@t_dos BETWEEN (@dos_recent_D0180) AND (DATEADD(YEAR,1,@dos_recent_D0180)) AND @t_dos != @dos_recent_D0180	 	))
											BEGIN -- >> REASON 7
												UPDATE	[dbo].[t_temp_13_simpleProphy4a_result_test_table] 
												SET		exp_reason_level=7,
														exp_ryg_status='red',
														-- exp_status='Disallow Codes D4342 , D4341',
														test_detail='DOS of '+ @t_proc_code 
																			 + '[' +CAST(@t_dos as varchar) + ']'
																			 + 'does not occurs within 1 year after DOS D0180'
																			 + '['+ cast(@dos_recent_D0180 as varchar)+']'
												WHERE id=@t_id;
											END
										ELSE
											BEGIN
												-- Checking for D42xx, D4320, D4321, D4355, D4381
												SELECT  @check_for_D42xx_others = count(*)
												FROM fl_production.[dbo].[src_perio_scaling_4a]
												WHERE (proc_code LIKE 'D42%' OR proc_code IN('D4320','D4321','D4355','D4381')) AND mid=@t_mid
												AND (date_of_service < @t_dos OR date_of_service = @t_dos);
												-- ---------------------- IF D Starts ---------------------
												IF(@check_for_D42xx_others=0)
													BEGIN -- >> REASON 8
														UPDATE [dbo].[t_temp_13_simpleProphy4a_result_test_table] 
														SET exp_reason_level=8,
															exp_ryg_status='green',
																		-- exp_status='Allow Codes D4342 , D4341',
																		test_detail='Code found in D42xx, D4320, D4321, D4355, D4381.'
															WHERE id=@t_id;
													END
												ELSE
													BEGIN
														-- Does DOS D4341, D4342 occur before DOS D42xx, D4320, D4321, D4355, D4381 ?
														SELECT  @is_dos_D4341_43_before_D42xx_Others = count(*)
														FROM  fl_production.[dbo].[src_perio_scaling_4a]
														WHERE proc_code != @t_proc_code AND (proc_code IN('D4320','D4321','D4355','D4381') OR proc_code LIKE 'D42%') 
														AND mid=@t_mid 
														AND (date_of_service BETWEEN (DATEADD(YEAR,-1,@t_dos)) AND @t_dos);
														-- ------------- IF E Starts ---------------   
														IF(@is_dos_D4341_43_before_D42xx_Others=0)
															BEGIN -- >> Reason 9
																UPDATE [dbo].[t_temp_13_simpleProphy4a_result_test_table] 
																SET exp_reason_level=9,
																exp_ryg_status='red',
																			-- exp_status='Disallow Codes D4342 , D4341',
																			test_detail='No DOS for D4341, D4342 occur before DOS D42xx, D4320, D4321, D4355, D4381.'
																WHERE id=@t_id;
															END
														ELSE
															BEGIN	-- >> REASON 10
																UPDATE [dbo].[t_temp_13_simpleProphy4a_result_test_table] 
																SET exp_reason_level=10,
																	exp_ryg_status='green',
																	-- exp_status='Allow Codes D4342 , D4341',
																	test_detail='DOS for D4341, D4342 occur before DOS D42xx, D4320, D4321, D4355, D4381.'
																WHERE id=@t_id; 
															END 
														-- ------------- IF E Starts ---------------  
												END
												-- ---------------------- IF D Ends ---------------------
											END
										-- -----------------------------------IF "H" Ends ------------------------------------------
									END
								-- ----------------------------------------------- IF "G" Ends ---------------------------------------------------
							END
					
						-- -------------------------------------------------------- IF "F" Ends -----------------------------------------------------------
					-- ======================================================================================================================================
					END
			END	
		ELSE
			BEGIN
				UPDATE [dbo].[t_temp_13_simpleProphy4a_result_test_table] 
				SET exp_reason_level=-1
					,test_detail='Invalid Data in record.'
				WHERE id=@t_id;
		END
		-- --------------------------------------------------------------Outer if Ends------------------------------------------------------
	FETCH NEXT FROM test_row_cursor INTO  @t_id,@t_proc_code, @t_attend, @t_mid,@t_dos;
		
	END -- While Ends
	CLOSE test_row_cursor 
	DEALLOCATE test_row_cursor

	
	-- setting up output parameters
  
	UPDATE	[dbo].[t_temp_13_simpleProphy4a_result_test_table] 
	SET		test_status=1 
	WHERE	act_reason_level=exp_reason_level

	UPDATE	[dbo].[t_temp_13_simpleProphy4a_result_test_table] 
	SET		test_status=0 
	WHERE	act_reason_level!=exp_reason_level
  
	-- setting up records counts
	SELECT  @count_total_records = COUNT(*) FROM [dbo].[t_temp_13_simpleProphy4a_result_test_table]

	SELECT  @count_defective_records = COUNT(*)  FROM [dbo].[t_temp_13_simpleProphy4a_result_test_table]
	WHERE  act_reason_level != exp_reason_level
	
	SET @temp_count=0;
	SELECT  @temp_count = COUNT(*) FROM [dbo].[t_temp_13_simpleProphy4a_result_test_table] WHERE exp_reason_level IS NULL;
	IF(@temp_count>0) 
		BEGIN
			SET @out_success=0
		END
	ELSE
		BEGIN
			SET @out_success=1;

			SET @temp_count=0;
			SELECT  @temp_count = COUNT(*) FROM [dbo].[t_temp_13_simpleProphy4a_result_test_table] WHERE act_reason_level != exp_reason_level;
			IF(@temp_count=0)
				BEGIN
					SET @out_test_status=1
					SET @out_test_detail=cast(@count_total_records as varchar)+' records are tested.No ambiguous record found.'
				END
			ELSE
				BEGIN
					SET @out_test_status=0
					SET @out_test_detail=cast(@count_defective_records as varchar)+' ambiguous records found out of '+cast(@count_total_records as varchar)
				END 
	END 
	
	
END


GO
/****** Object:  StoredProcedure [dbo].[t_14____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_14____________________]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

END


GO
/****** Object:  StoredProcedure [dbo].[t_14_simpleProphy4b_ts1_tc5A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Imran Abbas
-- Create date: 6/4/2018 2:48:45 PM
-- Description:	Generating test table for algorithm 14
-- =============================================
CREATE PROCEDURE [dbo].[t_14_simpleProphy4b_ts1_tc5A_testTableGen]	 
	@out_success bit OUTPUT
	
AS
BEGIN
	SET  XACT_ABORT  ON
    SET  NOCOUNT  ON

	SET @out_success = NULL

	DECLARE
		@reason_percent decimal(5, 2)
		,@reason_total_count int
		,@temp_count int
		,@reason_sample_count int
		,@selected_reason int
		,@iterator int
		,@max_process_date DATETIME2(0)

	if(object_id(N'[dbo].[t_temp_14_simpleProphy_result_test_table]', 'U') is not null)
		DROP TABLE [dbo].[t_temp_14_simpleProphy_result_test_table] 
	  
	CREATE TABLE [dbo].[t_temp_14_simpleProphy_result_test_table]
	(
		id bigint IDENTITY(1,1), 
		res_id bigint DEFAULT NULL, 
		attend varchar(40)  DEFAULT NULL, 
		mid varchar(99) DEFAULT NULL, 
		proc_code varchar(99)  DEFAULT NULL, 
		date_of_service datetime2(0) DEFAULT NULL,
		patient_age varchar(99) DEFAULT NULL, 
		
		act_reason_level int DEFAULT NULL, 
		exp_reason_level int DEFAULT NULL, 
		
		act_ryg_status varchar(15) DEFAULT NULL, 
		exp_ryg_status varchar(15) DEFAULT NULL, 

		test_status bit DEFAULT NULL, 
		test_detail varchar(255) DEFAULT NULL, 
		PRIMARY KEY (id)
	)    

	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.[results_simple_prophy_4b]
	WHERE	isactive = 1


	SET @iterator = 1
	WHILE (@iterator < 6)
		BEGIN
			SET @selected_reason = @iterator

			SELECT	 @reason_percent = reason_weight
			FROM	dbo.t_global_reasons_ratio
			WHERE	algo_id = 14 
					AND reason_level = @selected_reason

			SET @reason_total_count = 0
			SET @reason_sample_count = 0

			SELECT	@reason_total_count = count(*)
			FROM	fl_production.dbo.results_simple_prophy_4b
			WHERE	reason_level = @selected_reason
					AND isactive = 1
					AND process_date = @max_process_date

			
			SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

			IF (@reason_sample_count < 0)
               SET @reason_sample_count = 50
            
			INSERT  INTO [dbo].[t_temp_14_simpleProphy_result_test_table]
			(
				res_id 
				,attend 
				,MID
				,proc_code
				,date_of_service
				,act_reason_level
				,act_ryg_status
				
			)	
			SELECT top (@reason_sample_count)
				id 
				,attend 
				,MID
				,proc_code 
				,date_of_service
				,reason_level
				,ryg_status
            FROM fl_production.dbo.[results_simple_prophy_4b]
            WHERE isactive= 1 AND 
				reason_level = @selected_reason
				AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1)
                     
            SET @iterator = @iterator + 1

         END

      SELECT	@temp_count = count(*)
      FROM		[dbo].[t_temp_14_simpleProphy_result_test_table]     


      IF (@temp_count > 0)
         SET @out_success = 1
      ELSE 
         SET @out_success = 0
	
END


GO
/****** Object:  StoredProcedure [dbo].[t_14_simpleProphy4b_ts1_tc5B_reasons]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Imran Abbas
-- Create date: 6/4/2018 2:46:02 PM 
-- Description:	Verifying result table [results_simple_prophy_4b]
-- =============================================
CREATE PROCEDURE [dbo].[t_14_simpleProphy4b_ts1_tc5B_reasons] 
	
	@out_success bit output , @out_test_status bit output, @out_test_detail varchar(250) output
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @t_id int
	DECLARE @t_dos_d4910 datetime2(0)
	DECLARE @t_attend varchar(50), @t_mid varchar(50)
  
	DECLARE @p_d4910 varchar(50) , @p_d0180 varchar(50), @temp_proc_code varchar(50)
	DECLARE @dos_d4910 datetime2(0), @dos_d0180 datetime2(0), @dos_temp datetime2(0)
			,@dos_year_back datetime2(0), @dos_d4xxx datetime2(0)

	DECLARE @temp_count int, @temp_count_1 int, @temp_count_2 int, @temp_count_3 int,
			@count_total_records int, @count_defective_records int

	DECLARE test_row_cursor CURSOR FOR 
			SELECT id, attend, MID, date_of_service 
			FROM [dbo].[t_temp_14_simpleProphy_result_test_table]		    
	
	OPEN test_row_cursor ;
	FETCH test_row_cursor INTO  @t_id, @t_attend, @t_mid, @t_dos_d4910;
	
	
	WHILE @@FETCH_STATUS = 0
	BEGIN -- While Starts	    
		-- =========================================== IF "A" STARTS =============================================== --
		IF( (@t_attend!='') AND (@t_attend IS NOT NULL) AND (@t_mid !='') AND (@t_mid IS NOT NULL) AND (@t_dos_d4910 !='' ) AND (@t_dos_d4910 IS NOT NULL))
			BEGIN -- [1]
				SET @temp_count =0
				SELECT 	@temp_count = COUNT(*) 
				FROM 	fl_production.dbo.[src_simple_prophy_4b] 
				WHERE 	mid=@t_mid 
						AND attend=@t_attend 
						AND proc_code='D4910' 
						AND date_of_service=@t_dos_d4910
				-- =========================================== IF "B" STARTS =============================================== --
				IF(@temp_count != 0) 
					BEGIN -- [2]
						SET @temp_count = 0; SET @temp_count_1 = 0; SET @temp_count_2 = 0; SET @temp_count_3 = 0;
				
						SELECT @temp_count_1 = 	COUNT(*)
						FROM 	fl_production.dbo.[src_simple_prophy_4b] 
						WHERE 	mid=@t_mid
							AND  proc_code LIKE 'D4%'
							AND date_of_service < @t_dos_d4910 
							-- AND date_of_service BETWEEN (DATEADD(month,-6,@t_dos_d4910)) AND @t_dos_d4910
							-- Important Change Below 
							AND date_of_service BETWEEN (DATEADD(DAY,-180,@t_dos_d4910)) AND @t_dos_d4910

						SELECT 	@temp_count_2 = COUNT(*) 
						FROM 	fl_production.dbo.[src_simple_prophy_4b] 
						WHERE 	mid = @t_mid 
							AND  proc_code LIKE 'D4%' 
							AND  date_of_service = @t_dos_d4910 
							AND proc_code != 'D4910'
						
						SELECT 	@temp_count_3 = COUNT(*)
						FROM 	fl_production.dbo.[src_simple_prophy_4b] 
						WHERE 	mid = @t_mid 
							AND  date_of_service = @t_dos_d4910 
							AND proc_code = 'D4910'
						
						IF(@temp_count_3 = 1)
							SET @temp_count_3 = 0
						SET @temp_count = @temp_count_1 + @temp_count_2 + @temp_count_3
						-- =========================================== IF "C" STARTS =============================================== --
						IF(@temp_count = 0)
							BEGIN --[3]
								SET @temp_count=0;
								SELECT  @temp_count = count(*) 
								FROM 	fl_production.dbo.[src_simple_prophy_4b] 
								WHERE 	MID=@t_mid
										AND proc_code='D0180' 
										AND (date_of_service < @t_dos_d4910 OR date_of_service=@t_dos_d4910)
			
								-- =========================================== IF "D" STARTS =============================================== --
								IF(@temp_count != 0) -- >> Reason 1 and 2
									BEGIN -- [4]
										SET @temp_count = 0;
										SELECT 	@dos_d0180=MAX(date_of_service)
										FROM 	fl_production.dbo.[src_simple_prophy_4b] 
										WHERE 	MID=@t_mid
												AND proc_code='D0180' 
												AND (date_of_service < @t_dos_d4910 OR date_of_service=@t_dos_d4910);

										IF(@dos_d0180 != '') 
											BEGIN -- [5]
												SET @dos_year_back = DATEADD(YEAR,-1,@t_dos_d4910);
												IF((@dos_d0180 BETWEEN @dos_year_back AND @t_dos_d4910 ) OR (@dos_d0180 = @t_dos_d4910 ))
													BEGIN
														UPDATE 	[dbo].[t_temp_14_simpleProphy_result_test_table]  
														SET 	exp_reason_level=1, 
																test_detail='IN 1' 
														WHERE 	id=@t_id
													END
												ELSE
													BEGIN
														UPDATE 	[dbo].[t_temp_14_simpleProphy_result_test_table]  
														SET 	exp_reason_level=2, test_detail='IN 2' 
														WHERE 	id=@t_id
													END 
											END -- [5]	
										ELSE
											BEGIN 
												UPDATE 	[dbo].[t_temp_14_simpleProphy_result_test_table]  
												SET 	exp_reason_level=-1, 
													test_detail='Dos for D0180 is null' 
												WHERE 	id=@t_id
											END 
									END -- [4]

								ELSE	-- >> Reason 3 and 4
									BEGIN -- [6]
										SET @temp_count = 0;
										SELECT 	@temp_count = COUNT(*), @dos_d4xxx = MAX(date_of_service) 
										FROM 	fl_production.dbo.[src_simple_prophy_4b] 
										WHERE 	MID=@t_mid
												AND proc_code LIKE 'D4%' 
												AND attend <> @t_attend 
												AND date_of_service <= @t_dos_d4910 

										IF (@temp_count != 0)
											BEGIN
												SET @dos_temp = NULL;
												-- SET @dos_temp=DATE_ADD(@dos_d4xxx,INTERVAL 183 DAY);
												SET  @dos_temp = DATEADD(Day,183,@dos_d4xxx);
												IF(@t_dos_d4910 <= @dos_temp )
													BEGIN
														UPDATE 	[dbo].[t_temp_14_simpleProphy_result_test_table]  
														SET 	exp_reason_level=3, 
																test_detail=CONCAT('DOS(d4910) ',@t_dos_d4910,' is less then DOS(d4xxx) ',@dos_temp ,' plus 183 days') 
														WHERE id=@t_id
													END
												ELSE
													BEGIN
														UPDATE 	[dbo].[t_temp_14_simpleProphy_result_test_table]  
														SET 	exp_reason_level=4, 
																test_detail=CONCAT('DOS(d4910) ',@t_dos_d4910,' is not less then DOS(d4xxx) ',@dos_temp ,' plus 183 days') 
														WHERE 	id=@t_id
													END
											END	
									ELSE
										BEGIN
											UPDATE 	[dbo].[t_temp_14_simpleProphy_result_test_table]  
											SET 	exp_reason_level=4, test_detail='No code for this patient like D4xxx found with other doctor.' 
											WHERE 	id=@t_id
										END
									END -- [6]
								-- =========================================== IF "D" ENDS =============================================== --
							END -- [3]
							-- Check
						ELSE
							BEGIN
								UPDATE 	[dbo].[t_temp_14_simpleProphy_result_test_table]  
								SET 	exp_reason_level=5, test_detail='There is D4xxx with in history of D4910' 
								WHERE 	id=@t_id
							END
							-- =========================================== IF "C" ENDS =============================================== --
					END -- [2]	
				ELSE
					BEGIN			
						UPDATE 	[dbo].[t_temp_14_simpleProphy_result_test_table] 
						SET 	exp_reason_level=-2, test_detail='proc code D4910 or dos or both does not exist'
						WHERE 	id=@t_id
					END
				-- =========================================== IF "B" ENDS =============================================== --
			END -- [1]
		ELSE
			BEGIN
				UPDATE 	[dbo].[t_temp_14_simpleProphy_result_test_table] 
				SET 	exp_reason_level=-1
						,test_detail='Invalid Data.' 
				WHERE 	id=@t_id
			END
	-- =========================================== IF "A" ENDS =============================================== --


		FETCH NEXT FROM test_row_cursor INTO  @t_id, @t_attend, @t_mid, @t_dos_d4910;    
	END	-- While Ends	
			  		    
	CLOSE test_row_cursor 
	DEALLOCATE test_row_cursor

	


  
  UPDATE [dbo].[t_temp_14_simpleProphy_result_test_table]  SET test_status=1 WHERE act_reason_level=exp_reason_level
  UPDATE [dbo].[t_temp_14_simpleProphy_result_test_table]  SET test_status=0 WHERE act_reason_level!=exp_reason_level
  -- setting up records counts
  SELECT @count_total_records = COUNT(*) FROM [dbo].[t_temp_14_simpleProphy_result_test_table] 
  SELECT  @count_defective_records = COUNT(*)  FROM [dbo].[t_temp_14_simpleProphy_result_test_table]  WHERE  act_reason_level != exp_reason_level;
	
  SET @temp_count=0;
  SELECT  @temp_count= COUNT(*)  FROM [dbo].[t_temp_14_simpleProphy_result_test_table]  WHERE exp_reason_level IS NULL;
  IF(@temp_count>0)
	BEGIN
		SET @out_success= 0
	END
  ELSE
	BEGIN
		SET @out_success= 1;
		SET @temp_count=0;
		SELECT @temp_count=COUNT(*)  FROM [dbo].[t_temp_14_simpleProphy_result_test_table]  WHERE act_reason_level != exp_reason_level;
		IF(@temp_count=0)
			BEGIN
				SET @out_test_status=1
				SET @out_test_detail= CAST(@count_total_records as varchar(50)) +' records are tested.No ambiguous record found'
			END
		ELSE
			BEGIN
				SET @out_test_status=0;
				SET @out_test_detail= CAST(@count_defective_records as varchar(50))
						+' ambiguous records found out of ' + 
						CAST(@count_total_records as varchar(50))
			END
	END
  
  -- select @out_success  , @out_test_status , @out_test_detail 
END

GO
/****** Object:  StoredProcedure [dbo].[t_15____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

CREATE PROCEDURE [dbo].[t_15____________________]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

   END

GO
/****** Object:  StoredProcedure [dbo].[t_15_unJustFMX_ts2_tc1A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Imran Abbas
-- Create date: 25 June 2018
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_15_unJustFMX_ts2_tc1A_testTableGen]
  @out_success bit  OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON

	DECLARE @reason_percent DECIMAL(5,2),
	     @reason_total_count int ,
		 @temp_count INT,
         @reason_sample_count INT,
         @selected_reason INT,
         @iterator INT,
         @_ryg_status VARCHAR(99) 
		 ,@max_process_date DATETIME2(0)
 
		if(object_id(N'[dbo].[t_temp_15_unJustFMX_test_table]', 'U') is not null)
			BEGIN
				DROP TABLE [dbo].[t_temp_15_unJustFMX_test_table]
			END

	CREATE TABLE [dbo].[t_temp_15_unJustFMX_test_table]
		(
		id BIGINT IDENTITY(1,1),
		res_id BIGINT  DEFAULT NULL,
		attend VARCHAR(99) DEFAULT NULL,
		proc_code varchar(99)  DEFAULT NULL, 
		mid VARCHAR(99) DEFAULT NULL,
		date_of_service DATETIME DEFAULT NULL,
		--patient_age INT DEFAULT 0,
		--tooth_no Varchar(15) Default Null, 
		actual_reason_level INT DEFAULT NULL,
		expected_reason_level INT DEFAULT NULL,
		act_ryg_status VARCHAR(15) DEFAULT NULL,
		exp_ryg_status VARCHAR(15) DEFAULT NULL,
		test_status bit DEFAULT NULL,
		test_detail nvarchar(1000) DEFAULT NULL,
		PRIMARY KEY (id)
		)

		SELECT	@max_process_date=max(process_date) 
		FROM	fl_production.dbo.[results_full_mouth_xrays]
		WHERE	isactive = 1



		SET @iterator = 1
        WHILE(@iterator < 6) 
		Begin
			SET @selected_reason = @iterator

			SELECT @reason_percent=reason_weight 
			FROM [dbo].[t_global_reasons_ratio]  
			WHERE algo_id=15 AND reason_level=@selected_reason

			SET @reason_total_count=0
			SET @reason_sample_count=0
		
			SELECT  @reason_total_count= COUNT(*)  
			FROM fl_production.dbo.[results_full_mouth_xrays]
			WHERE reason_level = @selected_reason
					AND process_date = @max_process_date
					AND isactive = 1

		
			SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100
			
			IF (@reason_sample_count < 0)
				SET @reason_sample_count = 50
            
			INSERT INTO [dbo].[t_temp_15_unJustFMX_test_table]
			(
				res_id,
				attend,
				proc_code,
				MID,
				date_of_service,
				-- patient_age,
				-- tooth_no,
				actual_reason_level,
				act_ryg_status
			)
			SELECT top (@reason_sample_count)	
				id, 
				attend, 
				proc_code,
				MID, 
				date_of_service,
				-- patient_age,
				-- tooth_no,
	 			reason_level, 
				ryg_status
			FROM 	fl_production.dbo.[results_full_mouth_xrays]
			WHERE	reason_level = @selected_reason
				AND isactive = 1
				AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1)
		

		SET @iterator = @iterator + 1;

END


	SELECT	@temp_count = count(*)
     FROM		[dbo].[t_temp_15_unJustFMX_test_table]   

	  print @temp_count

      IF (@temp_count > 0)
         SET @out_success = 1
      ELSE 
         SET @out_success = 0
   END



GO
/****** Object:  StoredProcedure [dbo].[t_15_unJustFMX_ts2_tc5B_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_15_unJustFMX_ts2_tc5B_resReasonsValidation]
	-- Add the parameters for the stored procedure here
	 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(1000)  OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	  SET NOCOUNT ON;
	  SET  XACT_ABORT  ON

    -- Insert statements for procedure here
	

	DECLARE @t_id BIGINT = 0 
	 ,@t_attend VARCHAR(99) = '' 
	 ,@t_mid VARCHAR(99) = ''
	 ,@t_dos DATETIME = NULL
	 ,@t_patient_age INT = 0
	 ,@exf_min_age int =11
	 , @t_tooth_no nvarchar(99) = N''
	 , @exf_max_age INT =11
	 ,@t_proc_code nvarchar(99) = N'';

		
 	DECLARE @temp_count INT = 0,
	 @count_total_records INT = 0, 
	 @expected_reason_level INT = 0,
	 @actual_reason_level INT = 0,
	  @count_defective_records INT = 0,
	  @is_oldPatient INT = 0, 
	  @is_inLast5year INT = 0, 
	  @has_D4xxx INT = 0, 
	  @has_D3xxx INT = 0;  
  
     

	DECLARE
          test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 

		    SELECT 
				  id, 
				  attend, 
				  proc_code,
                  MID, 
                  date_of_service 
                  
            FROM [dbo].[t_temp_15_unJustFMX_test_table];

	OPEN test_row_cursor
	
	FETCH  FROM test_row_cursor
                INTO 
                  @t_id, 
                  @t_attend, 
				  @t_proc_code,
                  @t_mid, 
                  @t_dos; 
                  
				  	

	WHILE @@FETCH_STATUS = 0
	
	BEGIN     
		IF( (@t_mid !='') AND (@t_mid IS NOT NULL) AND (@t_dos != '' ) AND (@t_dos IS NOT NULL) AND (@t_proc_code != '') AND (@t_proc_code IS NOT NULL) )
			BEGIN -->[H]
				-- Checking for patient is old or not
				SELECT  @is_oldPatient = COUNT(*) FROM [dbo].[t_temp_procedure_performed]
				 WHERE	date_of_service < @t_dos
						AND MID=@t_mid  AND date_of_service < @t_dos
				 --  AND (date_of_service !='' OR date_of_service IS NOT NULL)AND LEN(proc_code)=5 AND SUBSTRING(proc_code,1,1)='D' -- AND is_invalid=0;
				
					IF(@is_oldPatient=0) 
						BEGIN
							-- >> Reason 1
							UPDATE	 dbo.t_temp_15_unJustFMX_test_table 
							SET		expected_reason_level=1, exp_ryg_status = 'green',
									test_detail='Patient is not old.'
							WHERE	id=@t_id
						END
					ELSE
						BEGIN -->[I]
							-- Checking for D0330 0r D0210 over last 5 years 
							SELECT  @is_inLast5year = COUNT_BIG(*) 
							FROM fl_production.dbo.src_full_mouth_xrays 
							WHERE mid=@t_mid 
							AND date_of_service != @t_dos 
							AND proc_code IN ('D0330','D0210') 
							AND (date_of_service BETWEEN DATEADD(year, -5,@t_dos )  AND @t_dos );
							
							IF(@is_inLast5year = 0 ) 
								BEGIN
									UPDATE dbo.t_temp_15_unJustFMX_test_table 
									SET expected_reason_level=2, exp_ryg_status = 'green',
									test_detail=CONCAT('No procedure code(D0330,D0210) found within [',DATEADD(Day,1, @t_dos),' to ',DATEADD (year,-5,@t_dos),'].') 
									WHERE id=@t_id;
								END
							ELSE
								BEGIN -->[J]
									-- checking D4xxx(except 4910) over last 3 years
									SELECT  @has_D4xxx = count(1) 
									FROM fl_production.dbo.src_full_mouth_xrays 
									WHERE mid=@t_mid AND proc_code != 'D4910' 
									AND  proc_code LIKE 'D4%' 
									AND (date_of_service BETWEEN  DATEadd(year, 3,@t_dos) AND @t_dos);
					
									IF(@has_D4xxx != 0) 
										BEGIN
											-- >> 
											UPDATE dbo.t_temp_15_unJustFMX_test_table 
											SET expected_reason_level=3 , exp_ryg_status = 'green',
												test_detail=CONCAT('Found procedure code like D4xxx (Except D4910) within [',DATEAdd(year, -3, @t_dos),' to ',DATEADD(Day,1, @t_dos  ),'].') 
											WHERE id=@t_id;
										END
									ELSE
										BEGIN --> [k]
											-- checking D3xxx over last 3 years
											SELECT @has_D3xxx = COUNT(DISTINCT(claim_id))
											FROM fl_production.dbo.src_full_mouth_xrays 
											WHERE mid=@t_mid 
											AND  proc_code LIKE 'D3%' 
											AND (date_of_service BETWEEN  DATEADD(year, -3,@t_dos) AND @t_dos)
											AND (date_of_service !='' OR date_of_service IS NOT NULL); 
											-- QUERY ENDS
											IF ISNULL(@has_D3xxx, 0) >= 3 
												BEGIN
													UPDATE dbo.t_temp_15_unJustFMX_test_table 
													SET expected_reason_level=4, exp_ryg_status = 'green',
													test_detail=CONCAT('Found more than 3 claims procedure code like D3xxx within [',DATEADD(year,3,@t_dos),' to ',@t_dos,'].') 
													WHERE id=@t_id
												END
											ELSE
												BEGIN
													UPDATE dbo.t_temp_15_unJustFMX_test_table 
													SET expected_reason_level=5 ,  exp_ryg_status = 'red',
													test_detail=CONCAT('No procedure code like D3xxx found within [',DATEADD(year,-3 ,@t_dos),' to ',@t_dos,'].') 
													WHERE id=@t_id
												END
										END -- [K]
							END -->[J]
						END -->[I]
			END -->[H]
		ELSE
			BEGIN
				UPDATE dbo.t_temp_15_unJustFMX_test_table 
				SET expected_reason_level=-1 , 
					test_detail='Invalid Data.' 
				WHERE id=@t_id
			END
	       
	FETCH NEXT FROM test_row_cursor INTO @t_id, @t_attend, @t_proc_code, @t_mid, @t_dos
	END -- WHILE ENDS
	
		
  
    ClOSE test_row_cursor;
    DEALLOCATE test_row_cursor;

	UPDATE dbo.t_temp_15_unJustFMX_test_table SET  test_status = 1     WHERE actual_reason_level=expected_reason_level;

	UPDATE dbo.t_temp_15_unJustFMX_test_table SET test_status = 0  WHERE actual_reason_level!= expected_reason_level;
 
	-- setting up records counts
	SELECT  @count_total_records=COUNT(*) FROM dbo.t_temp_15_unJustFMX_test_table
	SELECT   @count_defective_records=COUNT(*) FROM dbo.t_temp_15_unJustFMX_test_table 
	WHERE  actual_reason_level != expected_reason_level
	SET @temp_count=0
	SELECT @temp_count=COUNT(*) FROM dbo.t_temp_15_unJustFMX_test_table WHERE expected_reason_level IS NULL

	IF(@temp_count=0) 
		BEGIN
			SET @out_test_status=1;
			SET @test_detail=CAST(@count_total_records AS varchar(50)) +
								' records are tested.No ambiguous record found.'
		END
	ELSE
		BEGIN
			SET @out_test_status=0;
			SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
								' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) ;
		END 

END









GO
/****** Object:  StoredProcedure [dbo].[t_16____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

Create PROCEDURE [dbo].[t_16____________________]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

   END



GO
/****** Object:  StoredProcedure [dbo].[t_16_complexPerio_ts2_tc2A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Imran Abbas Satti
-- Create date: 3/7/2018
-- Description:	Algo # 12 [third ] reason level test table generation
-- =============================================
CREATE PROCEDURE [dbo].[t_16_complexPerio_ts2_tc2A_testTableGen] 
	@out_success bit OUTPUT
AS
BEGIN
	SET  XACT_ABORT  ON
    SET  NOCOUNT  ON

	SET @out_success = NULL

	DECLARE
		@reason_percent decimal(5, 2)
		,@reason_total_count int
		,@temp_count int
		,@reason_sample_count int
		,@selected_reason int
		,@iterator int
		,@max_process_date DATETIME2(0)

	if(object_id(N'[dbo].[t_temp_16_complexperio_result_test_table]', 'U') is not null)
		DROP TABLE dbo.t_temp_16_complexperio_result_test_table 
	  
	CREATE TABLE [dbo].[t_temp_16_complexperio_result_test_table]
	(
		id bigint IDENTITY(1,1), 
		res_id bigint DEFAULT NULL, 
		attend varchar(40)  DEFAULT NULL,
		specialty VARCHAR(20) DEFAULT NULL, 
		mid varchar(99) DEFAULT NULL, 
		proc_code varchar(99)  DEFAULT NULL, 
		
		date_of_service datetime2(0) DEFAULT NULL,
		patient_age varchar(99) DEFAULT NULL, 
		
		act_reason_level int DEFAULT NULL, 
		exp_reason_level int DEFAULT NULL, 
		
		act_ryg_status varchar(15) DEFAULT NULL, 
		exp_ryg_status varchar(15) DEFAULT NULL, 
		
		act_status varchar(100) DEFAULT NULL,
		exp_status varchar(100) DEFAULT NULL,

		test_status bit DEFAULT NULL, 
		test_detail varchar(255) DEFAULT NULL, 
		PRIMARY KEY (id)
	)    

	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.[results_complex_perio]
	WHERE	isactive = 1

	SET @iterator = 1
	WHILE (@iterator < 7)
		BEGIN
			SET @selected_reason = @iterator

			SELECT	 @reason_percent = reason_weight
			FROM	[dbo].t_global_reasons_ratio
			WHERE	algo_id = 16 
					AND reason_level = @selected_reason

			SET @reason_total_count = 0
			SET @reason_sample_count = 0

			SELECT	@reason_total_count = count(*)
			FROM	fl_production.dbo.[results_complex_perio]
			WHERE	reason_level = @selected_reason
					AND process_date = @max_process_date
					AND isactive = 1

			
			SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

			IF (@reason_sample_count <= 0)
               SET @reason_sample_count = 50
            
			-- select @reason_sample_count
			INSERT  INTO [dbo].[t_temp_16_complexperio_result_test_table]
			(
				res_id 
				,attend 
				,MID
				,proc_code
				,specialty
				,date_of_service
				,act_reason_level
				,act_ryg_status
				,act_status	
			)	
			SELECT top (@reason_sample_count)
				id 
				,attend 
				,MID
				,proc_code 
				,specialty
				,date_of_service
				,reason_level
				,ryg_status
				,status
            FROM fl_production.dbo.[results_complex_perio]
            WHERE isactive= 1 AND 
				reason_level = @selected_reason
				AND process_date = @max_process_date
				AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1)
			
                     
            SET @iterator = @iterator + 1

         END
		
      SELECT	@temp_count = count(*)
      FROM		[dbo].[t_temp_16_complexperio_result_test_table]     



      IF (@temp_count > 0)
         SET @out_success = 1
      ELSE 
         SET @out_success = 0
END




GO
/****** Object:  StoredProcedure [dbo].[t_16_complexPerio_ts2_tc2B_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Imran Abbas Satti>
-- Create date: <03 07 2018>
-- Description:	<Third Molar Reasons Validation>
-- =============================================
CREATE PROCEDURE [dbo].[t_16_complexPerio_ts2_tc2B_resReasonsValidation]
	-- Add the parameters for the stored procedure here
	 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
	
	DECLARE @t_id INT = 0 
			,@t_attend VARCHAR(50) = '' 
			,@t_mid VARCHAR(50) = ''
			,@t_tooth_no varchar(50) = ''
			,@t_dos DATETIME2(0) = NULL
			,@t_specialty VARCHAR(50) = '' 
			,@t_proc_code VARCHAR(11) = ''
	
		
	DECLARE @temp_count INT = 0,
			@count_total_records INT = 0, 
			@exp_reason_level INT = 0,
			@act_reason_level INT = 0,
			@count_defective_records INT = 0

	DECLARE @date_D0180_2Rmore_yearAgo DATETIME2(0) = ''
			,@date_D0210_withIn_2year DATETIME2(0) = ''
			,@date_D0150rD0120_lastYear DATETIME2(0) = ''
 
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT 
				id 
				,attend 
				,MID
				,date_of_service
				,specialty
			FROM [dbo].[t_temp_16_complexperio_result_test_table] 


	OPEN test_row_cursor
	
	FETCH  FROM test_row_cursor INTO  @t_id, @t_attend, @t_mid, @t_dos, @t_specialty
				  	
	WHILE @@FETCH_STATUS = 0
	BEGIN -- <=== Algo Core Processing Starts    
		
				    -- ---------------------------------------------------------------------------- IF # A Starts--------------------------------------------------------------------------
		    IF(@t_mid IS NULL OR @t_mid='' OR @t_attend IS NULL OR @t_attend='' OR @t_dos IS NULL OR @t_dos='' )
				BEGIN
					UPDATE [dbo].[t_temp_16_complexperio_result_test_table]
					SET exp_reason_level=-1,
						test_detail='Data is not valid.'
					WHERE id=@t_id
				END
		    ELSE
				BEGIN
					-- ----------------------------------------------------------IF # B Starts ------------------------------------------------------------------
					IF(@t_specialty='1223P0300X')
						BEGIN
							UPDATE [dbo].[t_temp_16_complexperio_result_test_table]
							SET exp_reason_level=1,
								test_detail='Specialty is ['+ @t_specialty+'].Doctor is periodontist'
							WHERE id=@t_id
						END
					ELSE
						BEGIN
							
							SELECT @date_D0180_2Rmore_yearAgo = MAX(date_of_service) -- should be minimum
							FROM fl_production.dbo.[src_complex_perio]
							WHERE proc_code='D0180' AND
								  (date_of_service IS NOT NULL OR date_of_service !='') AND
								  date_of_service != @t_dos AND
								  date_of_service < @t_dos AND
								  -- date_of_service != '0000-00-00 00:00:00' AND
								  mid=@t_mid 
							
							-- ---------------------------------------IF # C Starts -------------------------------------------
							IF((@date_D0180_2Rmore_yearAgo != '') AND (@date_D0180_2Rmore_yearAgo <= DATEADD(YEAR,-2,@t_dos)))
								BEGIN
									SELECT @date_D0210_withIn_2year = MAX(date_of_service)
									FROM fl_production.dbo.[src_complex_perio]
									WHERE proc_code='D0210' AND
											  (date_of_service IS NOT NULL OR date_of_service !='') AND
											  date_of_service <= @t_dos AND
											  -- date_of_service != '0000-00-00 00:00:00' AND
											  mid=@t_mid;
										-- --------------------IF # D Starts -----------------------------------------
									IF((@date_D0210_withIn_2year !='') AND (@date_D0210_withIn_2year BETWEEN DATEADD(YEAR,-2,@t_dos) AND @t_dos))  -- Yes (reason 3)
										BEGIN
											UPDATE [dbo].[t_temp_16_complexperio_result_test_table]
											SET exp_reason_level=3,
												test_detail='Has D0180 on [' 
															+ CAST(@date_D0180_2Rmore_yearAgo as VARCHAR) 
															+ '] and D0210 on [' 
															+ CAST(@date_D0210_withIn_2year as VARCHAR) 
															+ ']'
											WHERE id=@t_id
										END
									ELSE
										BEGIN                                -- No (reason 2)
											UPDATE [dbo].[t_temp_16_complexperio_result_test_table]
											SET exp_reason_level=2,
												test_detail='Has D0180 on [' + CAST(@date_D0180_2Rmore_yearAgo as VARCHAR) + '] and No D0210 in last two years'
											WHERE id=@t_id
										END
								END
									-- --------------------IF # D Ends   -----------------------------------------
							ELSE 
								BEGIN
									SELECT @date_D0150rD0120_lastYear = MAX(date_of_service) 
									FROM fl_production.dbo.[src_complex_perio]
									WHERE proc_code IN('D0120','D0150') AND
											  (date_of_service IS NOT NULL OR date_of_service !='') AND
											  date_of_service <= @t_dos AND
											  -- date_of_service != '0000-00-00 00:00:00' AND
											  mid=@t_mid
									   -- --------------------IF # F Starts -----------------------------------------
									IF((@date_D0150rD0120_lastYear !='') AND (@date_D0150rD0120_lastYear BETWEEN DATEADD(YEAR,-1,@t_dos) AND @t_dos))
										BEGIN
											SELECT @date_D0210_withIn_2year = MAX(date_of_service) 
											FROM fl_production.dbo.[src_complex_perio]
											WHERE proc_code='D0210' AND
											(date_of_service IS NOT NULL OR date_of_service !='') AND
											date_of_service <= @t_dos AND
											-- date_of_service != '0000-00-00 00:00:00' AND
											mid=@t_mid;
											-- --------------------IF # G Starts -----------------------------------------
											IF((@date_D0210_withIn_2year !='') AND (@date_D0210_withIn_2year BETWEEN DATEADD(YEAR,-2,@t_dos) AND @t_dos)) -- Yes (reason 5)
												BEGIN
													UPDATE [dbo].[t_temp_16_complexperio_result_test_table]
													SET exp_reason_level=5,
														test_detail='D0150 or D0120 exists on [' 
																	+ CAST(@date_D0150rD0120_lastYear as varchar) + '] and D0210 on [' 
																	+ CAST(@date_D0210_withIn_2year as VARCHAR) + ']'
													WHERE id=@t_id
												END
											ELSE
												BEGIN                                -- No (reason 2)
													UPDATE [dbo].[t_temp_16_complexperio_result_test_table]
													SET exp_reason_level=4,
														test_detail='No D0150 or D0120 exists and No D0210 exists with in last year'
													WHERE id=@t_id
												END 
											END
										-- -------------------- IF # G Ends -------------------------------------------
										ELSE
											BEGIN
												UPDATE [dbo].[t_temp_16_complexperio_result_test_table]
												SET exp_reason_level=6,
													test_detail='Has no D0180 two year ago and has no D0150 or D0210 in last year'
												WHERE id=@t_id;
											END
								END
									   -- --------------------IF # F Ends   -----------------------------------------
					
							
							-- ---------------------------------------IF # C Ends   -------------------------------------------
						END 
						
			-- ----------------------------------------------------------IF # B Ends ---------------------------------------------------------------------
				END 
		    -- ---------------------------------------------------------------------------- IF # A Ends----------------------------------------------------------------------------

		FETCH NEXT FROM test_row_cursor INTO @t_id, @t_attend, @t_mid, @t_dos, @t_specialty
	END -- <=== Algo Core Processing Ends
    ClOSE test_row_cursor
    DEALLOCATE test_row_cursor



	UPDATE	[dbo].[t_temp_16_complexperio_result_test_table]   
	SET		test_status=1     
	WHERE	act_reason_level=exp_reason_level

	UPDATE [dbo].[t_temp_16_complexperio_result_test_table]   
	SET		test_status=0  
	WHERE	 act_reason_level!= exp_reason_level

  -- setting up records counts
	SELECT	 @count_total_records = COUNT(*) 
	FROM	[dbo].[t_temp_16_complexperio_result_test_table] 

	SELECT   @count_defective_records=COUNT(*) 
	FROM	[dbo].[t_temp_16_complexperio_result_test_table]   
	WHERE	act_reason_level != exp_reason_level

	SET @temp_count=0
	SELECT	 @temp_count=COUNT(*) 
	FROM	[dbo].[t_temp_16_complexperio_result_test_table]   
	WHERE	exp_reason_level IS NULL
	
	-- SETTING UP OUTPUT PARAMETERS
	IF(@temp_count > 0) 
		BEGIN
			SET @out_success=0	
		END
	ELSE 
		BEGIN
			SET @out_success=1
			IF(@count_defective_records = 0)
				BEGIN
					SET @out_test_status=1
		        	SET @test_detail=CAST(@count_total_records AS varchar(50)) +
								' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status=0
					SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
								' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) 
				END
		END 


	
END






GO
/****** Object:  StoredProcedure [dbo].[t_17____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`192.168.0.167`.
*/

Create PROCEDURE [dbo].[t_17____________________]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

   END



GO
/****** Object:  StoredProcedure [dbo].[t_17_simpCompExtCodeDist_step1_src_table_gen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Imran Abbas
-- Create date: 04 7 2018
-- Description:	Creating source table
-- =============================================
CREATE PROCEDURE [dbo].[t_17_simpCompExtCodeDist_step1_src_table_gen]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	DECLARE @temp_count INT = 0

	-- t_temp_17_simpCompExtCodeDist_src_table
    IF (OBJECT_ID('[dbo].[t_temp_17_simpCompExtCodeDist_src_table]') IS NOT NULL)
		DROP TABLE [dbo].[t_temp_17_simpCompExtCodeDist_src_table]

	CREATE TABLE [dbo].[t_temp_17_simpCompExtCodeDist_src_table]
	(
		id INT DEFAULT NULL
		,attend VARCHAR(50) DEFAULT NULL
		,year int NULL
		,specialty VARCHAR(50) DEFAULT NULL
		,proc_code VARCHAR(10) DEFAULT NULL
		
	)

	CREATE CLUSTERED INDEX ix__c__t_temp_17_simpCompExtCodeDist_src_table__year__specialty__attend__proc_code
	ON [dbo].[t_temp_17_simpCompExtCodeDist_src_table] 
	(year asc,proc_code asc,attend asc,specialty asc) 
	
	/*
	CREATE NONCLUSTERED INDEX ix__nc__t_temp_17_simpCompExtCodeDist_src_table__year
	ON [dbo].[t_temp_17_simpCompExtCodeDist_src_table] (year asc)
	
	CREATE NONCLUSTERED INDEX ix__c__t_temp_18_ext_upcode_procedure_performed_final
	ON [dbo].[t_temp_17_simpCompExtCodeDist_src_table] (tooth_no asc,proc_code asc,date_of_service asc) 
	  ;
	*/
	 

	INSERT INTO [dbo].[t_temp_17_simpCompExtCodeDist_src_table]
	(
		id
		,attend
		,year
		,specialty
		,proc_code

	)
	SELECT 
		id
		,attend
		,year
		,specialty
		,proc_code

	FROM fl_production.dbo.src_ext_code_distribution
	

	SELECT @temp_count = COUNT(*) FROM  [dbo].[t_temp_17_simpCompExtCodeDist_src_table]
	IF(@temp_count > 0 ) 
		SET @out_success=1
	ELSE 
		SET @out_success=0

END




GO
/****** Object:  StoredProcedure [dbo].[t_17_simpCompExtCodeDist_step2A_test_table_gen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Imran Abbas Satti
-- Create date: 3/7/2018
-- Description:	Algo # 17 test table generation
-- =============================================
CREATE PROCEDURE [dbo].[t_17_simpCompExtCodeDist_step2A_test_table_gen] 
	@out_success bit OUTPUT
AS
BEGIN
	SET  XACT_ABORT  ON
    SET  NOCOUNT  ON

	SET @out_success = NULL

	DECLARE
		@reason_percent decimal(5, 2)
		,@reason_total_count int
		,@temp_count int
		,@reason_sample_count int
		,@selected_reason int
		,@iterator int

	if(object_id(N'[dbo].[t_temp_17_simpCompCodeDist_test_table]', 'U') is not null)
		DROP TABLE dbo.t_temp_17_simpCompCodeDist_test_table 
	  
	CREATE TABLE [dbo].[t_temp_17_simpCompCodeDist_test_table]
	(
		id bigint IDENTITY(1,1), 
		res_id bigint DEFAULT NULL, 
		year INT NULL,
		specialty VARCHAR(20) DEFAULT NULL, 
		attend varchar(40)  DEFAULT NULL,

		
		act_d7140_count int DEFAULT 0, 
		exp_d7140_count int DEFAULT 0, 

		act_d7210_count int DEFAULT 0, 
		exp_d7210_count int DEFAULT 0,
		
		act_ratio_d7210_to_d7140 int DEFAULT 0, 
		exp_ratio_d7210_to_d7140 int DEFAULT 0,

		test_status bit DEFAULT NULL, 
		test_detail varchar(255) DEFAULT NULL, 
		PRIMARY KEY (id)
	)    

            
			
	INSERT  INTO [dbo].[t_temp_17_simpCompCodeDist_test_table]
	(
		res_id, YEAR, specialty, attend, act_d7140_count, act_d7210_count, act_ratio_d7210_to_d7140
		
	)	
	SELECT 
		id, YEAR, specialty, attend, d7140_count, d7210_count, ratio_d7210_to_d7140
    FROM fl_production.dbo.results_ext_code_distribution
    WHERE isactive= 1
		
         
	SELECT	@temp_count = count(*)
	FROM	[dbo].[t_temp_17_simpCompCodeDist_test_table]     



	IF (@temp_count > 0)
		SET @out_success = 1
	ELSE 
		SET @out_success = 0
END






GO
/****** Object:  StoredProcedure [dbo].[t_17_simpCompExtCodeDist_step2B_validation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Imran Abbas Satti>
-- Create date: <04 07 2018>
-- Description:	< Validation>
-- =============================================
CREATE PROCEDURE [dbo].[t_17_simpCompExtCodeDist_step2B_validation]
	-- Add the parameters for the stored procedure here
	 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
	
	DECLARE @t_id INT = 0 
			,@t_attend VARCHAR(50) = '' 
			,@t_specialty VARCHAR(50) = '' 
			,@t_year INT = NULL
	

	DECLARE @d7140_count INT = 0
			,@d7210_count INT = 0
		
	DECLARE @temp_count INT = 0,
			@count_total_records INT = 0, 
			@exp_reason_level INT = 0,
			@act_reason_level INT = 0,
			@count_defective_records INT = 0

	
 
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT 
				id
				,year
				,specialty
				,attend 
			FROM [dbo].[t_temp_17_simpCompCodeDist_test_table] 


	OPEN test_row_cursor
	
	FETCH  FROM test_row_cursor INTO  @t_id, @t_year,@t_specialty,@t_attend
				  	
	WHILE @@FETCH_STATUS = 0
		BEGIN -- <=== Algo Core Processing Starts    
			SELECT	@d7140_count = COUNT(*)  
			FROM 	[dbo].[t_temp_17_simpCompExtCodeDist_src_table]
			WHERE 	YEAR = @t_year
					AND specialty = @t_specialty
					AND attend = @t_attend
					AND proc_code = 'D7140';
				
			SELECT	@d7210_count = COUNT(*) 
			FROM 	[dbo].[t_temp_17_simpCompExtCodeDist_src_table]
			WHERE 	YEAR = @t_year
					AND specialty = @t_specialty
					AND attend = @t_attend
					AND proc_code = 'D7210';
				
			UPDATE	[dbo].[t_temp_17_simpCompCodeDist_test_table]
			SET 	exp_d7140_count = @d7140_count,
					exp_d7210_count = @d7210_count
			WHERE 	id = @t_id	
		FETCH NEXT FROM test_row_cursor INTO @t_id, @t_year,@t_specialty,@t_attend
	END -- <=== Algo Core Processing Ends

	-- SELECT @t_id, @t_year,@t_specialty,@t_attend

    ClOSE test_row_cursor
    DEALLOCATE test_row_cursor

	UPDATE	[dbo].[t_temp_17_simpCompCodeDist_test_table]
			SET 	exp_d7140_count = 1
			WHERE 	exp_d7140_count = 0
		
	UPDATE	[dbo].[t_temp_17_simpCompCodeDist_test_table]
	SET 	exp_ratio_d7210_to_d7140 = ROUND(exp_d7210_count/exp_d7140_count,2)
	
	UPDATE 	[dbo].[t_temp_17_simpCompCodeDist_test_table]
	SET 	test_status = 1
	WHERE 	act_d7140_count = exp_d7140_count AND
			act_d7210_count = exp_d7210_count AND
			act_ratio_d7210_to_d7140 = exp_ratio_d7210_to_d7140
		
	UPDATE 	[dbo].[t_temp_17_simpCompCodeDist_test_table]
	SET 	test_status = 0
	WHERE 	test_status IS NULL



	

  -- setting up records counts
	SELECT	 @count_total_records = COUNT(*) 
	FROM	[dbo].[t_temp_17_simpCompCodeDist_test_table] 

	SELECT   @count_defective_records=COUNT(*) 
	FROM	[dbo].[t_temp_17_simpCompCodeDist_test_table]   
	WHERE	test_status = 0

	SET @temp_count=0
	SELECT	 @temp_count=COUNT(*) 
	FROM	[dbo].[t_temp_17_simpCompCodeDist_test_table]   
	WHERE	test_status IS NULL
	
	-- SETTING UP OUTPUT PARAMETERS
	IF(@temp_count > 0) 
		BEGIN
			SET @out_success=0	
		END
	ELSE 
		BEGIN
			SET @out_success=1
			IF(@count_defective_records = 0)
				BEGIN
					SET @out_test_status=1
		        	SET @test_detail=CAST(@count_total_records AS varchar(50)) +
								' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status=0
					SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
								' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) 
				END
		END 


	
END






GO
/****** Object:  StoredProcedure [dbo].[t_17_simpCompExtCodeDist_step3A_meansd_test_table_gen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Imran Abbas Satti
-- Create date: 3/7/2018
-- Description:	Algo # 17 test table generation
-- =============================================
CREATE PROCEDURE [dbo].[t_17_simpCompExtCodeDist_step3A_meansd_test_table_gen] 
	@out_success bit OUTPUT
AS
BEGIN
	
    SET  NOCOUNT  ON

	DECLARE @temp_count INT = 0;
		

	if(object_id(N'[dbo].[t_temp_17_simpCompCodeDist_meansd_test_table]', 'U') is not null)
		DROP TABLE dbo.t_temp_17_simpCompCodeDist_meansd_test_table 
	  
	CREATE TABLE [dbo].[t_temp_17_simpCompCodeDist_meansd_test_table]
	(
		id bigint IDENTITY(1,1), 
		res_id bigint DEFAULT NULL, 
		year INT NULL,
		specialty VARCHAR(20) DEFAULT NULL, 

		
		act_specialty_mean FLOAT DEFAULT 0, 
		exp_specialty_mean FLOAT DEFAULT 0, 

		act_specialty_sd FLOAT DEFAULT 0, 
		exp_specialty_sd FLOAT DEFAULT 0,
		
		act_specialty_sd_min FLOAT DEFAULT 0, 
		exp_specialty_sd_min FLOAT DEFAULT 0,

		act_specialty_sd_max FLOAT DEFAULT 0, 
		exp_specialty_sd_max FLOAT DEFAULT 0,

		test_status bit DEFAULT NULL, 
		test_detail varchar(255) DEFAULT NULL, 
		PRIMARY KEY (id)
	)    

            
			
	INSERT  INTO [dbo].[t_temp_17_simpCompCodeDist_meansd_test_table]
	(
		res_id, YEAR, specialty, act_specialty_mean, act_specialty_sd, act_specialty_sd_min, act_specialty_sd_max
	)	
	SELECT 
		id, YEAR, specialty, specialty_mean, specialty_sd, specialty_sd_min, specialty_sd_max
    FROM fl_production.dbo.results_ext_code_distribution_all_meansd
    WHERE isactive= 1
		
         
	SELECT	@temp_count = count(*)
	FROM	[dbo].[t_temp_17_simpCompCodeDist_meansd_test_table]     



	IF (@temp_count > 0)
		SET @out_success = 1
	ELSE 
		SET @out_success = 0
END







GO
/****** Object:  StoredProcedure [dbo].[t_17_simpCompExtCodeDist_step3B_meansd_validation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Imran Abbas Satti>
-- Create date: <05 07 2018>
-- Description:	< Validation>
-- =============================================
CREATE PROCEDURE [dbo].[t_17_simpCompExtCodeDist_step3B_meansd_validation]
	-- Add the parameters for the stored procedure here
	 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
	
	DECLARE @t_id INT = 0 
			,@t_specialty VARCHAR(50) = '' 
			,@t_year INT = NULL
	

	DECLARE @specialty_mean FLOAT = 0
			,@specialty_sd FLOAT= 0
		
	DECLARE @temp_count INT = 0,
			@count_total_records INT = 0, 
			@exp_reason_level INT = 0,
			@act_reason_level INT = 0,
			@count_defective_records INT = 0

	
 
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT 
				id
				,year
				,specialty
			FROM [dbo].[t_temp_17_simpCompCodeDist_meansd_test_table] 


	OPEN test_row_cursor
	
	FETCH  FROM test_row_cursor INTO  @t_id, @t_year,@t_specialty
				  	
	WHILE @@FETCH_STATUS = 0
		BEGIN -- <=== Algo Core Processing Starts  
		
		  
			SELECT	@specialty_mean = ROUND(	AVG(ratio_d7210_to_d7140),2		)
					,@specialty_sd = ROUND(		STDEV(ratio_d7210_to_d7140),2	)
			-- FROM 	[dbo].[t_temp_17_simpCompCodeDist_test_table]
			FROM	fl_production.dbo.results_ext_code_distribution
			WHERE 	YEAR = @t_year
					AND isactive = 1
					AND specialty = @t_specialty
					AND ratio_d7210_to_d7140 > 0
			
	
			UPDATE 	[dbo].[t_temp_17_simpCompCodeDist_meansd_test_table]
			SET		exp_specialty_mean = IIF(@specialty_mean IS NULL,0,@specialty_mean)
					,exp_specialty_sd = IIF(@specialty_sd IS NULL,0,@specialty_sd)
			WHERE 	id = @t_id
			
			FETCH  NEXt FROM test_row_cursor INTO  @t_id, @t_year,@t_specialty

		END -- <=== Algo Core Processing Ends
    ClOSE test_row_cursor
    DEALLOCATE test_row_cursor


	UPDATE 	[dbo].[t_temp_17_simpCompCodeDist_meansd_test_table]
	SET		exp_specialty_sd_min = ROUND(exp_specialty_mean + exp_specialty_sd,2),
			exp_specialty_sd_max = ROUND(exp_specialty_mean + 1.5 * exp_specialty_sd,2)
	-- WHERE 	exp_specialty_sd != 0 -- important
		

	UPDATE 	[dbo].[t_temp_17_simpCompCodeDist_meansd_test_table]
	SET 	test_status = 1
	WHERE 	cast(act_specialty_mean as int) = cast(exp_specialty_mean as int)
			AND cast(act_specialty_sd as int) = cast(exp_specialty_sd as int)
			AND cast(act_specialty_sd_min as int) = cast(exp_specialty_sd_min as int) 
			AND cast(act_specialty_sd_max as int) = cast(exp_specialty_sd_max as int)

	UPDATE	[dbo].[t_temp_17_simpCompCodeDist_meansd_test_table]
	SET 	test_status = 0
	WHERE 	test_status IS NULL
	

  -- setting up records counts
	SELECT	 @count_total_records = COUNT(*) 
	FROM	[dbo].[t_temp_17_simpCompCodeDist_meansd_test_table] 

	SELECT   @count_defective_records=COUNT(*) 
	FROM	[dbo].[t_temp_17_simpCompCodeDist_meansd_test_table]   
	WHERE	test_status = 0

	SET @temp_count=0
	SELECT	 @temp_count=COUNT(*) 
	FROM	[dbo].[t_temp_17_simpCompCodeDist_meansd_test_table]   
	WHERE	test_status IS NULL
	
	-- SETTING UP OUTPUT PARAMETERS
	IF(@temp_count > 0) 
		BEGIN
			SET @out_success=0	
		END
	ELSE 
		BEGIN
			SET @out_success=1
			IF(@count_defective_records = 0)
				BEGIN
					SET @out_test_status=1
		        	SET @test_detail=CAST(@count_total_records AS varchar(50)) +
								' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status=0
					SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
								' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) 
				END
		END 


	
END







GO
/****** Object:  StoredProcedure [dbo].[t_18__________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[t_18__________________]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
END


GO
/****** Object:  StoredProcedure [dbo].[t_18_extUpcodeAxomatic_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_18_extUpcodeAxomatic_TS2_RESULT_TABLE] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

END


GO
/****** Object:  StoredProcedure [dbo].[t_18_extUpcodeAxomatic_ts2_tc1B_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_18_extUpcodeAxomatic_ts2_tc1B_testTableGen] 
	-- Add the parameters for the stored procedure here
	@out_success bit output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON
    -- Insert statements for procedure here
	DECLARE @reason_percent float(2),
	 @reason_total_count int,
	 @temp_count INT,
         @reason_sample_count INT,
         @selected_reason INT,
         @iterator INT
		 ,@max_process_date DATETIME2(0);

		  if(object_id(N'[dbo].[t_temp_18_extUpcodeAxomatic_test_table]', 'U') is not null)
			DROP TABLE [dbo].t_temp_18_extUpcodeAxomatic_test_table




	CREATE TABLE test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table (
	id BIGINT identity(1,1) ,
	res_id BIGINT DEFAULT NULL,
	attend VARCHAR(40) DEFAULT NULL,
	specialty VARCHAR(250) DEFAULT NULL,
	mid VARCHAR(99) DEFAULT NULL,
	proc_code VARCHAR(99) DEFAULT NULL,
	date_of_service DATETIME DEFAULT NULL,
	tooth_no VARCHAR(99) DEFAULT NULL,
	act_reason_level INT DEFAULT NULL,
	exp_reason_level INT DEFAULT NULL,
	act_ryg_status VARCHAR(15) DEFAULT NULL,
	exp_ryg_status VARCHAR(15) DEFAULT NULL,
	test_status bit DEFAULT NULL,
	test_detail varchar(250) DEFAULT NULL,
	PRIMARY KEY (id)
	) 
	TRUNCATE TABLE test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table;
	


	SET @iterator = 1;
        WHILE(@iterator < 10) Begin

		SET @selected_reason= @iterator;
		SELECT @reason_percent=reason_weight FROM test_cases.dbo.t_global_reasons_ratio  WHERE algo_id=18 AND reason_level=@selected_reason;
		SET @reason_total_count=0;
		SET @reason_sample_count=0;

		SELECT @reason_total_count=COUNT(*)   FROM fl_production.dbo.surg_ext_final_results WHERE reason_level=@selected_reason AND process_date = @max_process_date;
		
		SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100
			IF (@reason_sample_count < 0)
               SET @reason_sample_count = 50


	INSERT INTO test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
		(
			res_id,
			attend,
			specialty,
			MID,
			date_of_service,
			proc_code,
			tooth_no,
			act_reason_level,
			act_ryg_status
		)
		SELECT top (@reason_sample_count)	id, attend,specialty, MID,date_of_service, proc_code, tooth_no, reason_level, ryg_status
		FROM 	fl_production.dbo.surg_ext_final_results 
		WHERE 	reason_level=@selected_reason AND isactive=1 AND proc_code='D7210'
		AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1) 
		;	
	
		SET @iterator = @iterator + 1;


		END-- while end

END


GO
/****** Object:  StoredProcedure [dbo].[t_18_extUpcodeAxomatic_ts2_tc1C_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_18_extUpcodeAxomatic_ts2_tc1C_resReasonsValidation] 
	-- Add the parameters for the stored procedure here
	 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON
    -- Insert statements for procedure here
	DECLARE @t_id BIGINT = 0 ,
	 @t_attend VARCHAR(40) = '', 
	 @t_mid VARCHAR(99) = '',
	 @t_specialty VARCHAR(250) = '',
	 @t_dos DATETIME = NULL,
	 @t_proc_code VARCHAR(99) = '',
	 @t_patient_age INT = 0,
	 @t_tooth_no VARCHAR(99) = '' ;

	 DECLARE @has_any_claim_prior_D7210 INT = 0;
			-- >> NOT BELONGS TO ANY GROUP << --
	DECLARE @has_D71xx_D721x_D722x_d723x_D724x_D725x_overPast3Years INT = 0;
	DECLARE @has_explian_group INT = 0, @has_filling_group INT = 0, @has_rootCanal_group INT = 0, @has_pinPostCore_group INT = 0, @has_sum_all_group INT = 0;
	DECLARE @has_claims_on_sameTooth_withOtherDoc INT = 0;
			-- >> BELONGS TO SOME GROUP << --
	DECLARE @has_D424x_D4260_D4261_D4268_overPast3Years INT = 0;
	DECLARE @has_same_DOS_for_D424x_D4260_D4261_D4268_as_D7210 INT = 0;
	
	DECLARE @has_D4263_D4264_D4265_D4266_D4267_D427x_overPast3Years INT = 0;
	DECLARE @has_same_DOS_for_D4263_D4264_D4265_D4266_D4267_D427x_as_D7210 INT = 0;
	Declare @temp_dos_for_detail DATETIME = NULL;
	Declare	@temp_proc_code_for_detail varchar(250);
	-- Variables below are used for setting Output parameters
	DECLARE @temp_count INT = 0,@count_total_records INT = 0,@count_defective_records INT = 0;





DECLARE test_row_cursor CURSOR FOR
			    SELECT 	id, attend, proc_code, specialty, MID, date_of_service, tooth_no
				FROM  	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table;
				OPEN test_row_cursor
				FETCH test_row_cursor INTO @t_id, @t_attend, @t_proc_code,@t_specialty ,@t_mid, @t_dos, @t_tooth_no;


  WHILE @@FETCH_STATUS = 0
         BEGIN   



		-- >> Visio [Are there any claims for this patient prior to the DOS for the D7210?]
		SELECT 	@has_any_claim_prior_D7210=COUNT(*) 
		FROM 	fl_production.dbo.procedure_performed
		WHERE 	(
				is_invalid = 0
				AND date_of_service < @t_dos
				AND MID = @t_mid
			)
			;

------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------IF [A] STARTS------------------------------------------------------------ --
		IF (@has_any_claim_prior_D7210 = 0)Begin 
			UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
			SET 	exp_reason_level = 9
				,exp_ryg_status = 'green'
				,test_detail = CONCAT('No claim found prior to [',@t_dos,']')
			WHERE 	id = @t_id
				;
		END
		ELSE Begin
			-- >> Visio [Check for code D71xx, D721x, D722x, d723x, D724x, D725x over the past 3 years for this tooth]
			SELECT 	@has_D71xx_D721x_D722x_d723x_D724x_D725x_overPast3Years=COUNT(*) , @temp_dos_for_detail= MAX(date_of_service)
			FROM 	fl_production.dbo.ext_upcode_procedure_performed_final
			WHERE 	tooth_no = @t_tooth_no
				AND (proc_code LIKE 'D71%' OR proc_code LIKE 'D721%' OR proc_code LIKE 'D722%' 
				     OR proc_code LIKE 'D723%' OR proc_code LIKE 'D724%' OR proc_code LIKE 'D725%' )
				AND date_of_service < @t_dos
				AND (date_of_service BETWEEN dateadd(year, -3, @t_dos) AND @t_dos)
				AND MID = @t_mid
				;


-- ------------------------------------------------IF [B] STARTS--------------------------------------------------------- --	
			IF (@has_D71xx_D721x_D722x_d723x_D724x_D725x_overPast3Years != 0)BEgin 
				UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
				SET 	exp_reason_level = 1
					,exp_ryg_status = 'red'
					,test_detail = CONCAT('Has proc code like  D71xx, D721x, D722x, d723x, D724x, D725x max[',@temp_dos_for_detail,']')
				WHERE 	id = @t_id	
				END
			

			ELSE Begin



			-- >> Visio [For Explain Group] [Does the Comment / Remarks section of the claim include the tooth number of the D7210 AND contains 
				-- >> any of the following words “broken”, “root”, “residual” or “dilaceration” or “NEA”]
				SELECT 	@has_explian_group=COUNT(*)
				FROM 	fl_production.dbo.ext_upcode_procedure_performed_final
				WHERE 	tooth_no = @t_tooth_no
					AND proc_code = 'D7210'
					AND date_of_service = @t_dos
					AND (
						remarks LIKE '%brok%' OR remarks LIKE '%root%' OR remarks LIKE '%residu%' 
						OR remarks LIKE '%dilacer%' OR remarks LIKE '%nea%'
					     )
					AND MID = @t_mid
					 ;
					 
				-- >> Visio [For Filling Group][Check for code D2161, D2335, D2394, D2644, D2664 over the past 3 years for this tooth]
				SELECT @has_filling_group = 	COUNT(*)
				FROM 	fl_production.dbo.ext_upcode_procedure_performed_final
				WHERE 	tooth_no = @t_tooth_no
					AND proc_code LIKE 'D33%'
					AND (date_of_service BETWEEN dateadd(year, -3, @t_dos) AND @t_dos)
					AND MID = @t_mid
					 ;
					 
				-- >> Visio [For Root Cannal Group] [Check for code D33xx over the past 3 years for this tooth]
				SELECT 	@has_rootCanal_group=COUNT(*)
				FROM 	fl_production.dbo.ext_upcode_procedure_performed_final
				WHERE 	tooth_no = @t_tooth_no
					AND proc_code IN ('D2161', 'D2335', 'D2394', 'D2644', 'D2664')
					AND (date_of_service BETWEEN dateadd(year, -3, @t_dos) AND @t_dos)
					AND MID = @t_mid
					 ;
				
				-- >> Visio [For Pin and Post Core Group][Check for code D295x over the past 3 years for this tooth]
				SELECT 	@has_pinPostCore_group=COUNT(*)
				FROM 	fl_production.dbo.ext_upcode_procedure_performed_final
				WHERE 	tooth_no = @t_tooth_no
					AND proc_code LIKE 'D295%'
					AND (date_of_service BETWEEN dateadd(year, -3, @t_dos) AND @t_dos)
					AND MID = @t_mid
					 ;
					 	 
				SET @has_sum_all_group = @has_explian_group + @has_filling_group + @has_rootCanal_group + @has_pinPostCore_group;


-- --------------------------------------IF [C] STARTS------------------------------------------------- ---------


IF(@has_sum_all_group = 0) BEgin
 -- >> NOT BELONGS TO ANY GROUP << --
					-- >> Visio [Is the provider an Oral Surgeon (Provider taxonomy code = 1223S0112X)]

-- --------------------------------------IF [D] STARTS------------------------------------------------- --------

			IF(@t_specialty = '1223S0112X')BEGIN

						UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
						SET 	exp_reason_level = 4
							,exp_ryg_status = 'green'
							,test_detail = CONCAT('Dentist has the specialty[',@t_specialty,']')
						WHERE 	id = @t_id
							;
							END


					ELSE BEGIN
					-- >> [Are there any other claims for this tooth on this patient by ANY other doctor over the last 3 years?]
					SELECT 	@has_claims_on_sameTooth_withOtherDoc=COUNT(*)
						FROM 	fl_production.dbo.procedure_performed
						WHERE 	is_invalid = 0
							AND date_of_service <= @t_dos
							AND (date_of_service BETWEEN dateadd(year, -3, @t_dos) AND @t_dos)
							AND attend != @t_attend
							AND MID = @t_mid
							AND tooth_no = @t_tooth_no
							;
	
				IF (@has_claims_on_sameTooth_withOtherDoc = 0)BEgin
							-- >> No
							UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
							SET 	exp_reason_level = 5
								,exp_ryg_status = 'yellow'
								,test_detail = 'Patient has no claimns the other doctor'
							WHERE 	id = @t_id
								; END
						ELSE Begin
							-- >> Yes
							UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
							SET 	exp_reason_level = 6
								,exp_ryg_status = 'red'
								,test_detail = 'Found claimns with other doctor'
							WHERE 	id = @t_id
							end


						END-- IF D END
				end --  c if part end

			ELSE BEGIN

				SELECT 	@has_D424x_D4260_D4261_D4268_overPast3Years=COUNT(*)	 	
					FROM 	fl_production.dbo.ext_upcode_procedure_performed_final
					WHERE 	tooth_no = @t_tooth_no
						AND (proc_code LIKE 'D424%' OR proc_code IN ('D4260','D4261','D4268'))
						AND date_of_service < @t_dos
						AND (date_of_service BETWEEN  dateadd(year, -3, @t_dos) AND @t_dos)
						AND MID = @t_mid
						-- is_invalid = 0
						;

			-- -------------------------IF [E] STARTS--------------------------------- --

			IF(@has_D424x_D4260_D4261_D4268_overPast3Years != 0)BEGIN -- >>YES
						-- >> Visio [Is the DOS for the codes D424x, D4260, D4261, D4268, the same as the DOS for the D7210  for this tooth?]

						SELECT 	@has_same_DOS_for_D424x_D4260_D4261_D4268_as_D7210=COUNT(*)
						FROM 	fl_production.dbo.ext_upcode_procedure_performed_final
						WHERE 	tooth_no = @t_tooth_no
							AND (proc_code LIKE 'D424%' OR proc_code IN ('D4260','D4261','D4268'))
							AND date_of_service = @t_dos
							AND MID = @t_mid


						SELECT  top 1 @temp_proc_code_for_detail=proc_code
						FROM 	fl_production.dbo.ext_upcode_procedure_performed_final
						WHERE 	tooth_no = @t_tooth_no
							AND (proc_code LIKE 'D424%' OR proc_code IN ('D4260','D4261','D4268'))
							AND date_of_service = @t_dos
							AND MID = @t_mid



							IF(@has_same_DOS_for_D4263_D4264_D4265_D4266_D4267_D427x_as_D7210 = 0)BEgin
							UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
							SET 	exp_reason_level = 2
								,exp_ryg_status = 'red'
								,test_detail = 'Has no proc code on same date of service of D7210'
							WHERE 	id = @t_id
								END;
						ELSE Begin
							UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
							SET 	exp_reason_level = 7
								,exp_ryg_status = 'green'
								,test_detail = CONCAT('Has no proc code[',@temp_proc_code_for_detail,'] on same date of service of D7210')
							WHERE 	id = @t_id
								;
						END ;
				
				END
				ELSE BEGIN

				SELECT @has_D4263_D4264_D4265_D4266_D4267_D427x_overPast3Years=	COUNT(*) 	
						FROM 	fl_production.dbo.ext_upcode_procedure_performed_final
						WHERE 	-- is_invalid = 0
							tooth_no = @t_tooth_no
							AND (proc_code IN ('D4263','D4264','D4265','D4266','D4267') OR proc_code LIKE 'D427%')
							-- AND date_of_service < t_dos
							AND (date_of_service BETWEEN dateadd(year, -3, @t_dos) AND @t_dos)
							AND MID = @t_mid
							;
					-- ------------------ IF [F] STARTS ----------------- -- 

					IF(@has_D4263_D4264_D4265_D4266_D4267_D427x_overPast3Years = 0) BEgin
							UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
							SET 	exp_reason_level = 3
								,exp_ryg_status = 'green'
								,test_detail = 'Has no proc_code like [D4263,D4264,D4265,D4266,D4267,D427x] over last 3 years'
							WHERE 	id = @t_id ;
					END
					ELSE Begin

					SELECT 	@has_same_DOS_for_D4263_D4264_D4265_D4266_D4267_D427x_as_D7210=COUNT(*)
							FROM 	fl_production.dbo.ext_upcode_procedure_performed_final
							WHERE 	-- is_invalid = 0
								tooth_no = @t_tooth_no
								AND (proc_code IN ('D4263','D4264','D4265','D4266','D4267') OR proc_code LIKE 'D427%')
								AND date_of_service = @t_dos
								AND MID = @t_mid
								;

						SELECT 	@temp_proc_code_for_detail=proc_code
							FROM 	fl_production.dbo.ext_upcode_procedure_performed_final
							WHERE 	-- is_invalid = 0
								tooth_no = @t_tooth_no
								AND (proc_code IN ('D4263','D4264','D4265','D4266','D4267') OR proc_code LIKE 'D427%')
								AND date_of_service = @t_dos
								AND MID = @t_mid
								;
											IF(@has_same_DOS_for_D4263_D4264_D4265_D4266_D4267_D427x_as_D7210 = 0) Begin
											UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
											SET 	exp_reason_level = 2
												,exp_ryg_status = 'red'
												,test_detail = 'Has no proc code like [D4263,D4264,D4265,D4266,D4267,D427] on same dos of D210'
											WHERE 	id = @t_id
												;  END
										ELSE BEgin 

													IF(@t_proc_code = 'D7210')BEgin
													UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
													SET 	exp_reason_level = 8
														,exp_ryg_status = 'green'
														,test_detail = CONCAT('Has no proc code[',@temp_proc_code_for_detail,'] on same dos of D210')
													WHERE 	id = @t_id
														;  END


														ELSE BEGIN

														UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
														SET 	exp_reason_level = 8
															,exp_ryg_status = 'red'
															,test_detail = CONCAT('Has no proc code[',@temp_proc_code_for_detail,'] on same dos of D210')
														WHERE 	id = @t_id
															;
														END
										END
					END --if f end
				END -- if e end
			  END -- IF C END
		END -- IF B END
END -- IF A END




--------------------------------------------------------------------------------------------------------------------------
FETCH NEXT FROM test_row_cursor INTO  @t_id, @t_attend, @t_proc_code,@t_specialty ,@t_mid, @t_dos, @t_tooth_no;
 END -- While end
 
ClOSE test_row_cursor
DEALLOCATE test_row_cursor


	-- =====================================================================================================================
	--            				    Algo Core Processing Ends
	-- =====================================================================================================================
	
	UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
	SET 	test_status = 1
	WHERE 	act_reason_level = exp_reason_level
		;
	
	UPDATE 	test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table
	SET 	test_status = 0
	WHERE 	act_reason_level != exp_reason_level
		;

	SELECT @count_total_records=COUNT(*)   FROM test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table;
	SELECT @count_defective_records=COUNT(*)   FROM test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table WHERE  act_reason_level != exp_reason_level;
	SET @temp_count=0;
	SELECT @temp_count=COUNT(*)   FROM test_cases.dbo.t_temp_18_extUpcodeAxomatic_test_table WHERE exp_reason_level IS NULL;

	 IF(@temp_count=0) begin
			SET @out_test_status=1;
			SET @test_detail=CAST(@count_total_records AS varchar(50)) +
							 ' records are tested.No ambiguous record found.';
		end
		ELSE Begin
			SET @out_test_status=0;
			SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
							 ' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) ;
		
		END 

END


GO
/****** Object:  StoredProcedure [dbo].[t_19__________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_19__________________]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
END


GO
/****** Object:  StoredProcedure [dbo].[t_19_overactInactCodeDist_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_19_overactInactCodeDist_TS2_RESULT_TABLE] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


END


GO
/****** Object:  StoredProcedure [dbo].[t_19_overactInactCodeDist_ts2_tc5A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_19_overactInactCodeDist_ts2_tc5A_testTableGen] 
	-- Add the parameters for the stored procedure here
		@out_success bit output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON


		DECLARE @reason_percent DECIMAL(5,2),
		 @reason_ryg_status VARCHAR(30) ,
		 @reason_total_count int ,@temp_count INT,
         @reason_sample_count INT,
         @selected_reason INT,
         @iterator INT
		 ,@max_process_date DATETIME2(0);


		 if(object_id(N'[dbo].[t_temp_19_overactiveInactive_result_test_table]', 'U') is not null)
			DROP TABLE [dbo].t_temp_19_overactiveInactive_result_test_table;


	CREATE  TABLE  test_cases.dbo.t_temp_19_overactiveInactive_result_test_table(
	id BIGINT identity(1,1) ,
	res_id BIGINT  DEFAULT NULL,
	attend VARCHAR(40) DEFAULT NULL,
	-- specialty varchar(20) default null,
	-- payer_id varchar(20) default null,
	-- mid varchar(250) default null,
	year INT DEFAULT NULL,
	act_patients_wd_xplus_visits BIGINT DEFAULT NULL,
	exp_patients_wd_xplus_visits BIGINT DEFAULT NULL,
	act_all_patients BIGINT DEFAULT NULL,
	exp_all_patients BIGINT DEFAULT NULL,
	act_attend_mean float DEFAULT NULL,
	exp_attend_mean float DEFAULT NULL,
	act_all_mean float DEFAULT NULL,
	exp_all_mean float DEFAULT NULL,
	act_all_sd float DEFAULT NULL,
	exp_all_sd float DEFAULT NULL,
	act_income float DEFAULT NULL,
	exp_income float DEFAULT NULL,
	act_ryg_status VARCHAR(15) DEFAULT NULL,
	exp_ryg_status VARCHAR(15) DEFAULT NULL,
	test_status bit DEFAULT NULL,
	test_detail varchar(250) DEFAULT NULL,
	PRIMARY KEY (id)
	) ;  
	TRUNCATE TABLE test_cases.dbo.t_temp_19_overactiveInactive_result_test_table;

	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.overactive_code_distribution_yearly_by_attend
	WHERE	isactive  = 1	;
	 SET @iterator = 1;
	
	 SET @iterator = 101;
   
		WHILE(@iterator < 104) Begin
		sET @selected_reason= @iterator;
		SELECT @reason_percent=reason_weight, @reason_ryg_status=ryg_status   FROM test_cases.dbo.t_global_reasons_ratio  WHERE algo_id=19 AND reason_level=@selected_reason;
		SET @reason_total_count=0;
		SET @reason_sample_count=0;
		SELECT @reason_total_count=COUNT(*) from  fl_production.dbo.overactive_code_distribution_yearly_by_attend 
		WHERE ryg_status = @reason_ryg_status AND isactive = 1  AND process_date = @max_process_date;
		
		SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100
			IF (@reason_sample_count < 0)
               SET @reason_sample_count = 50


	INSERT INTO test_cases.dbo.t_temp_19_overactiveInactive_result_test_table
		(
			res_id
			,attend
			,YEAR
			,act_patients_wd_xplus_visits
			,act_all_patients
			,act_attend_mean
			,act_all_mean
			,act_all_sd
			,act_income
			,act_ryg_status
		)
		SELECT top (@reason_sample_count)	
			id
			,attend
			,YEAR	
			,patients_wd_xplus_visits
			,all_patients
			,attend_mean
			,all_mean
			,all_sd
			,income
			,ryg_status
		FROM 	fl_production.dbo.overactive_code_distribution_yearly_by_attend
		WHERE 	ryg_status = @reason_ryg_status 
			AND isactive=1 
	AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1) 
		;

		SET @iterator = @iterator + 1;

		END-- while end

END


GO
/****** Object:  StoredProcedure [dbo].[t_19_overactInactCodeDist_ts2_tc5B_reasons]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_19_overactInactCodeDist_ts2_tc5B_reasons] 
	-- Add the parameters for the stored procedure here
	 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON
DECLARE @t_id BIGINT = 0 ,
	 @t_attend VARCHAR(40) = NULL,
	 @t_specialty VARCHAR(20) = NULL,
	 @t_payer_id VARCHAR(20) = NULL,
	 @t_mid VARCHAR(250) = NULL,
	 @t_year INT = NULL ;


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.


    -- Insert statements for procedure here
		-- For Holding Results of Queries
	DECLARE @count_patients_wd_8_visits Bigint = 0, @count_all_patients BIGINT = 0;
	DECLARE @total_income float = NULL, @var_all_mean float = NULL, @var_all_sd float = NULL;
	


	-- Variables below are used for setting Output parameters
	DECLARE @temp_count INT = 0,@count_total_records INT = 0,@count_defective_records INT = 0;




	DECLARE test_row_cursor CURSOR FOR
				SELECT 	id, attend,YEAR  
				FROM  	test_cases.dbo.t_temp_19_overactiveInactive_result_test_table;
				OPEN test_row_cursor
				FETCH test_row_cursor INTO @t_id, @t_attend, @t_year;

  WHILE @@FETCH_STATUS = 0
         BEGIN   

		 
			SELECT 	@count_patients_wd_8_visits = COUNT(DISTINCT(CASE WHEN total_num_of_visits >=8 THEN MID END)) 
					,@count_all_patients=COUNT(DISTINCT(MID))
					,@total_income=ROUND(SUM(CASE WHEN ryg_status = 'red' THEN total_amount END),2)
			FROM 	fl_production.dbo.overactive_inactive
			WHERE 	attend = @t_attend
				AND YEAR = @t_year
				AND isactive = 1
			HAVING (COUNT(DISTINCT(CASE WHEN total_num_of_visits >=8 THEN MID END))) > 0;



				
			SELECT 	@var_all_mean=ROUND(AVG(attend_mean),2),
				@var_all_sd=ROUND(STDEV(attend_mean),2)
			FROM 	fl_production.dbo.overactive_code_distribution_yearly_by_attend
			WHERE 	YEAR = @t_year;
			





			UPDATE  test_cases.dbo.t_temp_19_overactiveInactive_result_test_table
			SET 	exp_patients_wd_xplus_visits = @count_patients_wd_8_visits
				,exp_all_patients = @count_all_patients
				,exp_attend_mean = ROUND(@count_patients_wd_8_visits/@count_all_patients *100,2)
				,exp_income = @total_income
				,exp_all_mean = @var_all_mean
				,exp_all_sd = @var_all_sd
			WHERE 	id = @t_id;

			
FETCH NEXT FROM test_row_cursor INTO  @t_id, @t_attend, @t_year;
	end-- while end


	ClOSE test_row_cursor
DEALLOCATE test_row_cursor




	UPDATE 	test_cases.dbo.t_temp_19_overactiveInactive_result_test_table
	SET 	exp_ryg_status = 'red'
	WHERE 	exp_attend_mean > exp_all_mean + 1.5*exp_all_sd
		;
	UPDATE 	test_cases.dbo.t_temp_19_overactiveInactive_result_test_table
	SET 	exp_ryg_status = 'yellow'
	WHERE 	exp_attend_mean > exp_all_mean + 1*exp_all_sd
		AND 
		exp_attend_mean <= exp_all_mean + 1.5*exp_all_sd
		;
	UPDATE 	test_cases.dbo.t_temp_19_overactiveInactive_result_test_table
	SET 	exp_ryg_status = 'green'
	WHERE 	
		exp_attend_mean <= exp_all_mean + 1*exp_all_sd
		;
	
	UPDATE 	test_cases.dbo.t_temp_19_overactiveInactive_result_test_table
	SET  	test_status = 1
	WHERE 	act_ryg_status = exp_ryg_status;
	
	UPDATE 	test_cases.dbo.t_temp_19_overactiveInactive_result_test_table
	SET  	test_status = 0
	WHERE 	act_ryg_status != exp_ryg_status;
	



	SELECT @count_total_records=COUNT(*)   FROM test_cases.dbo.t_temp_19_overactiveInactive_result_test_table;
	SELECT @count_defective_records=COUNT(*)   FROM test_cases.dbo.t_temp_19_overactiveInactive_result_test_table AS tt WHERE  tt.test_status = 0;
	SET @temp_count = 0;
	SELECT @temp_count=COUNT(*)   FROM test_cases.dbo.t_temp_19_overactiveInactive_result_test_table AS tt WHERE tt.test_status IS NULL ;



	 IF(@temp_count=0) begin
			SET @out_test_status=1;
			SET @test_detail=CAST(@count_total_records AS varchar(50)) +
							 ' records are tested.No ambiguous record found.';
		end
		ELSE Begin
			SET @out_test_status=0;
			SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
							 ' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) ;
		
		END 


END


GO
/****** Object:  StoredProcedure [dbo].[t_20__________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_20__________________]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
END


GO
/****** Object:  StoredProcedure [dbo].[t_20_adjFillingCodeDist_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_20_adjFillingCodeDist_TS2_RESULT_TABLE]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
END


GO
/****** Object:  StoredProcedure [dbo].[t_20_adjFillingCodeDist_ts2_tc1A_resultWeekTestTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_20_adjFillingCodeDist_ts2_tc1A_resultWeekTestTableGen]
	-- Add the parameters for the stored procedure here
	@out_success bit output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON
	DECLARE @reason_percent float(2),
		 @reason_ryg_status VARCHAR(30) = NULL,
		 @reason_total_count int  ,@temp_count INT,
         @reason_sample_count INT,
         @selected_reason INT,
         @iterator INT
		 ,@max_process_date DATETIME2(0);
		 

if(object_id(N'[dbo].[t_temp_20_adjFillingCodeDist_result_week_test_table]', 'U') is not null)
			DROP TABLE [dbo].[t_temp_20_adjFillingCodeDist_result_week_test_table];
			
	
	CREATE TABLE test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table (
	id BIGINT identity(1,1) ,
	res_id BIGINT  DEFAULT NULL,
	attend VARCHAR(40) DEFAULT NULL,
	week INT DEFAULT NULL,
	year INT DEFAULT NULL,
	act_ratio_adj_to_adjnonadj float DEFAULT NULL,
	exp_ratio_adj_to_adjnonadj float DEFAULT NULL,
	act_all_mean float DEFAULT NULL,
	exp_all_mean float DEFAULT NULL,
	act_all_sd float DEFAULT NULL,
	exp_all_sd float DEFAULT NULL,
	act_ryg_status VARCHAR(15) DEFAULT NULL,
	exp_ryg_status VARCHAR(15) DEFAULT NULL,
	test_status bit DEFAULT NULL,
	test_detail varchar(250) DEFAULT NULL,
	PRIMARY KEY (id)
	) ;  
	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.results_adjacent_filling_each_attend_weekly
	WHERE	isactive  = 1	
	 SET @iterator = 1;
   
WHILE(@iterator < 4) Begin
		SET @selected_reason= @iterator;

		SELECT @reason_percent=reason_weight, @reason_ryg_status=ryg_status   FROM test_cases.dbo.t_global_reasons_ratio  WHERE algo_id=20 AND reason_level=@selected_reason;
		SET @reason_total_count=0;
		SET @reason_sample_count=0;
		
		SELECT @reason_total_count=COUNT(*)   FROM fl_production.dbo.results_adjacent_filling_each_attend_weekly
		 WHERE ryg_status=@reason_ryg_status AND process_date = @max_process_date;
		
		IF(@reason_total_count < 100) 
			SET @reason_sample_count=@reason_total_count;
		ELSE
			SET @reason_sample_count=(@reason_total_count*@reason_percent)/100;
		

		INSERT INTO test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table
		(
			res_id
			,attend
			,WEEK
			,YEAR
			,act_ratio_adj_to_adjnonadj
			,act_all_mean
			,act_all_sd
			,act_ryg_status
		)
		SELECT top (@reason_sample_count)	id
			,attend
			,WEEK
			,YEAR
			,ratio_adj_to_adjnonadj
			,all_mean
			,all_sd
			,ryg_status
		FROM 	fl_production.dbo.results_adjacent_filling_each_attend_weekly 
		WHERE 	ryg_status = @reason_ryg_status 
			AND isactive=1 
		AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1) 
;	
		SET @iterator = @iterator + 1;


End -- while end
END


GO
/****** Object:  StoredProcedure [dbo].[t_20_adjFillingCodeDist_ts2_tc1B_resultWeekTableValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_20_adjFillingCodeDist_ts2_tc1B_resultWeekTableValidation]
	-- Add the parameters for the stored procedure here
			 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON
DECLARE @t_id BIGINT = 0 ;
	DECLARE @t_attend VARCHAR(40) = '' ;
	DECLARE @t_week INT = NULL;
	DECLARE @t_year INT = NULL;
	
	-- For Holding Results of Queries
	DECLARE @adjacent_count INT = 0;
	DECLARE @non_adjacent_count INT = 0;
	DECLARE @all_mean float = NULL;
	DECLARE @all_sd float = NULL;	
	
	-- Variables below are used for setting Output parameters
	DECLARE @temp_count INT = 0,@count_total_records INT = 0,@count_defective_records INT = 0;
	
	 DECLARE
          test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR
		 SELECT id, attend,WEEK, YEAR  
				FROM  test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table
OPEN test_row_cursor
FETCH  FROM test_row_cursor
                INTO @t_id, @t_attend, @t_week, @t_year;

WHILE @@FETCH_STATUS = 0
      BEGIN     
 
 
  SELECT	@adjacent_count=SUM(
				CASE
					WHEN is_instance_if_adj_fill = '1' 
					THEN 1 
					ELSE 0 
				END
			    ) ,
		@non_adjacent_count=	SUM(
				CASE
					WHEN is_instance_if_adj_fill = '0' 
					THEN 1 
					ELSE 0 
				END
			   )
			
		FROM 	fl_production.dbo.src_adjacent_filling
		WHERE 	attend = @t_attend
		AND YEAR(date_of_service) = @t_year
		AND datepart(wk,date_of_service) = @t_week
		AND is_instance_if_adj_fill >=0
			;

			
		SELECT 	@all_mean=ROUND(AVG(ratio_adj_to_adjnonadj),2), @all_sd=ROUND(Stdev(ratio_adj_to_adjnonadj),2)
		FROM 	fl_production.dbo.results_adjacent_filling_each_attend_weekly
		WHERE 	YEAR = @t_year
			AND WEEK = @t_week
			;
			

			UPDATE 	test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table
		SET 	exp_ratio_adj_to_adjnonadj = COALESCE(ROUND(@adjacent_count / (@adjacent_count + @non_adjacent_count),2),0)
			,exp_all_mean = @all_mean
			,exp_all_sd = @all_sd
		WHERE 	id = @t_id
			;

   FETCH NEXT FROM test_row_cursor INTO @t_id, @t_attend, @t_week, @t_year;


  END -- while end
  ClOSE test_row_cursor
DEALLOCATE test_row_cursor



  UPDATE 	test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table
	SET 	exp_ryg_status = 'red'
	WHERE 	exp_ratio_adj_to_adjnonadj >= ROUND(exp_all_mean + (2 * exp_all_sd),2)
		;
	
	UPDATE 	test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table
	SET 	exp_ryg_status = 'yellow'
	WHERE 	exp_ratio_adj_to_adjnonadj > ROUND(exp_all_mean + (1.5 * act_all_sd),2)
		AND exp_ratio_adj_to_adjnonadj < ROUND(exp_all_mean + (2 * act_all_sd),2)
		AND exp_ratio_adj_to_adjnonadj != 0
		;
	UPDATE 	test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table
	SET 	exp_ryg_status = 'green'
	WHERE 	exp_ratio_adj_to_adjnonadj <= ROUND(exp_all_mean + (1.5 * exp_all_sd),2)

	-- =====================================================================================================================
	--            				    Algo Core Processing Ends
	-- =====================================================================================================================
	UPDATE 	test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table
	SET 	test_status = 1
	WHERE 	act_ryg_status = exp_ryg_status
		;
		
	UPDATE 	test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table
	SET 	test_status = 0
	WHERE 	act_ryg_status != exp_ryg_status
		;



		-- Setting Up Output parameters [success, test_status, test_detail]
	SELECT @count_total_records=COUNT(*)   FROM test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table;
	SELECT @count_defective_records=COUNT(*)   FROM test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table AS tt WHERE  tt.test_status = 0;
	SET @temp_count = 0;
	SELECT @temp_count=COUNT(*)   FROM test_cases.dbo.t_temp_20_adjFillingCodeDist_result_week_test_table AS tt WHERE tt.test_status IS NULL ;
	


	 IF(@temp_count=0) begin
			SET @out_test_status=1;
			SET @test_detail=CAST(@count_total_records AS varchar(50)) +
							 ' records are tested.No ambiguous record found.';
		end
		ELSE Begin
			SET @out_test_status=0;
			SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
							 ' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) ;
		
		END 


END


GO
/****** Object:  StoredProcedure [dbo].[t_21_________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[t_21_________________]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


END


GO
/****** Object:  StoredProcedure [dbo].[t_21_overuseOfBorL_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_21_overuseOfBorL_TS2_RESULT_TABLE]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

END


GO
/****** Object:  StoredProcedure [dbo].[t_21_overuseOfBorL_ts2_tc1A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_21_overuseOfBorL_ts2_tc1A_testTableGen] 
	-- Add the parameters for the stored procedure here
		@out_success bit output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON

		DECLARE @reason_percent DECIMAL(5,2),
		 @reason_total_count INT,
		 @temp_count INT,
         @reason_sample_count INT,
         @selected_reason INT,
         @iterator INT
		 ,@max_process_date DATETIME2(0);


if(object_id(N'[dbo].[t_temp_21_overuseOfBorL_test_table]', 'U') is not null)
			DROP TABLE [dbo].[t_temp_21_overuseOfBorL_test_table];


CREATE TABLE [dbo].[t_temp_21_overuseOfBorL_test_table] (
	id BIGINT identity(1,1) ,
	res_id BIGINT DEFAULT NULL,
	attend VARCHAR(40) DEFAULT NULL,
	mid VARCHAR(99) DEFAULT NULL,
	proc_code VARCHAR(99) DEFAULT NULL,
	date_of_service DATETIME DEFAULT NULL,
	patient_age INT DEFAULT 0,
	tooth_no VARCHAR(99) DEFAULT NULL,
	data_set_name VARCHAR(99) DEFAULT NULL,
	act_reason_level INT DEFAULT NULL,
	exp_reason_level INT DEFAULT NULL,
	act_ryg_status VARCHAR(15) DEFAULT NULL,
	exp_ryg_status VARCHAR(15) DEFAULT NULL,
	test_status bit DEFAULT NULL,
	test_detail VARCHAR(250) DEFAULT NULL,
	PRIMARY KEY (id)
	) ;
	TRUNCATE TABLE test_cases.dbo.t_temp_21_overuseOfBorL_test_table;
      	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.results_over_use_of_b_or_l_filling
	WHERE	isactive  = 1	
 SET @iterator = 1;
   
		WHILE(@iterator < 4) Begin
		SET @selected_reason= @iterator;

		SELECT @reason_percent= reason_weight  FROM test_cases.dbo.t_global_reasons_ratio  WHERE algo_id=21 AND reason_level=@selected_reason;
		SET @reason_total_count=0;
		SET @reason_sample_count=0;
		
		SELECT @reason_total_count=COUNT(*) FROM fl_production.dbo.results_over_use_of_b_or_l_filling
		 WHERE reason_level=@selected_reason AND process_date = @max_process_date;
			SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100
			IF (@reason_sample_count < 0)
               SET @reason_sample_count = 50



	 INSERT INTO test_cases.dbo.t_temp_21_overuseOfBorL_test_table
		(
			res_id,
			attend,
			MID,
			date_of_service,
			proc_code,
			patient_age,
			tooth_no,
			data_set_name,
			act_reason_level,
			act_ryg_status
		)
		SELECT 	top (@reason_sample_count) id, attend, MID, date_of_service, proc_code, patient_age, tooth_no, data_set_name, reason_level, ryg_status
		FROM 	fl_production.dbo.results_over_use_of_b_or_l_filling
		WHERE 	reason_level=@selected_reason AND isactive=1  
		AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1);	
	
		SET @iterator = @iterator + 1;


		END -- while end



END


GO
/****** Object:  StoredProcedure [dbo].[t_21_overuseOfBorL_ts2_tc1B_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_21_overuseOfBorL_ts2_tc1B_resReasonsValidation] 
	-- Add the parameters for the stored procedure here
	 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN

DECLARE @t_id BIGINT = 0 ,
	 @t_attend VARCHAR(40) = '' ,
	 @t_mid VARCHAR(99) = '',
	 @t_dos DATETIME = NULL,
	 @t_proc_code VARCHAR(99) = '',
	 @t_patient_age INT = 0,
	 @t_tooth_no VARCHAR(99) = '' ,
	 @t_data_set_name VARCHAR(99)= '' ;
	
	-- For Holding Results of Queries
	DECLARE @has_D2xx_D3xx_D7140_D7210 INT = 0;
	DECLARE @has_D21xx_D239x_on_same_tooth INT = 0;
	
	-- Variables below are used for setting Output parameters
	DECLARE @temp_count INT = 0 , @count_total_records INT = 0 , @count_defective_records INT = 0;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	


	DECLARE test_row_cursor CURSOR FOR
				SELECT 	id, attend, MID, date_of_service, tooth_no
				FROM  	test_cases.dbo.t_temp_21_overuseOfBorL_test_table;
				OPEN test_row_cursor
				FETCH test_row_cursor INTO @t_id, @t_attend, @t_mid, @t_dos, @t_tooth_no;

  WHILE @@FETCH_STATUS = 0
         BEGIN   


SELECT 	@has_D2xx_D3xx_D7140_D7210=COUNT(*)
		FROM 	fl_production.dbo.src_over_use_of_b_or_l_history
		WHERE 	(MID = @t_mid) AND
			(date_of_service < @t_dos AND date_of_service BETWEEN dateadd(year, -1, @t_dos) AND @t_dos) AND
			(proc_code LIKE 'D2%' OR proc_code LIKE 'D3%' OR proc_code IN ('D7140','D7210'))
			;


	IF(@has_D2xx_D3xx_D7140_D7210 = 0 ) BEgin
			UPDATE 	test_cases.dbo.t_temp_21_overuseOfBorL_test_table
			SET 	exp_reason_level = 1,
				exp_ryg_status = 'red',
				test_detail = 'Has no Tx codes (D2xxx, D3xxx, D7140, D7210) in the 3 years.'
			WHERE 	id = @t_id;
			end
	ELSE Begin
			SELECT 	@has_D21xx_D239x_on_same_tooth=COUNT(*)
			FROM 	fl_production.dbo.src_over_use_of_b_or_l_history
			WHERE 	(MID = @t_mid) AND
				(date_of_service < @t_dos AND date_of_service BETWEEN dateadd(year, -3, @t_dos) AND @t_dos) AND
				(proc_code LIKE 'D21%' OR proc_code LIKE 'D239%') AND
				(tooth_no = @t_tooth_no)
				;



				IF(@has_D21xx_D239x_on_same_tooth = 0)BEGIN
					UPDATE 	test_cases.dbo.t_temp_21_overuseOfBorL_test_table
					SET 	exp_reason_level = 2,
						exp_ryg_status = 'red',
						test_detail = 'Has no D21xx or D239x on this same tooth during the previous 3 years.'
					WHERE 	id = @t_id;
					END
				ELSE BEgin
					UPDATE 	test_cases.dbo.t_temp_21_overuseOfBorL_test_table
					SET 	exp_reason_level = 3,
						exp_ryg_status = 'green',
						test_detail = 'Has D21xx or D239x on this same tooth during the previous 3 years.'
					WHERE 	id = @t_id;
					END

END

FETCH NEXT FROM test_row_cursor INTO  @t_id, @t_attend, @t_mid, @t_dos, @t_tooth_no; 

END -- while end

ClOSE test_row_cursor
DEALLOCATE test_row_cursor


UPDATE 	test_cases.dbo.t_temp_21_overuseOfBorL_test_table
	SET 	test_status = 1
	WHERE 	act_reason_level = exp_reason_level
		;
	
UPDATE 	test_cases.dbo.t_temp_21_overuseOfBorL_test_table
	SET 	test_status = 0
	WHERE 	act_reason_level != exp_reason_level
		;


SELECT @count_total_records=COUNT(*) FROM test_cases.dbo.t_temp_21_overuseOfBorL_test_table;
	SELECT @count_defective_records=COUNT(*)  FROM test_cases.dbo.t_temp_21_overuseOfBorL_test_table WHERE  act_reason_level != exp_reason_level;
	SET @temp_count=0;
	SELECT @temp_count=COUNT(*)  FROM test_cases.dbo.t_temp_21_overuseOfBorL_test_table WHERE exp_reason_level IS NULL;
	

	 IF(@temp_count=0) begin
			SET @out_test_status=1;
			SET @test_detail=CAST(@count_total_records AS varchar(50)) +
							 ' records are tested.No ambiguous record found.';
		end
		ELSE Begin
			SET @out_test_status=0;
			SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
							 ' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) ;
		
		END 


END


GO
/****** Object:  StoredProcedure [dbo].[t_22_________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_22_________________]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


END


GO
/****** Object:  StoredProcedure [dbo].[t_22_sealantInsteadOfFill_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_22_sealantInsteadOfFill_TS2_RESULT_TABLE] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 
END


GO
/****** Object:  StoredProcedure [dbo].[t_22_sealantInsteadOfFill_ts2_tc2A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[t_22_sealantInsteadOfFill_ts2_tc2A_testTableGen]
	-- Add the parameters for the stored procedure here
	@out_success bit output


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


		DECLARE @reason_percent DECIMAL(4,2),
		 @reason_total_count INT,
		 @temp_count INT,
         @reason_sample_count INT,
         @selected_reason INT,
         @iterator INT
		 ,@max_process_date DATETIME2(0);
    -- Insert statements for procedure here


	if(object_id(N'[dbo].[t_temp_22_sealant_test_table]', 'U') is not null)
			DROP TABLE [dbo].t_temp_22_sealant_test_table;

CREATE TABLE [dbo].[t_temp_22_sealant_test_table] (
	  id BIGINT identity(1,1) ,
	  res_id BIGINT NOT NULL,
	  attend VARCHAR(20) DEFAULT NULL,
	  mid VARCHAR(50) DEFAULT NULL,
	  date_of_service DATETIME DEFAULT NULL,
	  proc_code VARCHAR(50) DEFAULT NULL,
	  act_reason_level INT DEFAULT NULL,
	  exp_reason_level INT DEFAULT NULL,
	  act_ryg_status VARCHAR(30) DEFAULT NULL,
	  exp_ryg_status VARCHAR(30) DEFAULT NULL,
	  test_status bit DEFAULT NULL,
	  test_detail varchar(250) DEFAULT NULL,
	   PRIMARY KEY (id),
	
        ) ;  
        TRUNCATE TABLE [dbo].[t_temp_22_sealant_test_table];

	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.[results_sealants_instead_of_filling]
	WHERE	isactive  = 1	


   SET @iterator = 1;
   
		WHILE(@iterator < 4) Begin
		SET @selected_reason= @iterator;

		SELECT @reason_percent=reason_weight FROM dbo.t_global_reasons_ratio  WHERE algo_id=22 AND reason_level=@selected_reason;
		SET @reason_total_count=0;
		SET @reason_sample_count=0;
		
		SELECT @reason_total_count= COUNT(*) FROM fl_production.dbo.[results_sealants_instead_of_filling] 
		WHERE reason_level=@selected_reason AND process_date = @max_process_date;
		SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100
			IF (@reason_sample_count < 0)
               SET @reason_sample_count = 50




	INSERT INTO dbo.t_temp_22_sealant_test_table
	(res_id,
	attend,
	MID,
	date_of_service,
	proc_code,
	act_reason_level,
	act_ryg_status)
		SELECT top (@reason_sample_count)
		 id,attend,MID,date_of_service,proc_code,reason_level,ryg_status
		FROM fl_production.dbo.results_sealants_instead_of_filling WHERE reason_level=@selected_reason AND isactive=1 AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1);
		SET @iterator = @iterator + 1;
		END

	SELECT @temp_count=COUNT(*) FROM  fl_production.dbo.results_sealants_instead_of_filling;
	IF(@temp_count > 0 ) begin
		SET @out_success=1;
		end
	ELSE 
	begin
		SET @out_success=0;
        END 
END


GO
/****** Object:  StoredProcedure [dbo].[t_22_sealantInsteadOfFill_ts2_tc2B_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_22_sealantInsteadOfFill_ts2_tc2B_resReasonsValidation]
 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @t_id BIGINT,
    @t_attend VARCHAR(50) = '',
    @t_mid VARCHAR(50) =  '',
    @t_dos DATETIME = NULL,
    @t_proc_code VARCHAR(15); 

  DECLARE @has_tx_code  INT = 0, @has_D2xx_D3xx int  = 0;  
  
  DECLARE @temp_count INT = 0,@count_total_records INT = 0,@count_defective_records INT = 0;
   DECLARE
          test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR
		  SELECT id, MID,attend,date_of_service,proc_code FROM dbo.t_temp_22_sealant_test_table ;
		  OPEN test_row_cursor

FETCH  FROM test_row_cursor
                INTO @t_id, @t_mid, @t_attend,@t_dos, @t_proc_code; 


  WHILE @@FETCH_STATUS = 0
         BEGIN   



	SELECT @has_tx_code =	COUNT(*)   
		FROM 	fl_production.dbo.src_sealants_instead_of_filling_data_set_b 
		WHERE 	MID=@t_mid AND 
			-- attend = t_attend AND 
			date_of_service < @t_dos AND 
			(date_of_service BETWEEN  dateadd(year, -1, @t_dos) AND @t_dos ) ;




		IF (@has_tx_code = 0) BEgin 
			UPDATE 	test_cases.dbo.t_temp_22_sealant_test_table 
			SET 	exp_reason_level=1,
				exp_ryg_status = 'green', 
				test_detail='Has no Tx code in Data Set B.'
			WHERE 	id=@t_id
			; 	END

		ELSE  BEgin
			SET @has_D2xx_D3xx =0;		
			SELECT 	@has_D2xx_D3xx=COUNT(*) 
			FROM 	fl_production.dbo.[src_sealants_instead_of_filling_data_set_b] 
			WHERE	MID=@t_mid AND 
				-- attend = t_attend AND 
				(proc_code LIKE 'D2%' OR proc_code LIKE 'D3%') AND  
				date_of_service < @t_dos AND 
				(date_of_service BETWEEN dateadd(year, -1, @t_dos)  AND @t_dos )
				;



				IF(@has_D2xx_D3xx != 0) BEgin 
					UPDATE dbo.t_temp_22_sealant_test_table 
					SET exp_reason_level=2,
					exp_ryg_status = 'green',  
					test_detail='Has D2xxx or D3xxx Tx code in Data Set B.'
					WHERE id=@t_id;
					END

				ELSE 	  Begin
					UPDATE test_cases.dbo.t_temp_22_sealant_test_table 
					SET exp_reason_level=3, 
					exp_ryg_status = 'red', 
					test_detail='Has D2xxx or D3xxx Tx code in Data Set B.'
					WHERE id=@t_id;
				END  ; 



		END -- Outer IF END	

		FETCH NEXT FROM test_row_cursor INTO  @t_id, @t_mid, @t_attend,@t_dos, @t_proc_code; 

END -- while end
 ClOSE test_row_cursor
DEALLOCATE test_row_cursor


  UPDATE test_cases.dbo.t_temp_22_sealant_test_table SET test_status=1 WHERE act_reason_level=exp_reason_level;
  UPDATE test_cases.dbo.t_temp_22_sealant_test_table SET test_status=0 WHERE act_reason_level!=exp_reason_level;
  
   -- setting up records counts
  SELECT @count_total_records=COUNT(*) FROM test_cases.dbo.t_temp_22_sealant_test_table;
  SELECT @count_defective_records=COUNT(*) FROM test_cases.dbo.t_temp_22_sealant_test_table WHERE  act_reason_level != exp_reason_level;
	
	SET @temp_count=0;
  SELECT @temp_count=COUNT(*) FROM test_cases.dbo.t_temp_22_sealant_test_table WHERE act_reason_level != exp_reason_level;
   IF(@temp_count=0) begin
			SET @out_test_status=1;
			SET @test_detail=CAST(@count_total_records AS varchar(50)) +
							 ' records are tested.No ambiguous record found.';
		end
		ELSE Begin
			SET @out_test_status=0;
			SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
							 ' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) ;
		
		END 
END


GO
/****** Object:  StoredProcedure [dbo].[t_23_________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_23_________________]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


END


GO
/****** Object:  StoredProcedure [dbo].[t_23_cbu_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_23_cbu_TS2_RESULT_TABLE] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
END


GO
/****** Object:  StoredProcedure [dbo].[t_23_cbu_ts2_tc1A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_23_cbu_ts2_tc1A_testTableGen] 
	-- Add the parameters for the stored procedure here
	@out_success bit output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON;

	DECLARE @reason_percent DECIMAL(4,2),
			 @reason_total_count int ,
			 @temp_count INT ,
			 @reason_sample_count INT,
			 @selected_reason INT,
			 @iterator INT
			 ,@max_process_date DATETIME2(0);

	if(object_id(N'[dbo].[t_temp_23_cbu_test_table]', 'U') is not null)
			DROP TABLE [dbo].[t_temp_23_cbu_test_table];
	    
CREATE TABLE  [dbo].[t_temp_23_cbu_test_table]  (
	   id  BIGINT identity(1,1),
	   res_id  BIGINT  NOT NULL,
	   proc_code  VARCHAR(50) DEFAULT NULL,
	   attend  VARCHAR(20) DEFAULT NULL,
	   claim_id  VARCHAR(60) DEFAULT NULL,
	   mid  VARCHAR(50) DEFAULT NULL,
	   date_of_service  DATETIME DEFAULT NULL,
	  
	   tooth_no  VARCHAR(15) DEFAULT NULL,
	   remarks  VARCHAR(1000) DEFAULT '',
	   actual_reason_level  INT DEFAULT NULL,
	   expected_reason_level  INT DEFAULT NULL,
	  
	   actual_ryg_status  VARCHAR(30) DEFAULT NULL,
	   expected_ryg_status  VARCHAR(30) DEFAULT NULL,
	  
	   test_status  bit DEFAULT NULL,
	   test_detail  varchar(250) DEFAULT NULL,
	   PRIMARY KEY ( id ),
        ) ;  

        TRUNCATE TABLE dbo.t_temp_23_cbu_test_table;

	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.[results_cbu]
	WHERE	isactive  = 1	
	





        SET @iterator = 1;

		WHILE(@iterator < 7) Begin
		SET @selected_reason= @iterator;
		SELECT @reason_percent=reason_weight  FROM dbo.t_global_reasons_ratio  WHERE algo_id=23 AND reason_level=@selected_reason;
		SET @reason_total_count=0;
		SET @reason_sample_count=0;

		SELECT @reason_total_count=COUNT(*) FROM fl_production.dbo.[results_cbu] WHERE reason_level=@selected_reason and  process_date = @max_process_date;
			SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100
			IF (@reason_sample_count < 0)
               SET @reason_sample_count = 50

		INSERT INTO dbo.t_temp_23_cbu_test_table(
		res_id,
		attend,
		MID,
		claim_id,
		proc_code
		,date_of_service,
		tooth_no,
		remarks,
		actual_reason_level,
		actual_ryg_status)
		SELECT top (@reason_sample_count)
		id,
		attend,
		MID,
		claim_id,
		proc_code,
		date_of_service,
		tooth_no,
		remarks,
		reason_level,
		ryg_status
		FROM fl_production.dbo.[results_cbu] WHERE reason_level=@selected_reason AND isactive=1 AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1) ;
		SET @iterator = @iterator + 1;
	End --while end

	SELECT @temp_count=COUNT(*)  FROM  [dbo].[t_temp_23_cbu_test_table];
	IF(@temp_count > 0 ) begin
		SET @out_success=1;
		end
	ELSE 
	begin
		SET @out_success=0;
        END 
END

GO
/****** Object:  StoredProcedure [dbo].[t_23_cbu_ts2_tc1B_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_23_cbu_ts2_tc1B_resReasonsValidation] 
	-- Add the parameters for the stored procedure here
	 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
  DECLARE @t_id BIGINT = 0,
   @t_attend VARCHAR(20) = NULL,
   @t_mid VARCHAR(50) = NULL,
   @t_claim_id VARCHAR(60) = NULL,
   @t_dos DATETIME = NULL,
   @t_proc_code VARCHAR(50) = NULL,
   @t_tooth_no VARCHAR(5) = NULL;
  
  -- ------------------------------------------------------------------------------
  -- Variables below are used in if else blocks
  DECLARE @count_ INT = 0,
   @has_root_canal_treat INT = 0 , 
   @has_large_filling INT = 0,
    @has_d2xx_d3xx_d6xx_a INT = 0,
	 @has_d2xx_d3xx_d6xx_b INT = 0,
	 @has_additional_tooth INT = 0;
  
  -- ----------------------------------------------------------------------------
  -- Variables below are used after loop to hold stats of tested records
  DECLARE @temp_count INT = 0,@count_total_records INT = 0,@count_defective_records INT = 0;
  DECLARE @dos_root_canal_treat DATETIME = NULL;

   DECLARE
          test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR
		SELECT id,proc_code ,attend,MID,claim_id,date_of_service,tooth_no FROM dbo.t_temp_23_cbu_test_table ;
 
 -- ---------------------------------------------------------------------------
  -- Marking all records as reason level 4 where remarks = nea,retention,narrative,photo
		 UPDATE dbo.t_temp_23_cbu_test_table
  SET 	 expected_reason_level=4, expected_ryg_status='green'
  WHERE  date_of_service !='' AND
	 proc_code != '' AND
	 attend !='' AND
	 MID !='' AND
	(remarks LIKE '%retain%' OR remarks LIKE '%retention%'OR remarks LIKE '%narrative%' OR remarks LIKE '%photo%'
	  OR remarks LIKE '%nea%');
 -----------------------------------------------------------------------------	
		

		OPEN test_row_cursor
FETCH  FROM test_row_cursor
	INTO  @t_id,@t_proc_code, @t_attend, @t_mid,@t_claim_id,@t_dos, @t_tooth_no;


	  WHILE @@FETCH_STATUS = 0
         BEGIN   



	-- A IF
	IF (	(@t_dos != '') AND (@t_dos IS NOT NULL) AND (@t_attend !='') AND (@t_mid !='') AND (@t_tooth_no != '') AND (@t_tooth_no IS NOT NULL) AND
		        (@t_proc_code !='') AND (@t_attend IS NOT NULL) AND (@t_mid IS NOT NULL) AND (@t_proc_code IS NOT NULL)	) Begin
		   -- -------------------------------------------------------------------------------------------------------------------------------
		   -- Check claims going back 3 years to see if there is a claim for this tooth for CDT code D2161, D2335, D2394, D2544, D2644, D2664
		   -- ------------------------------------------------------------------------------------------------------------------------------- 
		   SET @count_ =0;
		   SELECT @count_=COUNT(*)
		   FROM fl_production.dbo.cbu_procedure_performed
		   WHERE MID=@t_mid AND
			--(date_of_service BETWEEN (dateadd(YEAR, -3, @t_dos)) AND (dateadd(DAY, -1, @t_dos)) )AND
			  ( year(date_of_service)  IN (   year(@t_dos),year(@t_dos)-1,year(@t_dos)-2,year(@t_dos)-3  )) AND date_of_service < @t_dos And
			 proc_code IN ('D2161', 'D2335', 'D2394', 'D2544', 'D2644', 'D2664') AND
			 tooth_no=@t_tooth_no;
		
		   IF(@count_ > 0) Begin	
			UPDATE dbo.t_temp_23_cbu_test_table
			SET expected_reason_level=1,
			    expected_ryg_status='green'
			WHERE id=@t_id --AND expected_reason_level IS NULL;
			 -- FETCH NEXT FROM test_row_cursor INTO @t_id,@t_proc_code, @t_attend, @t_mid,@t_claim_id,@t_dos, @t_tooth_no ;
		 GOTO Branch_One;
		   END 


		   -- ------------------------------------------------------------------------------------------------------------------------
		   -- Check claims going back 6 months to see if there is a root canal treatment on this tooth, CDT D3310, D3320, D333x, D334x
		   -- ------------------------------------------------------------------------------------------------------------------------
		   SET @has_root_canal_treat = 0;
		   SELECT @has_root_canal_treat=COUNT(*), @dos_root_canal_treat= MIN(date_of_service)
		   FROM fl_production.dbo.[cbu_procedure_performed]
		   WHERE MID=@t_mid AND
			(date_of_service BETWEEN (dateadd(month, -6, @t_dos)) AND (dateadd(DAY, -1, @t_dos)) )AND
			-- ( year(date_of_service)  IN (   year(@t_dos),year(@t_dos)-1,year(@t_dos)-2,year(@t_dos)-3  )) AND date_of_service < @t_dos And
			( proc_code IN ('D3310', 'D3320') OR proc_code LIKE 'D333%' OR proc_code LIKE 'D334%' )AND
			 tooth_no=@t_tooth_no;
			 
		   IF(@has_root_canal_treat>0) Begin -- IF B
			-- --------------------------------------------------------------------------------------------
			-- Check claim going back 3 years to see if there is a large filling (D2460, D2332, D2393, D2543, 
			-- D2643, D2663) on this tooth BEFORE the date of the root canal.
			-- --------------------------------------------------------------------------------------------
			SET @has_large_filling = 0;
			SELECT @has_large_filling=COUNT(*)
			FROM fl_production.dbo.[cbu_procedure_performed]
			WHERE MID=@t_mid AND
			--(date_of_service BETWEEN (dateadd(YEAR, -3, @dos_root_canal_treat)) AND (dateadd(DAY, -1, @dos_root_canal_treat)) )AND
			 ( year(date_of_service)  IN (   year(@dos_root_canal_treat),year(@dos_root_canal_treat)-1,year(@dos_root_canal_treat)-2,year(@dos_root_canal_treat)-3  )) AND date_of_service < @dos_root_canal_treat And
			proc_code IN ('D2460', 'D2332', 'D2393','D2543', 'D2643', 'D2663') AND
			tooth_no=@t_tooth_no;
			IF(@has_large_filling >0) BEGIN
				UPDATE dbo.t_temp_23_cbu_test_table
				SET expected_reason_level=3,
				expected_ryg_status='green'
				WHERE id=@t_id AND expected_reason_level IS NULL;
			--	FETCH NEXT FROM test_row_cursor INTO @t_id,@t_proc_code, @t_attend, @t_mid,@t_claim_id,@t_dos, @t_tooth_no ;
			GOTO Branch_One;
			END 


		   END  -- B IF END





		SELECT @has_d2xx_d3xx_d6xx_a=COUNT(*)
		FROM fl_production.dbo.[cbu_procedure_performed]
		WHERE MID=@t_mid   -- > Changed
		     -- AND ( date_of_service BETWEEN (dateadd(YEAR, -3, @t_dos)) AND @t_dos)
		   and ( year(date_of_service)  IN (   year(@t_dos),year(@t_dos)-1,year(@t_dos)-2,year(@t_dos)-3  )) AND date_of_service <= @t_dos 
		      AND (proc_code LIKE 'D2%' OR proc_code LIKE 'D3%' OR proc_code LIKE 'D6%') 
		      AND proc_code != 'D2950'
		      AND tooth_no = @t_tooth_no;
		
		SELECT @has_d2xx_d3xx_d6xx_b=COUNT(*)
		FROM fl_production.dbo.[cbu_procedure_performed]
		WHERE MID=@t_mid  -- > Changed
		      AND 
			--  ( date_of_service BETWEEN (dateadd(YEAR, -3, @t_dos)) AND @t_dos)
			   ( year(date_of_service)  IN (   year(@t_dos),year(@t_dos)-1,year(@t_dos)-2,year(@t_dos)-3  )) AND date_of_service <= @t_dos 
		      AND proc_code = 'D2950'
		      AND tooth_no = @t_tooth_no;


			  --------------------2---------------------
		IF(@has_d2xx_d3xx_d6xx_a = 0 AND @has_d2xx_d3xx_d6xx_b < 2)Begin
			UPDATE dbo.t_temp_23_cbu_test_table
			SET expected_reason_level=2,
			    expected_ryg_status='red'
			WHERE id=@t_id AND expected_reason_level IS NULL;
	--	FETCH NEXT FROM test_row_cursor INTO @t_id,@t_proc_code, @t_attend, @t_mid,@t_claim_id,@t_dos, @t_tooth_no ;;
		GOTO Branch_One;
		END
	
		ELSE BEGIN
			SELECT @has_additional_tooth=COUNT(DISTINCT(tooth_no))
			FROM fl_production.dbo.[cbu_procedure_performed]
			WHERE MID=@t_mid AND
			--    ( date_of_service BETWEEN (dateadd(YEAR, -3, @t_dos)) AND (dateadd(DAY, -1, @t_dos)) )AND
			 ( year(date_of_service)  IN (   year(@t_dos),year(@t_dos)-1,year(@t_dos)-2,year(@t_dos)-3  )) AND date_of_service < @t_dos And
			 date_of_service <= @t_dos and
			    ( proc_code LIKE 'D2%' OR proc_code LIKE 'D3%' OR proc_code LIKE 'D6%' ) AND
			    tooth_no != @t_tooth_no AND
			    (proc_code NOT IN ('D2140', 'D2150', 'D2330', 'D2331', 'D2391', 'D2392', 'D2410',
						      'D2420', 'D2510', 'D2520', 'D2610', 'D2620', 'D2650', 'D2651',
						     'D2960', 'D2961', 'D2962') 
				AND proc_code NOT LIKE 'D8%'
				AND proc_code NOT LIKE 'D997%'
				AND proc_code NOT LIKE 'D0%'
				AND proc_code NOT LIKE 'D1%');


				--------------------1---------------------
				IF(@has_additional_tooth>0) Begin
				UPDATE dbo.t_temp_23_cbu_test_table
				SET expected_reason_level=6,
				expected_ryg_status='yellow'
				WHERE id=@t_id AND expected_reason_level IS NULL;
			--	FETCH NEXT FROM test_row_cursor INTO @t_id,@t_proc_code, @t_attend, @t_mid,@t_claim_id,@t_dos, @t_tooth_no ;;
				GOTO Branch_One;
				end
			ELSE BEgin
				UPDATE t_temp_23_cbu_test_table
				SET expected_reason_level=5,
				expected_ryg_status='red'
				WHERE id=@t_id AND expected_reason_level IS NULL;
		--	FETCH NEXT FROM test_row_cursor INTO @t_id,@t_proc_code, @t_attend, @t_mid,@t_claim_id,@t_dos, @t_tooth_no ;;
			GOTO Branch_One;
			END 
			--------------------1---------------------



			END
			--------------------2---------------------


			END -- A if end
ELSE BEgin
UPDATE 	dbo.t_temp_23_cbu_test_table
SET 	expected_reason_level = -1,
	expected_ryg_status = 'N/A',
	test_detail = 'Important fields are empty'
WHERE 	id=@t_id;
end -- A	else end

Branch_One: 
	FETCH NEXT FROM test_row_cursor INTO @t_id,@t_proc_code, @t_attend, @t_mid,@t_claim_id,@t_dos, @t_tooth_no ;
end -- while end

ClOSE test_row_cursor
DEALLOCATE test_row_cursor

 UPDATE dbo.t_temp_23_cbu_test_table SET test_status=1 WHERE actual_reason_level=expected_reason_level;
 UPDATE dbo.t_temp_23_cbu_test_table SET test_status=0 WHERE actual_reason_level!=expected_reason_level;



 SELECT @count_total_records =COUNT(*)  FROM dbo.t_temp_23_cbu_test_table;
  SELECT @count_defective_records= COUNT(*)  FROM dbo.t_temp_23_cbu_test_table WHERE  actual_reason_level != expected_reason_level;


  SET @temp_count=0;
  SELECT @temp_count=COUNT(*) FROM dbo.t_temp_23_cbu_test_table WHERE actual_reason_level != expected_reason_level;;

     IF(@temp_count=0) begin
			SET @out_test_status=1;
			SET @test_detail=CAST(@count_total_records AS varchar(50)) +
							 ' records are tested.No ambiguous record found.';
		end
		ELSE Begin
			SET @out_test_status=0;
			SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
							 ' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) ;
		
		END 


END



GO
/****** Object:  StoredProcedure [dbo].[t_24_________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_24_________________]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

END


GO
/****** Object:  StoredProcedure [dbo].[t_24_denyPulpOnAdult_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_24_denyPulpOnAdult_TS2_RESULT_TABLE] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

END


GO
/****** Object:  StoredProcedure [dbo].[t_24_denyPulpOnAdult_ts2_tc5A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_24_denyPulpOnAdult_ts2_tc5A_testTableGen]
	-- Add the parameters for the stored procedure here
	@out_success bit output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON;


		DECLARE @reason_percent DECIMAL(4,2),
		 @reason_total_count int ,
		 @temp_count INT,
         @reason_sample_count INT,
         @selected_reason INT,
         @iterator INT
		  ,@max_process_date DATETIME2(0);
      
	  
	if(object_id(N'[dbo].[t_temp_24_denyPulpOnAdult_test_table]', 'U') is not null)
			DROP TABLE [dbo].[t_temp_24_denyPulpOnAdult_test_table];
	    
	  
	 CREATE TABLE [dbo].[t_temp_24_denyPulpOnAdult_test_table] (
	  id BIGINT IDENTITY(1,1),
	  res_id BIGINT  NOT NULL,
	  proc_code VARCHAR(50) DEFAULT NULL,
	  attend VARCHAR(20) DEFAULT NULL,
	  mid VARCHAR(50) DEFAULT NULL,
	  date_of_service DATETIME DEFAULT NULL,
	  tooth_no VARCHAR(15) DEFAULT NULL,
	  actual_reason_level INT DEFAULT NULL,
	  expected_reason_level INT DEFAULT NULL,
	  actual_ryg_status VARCHAR(30) DEFAULT NULL,
	  expected_ryg_status VARCHAR(30) DEFAULT NULL,
	  actual_status VARCHAR(250) DEFAULT NULL,
	  expected_status VARCHAR(250) DEFAULT NULL,
	  
	  test_status bit DEFAULT NULL,
	  test_detail varchar(250) DEFAULT NULL,
	   PRIMARY KEY (id)
	
        ) ;  
        TRUNCATE TABLE dbo.t_temp_24_denyPulpOnAdult_test_table;
	
	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.[results_deny_pulpotomy_on_adult]
	WHERE	isactive  = 1	
	
	  
SET @iterator = 1;

        WHILE(@iterator < 3) begin

		SET @selected_reason= @iterator;
		SELECT @reason_percent= reason_weight FROM [dbo].[t_global_reasons_ratio]  WHERE algo_id=24 AND reason_level=@selected_reason;
		SET @reason_total_count=0;
		SET @reason_sample_count=0;    

		SELECT @reason_total_count=COUNT(*)  FROM  fl_production.dbo.[results_deny_pulpotomy_on_adult] WHERE reason_level=@selected_reason 
		AND process_date = @max_process_date;
		SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

			IF (@reason_sample_count < 0)
               SET @reason_sample_count = 50

	INSERT INTO dbo.t_temp_24_denyPulpOnAdult_test_table 
			(res_id,
			proc_code,
			attend,
			MID,
			date_of_service,
			tooth_no,
			actual_reason_level,
			actual_ryg_status,
			actual_status) 
		SELECT top (@reason_sample_count) 
		 id,
		proc_code,
		attend,
		MID,
		date_of_service,
		tooth_no,
		reason_level,
		ryg_status,
		STATUS
		FROM fl_production.dbo.[results_deny_pulpotomy_on_adult] 
		WHERE reason_level=@selected_reason AND isactive=1 AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1) ;
		
		
		SET @iterator = @iterator + 1;
		End--while end


SELECT @temp_count=COUNT(*)  FROM  [dbo].[t_temp_24_denyPulpOnAdult_test_table];
	IF(@temp_count > 0 ) begin
		SET @out_success=1;
		end
	ELSE 
	begin
		SET @out_success=0;
        END 
        
END


GO
/****** Object:  StoredProcedure [dbo].[t_24_denyPulpOnAdult_ts2_tc5B_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_24_denyPulpOnAdult_ts2_tc5B_resReasonsValidation]	-- Add the parameters for the stored procedure here
		 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @t_id BIGINT = 0,
   @t_attend VARCHAR(20) = '',
   @t_mid VARCHAR(50) = '',
   @t_dos DATETIME = NULL,
   @t_proc_code VARCHAR(50) = '',
   @t_tooth_no VARCHAR(15) = '';


   DECLARE @is_emergencyEvaluation_code INT = 0;
   
  -- -------------------------------------------------------------------------------
  -- Variables below are used after loop to hold stats of tested records
  -- -------------------------------------------------------------------------------
  DECLARE @temp_count INT = 0 ,@count_total_records INT = 0 ,@count_defective_records INT = 0;


     DECLARE
          test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR
		  SELECT id,proc_code ,attend,MID,date_of_service,tooth_no FROM dbo.t_temp_24_denyPulpOnAdult_test_table 
OPEN test_row_cursor
FETCH  FROM test_row_cursor
                INTO @t_id,@t_proc_code, @t_attend, @t_mid,@t_dos,@t_tooth_no;

	      WHILE @@FETCH_STATUS = 0
         BEGIN     
  
  IF((@t_proc_code != 'D3220') OR (@t_tooth_no='') OR (@t_tooth_no IS NULL)) begin
			UPDATE dbo.t_temp_24_denyPulpOnAdult_test_table
			SET expected_reason_level=-1,
			expected_ryg_status='N/A',
			expected_status='N/A',
			test_detail='Tooth No. is empty or procedure code id not D3220.'
			WHERE id=@t_id;
	end
   ELSE BEGIN
				IF (@t_tooth_no IN('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U'))BEGIN
				UPDATE dbo.t_temp_24_denyPulpOnAdult_test_table
				SET expected_reason_level=1,
				expected_ryg_status='green',
				expected_status='Allow Code D3220',
				test_detail='Tooth No is ('+ cast(@t_tooth_no AS varchar(50)) +') which is alphabatical.'
				WHERE id=@t_id;
				END

				ELSE BEGIN
				SELECT @is_emergencyEvaluation_code=COUNT(*)
				FROM fl_production.dbo.src_deny_pulpotomy_algo_on_adult
				WHERE proc_code='D0140'
				AND date_of_service IN (@t_dos)
				AND MID=@t_mid;
				

							IF(@is_emergencyEvaluation_code !=0 ) BEGIN
							UPDATE test_cases.dbo.t_temp_24_denyPulpOnAdult_test_table
							SET expected_reason_level=2,
							expected_ryg_status='red',
							expected_status='Downcode to Code D3221',
							test_detail='Yes, there is emergency evaluation procedure code(D0140) on same date ['+ cast(@t_dos AS varchar(50)) +']'
							WHERE id=@t_id;
							END
						ELSE BEGIN
							UPDATE test_cases.dbo.t_temp_24_denyPulpOnAdult_test_table
							SET expected_reason_level=3,
							expected_ryg_status='yellow',
							expected_status='Allow D3220',
							test_detail='No, there is no emergency evaluation procedure code(D0140) on same date ['+ cast(@t_dos AS varchar(50)) +']'
							WHERE id=@t_id;
						END 
				END
   END
   FETCH NEXT FROM test_row_cursor
                INTO @t_id,@t_proc_code, @t_attend, @t_mid,@t_dos,@t_tooth_no;

END -- while end
 ClOSE test_row_cursor
DEALLOCATE test_row_cursor



  UPDATE test_cases.dbo.t_temp_24_denyPulpOnAdult_test_table SET test_status=1 WHERE actual_reason_level=expected_reason_level;
  UPDATE test_cases.dbo.t_temp_24_denyPulpOnAdult_test_table SET test_status=0 WHERE actual_reason_level!=expected_reason_level;
  
  -- setting up records counts
  SELECT  @count_total_records=COUNT(*) FROM test_cases.dbo.t_temp_24_denyPulpOnAdult_test_table;
  SELECT   @count_defective_records=COUNT(*) FROM test_cases.dbo.t_temp_24_denyPulpOnAdult_test_table WHERE  actual_reason_level != expected_reason_level;
	 SET @temp_count=0;
  SELECT @temp_count=COUNT(*) FROM test_cases.dbo.t_temp_24_denyPulpOnAdult_test_table WHERE  actual_reason_level != expected_reason_level;

   IF(@temp_count=0) begin
			SET @out_test_status=1;
			SET @test_detail=CAST(@count_total_records AS varchar(50)) +
							 ' records are tested.No ambiguous record found.';
		end
		ELSE Begin
			SET @out_test_status=0;
			SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
							 ' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) ;
		
		END 

END



GO
/****** Object:  StoredProcedure [dbo].[t_25____________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[t_25____________________] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
END


GO
/****** Object:  StoredProcedure [dbo].[t_25_denyOtherXray_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_25_denyOtherXray_TS2_RESULT_TABLE]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

END


GO
/****** Object:  StoredProcedure [dbo].[t_25_denyOtherXray_ts2_tc2A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_25_denyOtherXray_ts2_tc2A_testTableGen] 
	-- Add the parameters for the stored procedure here
	@out_success bit output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON;
    -- Insert statements for procedure here



		DECLARE @reason_percent DECIMAL(4,2),
		 @reason_total_count int,
		 @temp_count INT,
         @reason_sample_count INT,
         @selected_reason INT,
         @iterator INT
		 ,@max_process_date DATETIME2(0);


if(object_id(N'[dbo].[t_temp_25_denyOtherXray_test_table]', 'U') is not null)
			DROP TABLE [dbo].[t_temp_25_denyOtherXray_test_table] 
	  

CREATE TABLE [dbo].[t_temp_25_denyOtherXray_test_table] (
	  id BIGINT IDENTITY(1,1),
	  res_id BIGINT NOT NULL,
	  attend VARCHAR(20) DEFAULT NULL,
	  mid VARCHAR(50) DEFAULT NULL ,
	  date_of_service DATETIME DEFAULT NULL,
	  proc_code VARCHAR(50) DEFAULT NULL,
	  tooth_no VARCHAR(15) DEFAULT NULL,
	  actual_reason_level INT DEFAULT NULL,
	  expected_reason_level INT DEFAULT NULL,
	  test_status bit DEFAULT NULL,
	  test_detail varchar(250) DEFAULT NULL,
	   PRIMARY KEY (id),
        )  
       ;
	    TRUNCATE TABLE [dbo].[t_temp_25_denyOtherXray_test_table];
			
	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.[results_deny_otherxrays_if_fmx_done]
	WHERE	isactive  = 1

SET @iterator = 1;
        WHILE(@iterator < 3) begin


		SET @selected_reason= @iterator;
		SELECT @reason_percent= reason_weight FROM [dbo].[t_global_reasons_ratio]  WHERE algo_id=25 AND reason_level=@selected_reason;
		SET @reason_total_count=0;
		SET @reason_sample_count=0;
		
		
		SELECT @reason_total_count=COUNT(*)  FROM  fl_production.dbo.[results_deny_otherxrays_if_fmx_done] WHERE reason_level=@selected_reason AND
		process_date = @max_process_date;
		SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

			IF (@reason_sample_count < 0)
               SET @reason_sample_count = 50



		INSERT INTO [dbo].[t_temp_25_denyOtherXray_test_table]
	   (res_id,
		attend,
		MID,
		date_of_service,
		proc_code,
		actual_reason_level)
		SELECT TOP (@reason_sample_count)
		id,
		attend,
		MID,
		date_of_service,
		proc_code,
		reason_level
		FROM fl_production.dbo.[results_deny_otherxrays_if_fmx_done] WHERE reason_level=@selected_reason AND isactive=1 AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1);
		

		SET @iterator = @iterator + 1;
		end -- while end


	SELECT @temp_count=COUNT(*)  FROM  [dbo].[t_temp_25_denyOtherXray_test_table];
	IF(@temp_count > 0 ) begin
		SET @out_success=1;
		end
	ELSE 
	begin
		SET @out_success=0;
        END 
        

END


GO
/****** Object:  StoredProcedure [dbo].[t_25_denyOtherXray_ts2_tc2B_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_25_denyOtherXray_ts2_tc2B_resReasonsValidation]
	-- Add the parameters for the stored procedure here
		 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	SET NOCOUNT ON;
	DECLARE @t_id BIGINT;
  DECLARE @t_attend  VARCHAR (50) , @t_mid VARCHAR (50) = '' ;
  DECLARE @t_dos DATETIME = NULL;
  DECLARE @t_proc_code VARCHAR(15); 
  
  
  DECLARE @has_D0210 INT = 0 , @has_same_date INT = 0;  
  
  DECLARE @temp_count INT = 0,@count_total_records INT = 0,@count_defective_records INT = 0
    -- Insert statements for procedure here
	  DECLARE
          test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR
		  SELECT id, MID,date_of_service,proc_code FROM test_cases.dbo.t_temp_25_denyOtherXray_test_table ;;
OPEN test_row_cursor

FETCH  FROM test_row_cursor
                INTO @t_id, @t_mid, @t_dos, @t_proc_code;
				WHILE @@FETCH_STATUS = 0
         BEGIN 
		
		
		
			SELECT	@has_same_date=COUNT(*)   
			FROM 	fl_production.dbo.[src_deny_otherxrays_if_fmx_done] 
			WHERE 	MID=@t_mid AND proc_code = 'D0210' 
				AND ((date_of_service = @t_dos) OR (date_of_service BETWEEN dateadd(DAY, -90, @t_dos)  AND @t_dos ));
		      
		  IF (@has_same_date != 0) begin
			UPDATE test_cases.dbo.t_temp_25_denyOtherXray_test_table 
			SET expected_reason_level=1, 
			test_detail='red.'
			WHERE id=@t_id;  END
		  ELSE 	Begin
			UPDATE test_cases.dbo.t_temp_25_denyOtherXray_test_table 
			SET expected_reason_level=2, 
			test_detail='green.'
			WHERE id=@t_id;
	            END  


		 FETCH NEXT FROM test_row_cursor
                INTO 
               @t_id, @t_mid, @t_dos, @t_proc_code;     
		 end -- While end
		  ClOSE test_row_cursor
DEALLOCATE test_row_cursor


UPDATE test_cases.dbo.t_temp_25_denyOtherXray_test_table
	SET test_status = 0
	WHERE	actual_reason_level != expected_reason_level;
  
	UPDATE test_cases.dbo.t_temp_25_denyOtherXray_test_table
	SET test_status = 1
	WHERE	actual_reason_level = expected_reason_level;


  SELECT @count_total_records=COUNT(*)   FROM test_cases.dbo.t_temp_25_denyOtherXray_test_table;
  SELECT @count_defective_records=COUNT(*)   FROM test_cases.dbo.t_temp_25_denyOtherXray_test_table WHERE  actual_reason_level != expected_reason_level;
	
	SET @temp_count=0;
  SELECT @temp_count=COUNT(*)  FROM test_cases.dbo.t_temp_25_denyOtherXray_test_table WHERE expected_reason_level IS NULL;
IF(@temp_count=0) begin
			SET @out_test_status=1;
			SET @test_detail=CAST(@count_total_records AS varchar(50)) +
							 ' records are tested.No ambiguous record found.';
		end
		ELSE Begin
			SET @out_test_status=0;
			SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
							 ' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) ;
		
		END 


END


GO
/****** Object:  StoredProcedure [dbo].[t_26_________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[t_26_________________]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
END


GO
/****** Object:  StoredProcedure [dbo].[t_26_denyPulpOnAdultEndo_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE  [dbo].[t_26_denyPulpOnAdultEndo_TS2_RESULT_TABLE]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
END


GO
/****** Object:  StoredProcedure [dbo].[t_26_denyPulpOnAdultEndo_ts2_tc5A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_26_denyPulpOnAdultEndo_ts2_tc5A_testTableGen] 
	-- Add the parameters for the stored procedure here
	@out_success bit output
AS
BEGIN

	SET NOCOUNT ON;
	SET  XACT_ABORT  ON



	DECLARE @reason_percent decimal(4,2) ,
	     @reason_total_count int , 
     	 @temp_count INT ,
         @reason_sample_count INT ,
         @selected_reason INT ,
         @iterator INT 
		 ,@max_process_date DATETIME2(0);
        
     
      if(object_id(N'[dbo].[t_temp_26_denyPulpOnAdultEndo_test_table]', 'U') is not null)
			DROP TABLE [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table] 
	  

	  CREATE TABLE [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table] (
	  id BIGINT IDENTITY(1,1),
	  res_id BIGINT default NULL,
	  proc_code VARCHAR(50) DEFAULT NULL,
	  attend VARCHAR(20) DEFAULT NULL,
	  mid VARCHAR(50) DEFAULT NULL,
	  date_of_service DATETIME DEFAULT NULL,
	 
	  tooth_no VARCHAR(15) DEFAULT NULL,
	  
	  actual_reason_level INT DEFAULT NULL,
	  expected_reason_level INT DEFAULT NULL,
	  
	  actual_ryg_status VARCHAR(30) DEFAULT NULL,
	  expected_ryg_status VARCHAR(30) DEFAULT NULL,
	  actual_status VARCHAR(250) DEFAULT NULL,
	  expected_status VARCHAR(250) DEFAULT NULL,
	  
	  test_status bit DEFAULT NULL,
	  test_detail varchar(250) DEFAULT NULL,
	   PRIMARY KEY (id)
	
        )  
        TRUNCATE TABLE [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table];


	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.[results_deny_pulp_on_adult_full_endo]
	WHERE	isactive  = 1




 SET @iterator = 4;
        WHILE(@iterator < 7) begin
				SET @selected_reason= @iterator;
		SELECT @reason_percent= reason_weight FROM [dbo].[t_global_reasons_ratio]  WHERE algo_id=26 AND reason_level=@selected_reason;
		SET @reason_total_count=0;
		SET @reason_sample_count=0;
		
		
		SELECT @reason_total_count=COUNT(*)  FROM  fl_production.dbo.[results_deny_pulp_on_adult_full_endo] 
		WHERE reason_level=@selected_reason AND
		process_date = @max_process_date;
		
		SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

			IF (@reason_sample_count < 0)
               SET @reason_sample_count = 50
		
		INSERT INTO [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table] 
			(res_id,
			proc_code,
			attend,
			MID,
			date_of_service,
			tooth_no,
			actual_reason_level,
			actual_ryg_status,
			actual_status) 
		SELECT top (@reason_sample_count) 
		id,
		proc_code,
		attend,
		MID,
		date_of_service,
		tooth_no,
		reason_level,
		ryg_status,
		STATUS
		FROM fl_production.dbo.[results_deny_pulp_on_adult_full_endo] 
		WHERE reason_level=@selected_reason  AND isactive=1 
		AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1);
		
		
		SET @iterator = @iterator + 1;

		end


SELECT @temp_count=COUNT(*)  FROM  [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table];
	IF(@temp_count > 0 ) begin
		SET @out_success=1;
		end
	ELSE 
	begin
		SET @out_success=0;
        END 
        


END


GO
/****** Object:  StoredProcedure [dbo].[t_26_denyPulpOnAdultEndo_ts2_tc5B_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_26_denyPulpOnAdultEndo_ts2_tc5B_resReasonsValidation]
	 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS



BEGIN

	SET NOCOUNT ON;

  -- -------------------------------------------------------------------------------
  -- Variables below are used for storting data from test Table
  -- -------------------------------------------------------------------------------
  DECLARE @t_id BIGINT = 0 ,
   @t_attend VARCHAR(20) = '',
   @t_mid VARCHAR(50) = '',
   @t_dos DATETIME = NULL,
   @t_proc_code VARCHAR(50) = '',
   @t_tooth_no VARCHAR(15) = '';

   DECLARE @temp_count INT = 0 , @count_total_records int = 0,@count_defective_records INT = 0;
  -- -------------------------------------------------------------------------------
  -- Variables below are used in if else blocks
   -- ------------------------------------------------------------------------------
   DECLARE @toothNum_has_letter INT = 0 , @has_D3220_within6months_of_curCode INT = 0;
   DECLARE @dos_D3220 DATETIME =NULL;
   



   DECLARE
          test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR
		  SELECT id,proc_code ,attend,MID,date_of_service,tooth_no FROM [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table] ;
OPEN test_row_cursor

FETCH  FROM test_row_cursor
                INTO @t_id,@t_proc_code, @t_attend, @t_mid,@t_dos,@t_tooth_no;

	      WHILE @@FETCH_STATUS = 0
         BEGIN     
		  IF(@t_attend='' OR @t_attend IS NULL OR @t_mid='' OR @t_mid IS NULL OR @t_dos='' OR @t_dos IS NULL OR @t_proc_code='' OR @t_proc_code IS NULL 
		        OR @t_tooth_no='' OR @t_tooth_no IS NULL) Begin
		        UPDATE [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table]
		        SET expected_reason_level=-1,
		            expected_ryg_status='N/A',
		            expected_status='N/A',
		            test_detail='Record under test contains invalid data.'
		        WHERE id=@t_id;
				END

	else
	Begin
		IF(@t_proc_code NOT IN('D3310','D3320','D3330', 'D3331')) Begin
					UPDATE [dbo].t_temp_26_denyPulpOnAdultEndo_test_table 
					SET expected_reason_level=-1,
						expected_ryg_status='N/A',
						expected_status='N/A',
						test_detail='Invalid code. ' + CAST(@t_proc_code AS varchar(50)) + ' is not in D3310, D3320, D3330, D3331.'
					WHERE id=@t_id;
		end
	
		Else
		Begin


		IF (@t_tooth_no IN('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U'))Begin
					-- REASON 4
					UPDATE [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table] 
					SET expected_reason_level=4,
					    expected_ryg_status='',
					    expected_status='Disallow Code D3310,D3320,D3330,D3331',
					    test_detail='red'
					WHERE id=@t_id;
					End
				ELSE  Begin
					SELECT @dos_D3220=MAX(date_of_service)   
					FROM fl_production.dbo.[src_deny_pulpotomy_algo_on_adult]
					WHERE MID=@t_mid AND
					      attend=@t_attend AND
					      proc_code='D3220' AND
					      tooth_no=@t_tooth_no AND
					      (date_of_service IS NOT NULL OR date_of_service !='');
				End

		IF((@dos_D3220 IS NOT NULL OR @dos_D3220 !='') AND (@dos_D3220 BETWEEN dateadd(month, -6, CAST(@t_dos AS datetime)) AND @t_dos)) BEGIN
						UPDATE [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table] 
						SET expected_reason_level=5,
						expected_ryg_status='yellow',
						expected_status='Allow Code D3310,D3320,D3330,D3331',
						test_detail='red'
						WHERE id=@t_id; END

					ELSE BEGIN
						UPDATE [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table] 
						SET expected_reason_level=6,
						expected_ryg_status='green',
						expected_status='Allow Code D3310,D3320,D3330,D3331',
						test_detail='red'
						WHERE id=@t_id;
			END
		END

	End

	FETCH NEXT FROM test_row_cursor
                INTO 
                @t_id,@t_proc_code, @t_attend, @t_mid,@t_dos,@t_tooth_no         

END -- while end
 ClOSE test_row_cursor
DEALLOCATE test_row_cursor

UPDATE [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table] SET test_status=1 WHERE actual_reason_level=expected_reason_level;
UPDATE [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table] SET test_status=0 WHERE actual_reason_level!=expected_reason_level;
  
  -- setting up records counts
  SELECT @count_total_records =COUNT(*)   FROM [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table];
  SELECT @count_defective_records=COUNT(*)  FROM [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table] WHERE  actual_reason_level != expected_reason_level;
  SELECT @temp_count=COUNT(*)  FROM [dbo].[t_temp_26_denyPulpOnAdultEndo_test_table] WHERE  actual_reason_level != expected_reason_level;
  
  IF(@temp_count=0) begin
			SET @out_test_status=1;
			SET @test_detail=CAST(@count_total_records AS varchar(50)) +
							 ' records are tested.No ambiguous record found.';
		end
		ELSE Begin
			SET @out_test_status=0;
			SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
							 ' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) ;
		
		END 
END


GO
/****** Object:  StoredProcedure [dbo].[t_27_________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Abdul Mateen>
-- Create date: <Create Date,,04/June/2018 >
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[t_27_________________] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

END


GO
/****** Object:  StoredProcedure [dbo].[t_27_anesthesiaDangDose_TS2_RESULT_TABLE]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[t_27_anesthesiaDangDose_TS2_RESULT_TABLE]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	
END


GO
/****** Object:  StoredProcedure [dbo].[t_27_anesthesiaDangDose_ts2_tc1A_srcTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_27_anesthesiaDangDose_ts2_tc1A_srcTableGen] 
	-- Add the parameters for the stored procedure here
	@out_success bit  OUTPUT
AS
BEGIN
	SET @out_success = NULL
declare 
	@temp_count INT ;

	SET NOCOUNT ON;
	SET  XACT_ABORT  ON
	if(object_id(N'[dbo].[t_temp_src_anesthesia_dangerous_dose]', 'U') is not null)
			DROP TABLE [dbo].[t_temp_src_anesthesia_dangerous_dose]


CREATE TABLE [dbo].[t_temp_src_anesthesia_dangerous_dose]
(
	id int  DEFAULT 0 ,
	proc_code VARCHAR(99) DEFAULT NULL,
	tooth_no VARCHAR(5) DEFAULT NULL,
	quadrant VARCHAR(2) DEFAULT NULL,
	sector VARCHAR(15) DEFAULT NULL,
	date_of_service DATETIME DEFAULT NULL,
	attend VARCHAR(20) DEFAULT NULL,
	mid VARCHAR(98) DEFAULT NULL,
	patient_age INT DEFAULT 0

	-- PRIMARY KEY (id)
	-- INDEX i_date_of_service (date_of_service),
	-- INDEX i_quadrant (quadrant),
	-- INDEX i_sector (sector)
	) 
	
	INSERT 	INTO [dbo].[t_temp_src_anesthesia_dangerous_dose]
		(id, attend, MID, date_of_service, proc_code, tooth_no, patient_age, quadrant, sector)
	SELECT 	id, attend, MID, date_of_service, proc_code, tooth_no, patient_age, quadrant, sector
	FROM 	fl_production.dbo.[src_anesthesia_dangerous_dose];

	CREATE CLUSTERED INDEX ix__c__t_temp_src_anest__mid
	ON [dbo].[t_temp_src_anesthesia_dangerous_dose] (mid asc) 

	SELECT  @temp_count=COUNT(*) FROM  [dbo].[t_temp_src_anesthesia_dangerous_dose];
	IF(@temp_count > 0 ) 
		SET @out_success=1;
	ELSE 
		SET @out_success=0;


END


GO
/****** Object:  StoredProcedure [dbo].[t_27_anesthesiaDangDose_ts2_tc1B_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_27_anesthesiaDangDose_ts2_tc1B_testTableGen]
  @out_success bit  OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON

DECLARE @reason_percent DECIMAL(5,2),
	     @reason_total_count int ,
		 @temp_count INT,
         @reason_sample_count INT,
         @selected_reason INT,
         @iterator INT,
         @_ryg_status VARCHAR(99) 
		 ,@max_process_date DATETIME2(0);
 
 if(object_id(N'[dbo].[t_temp_27_anesthesiaDangDose_test_table]', 'U') is not null)
			DROP TABLE [dbo].[t_temp_27_anesthesiaDangDose_test_table]


CREATE TABLE [dbo].[t_temp_27_anesthesiaDangDose_test_table]
 (
	id BIGINT IDENTITY(1,1),
	res_id BIGINT  DEFAULT NULL,
	attend VARCHAR(40) DEFAULT NULL,
	mid VARCHAR(99) DEFAULT NULL,
	date_of_service DATETIME DEFAULT NULL,
	patient_age INT DEFAULT 0,
	default_plus_20_percent_adj_value float default 0,
	act_no_of_carpules_l float DEFAULT 0,
	exp_no_of_carpules_l float DEFAULT 0,
	act_severity_adjustment_l float DEFAULT 0,
	exp_severity_adjustment_l float DEFAULT 0,
	act_no_of_carpules_u float DEFAULT 0,
	exp_no_of_carpules_u float DEFAULT 0,
	act_severity_adjustment_u float DEFAULT 0,
	exp_severity_adjustment_u float DEFAULT 0,
	act_final_no_of_carpules float DEFAULT 0,
	exp_final_no_of_carpules float DEFAULT 0,
	act_reason_level INT DEFAULT NULL,
	exp_reason_level INT DEFAULT NULL,
	act_ryg_status VARCHAR(15) DEFAULT NULL,
	exp_ryg_status VARCHAR(15) DEFAULT NULL,
	test_status bit DEFAULT NULL,
	test_detail varchar(99) DEFAULT NULL,
	PRIMARY KEY (id)
	) 
	
	SELECT	@max_process_date=max(process_date) 
	FROM	fl_production.dbo.[results_anesthesia_dangerous_dose]
	WHERE	isactive  = 1	;
	 SET @iterator = 1;
	

		SET @iterator = 1;
        WHILE(@iterator < 3) 
		Begin

		SET @selected_reason = @iterator
		SELECT @reason_percent=reason_weight 
		FROM [dbo].[t_global_reasons_ratio]  
		WHERE algo_id=27 AND reason_level=@selected_reason;
		SET @reason_total_count=0;
		SET @reason_sample_count=0;
		
		IF(@selected_reason = 1) 
		begin
				SELECT  @reason_total_count= COUNT(*)  FROM fl_production.dbo.[results_anesthesia_dangerous_dose]
				WHERE ryg_status='red' AND process_date = @max_process_date AND isactive = 1

				SET @_ryg_status = 'red'
			end
		ELSE
		begin
				SELECT @reason_total_count=COUNT(*)  FROM fl_production.dbo.[results_anesthesia_dangerous_dose] 
				WHERE ryg_status='green' AND process_date = @max_process_date AND isactive = 1

				SET @_ryg_status = 'green'
		end
		
	SET @reason_sample_count = (@reason_total_count * @reason_percent)  / 100

	IF (@reason_sample_count < 0)
        SET @reason_sample_count = 50
            

		
		
		INSERT INTO [dbo].[t_temp_27_anesthesiaDangDose_test_table]
		(
			res_id,
			attend,
			MID,
			date_of_service,
			patient_age,
			default_plus_20_percent_adj_value,
			act_no_of_carpules_l,
			act_severity_adjustment_l,
			act_no_of_carpules_u,
			act_severity_adjustment_u,
			act_final_no_of_carpules,
			act_reason_level,
			act_ryg_status
		)
		SELECT top (@reason_sample_count)	id, 
			attend, 
			MID, 
			date_of_service, 
			patient_age,
			default_plus_20_percent_adj_value,
			no_of_carpules_l,
			severity_adjustment_l,
			no_of_carpules_u,
			severity_adjustment_u,
			final_no_of_carpules,
	 		reason_level, 
			ryg_status
		FROM 	fl_production.dbo.[results_anesthesia_dangerous_dose]
		WHERE 	ryg_status =  @_ryg_status
				AND isactive=1 
				AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) < (@reason_percent+1);

		SET @iterator = @iterator + 1;

END


END

GO
/****** Object:  StoredProcedure [dbo].[t_27_anesthesiaDangDose_ts2_tc1C_resReasonsValidation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[t_27_anesthesiaDangDose_ts2_tc1C_resReasonsValidation]
	-- Add the parameters for the stored procedure here
	 @out_success bit  OUTPUT,
     @out_test_status bit  OUTPUT,
     @test_detail nvarchar(255)  OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	  SET NOCOUNT ON;
	  SET  XACT_ABORT  ON

    -- Insert statements for procedure here
	

	DECLARE @t_id BIGINT = 0 
	 ,@t_attend VARCHAR(99) = '' 
	 ,@t_mid VARCHAR(99) = ''
	 ,@t_dos DATETIME = NULL
	 ,@t_patient_age INT = 0;



	DECLARE @cnt_distinct_quad_l INT = 0,
	 @cnt_distinct_quad_severity_adj_l INT = 0,
	 @cnt_distinct_sector_u INT = 0,
	 @cnt_distinct_sector_severity_adj_u INT = 0;
	
 	DECLARE @temp_count INT = 0,
	 @count_total_records INT = 0, 
	 @count_defective_records INT = 0;

	DECLARE
          test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
            SELECT 
				  id, 
                  attend, 
                  MID, 
                  date_of_service, 
                  patient_age 
            FROM [dbo].[t_temp_27_anesthesiaDangDose_test_table] 

	OPEN test_row_cursor
	
	FETCH  FROM test_row_cursor
                INTO 
                  @t_id, 
                  @t_attend, 
                  @t_mid, 
                  @t_dos, 
                  @t_patient_age 

	

	      WHILE @@FETCH_STATUS = 0
         BEGIN     


		 IF(@t_patient_age < 12)
		 Begin 
		 SELECT 	@cnt_distinct_quad_l= COUNT(DISTINCT(quadrant))
			FROM 	[dbo].[t_temp_src_anesthesia_dangerous_dose]
			WHERE 	attend = @t_attend
				AND MID = @t_mid
				AND date_of_service = @t_dos
				AND quadrant IN ('LL','LR')
				;
				
			SELECT @cnt_distinct_quad_severity_adj_l=	COUNT(DISTINCT(quadrant))
			FROM 	[dbo].[t_temp_src_anesthesia_dangerous_dose]
			WHERE 	attend = @t_attend
				AND MID = @t_mid
				AND date_of_service = @t_dos
				AND quadrant IN ('LL','LR')
				AND proc_code NOT IN ('D7111','D4910')
				AND (proc_code LIKE 'D3%' OR proc_code LIKE 'D4%' OR proc_code LIKE 'D7%')
				;
				
			SELECT @cnt_distinct_sector_u = COUNT(DISTINCT(sector))
			FROM 	[dbo].[t_temp_src_anesthesia_dangerous_dose]
			WHERE 	attend = @t_attend
				AND MID = @t_mid
				AND date_of_service = @t_dos
				AND quadrant IN ('UL','UR')
				;
				
			SELECT 	@cnt_distinct_sector_severity_adj_u=COUNT(DISTINCT(sector)) 	
			FROM 	[dbo].[t_temp_src_anesthesia_dangerous_dose]
			WHERE 	attend = @t_attend
				AND MID = @t_mid
				AND date_of_service = @t_dos
				AND quadrant IN ('UL','UR')
				AND proc_code NOT IN ('D7111','D4910')
				AND (proc_code LIKE 'D3%' OR proc_code LIKE 'D4%' OR proc_code LIKE 'D7%')
				;
							
			-- Updating test table	
			UPDATE 	[dbo].[t_temp_27_anesthesiaDangDose_test_table]
			SET 	exp_no_of_carpules_l = 0.5 * @cnt_distinct_quad_l,
				exp_severity_adjustment_l = 0.5 * @cnt_distinct_quad_severity_adj_l,
				
				exp_no_of_carpules_u = 0.5 * @cnt_distinct_sector_u,
				exp_severity_adjustment_u = 0.5 *  @cnt_distinct_sector_severity_adj_u
			WHERE id = @t_id;
			
			UPDATE 	[dbo].[t_temp_27_anesthesiaDangDose_test_table]
			SET 	exp_final_no_of_carpules = exp_no_of_carpules_l + exp_severity_adjustment_l + exp_no_of_carpules_u + exp_severity_adjustment_u
			WHERE id = @t_id;
		 end -- if end

	ELSE
				Begin
				SELECT @cnt_distinct_quad_l=	COUNT(DISTINCT(quadrant))
			FROM 	[dbo].[t_temp_src_anesthesia_dangerous_dose]
			WHERE 	attend = @t_attend
				AND MID = @t_mid
				AND date_of_service = @t_dos
				AND quadrant IN ('LL','LR')
				;
				
			SELECT 	@cnt_distinct_quad_severity_adj_l=COUNT(DISTINCT(quadrant))
			FROM 	[dbo].[t_temp_src_anesthesia_dangerous_dose]
			WHERE 	attend = @t_attend
				AND MID = @t_mid
				AND date_of_service = @t_dos
				AND quadrant IN ('LL','LR')
				AND proc_code NOT IN ('D7111','D4910')
				AND (proc_code LIKE 'D3%' OR proc_code LIKE 'D4%' OR proc_code LIKE 'D7%')
				;
				
			SELECT 	@cnt_distinct_sector_u=COUNT(DISTINCT(sector))
			FROM 	[dbo].[t_temp_src_anesthesia_dangerous_dose]
			WHERE 	attend = @t_attend
				AND MID = @t_mid
				AND date_of_service = @t_dos
				AND quadrant IN ('UL','UR')
				;
				
			SELECT 	@cnt_distinct_sector_severity_adj_u=COUNT(DISTINCT(sector))
			FROM 	[dbo].[t_temp_src_anesthesia_dangerous_dose]
			WHERE 	attend = @t_attend
				AND MID = @t_mid
				AND date_of_service = @t_dos
				AND quadrant IN ('UL','UR')
				AND proc_code NOT IN ('D7111','D4910')
				AND (proc_code LIKE 'D3%' OR proc_code LIKE 'D4%' OR proc_code LIKE 'D7%')
				;
							
			-- Updating test table	
			UPDATE [dbo].[t_temp_27_anesthesiaDangDose_test_table]
			SET 	exp_no_of_carpules_l =  @cnt_distinct_quad_l,
				exp_severity_adjustment_l =  @cnt_distinct_quad_severity_adj_l * 0.5,
				
				exp_no_of_carpules_u = @cnt_distinct_sector_u,
				exp_severity_adjustment_u = @cnt_distinct_sector_severity_adj_u * 0.5
			WHERE id = @t_id;
			
			UPDATE [dbo].[t_temp_27_anesthesiaDangDose_test_table]
			SET 	exp_final_no_of_carpules = exp_no_of_carpules_l + exp_severity_adjustment_l + exp_no_of_carpules_u + exp_severity_adjustment_u
			WHERE id = @t_id;

				end -- else end

			FETCH NEXT FROM test_row_cursor
                INTO 
                  @t_id, 
                  @t_attend, 
                  @t_mid, 
                  @t_dos, 
                  @t_patient_age              
         END -- While ends
		 
		 ClOSE test_row_cursor
		 DEALLOCATE test_row_cursor
    -- =====================================================================================================================
	--            				    Algo Core Processing Ends
	-- =====================================================================================================================
	-- Marking Expected RYG Status and Reason

	UPDATE	[dbo].[t_temp_27_anesthesiaDangDose_test_table]
	SET 	exp_reason_level = 1,
		exp_ryg_status = 'red'
	WHERE 	exp_final_no_of_carpules > default_plus_20_percent_adj_value;
	

	UPDATE	[dbo].[t_temp_27_anesthesiaDangDose_test_table]
	SET 	exp_reason_level = 2,
		    exp_ryg_status = 'green'
	WHERE 	exp_final_no_of_carpules <= default_plus_20_percent_adj_value;
	
	UPDATE 	[dbo].[t_temp_27_anesthesiaDangDose_test_table]
	SET 	test_status = 0
	WHERE 	act_reason_level != exp_reason_level;
	
	UPDATE 	[dbo].[t_temp_27_anesthesiaDangDose_test_table]
	SET 	test_status = 1
	WHERE 	act_reason_level = exp_reason_level;
		
	
	
		;

	SELECT @count_total_records=COUNT(*)   FROM [dbo].[t_temp_27_anesthesiaDangDose_test_table];
	SELECT @count_defective_records=COUNT(*)   FROM [dbo].[t_temp_27_anesthesiaDangDose_test_table] WHERE  act_reason_level != exp_reason_level;
	SELECT @temp_count=COUNT(*)   FROM [dbo].[t_temp_27_anesthesiaDangDose_test_table] WHERE exp_reason_level IS NULL;

	IF(@temp_count>0) Begin
		SET @out_success=0;
		end
	ELSE Begin
		SET @out_success=1;
		end
SET @temp_count=0;
 SELECT @count_total_records =COUNT(*)   FROM [dbo].[t_temp_27_anesthesiaDangDose_test_table];
  SELECT @count_defective_records=COUNT(*)  FROM [dbo].[t_temp_27_anesthesiaDangDose_test_table] WHERE  act_reason_level != exp_reason_level;
		SELECT @temp_count=COUNT(*) FROM [dbo].[t_temp_27_anesthesiaDangDose_test_table] WHERE act_reason_level != exp_reason_level;

IF(@temp_count=0) begin
			SET @out_test_status=1;
			SET @test_detail=CAST(@count_total_records AS varchar(50)) +
							 ' records are tested.No ambiguous record found.';
		end
		ELSE Begin
			SET @out_test_status=0;
			SET @test_detail=CAST(@count_defective_records AS varchar(50)) +
							 ' ambiguous records found out of '+ 
							CAST(@count_total_records  AS varchar(50)) ;
		
		END 


END


GO
/****** Object:  StoredProcedure [dbo].[t_28_D4346_ts2_tc5A_testTableGen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ABDUL MATEEN
-- Create date: 04/SEP/2018
-- Description:	D4363 Usage Model reason level test table generation
-- =============================================
CREATE PROCEDURE [dbo].[t_28_D4346_ts2_tc5A_testTableGen] @out_success BIT OUTPUT AS BEGIN
	
	SET XACT_ABORT ON 
	SET NOCOUNT ON 
	SET @out_success = NULL DECLARE
	@reason_percent DECIMAL ( 5, 2 ),@reason_total_count INT,@temp_count INT,@reason_sample_count INT,@selected_reason INT,@iterator INT,@max_process_date DATETIME2 ( 0 )
	IF
		( object_id( N'[dbo].[t_temp_28_D4346_result_test_table]', 'U' ) IS NOT NULL ) DROP TABLE dbo.t_temp_28_D4346_result_test_table CREATE TABLE [dbo].[t_temp_28_D4346_result_test_table] (
			id bigint IDENTITY ( 1, 1 ),
			res_id bigint DEFAULT NULL,
			attend VARCHAR ( 40 ) DEFAULT NULL,
			mid VARCHAR ( 99 ) DEFAULT NULL,
			proc_code VARCHAR ( 99 ) DEFAULT NULL,
			date_of_service datetime2 ( 0 ) DEFAULT NULL,
			patient_age VARCHAR ( 99 ) DEFAULT NULL,
			act_reason_level INT DEFAULT NULL,
			exp_reason_level INT DEFAULT NULL,
			act_ryg_status VARCHAR ( 15 ) DEFAULT NULL,
			exp_ryg_status VARCHAR ( 15 ) DEFAULT NULL,
			act_status VARCHAR ( 100 ) DEFAULT NULL,
			exp_status VARCHAR ( 100 ) DEFAULT NULL,
			test_status BIT DEFAULT NULL,
			test_detail VARCHAR ( 255 ) DEFAULT NULL,
			PRIMARY KEY ( id ) 
		) SELECT
		@max_process_date = MAX ( process_date ) 
	FROM
		fl_production.dbo.[results_D4346_usage] 
	WHERE
		is_invalid = 0 
		SET @iterator = 1
	WHILE
			( @iterator < 9 ) BEGIN
				
			
			SET @selected_reason = @iterator
			SELECT
				@reason_percent = reason_weight 
			FROM
				dbo.t_global_reasons_ratio 
			WHERE
				algo_id = 28 
				AND reason_level = @selected_reason 
				
				
				SET @reason_total_count = 0 
				SET @reason_sample_count = 0 SELECT
				@reason_total_count = COUNT ( * ) 
			FROM
				fl_production.dbo.[results_D4346_usage] 
			WHERE
				reason_level = @selected_reason 
				AND process_date = @max_process_date 
				AND is_invalid = 0
				SET @reason_sample_count = ( @reason_total_count * @reason_percent ) / 100
			IF
				( @reason_sample_count <= 0 ) 
				
				SET @reason_sample_count = 50
				INSERT INTO [dbo].[t_temp_28_D4346_result_test_table] ( res_id, attend, MID, proc_code, date_of_service, act_reason_level, act_ryg_status, act_status ) SELECT TOP
				( @reason_sample_count ) id,
				attend,
				MID,
				proc_code,
				date_of_service,
				reason_level,
				ryg_status,
				rec_status 
			FROM
				fl_production.dbo.[results_D4346_usage] 
			WHERE
				is_invalid = 0 
				AND reason_level = @selected_reason 
				--AND is_invalid = 1 
				AND process_date = @max_process_date 
				AND ( ABS( CAST (( BINARY_CHECKSUM( * ) * RAND()) AS INT )) % 100 ) < ( @reason_percent + 1 ) 
				
				
				SET @iterator = @iterator + 1 
		END SELECT
			@temp_count = COUNT ( * ) 
		FROM
			[dbo].[t_temp_28_D4346_result_test_table]
		IF
			( @temp_count > 0 ) 
			SET @out_success = 1 ELSE 
		SET @out_success = 0 
END
GO
/****** Object:  StoredProcedure [dbo].[t_dyn__________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[t_dyn__________________] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

END




GO
/****** Object:  StoredProcedure [dbo].[t_dyn_pl_daily]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[t_dyn_pl_daily] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	DECLARE @dynamicQuery NVARCHAR(4000)

	/* Below variables are used in generating sample Table */
	DECLARE  @sampleLimit int = 0
			,@total_count_pl_table int = 0
			,@max_process_date DATETIME2 (0)


	/* Below variables are used for holding cursor data */
	DECLARE  @cur_pl_table_name VARCHAR(5000)
			,@cur_pl_result_table_name VARCHAR(5000)
			,@cur_pl_sample_table_name VARCHAR(5000)
			,@cur_pl_type VARCHAR(10)
			,@cur_pl_sample_percent float 

	DECLARE cur_validate_pl_table CURSOR LOCAL  FORWARD_ONLY FOR 
		SELECT	 pl_table_name
				,result_table_name
				,sample_table_name
				,pl_type
				,sample_percent
		FROM	[test_cases].[dbo].t_global_pl_config
		WHERE	run_test = 1
				AND pl_type = 'daily'
	
	OPEN cur_validate_pl_table

	FETCH FROM  cur_validate_pl_table 
	INTO	 @cur_pl_table_name
			,@cur_pl_result_table_name
			,@cur_pl_sample_table_name
			,@cur_pl_type
			,@cur_pl_sample_percent

	WHILE @@FETCH_STATUS = 0
		BEGIN
		-- BLOCK A [GENERATING SAMPLE TABLE]
		-- ================================================================================
		-->> BLOCK A STARTS 

			/* Below dynamic query will delete sample table id exists and
				will generate the shema for sample table */
			set @dynamicQuery = 
			N'
			if(OBJECT_ID(''test_cases.dbo.'+@cur_pl_sample_table_name+''') IS NOT NULL)
			BEGIN
				DROP TABLE test_cases.dbo.'+@cur_pl_sample_table_name+'
			END

			create table test_cases.dbo.'+@cur_pl_sample_table_name+'
			(
				 id int identity
				,res_id int
				,attend VARCHAR(250) default null
				,date_of_service datetime2 null

				,act_proc_count INT DEFAULT 0
				,exp_proc_count INT DEFAULT 0

				,act_patient_count INT DEFAULT 0
				,exp_patient_count INT DEFAULT 0

				,act_paid_money float default 0
				,exp_paid_money float default 0

				,act_recovered_money float
				,exp_recovered_money float NOT NULL DEFAULT 0

				,act_ryg_status VARCHAR(15)
				,exp_ryg_status VARCHAR(15)

				,act_num_of_violations int not null default 0
				,exp_num_of_violations int not null default 0

				,test_status BIT DEFAULT NULL 
			)
			'
			EXECUTE sp_executesql @dynamicQuery
			

			/* Below dynamic query will get max process date and 
				total records for pl table */
			set @dynamicQuery =
			N'
				SELECT @_max_process_date = max(process_date)
				FROM  [fl_production].[dbo].['+@cur_pl_table_name+']
				WHERE isactive = 1

				SELECT  @_total_count_pl_table = COUNT(*)
				FROM [fl_production].[dbo].['+@cur_pl_table_name+']
				WHERE isactive = 1 and process_date = @_max_process_date
			'
			
			EXECUTE  sp_executesql @dynamicQuery
					 ,N'@_total_count_pl_table INT OUTPUT, @_max_process_date datetime2(0) OUTPUT'
					,@_total_count_pl_table = @total_count_pl_table OUTPUT 
					,@_max_process_date  = @max_process_date OUTPUT
		
			
			
			/* Calculating Limit value for sampling using percentage in config table */
			SET	@sampleLimit = @total_count_pl_table * 	@cur_pl_sample_percent /100
			IF @sampleLimit < 1
				SET @sampleLimit = 25


			/*	Inserting rows from pl table to sample table */
			set @dynamicQuery = 
			N'
			INSERT INTO [test_cases].[dbo].['+@cur_pl_sample_table_name+']
			(
				 res_id
				,attend
				,date_of_service
				,act_proc_count
				,act_patient_count
				,act_paid_money
				,act_recovered_money
				,act_ryg_status
				,act_num_of_violations
			)
			SELECT TOP('+cast(@sampleLimit as varchar)+')
				 id
				,attend
				,date_of_service
				,proc_count
				,patient_count
				,income
				,iif(recovered_money IS NULL,0,recovered_money)
				,ryg_status
				,number_of_violations
			FROM	[fl_production].[dbo].['+@cur_pl_table_name+']
			WHERE	isactive = 1
					AND process_date = @__max_process_date
					AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) 
						< ('+CAST(@sampleLimit+1 as VARCHAR)+')
			'
			EXECUTE sp_executesql @dynamicQuery
					,N'@__max_process_date datetime2(0) '
					,@__max_process_date = @max_process_date 

			Declare @_count int = 0
		-- << BLOCK A ENDS
		-- ================================================================================
		-- BLOCK B [VALIDATING COLUMNS IN SAMPLE TABLE]
		-- ================================================================================
		-- >> BLOCK B STARTS
			set @dynamicQuery =
			N'
				/* Below Variables are used for evaluating column values */
				DECLARE @tmp_exp_proc_count INT = 0
						,@tmp_exp_patient_count INT = 0
						,@tmp_exp_paid_money FLOAT 
						,@tmp_exp_recovered_money FLOAT 
						,@tmp_exp_ryg_status VARCHAR(15)
						,@tmp_r_check INT = 0
						,@tmp_y_check INT = 0
						,@tmp_g_check INT = 0
						,@tmp_exp_num_of_violations INT = 0
				
				/* Below Variable are used for holding cursor data */
				DECLARE	
						@cur_id_row INT = 0
						,@cur_row_attend VARCHAR(50)
						,@cur_row_dos DATETIME2(0)

				DECLARE cur_test_sample_row CURSOR LOCAL  FORWARD_ONLY FOR 
					SELECT id,attend, date_of_service
					FROM   [test_cases].[dbo].['+@cur_pl_sample_table_name+']
				

				-- >> --------------------------------------
				-- >>  CORE PROCESSING STARTS
				-- >> --------------------------------------
				OPEN cur_test_sample_row

				FETCH FROM cur_test_sample_row
				INTO @cur_id_row, @cur_row_attend, @cur_row_dos

				WHILE @@FETCH_STATUS = 0
					BEGIN
					
						SELECT	@tmp_exp_proc_count = COUNT(*) 
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+']
						WHERE	isactive = 1
								AND attend = @cur_row_attend
								AND date_of_service = @cur_row_dos
								
						SELECT	@tmp_exp_patient_count = COUNT(DISTINCT(mid)) 
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+']
						WHERE	isactive = 1
								AND attend = @cur_row_attend
								AND date_of_service = @cur_row_dos
								
						SELECT	@tmp_exp_paid_money = ROUND(SUM(paid_money),2)
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+'] 
						WHERE	isactive = 1
								AND attend = @cur_row_attend
								AND date_of_service = @cur_row_dos

						SELECT	@tmp_exp_recovered_money = ROUND(SUM(recovered_money),2)
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+'] 
						WHERE	isactive = 1
								AND attend = @cur_row_attend
								AND date_of_service = @cur_row_dos
							
						
						SELECT	@tmp_r_check = COUNT(*)
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+']  
						WHERE	isactive = 1 
								AND attend = @cur_row_attend 
								AND date_of_service =  @cur_row_dos
								AND ryg_status=''red''

						SELECT	@tmp_y_check = COUNT(*)
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+']  
						WHERE	isactive = 1 
								AND attend = @cur_row_attend 
								AND date_of_service =  @cur_row_dos
								AND ryg_status=''yellow''
						
						IF(@tmp_r_check != 0)
							BEGIN
								SET @tmp_exp_ryg_status=''red''
							END
						ELSE
							BEGIN
								IF(@tmp_y_check != 0)
									BEGIN
										SET @tmp_exp_ryg_status=''yellow''
									END
								ELSE
									BEGIN
										SET @tmp_exp_ryg_status=''green''
									END
							END
						SET @tmp_exp_num_of_violations = @tmp_r_check

						/*          */
						
						UPDATE [test_cases].[dbo].['+@cur_pl_sample_table_name+']
						SET		exp_proc_count = @tmp_exp_proc_count
								,exp_patient_count = @tmp_exp_patient_count
								,exp_paid_money = @tmp_exp_paid_money
								,exp_ryg_status = @tmp_exp_ryg_status
								,exp_num_of_violations =  @tmp_exp_num_of_violations
						WHERE	id = @cur_id_row
						
						FETCH NEXT FROM cur_test_sample_row
						INTO @cur_id_row ,@cur_row_attend, @cur_row_dos
					END

				CLOSE cur_test_sample_row
				DEALLOCATE cur_test_sample_row
				-- << -------------------------------------------
				-- << CORE PROCESSING ENDS
				-- << -------------------------------------------
			'
			EXECUTE (@dynamicQuery)


			SET @dynamicQuery = 
			'N
				
				UPDATE [test_cases].[dbo].['+@cur_pl_sample_table_name+']
				SET		test_status = 1
				WHERE	act_proc_count = exp_proc_count
						AND act_patient_count = exp_patient_count
						AND act_paid_money = exp_paid_money
						AND act_recovered_money = exp_recovered_money
						AND act_ryg_status = exp_ryg_status
						AND act_num_of_violations = exp_num_of_violations

				UPDATE [test_cases].[dbo].['+@cur_pl_sample_table_name+']
				SET		test_status = 0
				WHERE	test_status is null
			'
			EXECUTE (@dynamicQuery)
			
		-- << BLOCK B ENDS

			FETCH NEXT FROM  cur_validate_pl_table 
			INTO	@cur_pl_table_name
					,@cur_pl_result_table_name
					,@cur_pl_sample_table_name
					,@cur_pl_type
					,@cur_pl_sample_percent
		END

	CLOSE cur_validate_pl_table
	DEALLOCATE cur_validate_pl_table

END





GO
/****** Object:  StoredProcedure [dbo].[t_dyn_pl_monthly]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[t_dyn_pl_monthly] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	DECLARE @dynamicQuery NVARCHAR(4000)

	/* Below variables are used in generating sample Table */
	DECLARE  @sampleLimit int = 0
			,@total_count_pl_table int = 0
			,@max_process_date DATETIME2 (0)


	/* Below variables are used for holding cursor data */
	DECLARE  @cur_pl_table_name VARCHAR(5000)
			,@cur_pl_result_table_name VARCHAR(5000)
			,@cur_pl_sample_table_name VARCHAR(5000)
			,@cur_pl_type VARCHAR(10)
			,@cur_pl_sample_percent float 

	DECLARE cur_validate_pl_table CURSOR LOCAL  FORWARD_ONLY FOR 
		SELECT	 pl_table_name
				,result_table_name
				,sample_table_name
				,pl_type
				,sample_percent
		FROM	[test_cases].[dbo].t_global_pl_config
		WHERE	run_test = 1
				AND pl_type = 'daily'
	
	OPEN cur_validate_pl_table

	FETCH FROM  cur_validate_pl_table 
	INTO	 @cur_pl_table_name
			,@cur_pl_result_table_name
			,@cur_pl_sample_table_name
			,@cur_pl_type
			,@cur_pl_sample_percent

	WHILE @@FETCH_STATUS = 0
		BEGIN
		-- BLOCK A [GENERATING SAMPLE TABLE]
		-- ================================================================================
		-->> BLOCK A STARTS 

			/* Below dynamic query will delete sample table id exists and
				will generate the shema for sample table */
			set @dynamicQuery = 
			N'
			if(OBJECT_ID(''test_cases.dbo.'+@cur_pl_sample_table_name+''') IS NOT NULL)
			BEGIN
				DROP TABLE test_cases.dbo.'+@cur_pl_sample_table_name+'
			END

			create table test_cases.dbo.'+@cur_pl_sample_table_name+'
			(
				 id int identity
				,res_id int
				,attend VARCHAR(250) default null
				,date_of_service datetime2 null

				,act_proc_count INT DEFAULT 0
				,exp_proc_count INT DEFAULT 0

				,act_patient_count INT DEFAULT 0
				,exp_patient_count INT DEFAULT 0

				,act_paid_money float default 0
				,exp_paid_money float default 0

				,act_recovered_money float
				,exp_recovered_money float NOT NULL DEFAULT 0

				,act_ryg_status VARCHAR(15)
				,exp_ryg_status VARCHAR(15)

				,act_num_of_violations int not null default 0
				,exp_num_of_violations int not null default 0

				,test_status BIT DEFAULT NULL 
			)
			'
			EXECUTE sp_executesql @dynamicQuery
			

			/* Below dynamic query will get max process date and 
				total records for pl table */
			set @dynamicQuery =
			N'
				SELECT @_max_process_date = max(process_date)
				FROM  [fl_production].[dbo].['+@cur_pl_table_name+']
				WHERE isactive = 1

				SELECT  @_total_count_pl_table = COUNT(*)
				FROM [fl_production].[dbo].['+@cur_pl_table_name+']
				WHERE isactive = 1 and process_date = @_max_process_date
			'
			
			EXECUTE  sp_executesql @dynamicQuery
					 ,N'@_total_count_pl_table INT OUTPUT, @_max_process_date datetime2(0) OUTPUT'
					,@_total_count_pl_table = @total_count_pl_table OUTPUT 
					,@_max_process_date  = @max_process_date OUTPUT
		
			
			
			/* Calculating Limit value for sampling using percentage in config table */
			SET	@sampleLimit = @total_count_pl_table * 	@cur_pl_sample_percent /100
			IF @sampleLimit < 1
				SET @sampleLimit = 25


			/*	Inserting rows from pl table to sample table */
			set @dynamicQuery = 
			N'
			INSERT INTO [test_cases].[dbo].['+@cur_pl_sample_table_name+']
			(
				 res_id
				,attend
				,date_of_service
				,act_proc_count
				,act_patient_count
				,act_paid_money
				,act_recovered_money
				,act_ryg_status
				,act_num_of_violations
			)
			SELECT TOP('+cast(@sampleLimit as varchar)+')
				 id
				,attend
				,date_of_service
				,proc_count
				,patient_count
				,income
				,iif(recovered_money IS NULL,0,recovered_money)
				,ryg_status
				,number_of_violations
			FROM	[fl_production].[dbo].['+@cur_pl_table_name+']
			WHERE	isactive = 1
					AND process_date = @__max_process_date
					AND (ABS(CAST((BINARY_CHECKSUM(*) *RAND()) as int)) % 100) 
						< ('+CAST(@sampleLimit+1 as VARCHAR)+')
			'
			EXECUTE sp_executesql @dynamicQuery
					,N'@__max_process_date datetime2(0) '
					,@__max_process_date = @max_process_date 

			Declare @_count int = 0
		-- << BLOCK A ENDS
		-- ================================================================================
		-- BLOCK B [VALIDATING COLUMNS IN SAMPLE TABLE]
		-- ================================================================================
		-- >> BLOCK B STARTS
			set @dynamicQuery =
			N'
				/* Below Variables are used for evaluating column values */
				DECLARE @tmp_exp_proc_count INT = 0
						,@tmp_exp_patient_count INT = 0
						,@tmp_exp_paid_money FLOAT 
						,@tmp_exp_recovered_money FLOAT 
						,@tmp_exp_ryg_status VARCHAR(15)
						,@tmp_r_check INT = 0
						,@tmp_y_check INT = 0
						,@tmp_g_check INT = 0
						,@tmp_exp_num_of_violations INT = 0
				
				/* Below Variable are used for holding cursor data */
				DECLARE	
						@cur_id_row INT = 0
						,@cur_row_attend VARCHAR(50)
						,@cur_row_dos DATETIME2(0)

				DECLARE cur_test_sample_row CURSOR LOCAL  FORWARD_ONLY FOR 
					SELECT id,attend, date_of_service
					FROM   [test_cases].[dbo].['+@cur_pl_sample_table_name+']
				

				-- >> --------------------------------------
				-- >>  CORE PROCESSING STARTS
				-- >> --------------------------------------
				OPEN cur_test_sample_row

				FETCH FROM cur_test_sample_row
				INTO @cur_id_row, @cur_row_attend, @cur_row_dos

				WHILE @@FETCH_STATUS = 0
					BEGIN
					
						SELECT	@tmp_exp_proc_count = COUNT(*) 
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+']
						WHERE	isactive = 1
								AND attend = @cur_row_attend
								AND date_of_service = @cur_row_dos
								
						SELECT	@tmp_exp_patient_count = COUNT(DISTINCT(mid)) 
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+']
						WHERE	isactive = 1
								AND attend = @cur_row_attend
								AND date_of_service = @cur_row_dos
								
						SELECT	@tmp_exp_paid_money = ROUND(SUM(paid_money),2)
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+'] 
						WHERE	isactive = 1
								AND attend = @cur_row_attend
								AND date_of_service = @cur_row_dos

						SELECT	@tmp_exp_recovered_money = ROUND(SUM(recovered_money),2)
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+'] 
						WHERE	isactive = 1
								AND attend = @cur_row_attend
								AND date_of_service = @cur_row_dos
							
						
						SELECT	@tmp_r_check = COUNT(*)
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+']  
						WHERE	isactive = 1 
								AND attend = @cur_row_attend 
								AND date_of_service =  @cur_row_dos
								AND ryg_status=''red''

						SELECT	@tmp_y_check = COUNT(*)
						FROM	[fl_production].[dbo].['+@cur_pl_result_table_name+']  
						WHERE	isactive = 1 
								AND attend = @cur_row_attend 
								AND date_of_service =  @cur_row_dos
								AND ryg_status=''yellow''
						
						IF(@tmp_r_check != 0)
							BEGIN
								SET @tmp_exp_ryg_status=''red''
							END
						ELSE
							BEGIN
								IF(@tmp_y_check != 0)
									BEGIN
										SET @tmp_exp_ryg_status=''yellow''
									END
								ELSE
									BEGIN
										SET @tmp_exp_ryg_status=''green''
									END
							END
						SET @tmp_exp_num_of_violations = @tmp_r_check

						/*          */
						
						UPDATE [test_cases].[dbo].['+@cur_pl_sample_table_name+']
						SET		exp_proc_count = @tmp_exp_proc_count
								,exp_patient_count = @tmp_exp_patient_count
								,exp_paid_money = @tmp_exp_paid_money
								,exp_ryg_status = @tmp_exp_ryg_status
								,exp_num_of_violations =  @tmp_exp_num_of_violations
						WHERE	id = @cur_id_row
						
						FETCH NEXT FROM cur_test_sample_row
						INTO @cur_id_row ,@cur_row_attend, @cur_row_dos
					END

				CLOSE cur_test_sample_row
				DEALLOCATE cur_test_sample_row
				-- << -------------------------------------------
				-- << CORE PROCESSING ENDS
				-- << -------------------------------------------
			'
			EXECUTE (@dynamicQuery)


			SET @dynamicQuery = 
			'N
				
				UPDATE [test_cases].[dbo].['+@cur_pl_sample_table_name+']
				SET		test_status = 1
				WHERE	act_proc_count = exp_proc_count
						AND act_patient_count = exp_patient_count
						AND act_paid_money = exp_paid_money
						AND act_recovered_money = exp_recovered_money
						AND act_ryg_status = exp_ryg_status
						AND act_num_of_violations = exp_num_of_violations

				UPDATE [test_cases].[dbo].['+@cur_pl_sample_table_name+']
				SET		test_status = 0
				WHERE	test_status is null
			'
			EXECUTE (@dynamicQuery)
			
		-- << BLOCK B ENDS

			FETCH NEXT FROM  cur_validate_pl_table 
			INTO	@cur_pl_table_name
					,@cur_pl_result_table_name
					,@cur_pl_sample_table_name
					,@cur_pl_type
					,@cur_pl_sample_percent
		END

	CLOSE cur_validate_pl_table
	DEALLOCATE cur_validate_pl_table

END






GO
/****** Object:  StoredProcedure [dbo].[t_indp_________________]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[t_indp_________________] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

END



GO
/****** Object:  StoredProcedure [dbo].[t_indp_01_check_table_data_status]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[t_indp_01_check_table_data_status]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUT
	,@out_test_status bit = 0 OUT
	,@out_test_detail varchar(255)= '' OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON
	 -- -----------------------------------------------------------------
	-- Variables Below Are Used For Holding Data From Test Table
	-- -----------------------------------------------------------------
	DECLARE @t_id INT = 0
			,@t_attend VARCHAR(50) = ''
			,@t_mid VARCHAR(50) =''
			,@t_dos DATETIME2(0)
			,@t_sum_of_all_proc_mins int =0
			,@t_patient_count int = 0
			,@t_working_hours int = 0
			,@t_num_of_operatories int = 0
	-- -----------------------------------------------------------------
	-- Variables Below Are Used With In Loop For Pocessing
	-- -----------------------------------------------------------------  
	DECLARE @temp_exp_anesthesia_time int =0
			,@temp_exp_multisite_time int = 0
			,@temp_exp_fill_time int = 0
			,@temp_exp_setup_plus_cleanup int = 0
			,@temp_exp_chair_time int = 0
			,@temp_exp_total_min_per_day int = 0
			,@temp_exp_maximum_time int = 0 

	DECLARE @temp_exp_setup_time int = 0
			,@temp_exp_cleanup_time int = 0
			,@temp_exp_chair_time_plus_20_percent int = 0
			,@temp_exp_excess_time int = 0
			,@temp_exp_final_time int = 0
			,@temp_exp_excess_time_ratio int = 0
  
   
	-- -----------------------------------------------------------------
	-- Variables Below Are Used In Marking Ambigous Results
	-- -----------------------------------------------------------------
	DECLARE @_test_detail VARCHAR(250) = 'OK'
	DECLARE @temp_count INT= 0
	DECLARE @count_total_records INT = 0
			,@count_defective_records INT = 0
  
  
	-- ------------------------------------------------------------------
  
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT id,attend,date_of_service,sum_of_all_proc_mins, patient_count, working_hours, num_of_operatories 
			FROM [dbo].[t_temp_01_pic_pldaily_test_table] 		    

	
	OPEN test_row_cursor
	FETCH test_row_cursor INTO  @t_id, @t_attend,@t_dos,@t_sum_of_all_proc_mins
								,@t_patient_count,@t_working_hours,@t_num_of_operatories
	-- ===>>ALGO CORE PROCESSING STARTS
	
	WHILE @@FETCH_STATUS = 0
		BEGIN -- [1]
			 -- anesthesia time 
             
		SELECT 	@temp_exp_anesthesia_time = SUM(total_adjustment_pic) 
		FROM 	fl_production.dbo.[pic_dwp_anesthesia_adjustments]
		WHERE 	attend = @t_attend AND date_of_service = @t_dos AND isactive = 1
				   	    
            -- multisite time 
             
		SELECT 	@temp_exp_multisite_time = SUM(min_to_subtract)
		FROM 	fl_production.dbo.[pic_dwp_multisites_adjustments] 
		WHERE 	attend = @t_attend AND date_of_service = @t_dos AND isactive = 1
				    
			  
	    -- fill_time
		
		SELECT @temp_exp_fill_time=SUM(minutes_subtract)
		FROM 	fl_production.dbo.[pic_dwp_fillup_time_by_mid] 
		WHERE 	attend = @t_attend AND date_of_service = @t_dos AND isactive = 1
		
	    -- setup and cleanup time
		SET @temp_exp_setup_time =  @t_patient_count * 2
		SET @temp_exp_cleanup_time = IIF(
											(@t_patient_count - @t_num_of_operatories)>-1
											,(@t_patient_count - @t_num_of_operatories)*16
											,0
										 )
	   
	    -- total min per day
		SET @temp_exp_total_min_per_day =IIF(
												 (@t_working_hours * @t_num_of_operatories*60)<0
												 ,0
												 ,@t_working_hours * @t_num_of_operatories*60
											)


	    -- maximum time
		SET @temp_exp_maximum_time = IIF(
											(@t_working_hours * 60)<0
											,0
											,(@t_working_hours * 60)
										)
	    -- chair time and exp_chair_time_plus_20_percent
		SET @temp_exp_chair_time = @temp_exp_total_min_per_day - @temp_exp_setup_time - @temp_exp_cleanup_time 
		SET @temp_exp_chair_time_plus_20_percent = @temp_exp_chair_time + (0.2 * @temp_exp_total_min_per_day)
		
	    -- final time
		SET @temp_exp_final_time = IIF(@t_sum_of_all_proc_mins IS NULL,0,@t_sum_of_all_proc_mins)
								   + IIF(@temp_exp_anesthesia_time IS null ,0,@temp_exp_anesthesia_time) 
								   - IIF(@temp_exp_multisite_time IS NULL,0,@temp_exp_multisite_time) 
								   - IIF(@temp_exp_fill_time IS NULL,0,@temp_exp_fill_time) 
	    -- excess time
		SET @temp_exp_excess_time = IIF(@temp_exp_final_time is NULL,0,@temp_exp_final_time) 
									- IIF(@temp_exp_chair_time_plus_20_percent IS NULL,0,@temp_exp_chair_time_plus_20_percent)
		
	    -- exp_excess_time_ratio
		SET @temp_exp_excess_time_ratio = IIF(@temp_exp_excess_time IS NULL,0,@temp_exp_excess_time)
															/
											(
												IIF(@temp_exp_excess_time IS NULL,0,@temp_exp_excess_time) 
														+ 
												(@temp_exp_total_min_per_day + @temp_exp_total_min_per_day*0.2)
											);
	    
		
		UPDATE 	[dbo].[t_temp_01_pic_pldaily_test_table]  
		SET 	exp_anesthesia_time = @temp_exp_anesthesia_time
				,exp_multisite_time = @temp_exp_multisite_time
				,exp_fill_time = @temp_exp_fill_time
			
				,exp_setup_time = @temp_exp_setup_time
				,exp_cleanup_time = @temp_exp_cleanup_time
				,exp_setup_plus_cleanup = @temp_exp_setup_time + @temp_exp_cleanup_time
				,exp_chair_time = @temp_exp_chair_time
				,exp_total_min_per_day = @temp_exp_total_min_per_day
				
				,exp_chair_time_plus_20_percent = @temp_exp_chair_time_plus_20_percent
				,exp_final_time = @temp_exp_final_time
				,exp_excess_time = @temp_exp_excess_time 
				,exp_excess_time_ratio = ROUND(@temp_exp_excess_time_ratio,2)	
		WHERE 	id = @t_id
			
		
		
		IF(@temp_exp_final_time > @temp_exp_total_min_per_day + 0.2*@temp_exp_total_min_per_day)
			BEGIN
				UPDATE 	[dbo].[t_temp_01_pic_pldaily_test_table]   
				SET 	exp_ryg_status = 'red' 
				WHERE 	id = @t_id 
			END
		ELSE IF(@temp_exp_final_time > @temp_exp_total_min_per_day AND @temp_exp_final_time <= @temp_exp_total_min_per_day + 0.2 * @temp_exp_total_min_per_day)
			BEGIN
			UPDATE 	[dbo].[t_temp_01_pic_pldaily_test_table]   
			SET 	exp_ryg_status = 'yellow' 
			WHERE 	id = @t_id 
			END
		ELSE
			BEGIN
			UPDATE 	[dbo].[t_temp_01_pic_pldaily_test_table]   
			SET 	exp_ryg_status = 'green' 
			WHERE 	id = @t_id 
			END
		
	FETCH test_row_cursor INTO  @t_id, @t_attend,@t_dos,@t_sum_of_all_proc_mins
								,@t_patient_count,@t_working_hours,@t_num_of_operatories
		
		END	-- [1]
	
	CLOSE test_row_cursor 
	DEALLOCATE test_row_cursor
	
  
	-- <<=== ALGO CORE PROCESSING ENDS
 
	-- MARKING AMBIGUOUS RECORDS(status column and test detail)
	-- Chunck A
	
	UPDATE	 [dbo].[t_temp_01_pic_pldaily_test_table]
	SET		test_status=1
			,test_detail='OK'
	WHERE	act_ryg_status != exp_ryg_status

	UPDATE	 [dbo].[t_temp_01_pic_pldaily_test_table]
	SET		test_status=0
			,test_detail='Not Ok'
	WHERE	act_ryg_status != exp_ryg_status

	-- ---------------------------------------------------------------------------------
	
	
	-- ------------------------------------------------------------------------------------------------------------------
	SELECT @count_total_records  = COUNT(*) 
	FROM [dbo].[t_temp_01_pic_pldaily_test_table]

	SELECT @count_defective_records = COUNT(*) 
	FROM [dbo].[t_temp_01_pic_pldaily_test_table] 
	WHERE test_status=0
	
	SET @temp_count=0
	SELECT @temp_count = COUNT(*) 
	FROM [dbo].[t_temp_01_pic_pldaily_test_table] 
	WHERE  test_status IS NULL

	IF(@temp_count != 0)
		BEGIN
			SET @out_success=0
			SELECT @out_success
		END
	ELSE
		BEGIN
			SET @out_success= 1
			IF(@count_defective_records=0)
				BEGIN
					SET @out_test_status= 1
					SET @out_test_detail=cast(@count_total_records as varchar) +' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status= 0
					SET @out_test_detail=CAST(@count_defective_records as VARCHAR) + ' ambiguous records found out of '
											+ CAST(@count_total_records as VARCHAR)
				END 
		END 
		
END








GO
/****** Object:  StoredProcedure [dbo].[t_indp_02_verify_pivot_stats]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<ABDUL MATEEN>
-- Create date: <16 AUG 2018>

-- =============================================
CREATE PROCEDURE [dbo].[t_indp_02_verify_pivot_stats]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET  XACT_ABORT  ON
    -- Insert statements for procedure here
	
	if(object_id(N'[test_cases].[dbo].[t_pivot_table]', 'U') is null)
	BEGIN
	 CREATE TABLE  [test_cases].[dbo].[t_pivot_table] (
	   id BIGINT IDENTITY(1,1),
	   algo_id INT  DEFAULT NULL,
	   algo_name VARCHAR(100) DEFAULT 'NO NAME',	  
	   total_claim INT  DEFAULT NULL,
	   total_attend INT  DEFAULT NULL,
	   total_mid INT DEFAULT NULL,
	   total_dos INT  DEFAULT NULL,
	   total_tooth INT DEFAULT NULL,
	   total_red INT DEFAULT NULL,
	   total_yellow INT  DEFAULT NULL,
	   total_green INT  DEFAULT NULL,
	   total_reason_levels INT  DEFAULT NULL,

	   total_paid_money INT  DEFAULT NULL,
	   total_recovered_money float DEFAULT NULL,
	   t_total_recovered_money float DEFAULT NULL,
	   process_time datetime2,
	   PRIMARY KEY (id)   
        ) 
	END

		

	Declare @out_recovered_money_sum float =NULL;
	declare @timestamp datetime2;


	set @timestamp=GETDATE();
	
	
	
DECLARE    @return_value int;

EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'pic_doctor_stats_daily'
        ,'1'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT

				INSERT INTO [dbo].[t_pivot_table]
				 (
				   algo_id,
				   algo_name,
				   total_claim,
				   total_attend,
				   total_dos,
				   total_tooth,
				   total_red,
				   total_yellow,
				   total_green,
				   total_paid_money,
				   total_recovered_money,
				   total_reason_levels,
				   t_total_recovered_money,
				   process_time
				   ) 
				SELECT 
			    '01', 
			    'fl_production.dbo.pic_doctor_stats_daily', 
				NULL, 
				count(distinct(attend)),
				count(distinct(date_of_service)), 
				NULL, 
			    SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END), 
			    SUM(income), 
				SUM(recovered_money), 
				NULL ,
				@out_recovered_money_sum,
				@timestamp
				FROM
				fl_production.dbo.pic_doctor_stats_daily 
				Where isactive = '1' 
				
			


EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'dwp_doctor_stats_daily'
        ,'2'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT



				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend ,total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '02', 
				 'fl_production.dbo.dwp_doctor_stats_daily', 
				 NULL, 
				count(distinct(attend)), 
				count(distinct(date_of_service)), 
				NULL, 
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END), 
				SUM(income), 
				SUM(recovered_money), 
				NULL,
				@out_recovered_money_sum,
				@timestamp
				FROM 
				fl_production.dbo.dwp_doctor_stats_daily 
				Where isactive = '1' 
		



			
set @out_recovered_money_sum=NULL;
EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_multi_doctor'
        ,'7'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT



		INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid ,total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				'07', 
				'fl_production.dbo.results_multi_doctor', 
				count(distinct(claim_id)), 
				count(distinct(attend)), 
				count(distinct(mid)), 
				count(distinct(date_of_service)), 
				count(tooth_no), 
				SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				SUM(CASE WHEN ryg_status='yellow'  THEN 1 ELSE 0 END), 
				SUM(CASE WHEN ryg_status='green'   THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)) ,
				@out_recovered_money_sum,
				@timestamp
				FROM 
				fl_production.dbo.results_multi_doctor 
				Where isactive = '1' ;



				
				set @out_recovered_money_sum=Null;

--EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
--        'overactive_inactive'
--        ,'8'
--        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT



				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '08', 
				 'fl_production.dbo.overactive_inactive', 
				NULL, 
				count(distinct(attend)), 
				count(distinct(mid)), 
				NULL, 
				NULL, 
				 SUM(CASE WHEN ryg_status='red'      THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow'   THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green'    THEN 1 ELSE 0 END), 
				 SUM(total_amount), 
				NULL, 
				NULL ,
				@out_recovered_money_sum,
				@timestamp
				FROM 
				fl_production.dbo.overactive_inactive 
				Where isactive = '1' 



								
EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_primary_tooth_ext'
        ,'11'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT

				 INSERT INTO  
				[dbo].[t_pivot_table]
				 (algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time)  
				 SELECT  
				 '11',  
				 'fl_production.dbo.results_primary_tooth_ext',  
				 count(distinct(claim_id)),  
				 count(distinct(attend)),  
				 count(distinct(mid)),  
				 count(distinct(date_of_service)),  
				 count(tooth_no),  
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END),  
				 SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END),  
				 SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END),  
				 SUM(paid_money),  
				 SUM(recovered_money),  
				 count(distinct(reason_level)),  
				@out_recovered_money_sum,
				@timestamp   
				 FROM  
				 fl_production.dbo.results_primary_tooth_ext  
				 Where isactive = '1'  







				 EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_third_molar'
        ,'12'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT

				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '12', 
				 'fl_production.dbo.results_third_molar', 
				count(distinct(claim_id)), 
				count(distinct(attend)), 
				 count(distinct(mid)), 
				count(distinct(date_of_service)), 
				count(tooth_no), 
				SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)) ,
				@out_recovered_money_sum,
				@timestamp
				FROM 
				fl_production.dbo.results_third_molar 
				Where isactive = '1' 












				
		EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_perio_scaling_4a'
        ,'13'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT





				 INSERT INTO  
				[dbo].[t_pivot_table]
				 (algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time)  
				 SELECT  
				  '13',  
				  'fl_production.dbo.results_perio_scaling_4a',  
				 count(distinct(claim_id)),  
				 count(distinct(attend)),  
				  count(distinct(mid)),  
				 count(distinct(date_of_service)),  
				  --count(tooth_no),      Column doest not exist 
				  NULL,
				  SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END),  
				  SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END),  
				  SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END),  
				 SUM(paid_money),  
				 SUM(recovered_money),  
				 count(distinct(reason_level)),
				 @out_recovered_money_sum,
				 @timestamp  
				 FROM  
				 fl_production.dbo.results_perio_scaling_4a  
				 Where isactive = '1'  








				 		EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_simple_prophy_4b'
        ,'14'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT






				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '14', 
				 'fl_production.dbo.results_simple_prophy_4b', 
				count(distinct(claim_id)), 
				count(distinct(attend)), 
				 count(distinct(mid)), 
				count(distinct(date_of_service)), 
				-- count(tooth_no), 
				NULL,
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)), 
				@out_recovered_money_sum,
				@timestamp   
				FROM 
				fl_production.dbo.results_simple_prophy_4b 
				Where isactive = '1' ;




		EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_full_mouth_xrays'
        ,'15'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT


				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '15', 
				 'fl_production.dbo.results_full_mouth_xrays', 
				count(distinct(claim_id)), 
				count(distinct(attend)), 
				 count(distinct(mid)), 
				count(distinct(date_of_service)), 
				--count(tooth_no), 
				NULL,
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)),
				@out_recovered_money_sum,
				@timestamp 
				FROM 
				fl_production.dbo.results_full_mouth_xrays 
				Where isactive = '1' 



		EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_complex_perio'
        ,'16'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT


				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id,
				 algo_name,
				  total_claim,
				  total_attend,
				   total_mid, 
				   total_dos,
					total_tooth,
					total_red,
					total_yellow
					,total_green,
					total_paid_money,
					total_recovered_money,
					total_reason_levels,
					t_total_recovered_money,
					process_time) 
				SELECT 
				 '16', 
				 'fl_production.dbo.results_complex_perio', 
				count(distinct(claim_id)), 
				count(distinct(attend)), 
				 count(distinct(mid)), 
				count(distinct(date_of_service)), 
				--count(tooth_no), 
				 NULL,
				 SUM(CASE WHEN ryg_status='red'    THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green'  THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)), 
				@out_recovered_money_sum,
				@timestamp  
				FROM 
				fl_production.dbo.results_complex_perio 
				Where isactive = '1' 
			

			
				set @out_recovered_money_sum=Null;
		EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
         'results_ext_code_distribution'
        ,'17'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT


				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '17', 
				 'fl_production.dbo.results_ext_code_distribution', 
				NULL, 
				count(distinct(attend)), 
			     NULL, 
				NULL, 
				NULL, 
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow'  THEN 1 ELSE 0 END), 
				SUM(CASE WHEN ryg_status='green'    THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				NULL, 
				NULL,
				@out_recovered_money_sum,
				 @timestamp
				FROM 
				fl_production.dbo.results_ext_code_distribution 
				Where isactive = '1' 


		EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'surg_ext_final_results'
        ,'18'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT


				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '18', 
				 'fl_production.dbo.surg_ext_final_results', 
				count(distinct(claim_id)), 
				count(distinct(attend)), 
				 count(distinct(mid)), 
				count(distinct(date_of_service)), 
				count(tooth_no), 
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow'  THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN  ryg_status='green'    THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)), 
				@out_recovered_money_sum,
				@timestamp  
				FROM 
				fl_production.dbo.surg_ext_final_results 
				Where isactive = '1' ;



				
set @out_recovered_money_sum=NULL;

	--	EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
  --      'overactive_code_distribution_yearly_by_attend'
  --      ,'19'
  --      ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT


				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend,total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '19', 
				 'fl_production.dbo.overactive_code_distribution_yearly_by_attend', 
				 NULL, 
				count(distinct(attend)), 	
				NULL, 
				NULL, 
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END), 
				NULL, 
				NULL, 
				NULL ,
				@out_recovered_money_sum,
				@timestamp
				FROM 
				fl_production.dbo.overactive_code_distribution_yearly_by_attend 
				Where isactive = '1' 




				
				set @out_recovered_money_sum=Null;
		EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_adjacent_filling_each_attend_weekly'
        ,'20'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT



				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '20', 
				 'fl_production.dbo.results_adjacent_filling_each_attend_weekly', 
				NULL, 
				count(distinct(attend)), 
				 NULL, 
				NULL, 
				NULL, 
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				NULL ,
				@out_recovered_money_sum,
				@timestamp
				FROM 
				fl_production.dbo.results_adjacent_filling_each_attend_weekly 

				




		EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_over_use_of_b_or_l_filling'
        ,'21'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT



				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '21', 
				 'fl_production.dbo.results_over_use_of_b_or_l_filling', 
				count(distinct(claim_id)), 
				count(distinct(attend)), 
				 count(distinct(mid)), 
				count(distinct(date_of_service)), 
				count(tooth_no), 
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)),
				@out_recovered_money_sum,
				@timestamp 
				FROM 
				fl_production.dbo.results_over_use_of_b_or_l_filling 
				Where isactive = '1' 


		EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_sealants_instead_of_filling'
        ,'22'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT



				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '22', 
				 'fl_production.dbo.results_sealants_instead_of_filling', 
				count(distinct(claim_id)), 
				count(distinct(attend)), 
				 count(distinct(mid)), 
				count(distinct(date_of_service)), 
				count(tooth_no), 
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)) ,
				@out_recovered_money_sum,
				@timestamp
				FROM 
				fl_production.dbo.results_sealants_instead_of_filling 
				Where isactive = '1' 

			
					EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_cbu'
        ,'23'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT


				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '23', 
				 'fl_production.dbo.results_cbu', 
				count(distinct(claim_id)), 
				count(distinct(attend)), 
				count(distinct(mid)), 
				count(distinct(date_of_service)), 
				count(tooth_no), 
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)) ,
				@out_recovered_money_sum,
				@timestamp
				FROM 
				fl_production.dbo.results_cbu 
				Where isactive = '1' 







							
					EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_deny_pulpotomy_on_adult'
        ,'24'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT



				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '24', 
				 'fl_production.dbo.results_deny_pulpotomy_on_adult', 
				count(distinct(claim_id)), 
				count(distinct(attend)), 
				 count(distinct(mid)), 
				count(distinct(date_of_service)), 
				count(tooth_no), 
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)) ,
				@out_recovered_money_sum,
				@timestamp
				FROM 
				fl_production.dbo.results_deny_pulpotomy_on_adult 
				Where isactive = '1' 

	 
	 
	 



	 			
					EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_deny_otherxrays_if_fmx_done'
        ,'25'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT

	
				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '25', 
				 'fl_production.dbo.results_deny_otherxrays_if_fmx_done', 
				count(distinct(claim_id)), 
				count(distinct(attend)), 
				 count(distinct(mid)), 
				count(distinct(date_of_service)), 
				NULL, 
				 SUM(CASE WHEN ryg_status='red'       THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green' THEN  1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)) ,
				@out_recovered_money_sum,
				@timestamp
				FROM 
				fl_production.dbo.results_deny_otherxrays_if_fmx_done 
				Where isactive = '1' 
			
 	




	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




				set @out_recovered_money_sum=Null;
	 EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
       'results_deny_pulp_on_adult_full_endo'
        ,'26'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT


				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '26', 
				 'fl_production.dbo.results_deny_pulp_on_adult_full_endo', 
				count(distinct(claim_id)), 
				count(distinct(attend)), 
				 count(distinct(mid)), 
				count(distinct(date_of_service)), 
				count(tooth_no), 
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow' THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green' THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)) ,
				@out_recovered_money_sum,
				@timestamp
				FROM 
				fl_production.dbo.results_deny_pulp_on_adult_full_endo 
				Where isactive = '1' 







							
					EXEC    @return_value = [dbo].[t__fn_sum_recovered_money]
        'results_anesthesia_dangerous_dose'
        ,'27'
        ,@out_recovered_money_sum = @out_recovered_money_sum OUTPUT


				INSERT INTO 
				[dbo].[t_pivot_table]
				(algo_id, algo_name, total_claim, total_attend, total_mid, total_dos,total_tooth,total_red,total_yellow,total_green,total_paid_money,total_recovered_money,total_reason_levels,t_total_recovered_money,process_time) 
				SELECT 
				 '27', 
				 'fl_production.dbo.results_anesthesia_dangerous_dose', 
				NULL, 
				count(distinct(attend)), 
				count(distinct(mid)), 
				count(distinct(date_of_service)), 
				NULL, 
				 SUM(CASE WHEN ryg_status='red'     THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='yellow'  THEN 1 ELSE 0 END), 
				 SUM(CASE WHEN ryg_status='green'   THEN 1 ELSE 0 END), 
				SUM(paid_money), 
				SUM(recovered_money), 
				count(distinct(reason_level)),
				@out_recovered_money_sum,
				@timestamp 
				FROM 
				fl_production.dbo.results_anesthesia_dangerous_dose 
				Where isactive = '1' 



END








GO
/****** Object:  StoredProcedure [dbo].[t_indp_03a_avg_money_test_table_gen]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[t_indp_03a_avg_money_test_table_gen]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON

	DECLARE
		
		@temp_count int =0

	-- t_temp_avg_money_test_table
	if(object_id(N'[dbo].[t_temp_avg_money_test_table]', 'U') is not null)
		DROP TABLE dbo.t_temp_avg_money_test_table 
	
	CREATE TABLE [dbo].[t_temp_avg_money_test_table]
	(
		id bigint IDENTITY(1,1), 
		year INT default NULL,
		proc_code varchar(15) default '',
		process_date datetime2(0) default null,

		act_avg_paid_money float default null,
		exp_avg_paid_money float default null,

		test_status bit DEFAULT NULL, 
		test_detail varchar(255) DEFAULT NULL, 
		PRIMARY KEY (id)
	)    
	
		
	INSERT  INTO [dbo].[t_temp_avg_money_test_table]
	(
		year
		,proc_code
		,process_date
		,act_avg_paid_money
	)	
	SELECT 
		year
		,proc_code
		,dtm
		,avg_paid_money
		
    FROM fl_production.dbo.[algos_base_code_avg_money]
    WHERE isactive= 1 

                     
        	
    SELECT	@temp_count = count(*)
    FROM		[dbo].t_temp_avg_money_test_table     


    IF (@temp_count > 0)
        SET @out_success = 1
    ELSE 
        SET @out_success = 0

	
END

GO
/****** Object:  StoredProcedure [dbo].[t_indp_03b_avg_money_validation]    Script Date: 10/11/2018 5:36:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Imran Abbas
-- Create date: 19 June 2018
-- Description:	FILL UP  Time Verification
-- =============================================
CREATE PROCEDURE [dbo].[t_indp_03b_avg_money_validation]
	-- Add the parameters for the stored procedure here
	@out_success bit = 0 OUT
	,@out_test_status bit = 0 OUT
	,@out_test_detail varchar(255)= '' OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	 -- -----------------------------------------------------------------
	-- Variables Below Are Used For Holding Data From Test Table
	-- -----------------------------------------------------------------
	DECLARE @t_id INT = 0
	DECLARE @t_proc_code VARCHAR(50) =''
	DECLARE @t_year INT = 0
  
	-- -----------------------------------------------------------------
	-- Variables Below Are Used With In Loop For Pocessing
	-- -----------------------------------------------------------------  
	DECLARE @_exp_avg_paid_money float =0;
	
	
	-- -----------------------------------------------------------------
	-- Variables Below Are Used In Marking Ambigous Results
	-- -----------------------------------------------------------------
	DECLARE @_test_detail VARCHAR(250) = 'OK'
	DECLARE @temp_count INT= 0
	DECLARE @count_total_records INT = 0
			,@count_defective_records INT = 0
  
  
	-- ------------------------------------------------------------------
  
	DECLARE test_row_cursor CURSOR LOCAL FORWARD_ONLY FOR 
			SELECT id,year, proc_code FROM [dbo].[t_temp_avg_money_test_table] 		    


	OPEN test_row_cursor
	FETCH test_row_cursor INTO  @t_id, @t_year, @t_proc_code
	
	WHILE @@FETCH_STATUS = 0
		BEGIN -- <<-- ALGO CORE PROCESSING STARTS	
			
				SELECT	@_exp_avg_paid_money= round(AVG(paid_money),2)
				FROM	[dbo].t_temp_procedure_performed
				/*
						fl_production.dbo.[procedure_performed] as pp
						INNER JOIN
						fl_production.dbo.[ref_standard_procedures] as ref
						ON pp.proc_code = ref.proc_code
						*/
				WHERE	year = @t_year
						AND proc_code = @t_proc_code
						-- AND is_invalid = 0 

			   UPDATE [dbo].[t_temp_avg_money_test_table] 
			   SET	exp_avg_paid_money = @_exp_avg_paid_money
			   where id = @t_id
			

				FETCH NEXT FROM test_row_cursor INTO   @t_id, @t_year, @t_proc_code

		END	-- <<--  ALGO CORE PROCESSING ENDS
	
	CLOSE test_row_cursor 
	DEALLOCATE test_row_cursor

	
	-- <<=== ALGO CORE PROCESSING ENDS
	
	-- MARKING AMBIGUOUS RECORDS(status column and test detail)
	-- Chunck A
	
	
	UPDATE	[dbo].[t_temp_avg_money_test_table]
	SET		test_status=1
	where	act_avg_paid_money = exp_avg_paid_money	
			

	UPDATE	 [dbo].[t_temp_avg_money_test_table]
	SET		test_status=0,
			test_detail='Issue'
	WHERE	test_status IS NULL

	
	-- Setting up out parameters
	-- ------------------------------------------------------------------------------------------------------------------
	SELECT @count_total_records  = COUNT(*) 
	FROM [dbo].[t_temp_avg_money_test_table]

	SELECT @count_defective_records = COUNT(*) 
	FROM [dbo].[t_temp_avg_money_test_table] 
	WHERE test_status = 0
	
	SET @temp_count = 0
	SELECT @temp_count = COUNT(*) 
	FROM [dbo].[t_temp_avg_money_test_table] 
	WHERE  test_status IS NULL

	IF(@temp_count != 0)
		BEGIN
			SET @out_success=0
			SELECT @out_success
		END
	ELSE
		BEGIN
			SET @out_success= 1
			IF(@count_defective_records=0)
				BEGIN
					SET @out_test_status= 1
					SET @out_test_detail=cast(@count_total_records as varchar) +' records are tested.No ambiguous record found'
				END
			ELSE
				BEGIN
					SET @out_test_status= 0
					SET @out_test_detail=CAST(@count_defective_records as VARCHAR) + ' ambiguous records found out of '
											+ CAST(@count_total_records as VARCHAR)
				END 
		END 
		
		
END








GO

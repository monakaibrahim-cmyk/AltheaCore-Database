SET NOCOUNT ON;
GO
USE [dngsm]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DynamicWhereClause]    Script Date: 11/14/2026 8:47:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2008-02-19
description : Makes the [where clause] that is included in dynamic query.
**/

CREATE FUNCTION [dbo].[FN_DynamicWhereClause] (
	@nvcColumnName nvarchar(128),
	@nvcVariableName nvarchar(128),
	@inbNullBitmap bigint,
	@intColumnSequence int,
	@intColumnCount int,
	@inyComparisonType tinyint
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @nvcWhereClause nvarchar(max)

	SET @nvcWhereClause =
		CASE
			WHEN @intColumnSequence = 1 AND @inbNullBitmap > 0 THEN ' WHERE '
			ELSE N''
		END +
		CASE
			WHEN @inbNullBitmap & POWER(CAST(2 AS bigint), @intColumnSequence - 1) = 0 THEN N''
			ELSE @nvcColumnName +
				CASE @inyComparisonType
					WHEN 1 THEN N' = ' + @nvcVariableName
					WHEN 2 THEN N' LIKE (' + @nvcVariableName + N' + ''%'')'
					WHEN 3 THEN N' LIKE (''%'' + ' + @nvcVariableName + N' + ''%'')'
					WHEN 4 THEN N' > ' + @nvcVariableName
					WHEN 5 THEN N' >= ' + @nvcVariableName
					WHEN 6 THEN N' < ' + @nvcVariableName
					WHEN 7 THEN N' <= ' + @nvcVariableName
					WHEN 8 THEN N' <> ' + @nvcVariableName
					ELSE N''
				END +
				CASE
					WHEN @inbNullBitmap & ((POWER(CAST(2 AS bigint), @intColumnCount) - 1) - (POWER(CAST(2 AS bigint), @intColumnSequence) - 1)) > 0 THEN N' AND '
					ELSE N''
				END
		END

	RETURN @nvcWhereClause
END
GO
USE [dngsm]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DynamicWhereClause2]    Script Date: 11/14/2026 8:47:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-01-23
description : Makes the [where clause] that is included in dynamic query.
**/

CREATE FUNCTION [dbo].[FN_DynamicWhereClause2] (
	@nvcColumnName nvarchar(128),
	@nvcVariableName nvarchar(128),
	@inbNullBitmap bigint,
	@intColumnSequence int,
	@intColumnCount int,
	@vchComparisonType varchar(10)
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @nvcWhereClause nvarchar(max)

	SET @nvcWhereClause =
		CASE
			WHEN @intColumnSequence = 1 AND @inbNullBitmap > 0 THEN ' WHERE '
			ELSE N''
		END +
		CASE
			WHEN @inbNullBitmap & POWER(CAST(2 AS bigint), @intColumnSequence - 1) = 0 THEN N''
			ELSE @nvcColumnName +
				CASE @vchComparisonType
					WHEN '=' THEN N' = ' + @nvcVariableName
					WHEN 'A%' THEN N' LIKE (' + @nvcVariableName + N' + ''%'')'
					WHEN '%A%' THEN N' LIKE (''%'' + ' + @nvcVariableName + N' + ''%'')'
					WHEN '>' THEN N' > ' + @nvcVariableName
					WHEN '>=' THEN N' >= ' + @nvcVariableName
					WHEN '<' THEN N' < ' + @nvcVariableName
					WHEN '<=' THEN N' <= ' + @nvcVariableName
					WHEN '<>' THEN N' <> ' + @nvcVariableName
					WHEN '&' THEN N' & '  + @nvcVariableName + N' > 0'
					ELSE N''
				END +
				CASE
					WHEN @inbNullBitmap & ((POWER(CAST(2 AS bigint), @intColumnCount) - 1) - (POWER(CAST(2 AS bigint), @intColumnSequence) - 1)) > 0 THEN N' AND '
					ELSE N''
				END
		END

	RETURN @nvcWhereClause
END
GO
USE [dngsm]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GetPotentialList]    Script Date: 11/14/2026 8:47:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**
version : 2
author : ???
e-mail : dailykim@eyedentitygames.com
created date : 2011-12-08
description : PotentialID ? ?? ??? ????? ?? (?????)
**/

CREATE FUNCTION [dbo].[FN_GetPotentialList] (
	@PotentialID nvarchar(255)
)
RETURNS nvarchar(200)
AS
BEGIN
	DECLARE @results NVARCHAR(200);	
	
	SELECT @results = COALESCE(@results + ',', '') + _PotentialNo 
	FROM dbo.ExtPotential WITH (NOLOCK)
	WHERE _PotentialID = @PotentialID AND _PotentialNo > 0
	ORDER BY _PotentialNo;

	RETURN @results;
END

GO
USE [dngsm]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_IP2IPNumber]    Script Date: 11/14/2026 8:47:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
/**
version : 1
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-01-04
description : IP??? ????? ?????.
**/

CREATE FUNCTION [dbo].[FN_IP2IPNumber] (
	@vchIP varchar(15)
)
RETURNS int
AS
BEGIN
	RETURN
		((CAST(PARSENAME(@vchIP, 4) AS int) - 128) * 16777216) +
		(CAST(PARSENAME(@vchIP, 3) AS int) * 65536) +
		(CAST(PARSENAME(@vchIP, 2) AS int) * 256) +
		CAST(PARSENAME(@vchIP, 1) AS int);
END
GO
USE [dngsm]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_IPNumber2IP]    Script Date: 11/14/2026 8:47:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
/**
version : 1
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-01-04
description : ???? IP??? ?????.
**/

CREATE FUNCTION [dbo].[FN_IPNumber2IP] (
@intIPNumber int
)
RETURNS varchar(15)
AS
BEGIN
	RETURN
		CAST(((@intIPNumber & 0xFF000000) / 16777216) + 128 AS varchar(3)) + '.' +
		CAST((@intIPNumber & 0x00FF0000) / 65536 AS varchar(3)) + '.' +
		CAST((@intIPNumber & 0x0000FF00) / 256 AS varchar(3)) + '.' +
		CAST((@intIPNumber & 0x000000FF) AS varchar(3));
END
GO
USE [dngsm]
GO
/****** Object:  UserDefinedFunction [dbo].[IF_NSplit]    Script Date: 11/14/2026 8:47:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-04-02
description : ???? ?? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[IF_NSplit] (
	@nvcString nvarchar(max),
	@nchDelimiter nchar(1)
)
RETURNS TABLE
AS
RETURN (
	SELECT SUBSTRING(@nchDelimiter + @nvcString + @nchDelimiter, n + 1, CHARINDEX(@nchDelimiter, @nchDelimiter + @nvcString + @nchDelimiter, n + 1) - n - 1) AS string
	FROM dbo.Tally WITH (NOLOCK)
	WHERE n < (DATALENGTH(@nchDelimiter + @nvcString + @nchDelimiter) / 2) AND SUBSTRING(@nchDelimiter + @nvcString + @nchDelimiter, n, 1) = @nchDelimiter
)
GO
USE [dngsm]
GO
/****** Object:  UserDefinedFunction [dbo].[IF_Split]    Script Date: 11/14/2026 8:47:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-04-02
description : ???? ?? ? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[IF_Split] (
	@vchString nvarchar(max),
	@chrDelimiter nchar(1)
)
RETURNS TABLE
AS
RETURN (
	SELECT SUBSTRING(@chrDelimiter + @vchString + @chrDelimiter, n + 1, CHARINDEX(@chrDelimiter, @chrDelimiter + @vchString + @chrDelimiter, n + 1) - n - 1) AS string
	FROM dbo.Tally WITH (NOLOCK)
	WHERE n < DATALENGTH(@chrDelimiter + @vchString + @chrDelimiter) AND SUBSTRING(@chrDelimiter + @vchString + @chrDelimiter, n, 1) = @chrDelimiter
)
GO
USE [dngsm]
GO
/****** Object:  UserDefinedFunction [dbo].[TF_NSplit]    Script Date: 11/14/2026 8:47:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2008-07-10
description : ???? ?? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[TF_NSplit] (
	@nvcString nvarchar(max),
	@nvcDelimiter nvarchar(10)
)
RETURNS @tblResult table (string nvarchar(4000) NOT NULL)
AS
BEGIN
DECLARE @xmlString xml;

SET @xmlString = CAST(N'<X>'+REPLACE(@nvcString, @nvcDelimiter, N'</X><X>')+N'</X>' AS xml);

INSERT @tblResult (string)
SELECT N.value(N'.', 'nvarchar(4000)') FROM @xmlString.nodes(N'X') AS T(N)

RETURN;
END
GO
USE [dngsm]
GO
/****** Object:  UserDefinedFunction [dbo].[TF_Split]    Script Date: 11/14/2026 8:47:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-07-10
description : ???? ?? ? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[TF_Split] (
	@vchString varchar(max),
	@vchDelimiter varchar(10)
)
RETURNS @tblResult table (string varchar(8000) NOT NULL)
AS
BEGIN
DECLARE @xmlString xml;

SET @xmlString = CAST(N'<X>' + REPLACE(@vchString, @vchDelimiter, '</X><X>') + '</X>' AS xml);

INSERT @tblResult (string)
SELECT N.value('.', 'varchar(8000)') FROM @xmlString.nodes('X') AS T(N)

RETURN;
END
GO
USE [dnmembership]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DynamicWhereClause]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FN_DynamicWhereClause]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2008-02-19
description : Makes the [where clause] that is included in dynamic query.
**/

CREATE FUNCTION [dbo].[FN_DynamicWhereClause] (
	@nvcColumnName nvarchar(128),
	@nvcVariableName nvarchar(128),
	@inbNullBitmap bigint,
	@intColumnSequence int,
	@intColumnCount int,
	@inyComparisonType tinyint
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @nvcWhereClause nvarchar(max)

	SET @nvcWhereClause =
		CASE
			WHEN @intColumnSequence = 1 AND @inbNullBitmap > 0 THEN '' WHERE ''
			ELSE N''''
		END +
		CASE
			WHEN @inbNullBitmap & POWER(CAST(2 AS bigint), @intColumnSequence - 1) = 0 THEN N''''
			ELSE @nvcColumnName +
				CASE @inyComparisonType
					WHEN 1 THEN N'' = '' + @nvcVariableName
					WHEN 2 THEN N'' LIKE ('' + @nvcVariableName + N'' + ''''%'''')''
					WHEN 3 THEN N'' LIKE (''''%'''' + '' + @nvcVariableName + N'' + ''''%'''')''
					WHEN 4 THEN N'' > '' + @nvcVariableName
					WHEN 5 THEN N'' >= '' + @nvcVariableName
					WHEN 6 THEN N'' < '' + @nvcVariableName
					WHEN 7 THEN N'' <= '' + @nvcVariableName
					WHEN 8 THEN N'' <> '' + @nvcVariableName
					ELSE N''''
				END +
				CASE
					WHEN @inbNullBitmap & ((POWER(CAST(2 AS bigint), @intColumnCount) - 1) - (POWER(CAST(2 AS bigint), @intColumnSequence) - 1)) > 0 THEN N'' AND ''
					ELSE N''''
				END
		END

	RETURN @nvcWhereClause
END
' 
END
GO
USE [dnmembership]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DynamicWhereClause2]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FN_DynamicWhereClause2]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-01-23
description : Makes the [where clause] that is included in dynamic query.
**/

CREATE FUNCTION [dbo].[FN_DynamicWhereClause2] (
	@nvcColumnName nvarchar(128),
	@nvcVariableName nvarchar(128),
	@inbNullBitmap bigint,
	@intColumnSequence int,
	@intColumnCount int,
	@vchComparisonType varchar(10)
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @nvcWhereClause nvarchar(max)

	SET @nvcWhereClause =
		CASE
			WHEN @intColumnSequence = 1 AND @inbNullBitmap > 0 THEN '' WHERE ''
			ELSE N''''
		END +
		CASE
			WHEN @inbNullBitmap & POWER(CAST(2 AS bigint), @intColumnSequence - 1) = 0 THEN N''''
			ELSE @nvcColumnName +
				CASE @vchComparisonType
					WHEN ''='' THEN N'' = '' + @nvcVariableName
					WHEN ''A%'' THEN N'' LIKE ('' + @nvcVariableName + N'' + ''''%'''')''
					WHEN ''%A%'' THEN N'' LIKE (''''%'''' + '' + @nvcVariableName + N'' + ''''%'''')''
					WHEN ''>'' THEN N'' > '' + @nvcVariableName
					WHEN ''>='' THEN N'' >= '' + @nvcVariableName
					WHEN ''<'' THEN N'' < '' + @nvcVariableName
					WHEN ''<='' THEN N'' <= '' + @nvcVariableName
					WHEN ''<>'' THEN N'' <> '' + @nvcVariableName
					WHEN ''&'' THEN N'' & ''  + @nvcVariableName + N'' > 0''
					ELSE N''''
				END +
				CASE
					WHEN @inbNullBitmap & ((POWER(CAST(2 AS bigint), @intColumnCount) - 1) - (POWER(CAST(2 AS bigint), @intColumnSequence) - 1)) > 0 THEN N'' AND ''
					ELSE N''''
				END
		END

	RETURN @nvcWhereClause
END
' 
END
GO
USE [dnmembership]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_HashPassphrase]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FN_HashPassphrase]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'/**
version : 5
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-01-04
description : ????? Hash???.
**/

CREATE FUNCTION [dbo].[FN_HashPassphrase](
	@vchPassphrase varchar(12),
	@intAccountID int
)
RETURNS binary(20)
AS
BEGIN
	RETURN (
		HASHBYTES(''SHA1'', ''818719D11B0B41CA80C22F5D9901E92B'' + STR(@intAccountID, 10) + @vchPassphrase)
	);
END
' 
END
GO
USE [dnmembership]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_HashPassphrase2]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FN_HashPassphrase2]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[FN_HashPassphrase2](
	@vchPassphrase varchar(12),
	@intAccountID int
)
RETURNS binary(20)
AS
BEGIN
	RETURN (
		HASHBYTES(''md5'',@vchPassphrase)
	);
END
' 
END
GO
USE [dnmembership]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_IP2IPNumber]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FN_IP2IPNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'/**
version : 2
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-01-04
description : IP??? ????? ?????.
**/

CREATE FUNCTION [dbo].[FN_IP2IPNumber] (
	@vchIP varchar(15)
)
RETURNS int
AS
BEGIN
	RETURN
		((CAST(PARSENAME(@vchIP, 4) AS int) - 128) * 16777216) +
		(CAST(PARSENAME(@vchIP, 3) AS int) * 65536) +
		(CAST(PARSENAME(@vchIP, 2) AS int) * 256) +
		CAST(PARSENAME(@vchIP, 1) AS int);
END
' 
END
GO
USE [dnmembership]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_IPNumber2IP]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FN_IPNumber2IP]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'/**
version : 2
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-01-04
description : ???? IP??? ?????.
**/

CREATE FUNCTION [dbo].[FN_IPNumber2IP] (
@intIPNumber int
)
RETURNS varchar(15)
AS
BEGIN
	RETURN
		CAST(((@intIPNumber & 0xFF000000) / 16777216) + 128 AS varchar(3)) + ''.'' +
		CAST((@intIPNumber & 0x00FF0000) / 65536 AS varchar(3)) + ''.'' +
		CAST((@intIPNumber & 0x0000FF00) / 256 AS varchar(3)) + ''.'' +
		CAST((@intIPNumber & 0x000000FF) AS varchar(3));
END
' 
END
GO
USE [dnmembership]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_LogTableSuffix]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FN_LogTableSuffix]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'/**
version : 1
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-01-06
description : ??? ???? ?? ???? ??? (0 or 1 or 2)? ?????.
**/

CREATE FUNCTION [dbo].[FN_LogTableSuffix] (
	@dt2BasisDate datetime2(0)
)
RETURNS int
AS
BEGIN
	RETURN DATEDIFF(DAY, ''2000-01-01'', @dt2BasisDate) % 3;
END
' 
END
GO
USE [dnmembership]
GO
/****** Object:  UserDefinedFunction [dbo].[TF_NSplit]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TF_NSplit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'/**
version : 5
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-04-02
description : ???? ?? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[TF_NSplit] (
	@nvcString nvarchar(max),
	@nvcDelimiter nvarchar(10)
)
RETURNS @tblResult table (seq int IDENTITY(1, 1) NOT NULL PRIMARY KEY, string nvarchar(4000) NOT NULL)
AS
BEGIN
	DECLARE @xmlString xml;

	SET @xmlString = CAST(N''<X n="'' + REPLACE(@nvcString, @nvcDelimiter, N''"/><X n="'') + N''"/>'' AS xml);

	INSERT @tblResult (string)
	SELECT T.col.value(''@n'', ''nvarchar(4000)'') AS n FROM @xmlString.nodes(''/X'') T(col);

	RETURN;
END
' 
END
GO
USE [dnmembership]
GO
/****** Object:  UserDefinedFunction [dbo].[TF_Split]    Script Date: 11/14/2026 8:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TF_Split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'/**
version : 5
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-04-02
description : ???? ?? ? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[TF_Split] (
	@vchString varchar(max),
	@vchDelimiter varchar(10)
)
RETURNS @tblResult table (seq int IDENTITY(1, 1) NOT NULL PRIMARY KEY, string varchar(8000) NOT NULL)
AS
BEGIN
	DECLARE @xmlString xml;

	SET @xmlString = CAST(''<X n="'' + REPLACE(@vchString, @vchDelimiter, ''"/><X n="'') + ''"/>'' AS xml);

	INSERT @tblResult (string)
	SELECT T.col.value(''@n'', ''varchar(8000)'') AS n FROM @xmlString.nodes(''/X'') T(col);

	RETURN;
END
' 
END
GO
USE [dnserverlog]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DynamicWhereClause]    Script Date: 11/14/2026 8:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2008-02-19
description : Makes the [where clause] that is included in dynamic query.
**/

CREATE FUNCTION [dbo].[FN_DynamicWhereClause] (
	@nvcColumnName nvarchar(128),
	@nvcVariableName nvarchar(128),
	@inbNullBitmap bigint,
	@intColumnSequence int,
	@intColumnCount int,
	@inyComparisonType tinyint
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @nvcWhereClause nvarchar(max)

	SET @nvcWhereClause =
		CASE
			WHEN @intColumnSequence = 1 AND @inbNullBitmap > 0 THEN ' WHERE '
			ELSE N''
		END +
		CASE
			WHEN @inbNullBitmap & POWER(CAST(2 AS bigint), @intColumnSequence - 1) = 0 THEN N''
			ELSE @nvcColumnName +
				CASE @inyComparisonType
					WHEN 1 THEN N' = ' + @nvcVariableName
					WHEN 2 THEN N' LIKE (' + @nvcVariableName + N' + ''%'')'
					WHEN 3 THEN N' LIKE (''%'' + ' + @nvcVariableName + N' + ''%'')'
					WHEN 4 THEN N' > ' + @nvcVariableName
					WHEN 5 THEN N' >= ' + @nvcVariableName
					WHEN 6 THEN N' < ' + @nvcVariableName
					WHEN 7 THEN N' <= ' + @nvcVariableName
					WHEN 8 THEN N' <> ' + @nvcVariableName
					ELSE N''
				END +
				CASE
					WHEN @inbNullBitmap & ((POWER(CAST(2 AS bigint), @intColumnCount) - 1) - (POWER(CAST(2 AS bigint), @intColumnSequence) - 1)) > 0 THEN N' AND '
					ELSE N''
				END
		END

	RETURN @nvcWhereClause
END
GO
USE [dnserverlog]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DynamicWhereClause2]    Script Date: 11/14/2026 8:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-01-23
description : Makes the [where clause] that is included in dynamic query.
**/

CREATE FUNCTION [dbo].[FN_DynamicWhereClause2] (
	@nvcColumnName nvarchar(128),
	@nvcVariableName nvarchar(128),
	@inbNullBitmap bigint,
	@intColumnSequence int,
	@intColumnCount int,
	@vchComparisonType varchar(10)
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @nvcWhereClause nvarchar(max)

	SET @nvcWhereClause =
		CASE
			WHEN @intColumnSequence = 1 AND @inbNullBitmap > 0 THEN ' WHERE '
			ELSE N''
		END +
		CASE
			WHEN @inbNullBitmap & POWER(CAST(2 AS bigint), @intColumnSequence - 1) = 0 THEN N''
			ELSE @nvcColumnName +
				CASE @vchComparisonType
					WHEN '=' THEN N' = ' + @nvcVariableName
					WHEN 'A%' THEN N' LIKE (' + @nvcVariableName + N' + ''%'')'
					WHEN '%A%' THEN N' LIKE (''%'' + ' + @nvcVariableName + N' + ''%'')'
					WHEN '>' THEN N' > ' + @nvcVariableName
					WHEN '>=' THEN N' >= ' + @nvcVariableName
					WHEN '<' THEN N' < ' + @nvcVariableName
					WHEN '<=' THEN N' <= ' + @nvcVariableName
					WHEN '<>' THEN N' <> ' + @nvcVariableName
					WHEN '&' THEN N' & '  + @nvcVariableName + N' > 0'
					ELSE N''
				END +
				CASE
					WHEN @inbNullBitmap & ((POWER(CAST(2 AS bigint), @intColumnCount) - 1) - (POWER(CAST(2 AS bigint), @intColumnSequence) - 1)) > 0 THEN N' AND '
					ELSE N''
				END
		END

	RETURN @nvcWhereClause
END
GO
USE [dnserverlog]
GO
/****** Object:  UserDefinedFunction [dbo].[IF_NSplit]    Script Date: 11/14/2026 8:57:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-04-02
description : ???? ?? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[IF_NSplit] (
	@nvcString nvarchar(max),
	@nchDelimiter nchar(1)
)
RETURNS TABLE
AS
RETURN (
	SELECT ROW_NUMBER() OVER(ORDER BY n) AS seq, SUBSTRING(@nchDelimiter + @nvcString + @nchDelimiter, n + 1, CHARINDEX(@nchDelimiter, @nchDelimiter + @nvcString + @nchDelimiter, n + 1) - n - 1) AS string
	FROM dbo.Tally WITH (NOLOCK)
	WHERE n < (DATALENGTH(@nchDelimiter + @nvcString + @nchDelimiter) / 2) AND SUBSTRING(@nchDelimiter + @nvcString + @nchDelimiter, n, 1) = @nchDelimiter
)
GO
USE [dnserverlog]
GO
/****** Object:  UserDefinedFunction [dbo].[IF_Split]    Script Date: 11/14/2026 8:57:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-04-02
description : ???? ?? ? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[IF_Split] (
	@vchString nvarchar(max),
	@chrDelimiter nchar(1)
)
RETURNS TABLE
AS
RETURN (
	SELECT ROW_NUMBER() OVER(ORDER BY n) AS seq, SUBSTRING(@chrDelimiter + @vchString + @chrDelimiter, n + 1, CHARINDEX(@chrDelimiter, @chrDelimiter + @vchString + @chrDelimiter, n + 1) - n - 1) AS string
	FROM dbo.Tally WITH (NOLOCK)
	WHERE n < DATALENGTH(@chrDelimiter + @vchString + @chrDelimiter) AND SUBSTRING(@chrDelimiter + @vchString + @chrDelimiter, n, 1) = @chrDelimiter
)
GO
USE [dnserverlog]
GO
/****** Object:  UserDefinedFunction [dbo].[TF_NSplit]    Script Date: 11/14/2026 8:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2008-07-10
description : ???? ?? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[TF_NSplit] (
	@nvcString nvarchar(max),
	@nvcDelimiter nvarchar(10)
)
RETURNS @tblResult table (string nvarchar(4000) NOT NULL)
AS
BEGIN
DECLARE @xmlString xml;

SET @xmlString = CAST(N'<X>'+REPLACE(@nvcString, @nvcDelimiter, N'</X><X>')+N'</X>' AS xml);

INSERT @tblResult (string)
SELECT N.value(N'.', 'nvarchar(4000)') FROM @xmlString.nodes(N'X') AS T(N)

RETURN;
END
GO
USE [dnserverlog]
GO
/****** Object:  UserDefinedFunction [dbo].[TF_Split]    Script Date: 11/14/2026 8:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-07-10
description : ???? ?? ? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[TF_Split] (
	@vchString varchar(max),
	@vchDelimiter varchar(10)
)
RETURNS @tblResult table (string varchar(8000) NOT NULL)
AS
BEGIN
DECLARE @xmlString xml;

SET @xmlString = CAST(N'<X>' + REPLACE(@vchString, @vchDelimiter, '</X><X>') + '</X>' AS xml);

INSERT @tblResult (string)
SELECT N.value('.', 'varchar(8000)') FROM @xmlString.nodes('X') AS T(N)

RETURN;
END
GO
USE [dnstaging]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DynamicWhereClause]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2008-02-19
description : Makes the [where clause] that is included in dynamic query.
**/

CREATE FUNCTION [dbo].[FN_DynamicWhereClause] (
	@nvcColumnName nvarchar(128),
	@nvcVariableName nvarchar(128),
	@inbNullBitmap bigint,
	@intColumnSequence int,
	@intColumnCount int,
	@inyComparisonType tinyint
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @nvcWhereClause nvarchar(max)

	SET @nvcWhereClause =
		CASE
			WHEN @intColumnSequence = 1 AND @inbNullBitmap > 0 THEN ' WHERE '
			ELSE N''
		END +
		CASE
			WHEN @inbNullBitmap & POWER(CAST(2 AS bigint), @intColumnSequence - 1) = 0 THEN N''
			ELSE @nvcColumnName +
				CASE @inyComparisonType
					WHEN 1 THEN N' = ' + @nvcVariableName
					WHEN 2 THEN N' LIKE (' + @nvcVariableName + N' + ''%'')'
					WHEN 3 THEN N' LIKE (''%'' + ' + @nvcVariableName + N' + ''%'')'
					WHEN 4 THEN N' > ' + @nvcVariableName
					WHEN 5 THEN N' >= ' + @nvcVariableName
					WHEN 6 THEN N' < ' + @nvcVariableName
					WHEN 7 THEN N' <= ' + @nvcVariableName
					WHEN 8 THEN N' <> ' + @nvcVariableName
					ELSE N''
				END +
				CASE
					WHEN @inbNullBitmap & ((POWER(CAST(2 AS bigint), @intColumnCount) - 1) - (POWER(CAST(2 AS bigint), @intColumnSequence) - 1)) > 0 THEN N' AND '
					ELSE N''
				END
		END

	RETURN @nvcWhereClause
END
GO
USE [dnstaging]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DynamicWhereClause2]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-01-23
description : Makes the [where clause] that is included in dynamic query.
**/

CREATE FUNCTION [dbo].[FN_DynamicWhereClause2] (
	@nvcColumnName nvarchar(128),
	@nvcVariableName nvarchar(128),
	@inbNullBitmap bigint,
	@intColumnSequence int,
	@intColumnCount int,
	@vchComparisonType varchar(10)
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @nvcWhereClause nvarchar(max)

	SET @nvcWhereClause =
		CASE
			WHEN @intColumnSequence = 1 AND @inbNullBitmap > 0 THEN ' WHERE '
			ELSE N''
		END +
		CASE
			WHEN @inbNullBitmap & POWER(CAST(2 AS bigint), @intColumnSequence - 1) = 0 THEN N''
			ELSE @nvcColumnName +
				CASE @vchComparisonType
					WHEN '=' THEN N' = ' + @nvcVariableName
					WHEN 'A%' THEN N' LIKE (' + @nvcVariableName + N' + ''%'')'
					WHEN '%A%' THEN N' LIKE (''%'' + ' + @nvcVariableName + N' + ''%'')'
					WHEN '>' THEN N' > ' + @nvcVariableName
					WHEN '>=' THEN N' >= ' + @nvcVariableName
					WHEN '<' THEN N' < ' + @nvcVariableName
					WHEN '<=' THEN N' <= ' + @nvcVariableName
					WHEN '<>' THEN N' <> ' + @nvcVariableName
					WHEN '&' THEN N' & '  + @nvcVariableName + N' > 0'
					ELSE N''
				END +
				CASE
					WHEN @inbNullBitmap & ((POWER(CAST(2 AS bigint), @intColumnCount) - 1) - (POWER(CAST(2 AS bigint), @intColumnSequence) - 1)) > 0 THEN N' AND '
					ELSE N''
				END
		END

	RETURN @nvcWhereClause
END
GO
USE [dnstaging]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_IP2IPNumber]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
version : 1
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-01-04
description : IP??? ????? ?????.
**/

CREATE FUNCTION [dbo].[FN_IP2IPNumber] (
	@vchIP varchar(15)
)
RETURNS int
AS
BEGIN
	RETURN
		((CAST(PARSENAME(@vchIP, 4) AS int) - 128) * 16777216) +
		(CAST(PARSENAME(@vchIP, 3) AS int) * 65536) +
		(CAST(PARSENAME(@vchIP, 2) AS int) * 256) +
		CAST(PARSENAME(@vchIP, 1) AS int);
END
GO
USE [dnstaging]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_IPNumber2IP]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
version : 1
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-01-04
description : ???? IP??? ?????.
**/

CREATE FUNCTION [dbo].[FN_IPNumber2IP] (
@intIPNumber int
)
RETURNS varchar(15)
AS
BEGIN
	RETURN
		CAST(((@intIPNumber & 0xFF000000) / 16777216) + 128 AS varchar(3)) + '.' +
		CAST((@intIPNumber & 0x00FF0000) / 65536 AS varchar(3)) + '.' +
		CAST((@intIPNumber & 0x0000FF00) / 256 AS varchar(3)) + '.' +
		CAST((@intIPNumber & 0x000000FF) AS varchar(3));
END
GO
USE [dnstaging]
GO
/****** Object:  UserDefinedFunction [dbo].[IF_NSplit]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-04-02
description : ???? ?? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[IF_NSplit] (
	@nvcString nvarchar(max),
	@nchDelimiter nchar(1)
)
RETURNS TABLE
AS
RETURN (
	SELECT ROW_NUMBER() OVER(ORDER BY n) AS seq, SUBSTRING(@nchDelimiter + @nvcString + @nchDelimiter, n + 1, CHARINDEX(@nchDelimiter, @nchDelimiter + @nvcString + @nchDelimiter, n + 1) - n - 1) AS string
	FROM dbo.Tally WITH (NOLOCK)
	WHERE n < (DATALENGTH(@nchDelimiter + @nvcString + @nchDelimiter) / 2) AND SUBSTRING(@nchDelimiter + @nvcString + @nchDelimiter, n, 1) = @nchDelimiter
)
GO
USE [dnstaging]
GO
/****** Object:  UserDefinedFunction [dbo].[IF_Split]    Script Date: 11/14/2026 9:00:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
version : 2
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-04-02
description : ???? ?? ? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[IF_Split] (
	@vchString varchar(max),
	@chrDelimiter char(1)
)
RETURNS TABLE
AS
RETURN (
	SELECT ROW_NUMBER() OVER(ORDER BY n) AS seq, SUBSTRING(@chrDelimiter + @vchString + @chrDelimiter, n + 1, CHARINDEX(@chrDelimiter, @chrDelimiter + @vchString + @chrDelimiter, n + 1) - n - 1) AS string
	FROM dbo.Tally WITH (NOLOCK)
	WHERE n < DATALENGTH(@chrDelimiter + @vchString + @chrDelimiter) AND SUBSTRING(@chrDelimiter + @vchString + @chrDelimiter, n, 1) = @chrDelimiter
)
GO
USE [dnstaging]
GO
/****** Object:  UserDefinedFunction [dbo].[TF_NSplit]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2008-07-10
description : ???? ?? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[TF_NSplit] (
	@nvcString nvarchar(max),
	@nvcDelimiter nvarchar(10)
)
RETURNS @tblResult table (string nvarchar(4000) NOT NULL)
AS
BEGIN
DECLARE @xmlString xml;

SET @xmlString = CAST(N'<X>'+REPLACE(@nvcString, @nvcDelimiter, N'</X><X>')+N'</X>' AS xml);

INSERT @tblResult (string)
SELECT N.value(N'.', 'nvarchar(4000)') FROM @xmlString.nodes(N'X') AS T(N)

RETURN;
END
GO
USE [dnstaging]
GO
/****** Object:  UserDefinedFunction [dbo].[TF_Split]    Script Date: 11/14/2026 9:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-07-10
description : ???? ?? ? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[TF_Split] (
	@vchString varchar(max),
	@vchDelimiter varchar(10)
)
RETURNS @tblResult table (string varchar(8000) NOT NULL)
AS
BEGIN
DECLARE @xmlString xml;

SET @xmlString = CAST(N'<X>' + REPLACE(@vchString, @vchDelimiter, '</X><X>') + '</X>' AS xml);

INSERT @tblResult (string)
SELECT N.value('.', 'varchar(8000)') FROM @xmlString.nodes('X') AS T(N)

RETURN;
END
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_AchieveMissionBin]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
version : 1
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-07-26
description : ??? ??? bitmap ???? ?????.
**/

CREATE FUNCTION [dbo].[FN_AchieveMissionBin] (
	@inbCharacterID bigint --// ??? ID
)
RETURNS binary(625)
AS
BEGIN
	DECLARE @binMissionBin binary(625), @vchTemp varchar(max) = '';

	WITH C1 (a, b) AS (
		SELECT MissionID / 8, POWER(2, 7 - (MissionID % 8))
		FROM dbo.AchieveMissions
		WHERE CharacterID = @inbCharacterID
	), C2 (a, b) AS (
		SELECT a, CONVERT(char(2), CAST(SUM(b) AS binary(1)), 2)
		FROM C1
		GROUP BY a
	)
	SELECT @vchTemp += COALESCE(C2.b, '00')
	FROM dbo.Tally T
		LEFT OUTER JOIN C2 ON T.n - 1 = C2.a
	WHERE T.n <= 625
	ORDER BY T.n;

	SET @binMissionBin = CONVERT(binary(625), @vchTemp, 2);

	RETURN @binMissionBin;
END
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_AppellationBin]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
version : 1
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-07-26
description : ??? ??? bitmap ???? ?????.
**/

CREATE FUNCTION [dbo].[FN_AppellationBin] (
	@inbCharacterID bigint --// ??? ID
)
RETURNS binary(100)
AS
BEGIN
	DECLARE @binAppellationBin binary(100), @vchTemp varchar(max) = '';

	WITH C1 (a, b) AS (
		SELECT AppellationID / 8, POWER(2, 7 - (AppellationID % 8))
		FROM dbo.Appellations
		WHERE CharacterID = @inbCharacterID
	), C2 (a, b) AS (
		SELECT a, CONVERT(char(2), CAST(SUM(b) AS binary(1)), 2)
		FROM C1
		GROUP BY a
	)
	SELECT @vchTemp += COALESCE(C2.b, '00')
	FROM dbo.Tally T
		LEFT OUTER JOIN C2 ON T.n - 1 = C2.a
	WHERE T.n <= 100
	ORDER BY T.n;

	SET @binAppellationBin = CONVERT(binary(100), @vchTemp, 2);

	RETURN @binAppellationBin;
END
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_Binary_Bitwise]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FN_Binary_Bitwise](@mask1 VARBINARY(MAX), @mask2 VARBINARY(MAX), @operator CHAR(1))
RETURNS VARBINARY(MAX)
AS
BEGIN
-- Set variable for slice size, INT = 4 bytes. Technically INT is signed, but since we're doing binary operations it won't matter.
DECLARE @slice_bytes INT;
SET @slice_bytes = 4;


DECLARE @max_length INT;                        -- Maximum length of either binary variable
DECLARE @slices INT;                            -- Number of slices
DECLARE @bin1 INT;                              -- Slice holder for @mask1
DECLARE @bin2 INT;                              -- Slice holder for @mask2
DECLARE @result INT;                            -- Result of bitwise binary operation per slice
DECLARE @resultmask VARBINARY(MAX);             -- Result of bitwise binary operation total
SET @resultmask = NULL;

-- Get maximum variable length
IF(DATALENGTH(@mask1) > DATALENGTH(@mask2))
SET @max_length = DATALENGTH(@mask1);
else
SET @max_length = DATALENGTH(@mask2);

-- Determine the number of slices we have to loop through
SET @slices = CEILING(@max_length/CAST(@slice_bytes AS FLOAT))

-- Loop through slices of our bitmasks
DECLARE @i INT;
SET @i = 0;
WHILE @i < @slices
BEGIN

-- Set @bin1 to the current INT sized slice of @mask1
IF(DATALENGTH(@mask1) > @i*@slice_bytes)
SET @bin1 = CAST(SUBSTRING(@mask1,DATALENGTH(@mask1)+1-(@i+1)*@slice_bytes,@slice_bytes) AS INT);
ELSE
SET @bin1 = 0;

-- Set @bin2 to the current INT sized slice of @mask2
IF(DATALENGTH(@mask2) > @i*@slice_bytes)
SET @bin2 = CAST(SUBSTRING(@mask2,DATALENGTH(@mask2)+1-(@i+1)*@slice_bytes,@slice_bytes) AS INT);
ELSE
SET @bin2 = 0;

-- Do bitwise operation and save in @result
IF(@operator = '&')
SET @result = @bin1 & @bin2;
ELSE
IF(@operator = '|')
SET @result = @bin1 | @bin2
ELSE
IF(@operator = '^')
SET @result = @bin1 ^ @bin2;
ELSE
RETURN 0x0;

-- Cast @result back to VARBINARY and append to @resultmask
IF(@resultmask IS NULL)
SET @resultmask = CAST(@result AS VARBINARY);
ELSE
SET @resultmask = CAST(@result AS VARBINARY) + @resultmask;

-- Increment counter
SET @i = @i + 1;
END

RETURN SUBSTRING(@resultmask,DATALENGTH(@resultmask)-@max_length+1,@max_length);
END;
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_CompleteQuestBin]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
version : 1
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-07-26
description : ??? ???? bitmap ???? ?????.
**/

CREATE FUNCTION [dbo].[FN_CompleteQuestBin] (
	@inbCharacterID bigint --// ??? ID
)
RETURNS binary(1250)
AS
BEGIN
	DECLARE @binCompleteQuestBin binary(1250), @vchTemp varchar(max) = '';

	WITH C1 (a, b) AS (
		SELECT QuestID / 8, CASE WHEN QuestID % 8 = 0 THEN 1 ELSE POWER(2, 8 - (QuestID % 8)) END
		FROM dbo.CompleteQuests WITH (NOLOCK)
		WHERE CharacterID = @inbCharacterID
	), C2 (a, b) AS (
		SELECT a, CONVERT(char(2), CAST(SUM(b) AS binary(1)), 2)
		FROM C1
		GROUP BY a
	)
	SELECT @vchTemp += COALESCE(C2.b, '00')
	FROM dbo.Tally T WITH (NOLOCK)
		LEFT OUTER JOIN C2 ON T.n - 1 = C2.a
	WHERE T.n <= 1250
	ORDER BY T.n;

	SET @binCompleteQuestBin = CONVERT(binary(1250), @vchTemp, 2);

	RETURN @binCompleteQuestBin;
END
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DynamicWhereClause]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2008-02-19
description : Makes the [where clause] that is included in dynamic query.
**/

CREATE FUNCTION [dbo].[FN_DynamicWhereClause] (
	@nvcColumnName nvarchar(128),
	@nvcVariableName nvarchar(128),
	@inbNullBitmap bigint,
	@intColumnSequence int,
	@intColumnCount int,
	@inyComparisonType tinyint
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @nvcWhereClause nvarchar(max)

	SET @nvcWhereClause =
		CASE
			WHEN @intColumnSequence = 1 AND @inbNullBitmap > 0 THEN ' WHERE '
			ELSE N''
		END +
		CASE
			WHEN @inbNullBitmap & POWER(CAST(2 AS bigint), @intColumnSequence - 1) = 0 THEN N''
			ELSE @nvcColumnName +
				CASE @inyComparisonType
					WHEN 1 THEN N' = ' + @nvcVariableName
					WHEN 2 THEN N' LIKE (' + @nvcVariableName + N' + ''%'')'
					WHEN 3 THEN N' LIKE (''%'' + ' + @nvcVariableName + N' + ''%'')'
					WHEN 4 THEN N' > ' + @nvcVariableName
					WHEN 5 THEN N' >= ' + @nvcVariableName
					WHEN 6 THEN N' < ' + @nvcVariableName
					WHEN 7 THEN N' <= ' + @nvcVariableName
					WHEN 8 THEN N' <> ' + @nvcVariableName
					ELSE N''
				END +
				CASE
					WHEN @inbNullBitmap & ((POWER(CAST(2 AS bigint), @intColumnCount) - 1) - (POWER(CAST(2 AS bigint), @intColumnSequence) - 1)) > 0 THEN N' AND '
					ELSE N''
				END
		END

	RETURN @nvcWhereClause
END
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_DynamicWhereClause2]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-01-23
description : Makes the [where clause] that is included in dynamic query.
**/

CREATE FUNCTION [dbo].[FN_DynamicWhereClause2] (
	@nvcColumnName nvarchar(128),
	@nvcVariableName nvarchar(128),
	@inbNullBitmap bigint,
	@intColumnSequence int,
	@intColumnCount int,
	@vchComparisonType varchar(10)
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @nvcWhereClause nvarchar(max)

	SET @nvcWhereClause =
		CASE
			WHEN @intColumnSequence = 1 AND @inbNullBitmap > 0 THEN ' WHERE '
			ELSE N''
		END +
		CASE
			WHEN @inbNullBitmap & POWER(CAST(2 AS bigint), @intColumnSequence - 1) = 0 THEN N''
			ELSE @nvcColumnName +
				CASE @vchComparisonType
					WHEN '=' THEN N' = ' + @nvcVariableName
					WHEN 'A%' THEN N' LIKE (' + @nvcVariableName + N' + ''%'')'
					WHEN '%A%' THEN N' LIKE (''%'' + ' + @nvcVariableName + N' + ''%'')'
					WHEN '>' THEN N' > ' + @nvcVariableName
					WHEN '>=' THEN N' >= ' + @nvcVariableName
					WHEN '<' THEN N' < ' + @nvcVariableName
					WHEN '<=' THEN N' <= ' + @nvcVariableName
					WHEN '<>' THEN N' <> ' + @nvcVariableName
					WHEN '&' THEN N' & '  + @nvcVariableName + N' > 0'
					ELSE N''
				END +
				CASE
					WHEN @inbNullBitmap & ((POWER(CAST(2 AS bigint), @intColumnCount) - 1) - (POWER(CAST(2 AS bigint), @intColumnSequence) - 1)) > 0 THEN N' AND '
					ELSE N''
				END
		END

	RETURN @nvcWhereClause
END
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_IP2IPNumber]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
version : 1
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-01-04
description : IP??? ????? ?????.
**/

CREATE FUNCTION [dbo].[FN_IP2IPNumber] (
	@vchIP varchar(15)
)
RETURNS int
AS
BEGIN
	RETURN
		((CAST(PARSENAME(@vchIP, 4) AS int) - 128) * 16777216) +
		(CAST(PARSENAME(@vchIP, 3) AS int) * 65536) +
		(CAST(PARSENAME(@vchIP, 2) AS int) * 256) +
		CAST(PARSENAME(@vchIP, 1) AS int);
END
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_IPNumber2IP]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
version : 1
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-01-04
description : ???? IP??? ?????.
**/

CREATE FUNCTION [dbo].[FN_IPNumber2IP] (
@intIPNumber int
)
RETURNS varchar(15)
AS
BEGIN
	RETURN
		CAST(((@intIPNumber & 0xFF000000) / 16777216) + 128 AS varchar(3)) + '.' +
		CAST((@intIPNumber & 0x00FF0000) / 65536 AS varchar(3)) + '.' +
		CAST((@intIPNumber & 0x0000FF00) / 256 AS varchar(3)) + '.' +
		CAST((@intIPNumber & 0x000000FF) AS varchar(3));
END
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_LogTableSuffix]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
version : 1
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2010-01-06
description : ??? ???? ?? ???? ??? (0 or 1 or 2)? ?????.
**/

CREATE FUNCTION [dbo].[FN_LogTableSuffix] (
	@dt2BasisDate datetime2(0)
)
RETURNS int
AS
BEGIN
	RETURN DATEDIFF(DAY, '2000-01-01', @dt2BasisDate) % 3;
END
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_MissionBinary]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FN_MissionBinary](@binGainMissionBin binary(1250), @intMissionID int)
RETURNS binary(1250)
AS
BEGIN
	RETURN CAST(SUBSTRING(@binGainMissionBin, 1, @intMissionID/8) 
			+ CAST( CAST(SUBSTRING(@binGainMissionBin, @intMissionID/8+1, 1) AS tinyint) | CAST(POWER( 2, 7-@intMissionID%8) AS tinyint) AS VARBINARY)
			+ SUBSTRING(@binGainMissionBin, CAST(@intMissionID/8 AS int)+2, 1250) AS VARBINARY(1250))
END
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[IF_TradeItemTotals]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
version : 5
author : ???
e-mail : purumae@eyedentitygames.com
created date : 2012-09-17
description : 
**/

CREATE FUNCTION [dbo].[IF_TradeItemTotals] (
	  @intItemID int --// ??? ID
	, @inyItemLevel tinyint --// ?? ??
	, @intListPrice int --// ??
	, @bitNoticeFlag bit --// ?? ?? ??
)
RETURNS table
AS
RETURN
	SELECT COUNT(*) AS TradeCount
		, ISNULL(MIN(TR.ListPrice), 0) AS MinPrice
	FROM dbo.Trade TR WITH (NOLOCK, INDEX(IX_NNIF_Trade_ItemID), FORCESEEK)
	WHERE TR.TradeStatusCode = 0
		AND TR.ItemID = @intItemID
		AND TR.TradeExpireDate >= GETDATE()
		AND (@bitNoticeFlag = 0 OR (@bitNoticeFlag = 1 AND TR.ItemLevel >= @inyItemLevel AND TR.ListPrice <= @intListPrice));
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[TF_NSplit]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
version : 5
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-04-02
description : ???? ?? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[TF_NSplit] (
	@nvcString nvarchar(max),
	@nvcDelimiter nvarchar(10)
)
RETURNS @tblResult table (seq int IDENTITY(1, 1) NOT NULL PRIMARY KEY, string nvarchar(4000) NOT NULL)
AS
BEGIN
	DECLARE @xmlString xml;

	SET @xmlString = CAST(N'<X n="' + REPLACE(@nvcString, @nvcDelimiter, N'"/><X n="') + N'"/>' AS xml);

	INSERT @tblResult (string)
	SELECT T.col.value('@n', 'nvarchar(4000)') AS n FROM @xmlString.nodes('/X') T(col);

	RETURN;
END
GO
USE [dnworld]
GO
/****** Object:  UserDefinedFunction [dbo].[TF_Split]    Script Date: 11/14/2026 8:54:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
version : 6
author : doeyull.kim
e-mail : purumae@gmail.com
created date : 2009-04-02
description : ???? ?? ? ???? ???? Split?? ???? ?????.
**/

CREATE FUNCTION [dbo].[TF_Split] (
	@vchString varchar(max),
	@vchDelimiter varchar(10)
)
RETURNS @tblResult table (seq int IDENTITY(1, 1) NOT NULL PRIMARY KEY, string varchar(8000) NOT NULL)
AS
BEGIN
	DECLARE @xmlString xml;

	SET @xmlString = CAST('<X n="' + REPLACE(@vchString, @vchDelimiter, '"/><X n="') + '"/>' AS xml);

	INSERT @tblResult (string)
	SELECT T.col.value('@n', 'varchar(8000)') AS n FROM @xmlString.nodes('/X') T(col);

	RETURN;
END
GO

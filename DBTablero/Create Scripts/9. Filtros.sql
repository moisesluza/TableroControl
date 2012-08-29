

IF OBJECT_ID (N'[S_View_TicketsConSLA_Anios]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsConSLA_Anios]

GO
CREATE PROCEDURE [S_View_TicketsConSLA_Anios]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT YEAR([FECHARES]) AS ANIO
		FROM View_TicketsConSLA WITH(NOLOCK)
		WHERE NOT [FECHARES] IS NULL
		ORDER BY 1 ASC
	SET NOCOUNT OFF
END

IF OBJECT_ID (N'[S_View_TicketsConSLA_Meses]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsConSLA_Meses]
GO

CREATE PROCEDURE [S_View_TicketsConSLA_Meses]
	@ANIO VARCHAR(4)
AS
BEGIN
	SET LANGUAGE SPANISH

	SET NOCOUNT ON
		SELECT DISTINCT MONTH([FECHARES]) AS CODIGO, UPPER(DATENAME(MM, [FECHARES])) AS MES
		FROM View_TicketsConSLA WITH(NOLOCK)
		WHERE CONVERT(VARCHAR(4),YEAR([FECHARES])) = @ANIO
		ORDER BY 1 ASC
	SET NOCOUNT OFF
END

IF OBJECT_ID (N'[S_View_TicketsPorEstados_Anios]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsPorEstados_Anios]
GO

CREATE PROCEDURE [S_View_TicketsPorEstados_Anios]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT YEAR([FECHARES]) AS ANIO
		FROM View_TicketsPorEstados WITH(NOLOCK)
		WHERE NOT [FECHARES] IS NULL
		ORDER BY 1 ASC
	SET NOCOUNT OFF
END

IF OBJECT_ID (N'[S_View_TicketsPorEstados_Meses]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsPorEstados_Meses]
GO

CREATE PROCEDURE [S_View_TicketsPorEstados_Meses]
	@ANIO VARCHAR(4)
AS
BEGIN
	SET LANGUAGE SPANISH

	SET NOCOUNT ON
		SELECT DISTINCT MONTH([FECHARES]) AS CODIGO, UPPER(DATENAME(MM, [FECHARES])) AS MES
		FROM View_TicketsPorEstados WITH(NOLOCK)
		WHERE CONVERT(VARCHAR(4),YEAR([FECHARES])) = @ANIO
		ORDER BY 1 ASC
	SET NOCOUNT OFF
END
GO
--[S_View_TicketsConSLA_Anios]
--[S_View_TicketsConSLA_Meses] '2010'

---------------------------------------
--View_TicketsEstadosAñosMesAgrupado
---------------------------------------

IF OBJECT_ID (N'[S_View_TicketsEstadosAñosMesAgrupado_Anios]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsEstadosAñosMesAgrupado_Anios]
GO

CREATE PROCEDURE [S_View_TicketsEstadosAñosMesAgrupado_Anios]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT [Año] AS ANIO
		FROM View_TicketsEstadosAñosMesAgrupado 
		ORDER BY 1 ASC
	SET NOCOUNT OFF
END

IF OBJECT_ID (N'[S_View_TicketsEstadosAñosMesAgrupado_Meses]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsEstadosAñosMesAgrupado_Meses]
GO

CREATE PROCEDURE [S_View_TicketsEstadosAñosMesAgrupado_Meses]
	@ANIO int
AS
BEGIN
	SET LANGUAGE SPANISH

	SET NOCOUNT ON
		SELECT distinct [Mes] AS CODIGO, UPPER(DATENAME(MM, CONVERT(VARCHAR,[Año]) + '' + RIGHT('0' + CONVERT(VARCHAR,[Mes]),2) + '01')) AS MES
		FROM View_TicketsEstadosAñosMesAgrupado 
		WHERE [Año] = @ANIO
		ORDER BY 1 ASC
	SET NOCOUNT OFF
END
GO
--[S_View_TicketsEstadosAñosMesAgrupado_Anios]
--[S_View_TicketsEstadosAñosMesAgrupado_Meses] 2011

---------------------------------------
--dbo.View_SatisfaccionEncuestas
---------------------------------------

IF OBJECT_ID (N'[S_View_SatisfaccionEncuestas_Anios]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_SatisfaccionEncuestas_Anios]
GO

CREATE PROCEDURE [S_View_SatisfaccionEncuestas_Anios]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT year([FechaRespuesta]) AS ANIO
		FROM View_SatisfaccionEncuestas 
		WHERE [FechaRespuesta] IS NOT NULL
		ORDER BY 1 ASC
	SET NOCOUNT OFF
END

IF OBJECT_ID (N'[S_View_SatisfaccionEncuestas_Meses]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_SatisfaccionEncuestas_Meses]
GO

CREATE PROCEDURE [S_View_SatisfaccionEncuestas_Meses]
	@ANIO int
AS
BEGIN
	SET LANGUAGE SPANISH

	SET NOCOUNT ON
	
		SELECT DISTINCT month([FechaRespuesta]) AS CODIGO, UPPER(DATENAME(MM, [FechaRespuesta])) AS MES
		FROM View_SatisfaccionEncuestas 
		WHERE year([FechaRespuesta]) = @ANIO
		ORDER BY 1 ASC
		
	SET NOCOUNT OFF
END
GO
--[S_View_SatisfaccionEncuestas_Anios]
--[S_View_SatisfaccionEncuestas_Meses] 2011


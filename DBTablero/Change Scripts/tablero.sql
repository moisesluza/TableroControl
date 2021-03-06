set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

alter PROCEDURE [dbo].[S_View_TicketsConSLA_Reporte]
	@Tipo nvarchar(510),
	@Grupo nvarchar(510),
	@Area nvarchar(510)
AS
BEGIN
	SET NOCOUNT ON
	SET LANGUAGE Spanish

	SELECT	B.TICKET AS TICKET, 
			YEAR(B.FechaRes) AS ANIO, 
			MONTH(B.FechaRes) AS MES_ORDEN,
			LEFT(DATENAME(mm,B.FechaRes),3) AS MES,
			[Nivel de Servicio] AS TIPO
	FROM [View_TicketsConSLA] B WITH(NOLOCK)
	WHERE --FechaRes IS NOT NULL AND
			B.[Tipo] = CASE WHEN LEN(LTRIM(RTRIM(@Tipo)))=0 THEN B.[Tipo] ELSE @Tipo END AND
			B.[Grupo] = CASE WHEN LEN(LTRIM(RTRIM(@Grupo)))=0 THEN B.[Grupo] ELSE @Grupo END AND
			ISNULL(B.[Área de Usuario],'') = CASE WHEN LEN(LTRIM(RTRIM(@Area)))=0 THEN ISNULL(B.[Área de Usuario],'') ELSE @Area END
	and YEAR(B.FechaRes) =2010
	ORDER BY 2,3

	SET NOCOUNT OFF
END
GO
alter PROCEDURE [dbo].[S_View_TicketsConSLA_Tipos]
AS
BEGIN
	SET NOCOUNT ON
		SELECT '(Seleccione un filtro)' AS TIPO
		UNION ALL
		SELECT DISTINCT [Tipo] FROM View_TicketsPorEstados
	SET NOCOUNT OFF
END
GO
alter PROCEDURE [dbo].[S_View_TicketsConSLA_Grupos]
AS
BEGIN
	SET NOCOUNT ON
		SELECT '(Seleccione un filtro)' AS GRUPO
		UNION ALL
		SELECT DISTINCT [Grupo] FROM View_TicketsPorEstados
	SET NOCOUNT OFF
END
GO
alter PROCEDURE [dbo].[S_View_TicketsConSLA_Areas]
AS
BEGIN
	SET NOCOUNT ON
		SELECT '(Seleccione un filtro)' AS AREA
		UNION ALL
		SELECT DISTINCT [Área de Usuario] FROM View_TicketsPorEstados
	SET NOCOUNT OFF
END
GO
/*
	SELECT	ISNULL(A.TICKET,B.TICKET) AS TICKET, 
			ISNULL(YEAR(A.FECHAAPE), YEAR(B.FECHAAPE)) AS ANIO, 
			ISNULL(MONTH(A.FECHAAPE), MONTH(B.FECHAAPE)) AS MES_ORDEN,
			LEFT(DATENAME(mm,ISNULL(A.FECHAAPE,B.FECHAAPE)),3) AS MES,
			ISNULL(A.[NIVEL DE SERVICIO],'SIN SLA') AS TIPO
	FROM View_TicketsConSLA A WITH(NOLOCK)
	FULL OUTER JOIN View_TicketsPorEstados B WITH(NOLOCK) ON A.TICKET=B.TICKET
	WHERE	A.[Tipo] = CASE WHEN LEN(LTRIM(RTRIM(@Tipo)))=0 THEN A.[Tipo] ELSE @Tipo END AND
			A.[Grupo] = CASE WHEN LEN(LTRIM(RTRIM(@Grupo)))=0 THEN A.[Grupo] ELSE @Grupo END AND
			A.[Área de Usuario] = CASE WHEN LEN(LTRIM(RTRIM(@Area)))=0 THEN A.[Área de Usuario] ELSE @Area END
	ORDER BY 
		ISNULL(YEAR(A.FECHAAPE), YEAR(B.FECHAAPE)),
		ISNULL(MONTH(A.FECHAAPE), MONTH(B.FECHAAPE))
*/
--exec [dbo.S_View_SatifaccionEncuestas_Reporte] '', '', ''
alter PROCEDURE [dbo].[S_View_SatisfaccionEncuestas_Reporte]
	@Tipo nvarchar(510),
	@Grupo nvarchar(510),
	@Area nvarchar(510)
AS
BEGIN
	SET NOCOUNT ON
	SET LANGUAGE Spanish

SELECT TICKET,
	fechares as FECHARES,
	RESPUESTAREPORTE
FROM View_SatisfacciónEncuestas A WITH(NOLOCK)
where RESPUESTAREPORTE is not null and
	(A.[Tipo] = LTRIM(RTRIM(@Tipo)) or LTRIM(RTRIM(@Tipo)) = '') and
	(A.[Grupo] = LTRIM(RTRIM(@Grupo)) or LTRIM(RTRIM(@Grupo)) = '') and 
	(A.[Área de Usuario] = LTRIM(RTRIM(@Area)) or LTRIM(RTRIM(@Area))='')
order by FECHARES

	SET NOCOUNT OFF
END
GO

--exec [S_View_TicketsEstadosAgrupado_Reporte] '', '', ''
ALTER PROCEDURE [dbo].[S_View_TicketsEstadosAgrupado_Reporte]
	@Tipo nvarchar(510),
	@Grupo nvarchar(510),
	@Area nvarchar(510)
AS
BEGIN
	SET NOCOUNT ON
	SET LANGUAGE Spanish

SELECT	*
FROM View_TicketsEstadosAgrupado A
where
	(A.[Tipo] = LTRIM(RTRIM(@Tipo)) or LTRIM(RTRIM(@Tipo)) = '') and
	(A.[GrupoReporte] = LTRIM(RTRIM(@Grupo)) or LTRIM(RTRIM(@Grupo)) = '') and 
	(A.[Área] = LTRIM(RTRIM(@Area)) or LTRIM(RTRIM(@Area))='')
	
	SET NOCOUNT OFF
END
GO
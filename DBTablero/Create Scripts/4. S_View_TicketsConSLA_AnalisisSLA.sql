set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

if exists(select * from sys.objects where type_desc='SQL_STORED_PROCEDURE' and name='S_View_TicketsConSLA_AnalisisSLA')
	drop procedure S_View_TicketsConSLA_AnalisisSLA
go

create PROCEDURE dbo.[S_View_TicketsConSLA_AnalisisSLA]
	@Tipo nvarchar(10),
	@Grupo nvarchar(100),
	@Area nvarchar(100),
	@FechaIni datetime,
	@FechaFin datetime
AS
BEGIN
	SET NOCOUNT ON
	SET LANGUAGE Spanish

	SELECT	 
			YEAR(B.FechaRes) AS ANIO, 
			MONTH(B.FechaRes) AS MES,
			--LEFT(DATENAME(mm,B.FechaRes),3) AS MES,
			[Nivel de Servicio] AS TIPO,
			COUNT(B.TICKET) AS CANT_TICKET
	FROM [View_TicketsConSLA] B WITH(NOLOCK)
	WHERE --FechaRes IS NOT NULL AND
			(B.[Tipo] = @Tipo or @Tipo='') AND
			(B.[Grupo] = @Grupo or @Grupo ='') AND
			(B.[Área de Usuario] = @Area or @Area='') and
			(B.FechaRes between @FechaIni and @FechaFin)
	GROUP BY YEAR(B.FechaRes), MONTH(B.FechaRes), [Nivel de Servicio]
	ORDER BY ANIO, MES, TIPO
	SET NOCOUNT OFF
END
GO
USE tablero
GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

if exists(select * from sys.objects where type_desc='SQL_STORED_PROCEDURE' and name='S_View_TicketsEstadosAñosMesAgrupado_PendPorMes')
	drop procedure [S_View_TicketsEstadosAñosMesAgrupado_PendPorMes]
go

create PROCEDURE dbo.[S_View_TicketsEstadosAñosMesAgrupado_PendPorMes]
	@Tipo nvarchar(100),
	@Area nvarchar(100),
	@anioMes_ini int,
	@anioMes_fin int
AS
BEGIN
	SET NOCOUNT ON
	SET LANGUAGE Spanish

  SELECT	 
		[Año], 
		[Mes], 
		[GrupoReporte],
		sum(Tickets) as CANT_TICKETS
	FROM dbo.[View_TicketsEstadosAñosMesAgrupado] WITH(NOLOCK)
	WHERE
		([EstadoReporte]='Pendiente') AND
		([Tipo] = @Tipo or @Tipo='') AND
		([Área] = @Area or @Area='') AND
		(Año*100)+Mes between @anioMes_ini and @anioMes_fin
	GROUP BY [Año], [Mes], [GrupoReporte]
	ORDER BY [Año], [Mes], [GrupoReporte]  
	
	SET NOCOUNT OFF
END
GO


 
--exec [S_View_TicketsEstadosAñosMesAgrupado_PendPorMes] '','',201005,201105
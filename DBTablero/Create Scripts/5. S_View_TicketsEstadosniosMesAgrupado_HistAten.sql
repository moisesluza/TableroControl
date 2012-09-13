

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

if exists(select * from sys.objects where type_desc='SQL_STORED_PROCEDURE' and name='S_View_TicketsEstadosAñosMesAgrupado_HistAten')
	drop procedure [S_View_TicketsEstadosAñosMesAgrupado_HistAten]
go

create PROCEDURE dbo.[S_View_TicketsEstadosAñosMesAgrupado_HistAten]
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
	isnull(GE.[GrupoReporte],'Sin Grupo') as [GrupoReporte],
	[EstadoReporte],
	sum(Tickets) as CANT_TICKETS
FROM dbo.[View_TicketsEstadosAñosMesAgrupado] T WITH(NOLOCK) 
	left join dbo.Grupo_Equilavencia GE on T.[GrupoReporte] = GE.Grupo
WHERE
		([Tipo] = @Tipo or @Tipo='') AND
		([Área] = @Area or @Area='') AND
		((convert(varchar,[Año]) + '' + right('0' + convert(varchar,[Mes]),2)) between @anioMes_ini and @anioMes_fin)	
GROUP BY [Año], [Mes], T.[GrupoReporte], [EstadoReporte],GE.[GrupoReporte]
ORDER BY [Año], [Mes], T.[GrupoReporte], [EstadoReporte]

	/*SELECT	 
		[Año], 
		[Mes], 
		[GrupoReporte],
		[EstadoReporte],
		sum(Tickets) as CANT_TICKETS
	FROM dbo.[View_TicketsEstadosAñosMesAgrupado] WITH(NOLOCK)
	WHERE
		([Tipo] = @Tipo or @Tipo='') AND
		([Área] = @Area or @Area='') AND
		((convert(varchar,[Año]) + '' + right('0' + convert(varchar,[Mes]),2)) between @anioMes_ini and @anioMes_fin)
	GROUP BY [Año], [Mes], [GrupoReporte], [EstadoReporte]
	ORDER BY [Año], [Mes], [GrupoReporte], [EstadoReporte]*/
	
	SET NOCOUNT OFF
END
GO
 
--exec [S_View_TicketsEstadosAñosMesAgrupado_HistAten] '','',201005,201105
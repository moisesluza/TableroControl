
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

if exists(select * from sys.objects where type_desc='SQL_STORED_PROCEDURE' and name='S_View_SatisfaccionEncuestas_AnaSatisEnc')
	drop procedure [S_View_SatisfaccionEncuestas_AnaSatisEnc]
go

create PROCEDURE dbo.[S_View_SatisfaccionEncuestas_AnaSatisEnc]
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
		YEAR(FechaRespuesta) AS ANIO, 
		MONTH(FechaRespuesta) AS MES,
		RespuestaReporte, 
		count(Ticket) as CANT_TICKETS
	FROM dbo.View_SatisfaccionEncuestas WITH(NOLOCK)
	WHERE
		([Tipo] = @Tipo or @Tipo='') AND
		([Grupo] = @Grupo or @Grupo ='') AND
		([Área de Usuario] = @Area or @Area='') AND
		(FechaRespuesta between @FechaIni and @FechaFin)
	GROUP BY YEAR(FechaRespuesta), MONTH(FechaRespuesta), RespuestaReporte
	ORDER BY YEAR(FechaRespuesta), MONTH(FechaRespuesta), RespuestaReporte
	
	SET NOCOUNT OFF
END
GO
 
--exec [S_View_SatisfaccionEncuestas_AnaSatisEnc] '','','','20100501','20110530'
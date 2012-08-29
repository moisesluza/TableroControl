IF OBJECT_ID (N'View_TicketsEstadosA�osMesAgrupado_BBVA', N'V') IS NOT NULL
	DROP VIEW View_TicketsEstadosA�osMesAgrupado_BBVA 
GO

CREATE VIEW View_TicketsEstadosA�osMesAgrupado_BBVA as
SELECT A�o, Mes, Tipo, �rea, GrupoReporte, EstadoReporte, COUNT(*) AS Tickets
FROM View_TicketsEstadosA�oMes_BBVA
GROUP BY A�o, Mes, Tipo, �rea, GrupoReporte, EstadoReporte

IF OBJECT_ID (N'View_TicketsEstadosAñosMesAgrupado_BBVA', N'V') IS NOT NULL
	DROP VIEW View_TicketsEstadosAñosMesAgrupado_BBVA 
GO

CREATE VIEW View_TicketsEstadosAñosMesAgrupado_BBVA as
SELECT Año, Mes, Tipo, Área, GrupoReporte, EstadoReporte, COUNT(*) AS Tickets
FROM View_TicketsEstadosAñoMes_BBVA
GROUP BY Año, Mes, Tipo, Área, GrupoReporte, EstadoReporte

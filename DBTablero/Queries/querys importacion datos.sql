select COUNT(*) from dbo.View_TicketsConSLA--[FechaRes]
select COUNT(*) from dbo.View_TicketsEstadosAñosMesAgrupado--totalizado [Anio, Mes]
select COUNT(*) from dbo.View_SatisfaccionEncuestas--[FechaRespuesta]
select COUNT(*) from dbo.View_TicketsPorEstados--[FechaApe]

truncate table View_TicketsConSLA
truncate table View_TicketsPorEstados

select Ticket, Tipo, Prioridad, FechaApe, FechaRes, FechaCie, Usuario, [ST Usuario], [Área de Usuario], SedeUsu, Analista, Grupo, Reportado_Por, ContractServiceType, SLATResolución, Categoría, DescCat, GrupoCat, Descripción, Resumen, Estado, Met_Reporte, RootCause, [Acción a Seguir], Proveedor, [¿Activo?], [Nivel de Servicio], OpenDate, CloseDate 
from dbo.View_TicketsConSLA where fechaApe between convert(datetime,'20110530')-30 and '20110530'
delete from dbo.View_TicketsConSLA where fechaApe between convert(datetime,'20110530')-30 and '20110530'

select Ticket, Tipo, Prioridad, FechaApe, FechaRes, FechaCie, Usuario, [ST Usuario], [Área de Usuario], SedeUsu, Analista, Reportado_Por, Categoría, DescCat, Grupo, Descripción, Resumen, Estado, Met_Reporte, [description], Proveedor, [¿Activo?], OpenDate, CloseDate, FechaRespuesta, nx_comment, SurveyAnswerSequence, RespuestaReporte, EncuestaContestada 
from dbo.View_SatisfaccionEncuestas where FechaRespuesta between convert(datetime,'20110530')-30 and '20110530'
delete from dbo.View_SatisfaccionEncuestas where FechaRespuesta between convert(datetime,'20110530')-30 and '20110530' 

select Ticket, Tipo, Prioridad, FechaApe, FechaRes, FechaCie, Usuario, [ST Usuario], [Área de Usuario], SedeUsu, Analista, Reportado_Por, ContractServiceType, Categoría, DescCat, Grupo, Descripción, Resumen, Estado, Met_Reporte, [description], Proveedor, [¿Activo?], OpenDate, CloseDate, GrupoReporte, EstadoReporte 
from dbo.View_TicketsPorEstados where FechaApe between convert(datetime,'20110530')-30 and '20110530'
delete from dbo.View_TicketsPorEstados where FechaApe between convert(datetime,'20110530')-30 and '20110530'

select Año, Mes, Tipo, Área, GrupoReporte, EstadoReporte, Tickets 
from dbo.View_TicketsEstadosAñosMesAgrupado where Año in (YEAR(convert(datetime,'20110515')),YEAR(convert(datetime,'20110515')-60)) and Mes>=month(convert(datetime,'20110515')-60) and Mes<=month(convert(datetime,'20110515')) 
delete from dbo.View_TicketsEstadosAñosMesAgrupado where Año in (YEAR(convert(datetime,'20110515')),YEAR(convert(datetime,'20110515')-60)) and Mes>=month(convert(datetime,'20110515')-60) and Mes<=month(convert(datetime,'20110515')) 

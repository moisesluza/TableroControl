
USE tablero

GO
BEGIN TRY

	BEGIN TRAN

	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[View_SatisfaccionEncuestas]') AND name = N'IX_View_SatisfaccionEncuestas')
		DROP INDEX [IX_View_SatisfaccionEncuestas] ON [dbo].[View_SatisfaccionEncuestas] WITH ( ONLINE = OFF )

	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[View_TicketsConSLA]') AND name = N'IX_View_TicketsConSLA')
		DROP INDEX [IX_View_TicketsConSLA] ON [dbo].[View_TicketsConSLA] WITH ( ONLINE = OFF )

	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[View_TicketsEstadosAñoMes]') AND name = N'IX_View_TicketsEstadosAnioMes')
		DROP INDEX [IX_View_TicketsEstadosAnioMes] ON [dbo].[View_TicketsEstadosAñoMes] WITH ( ONLINE = OFF )

	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[View_TicketsEstadosAñosMesAgrupado]') AND name = N'IX_View_TicketsEstadosAniosMesAgrupado')
		DROP INDEX [IX_View_TicketsEstadosAniosMesAgrupado] ON [dbo].[View_TicketsEstadosAñosMesAgrupado] WITH ( ONLINE = OFF )

	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[View_TicketsPorEstados]') AND name = N'IX_View_TicketsPorEstados')
		DROP INDEX [IX_View_TicketsPorEstados] ON [dbo].[View_TicketsPorEstados] WITH ( ONLINE = OFF )

	CREATE CLUSTERED INDEX [IX_View_SatisfaccionEncuestas] ON [dbo].[View_SatisfaccionEncuestas] 
	([Tipo] ASC, [Grupo] ASC, [Área de Usuario] ASC, [FechaRespuesta] ASC)
	WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

	CREATE CLUSTERED INDEX [IX_View_TicketsConSLA] ON [dbo].[View_TicketsConSLA] 
	([Tipo] ASC, [Grupo] ASC, [Área de Usuario] ASC, [FechaRes] ASC)
	WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

	CREATE CLUSTERED INDEX [IX_View_TicketsEstadosAnioMes] ON [dbo].[View_TicketsEstadosAñoMes] 
	([Tipo] ASC, [Grupo] ASC, [Área] ASC, [FechaApe] ASC)
	WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

	CREATE CLUSTERED INDEX [IX_View_TicketsEstadosAniosMesAgrupado] ON [dbo].[View_TicketsEstadosAñosMesAgrupado] 
	([Año] ASC, [Mes] ASC, [Tipo] ASC, [Área] ASC)
	WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

	CREATE CLUSTERED INDEX [IX_View_TicketsPorEstados] ON [dbo].[View_TicketsPorEstados] 
	([Tipo] ASC, [Grupo] ASC, [Área de Usuario] ASC, [FechaApe] ASC)
	WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

	COMMIT TRAN
END TRY
BEGIN CATCH
	SELECT	ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;

	ROLLBACK TRAN
END CATCH
USE tablero
GO

/****** Object:  StoredProcedure [dbo].[S_View_SatisfaccionEncuestas_Areas]    Script Date: 06/01/2011 00:41:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'[S_View_SatisfaccionEncuestas_Areas]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_SatisfaccionEncuestas_Areas]
GO
	
create PROCEDURE [dbo].[S_View_SatisfaccionEncuestas_Areas]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT [Área de Usuario] as codigo, [Área de Usuario] as area 
		FROM View_SatisfaccionEncuestas
		ORDER BY area
	SET NOCOUNT OFF
END

GO


/****** Object:  StoredProcedure [dbo].[S_View_SatisfaccionEncuestas_Grupos]    Script Date: 06/01/2011 00:41:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'[S_View_SatisfaccionEncuestas_Grupos]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_SatisfaccionEncuestas_Grupos]
GO

create PROCEDURE [dbo].[S_View_SatisfaccionEncuestas_Grupos]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT [Grupo] as codigo, [Grupo] 
		FROM View_SatisfaccionEncuestas
		ORDER BY Grupo
	SET NOCOUNT OFF
END

GO


/****** Object:  StoredProcedure [dbo].[S_View_SatisfaccionEncuestas_Tipos]    Script Date: 06/01/2011 00:42:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'[S_View_SatisfaccionEncuestas_Tipos]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_SatisfaccionEncuestas_Tipos]
GO

create PROCEDURE [dbo].[S_View_SatisfaccionEncuestas_Tipos]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT [Tipo] as codigo, [Tipo] 
		FROM View_SatisfaccionEncuestas
		ORDER BY Tipo
	SET NOCOUNT OFF
END

GO


/****** Object:  StoredProcedure [dbo].[S_View_TicketsConSLA_Areas]    Script Date: 06/01/2011 00:42:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'[S_View_TicketsConSLA_Areas]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsConSLA_Areas]
GO

create PROCEDURE [dbo].[S_View_TicketsConSLA_Areas]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT [Área de Usuario] as codigo, [Área de Usuario] as Area 
		FROM View_TicketsConSLA
		ORDER BY Area
	SET NOCOUNT OFF
END

GO


/****** Object:  StoredProcedure [dbo].[S_View_TicketsConSLA_Grupos]    Script Date: 06/01/2011 00:42:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'[S_View_TicketsConSLA_Grupos]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsConSLA_Grupos]
GO

create PROCEDURE [dbo].[S_View_TicketsConSLA_Grupos]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT [Grupo] as codigo, [Grupo] 
		FROM View_TicketsConSLA
		ORDER BY Grupo
	SET NOCOUNT OFF
END

GO


/****** Object:  StoredProcedure [dbo].[S_View_TicketsConSLA_Tipos]    Script Date: 06/01/2011 00:42:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'[S_View_TicketsConSLA_Tipos]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsConSLA_Tipos]
GO

create PROCEDURE [dbo].[S_View_TicketsConSLA_Tipos]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT [Tipo] as codigo, [Tipo] 
		FROM View_TicketsConSLA
		ORDER BY Tipo
	SET NOCOUNT OFF
END

GO


/****** Object:  StoredProcedure [dbo].[S_View_TicketsEstadosAñosMesAgrupado_Areas]    Script Date: 06/01/2011 00:42:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'[S_View_TicketsEstadosAñosMesAgrupado_Areas]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsEstadosAñosMesAgrupado_Areas]
GO

create PROCEDURE [dbo].[S_View_TicketsEstadosAñosMesAgrupado_Areas]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT [Área] as codigo, [Área] as Area 
		FROM View_TicketsEstadosAñosMesAgrupado
		ORDER BY Area
	SET NOCOUNT OFF
END

GO


/****** Object:  StoredProcedure [dbo].[S_View_TicketsEstadosAñosMesAgrupado_Tipos]    Script Date: 06/01/2011 00:43:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'[S_View_TicketsEstadosAñosMesAgrupado_Tipos]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsEstadosAñosMesAgrupado_Tipos]
GO

create PROCEDURE [dbo].[S_View_TicketsEstadosAñosMesAgrupado_Tipos]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT [Tipo] as codigo, [Tipo]  
		FROM View_TicketsEstadosAñosMesAgrupado
		ORDER BY Tipo
	SET NOCOUNT OFF
END

GO


/****** Object:  StoredProcedure [dbo].[S_View_TicketsPorEstados_Areas]    Script Date: 06/01/2011 00:43:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'[S_View_TicketsPorEstados_Areas]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsPorEstados_Areas]
GO


create PROCEDURE [dbo].[S_View_TicketsPorEstados_Areas]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT [Área de Usuario] as codigo, [Área de Usuario] as Area 
		FROM View_TicketsPorEstados
		ORDER BY Area
	SET NOCOUNT OFF
END

GO


/****** Object:  StoredProcedure [dbo].[S_View_TicketsPorEstados_Grupos]    Script Date: 06/01/2011 00:43:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'[S_View_TicketsPorEstados_Grupos]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsPorEstados_Grupos]
GO


create PROCEDURE [dbo].[S_View_TicketsPorEstados_Grupos]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT [Grupo] as codigo, [Grupo] 
		FROM View_TicketsPorEstados
		ORDER BY Grupo
	SET NOCOUNT OFF
END

GO


/****** Object:  StoredProcedure [dbo].[S_View_TicketsPorEstados_Tipos]    Script Date: 06/01/2011 00:43:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'[S_View_TicketsPorEstados_Tipos]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsPorEstados_Tipos]
GO

create PROCEDURE [dbo].[S_View_TicketsPorEstados_Tipos]
AS
BEGIN
	SET NOCOUNT ON
		SELECT DISTINCT [Tipo] as codigo, [Tipo] 
		FROM View_TicketsPorEstados
		ORDER BY Tipo
	SET NOCOUNT OFF
END

GO


USE [mdb]
GO
/****** Object:  Table [dbo].[View_TicketsPorEstados]    Script Date: 09/16/2011 13:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[View_TicketsPorEstados](
	[Ticket] [nvarchar](30) NOT NULL,
	[Tipo] [nvarchar](10) NULL,
	[Prioridad] [nvarchar](12) NULL,
	[FechaApe] [datetime] NULL,
	[FechaRes] [datetime] NULL,
	[FechaCie] [datetime] NULL,
	[Usuario] [nvarchar](201) NULL,
	[ST Usuario] [nvarchar](30) NULL,
	[Área de Usuario] [nvarchar](100) NULL,
	[SedeUsu] [nvarchar](100) NULL,
	[Analista] [nvarchar](201) NULL,
	[Reportado_Por] [nvarchar](201) NULL,
	[ContractServiceType] [nvarchar](30) NULL,
	[Categoría] [nvarchar](128) NULL,
	[DescCat] [nvarchar](500) NULL,
	[Grupo] [nvarchar](100) NULL,
	[Descripción] [ntext] NULL,
	[Resumen] [nvarchar](240) NULL,
	[Estado] [nvarchar](30) NULL,
	[Met_Reporte] [nvarchar](60) NULL,
	[description] [nvarchar](240) NULL,
	[Proveedor] [nvarchar](100) NULL,
	[¿Activo?] [int] NOT NULL,
	[OpenDate] [nvarchar](30) NULL,
	[CloseDate] [nvarchar](30) NULL,
	[GrupoReporte] [varchar](26) NOT NULL,
	[EstadoReporte] [varchar](17) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[View_TicketsEstadosAñosMesAgrupado]    Script Date: 09/16/2011 13:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[View_TicketsEstadosAñosMesAgrupado](
	[Año] [int] NULL,
	[Mes] [int] NULL,
	[Tipo] [nvarchar](10) NULL,
	[Área] [nvarchar](100) NULL,
	[GrupoReporte] [varchar](26) NOT NULL,
	[EstadoReporte] [varchar](17) NOT NULL,
	[Tickets] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[View_TicketsEstadosAñoMes]    Script Date: 09/16/2011 13:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[View_TicketsEstadosAñoMes](
	[Ticket] [nvarchar](30) NOT NULL,
	[Tipo] [nvarchar](10) NULL,
	[Prioridad] [nvarchar](12) NULL,
	[FechaApe] [datetime] NULL,
	[FechaRes] [datetime] NULL,
	[FechaCie] [datetime] NULL,
	[Usuario] [nvarchar](201) NULL,
	[ST Usuario] [nvarchar](30) NULL,
	[Área] [nvarchar](100) NULL,
	[SedeUsu] [nvarchar](100) NULL,
	[Analista] [nvarchar](201) NULL,
	[Reportado_Por] [nvarchar](201) NULL,
	[ContractServiceType] [nvarchar](30) NULL,
	[Categoría] [nvarchar](128) NULL,
	[DescCat] [nvarchar](500) NULL,
	[Grupo] [nvarchar](100) NULL,
	[Descripción] [ntext] NULL,
	[Resumen] [nvarchar](240) NULL,
	[Estado] [nvarchar](30) NULL,
	[Met_Reporte] [nvarchar](60) NULL,
	[description] [nvarchar](240) NULL,
	[Proveedor] [nvarchar](100) NULL,
	[¿Activo?] [int] NOT NULL,
	[OpenDate] [nvarchar](30) NULL,
	[CloseDate] [nvarchar](30) NULL,
	[GrupoReporte] [varchar](26) NOT NULL,
	[EstadoReporte] [varchar](17) NOT NULL,
	[Año] [int] NULL,
	[Mes] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[View_TicketsConSLA]    Script Date: 09/16/2011 13:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[View_TicketsConSLA](
	[Ticket] [nvarchar](30) NOT NULL,
	[Tipo] [nvarchar](10) NULL,
	[Prioridad] [nvarchar](12) NULL,
	[FechaApe] [datetime] NULL,
	[FechaRes] [datetime] NULL,
	[FechaCie] [datetime] NULL,
	[Usuario] [nvarchar](201) NULL,
	[ST Usuario] [nvarchar](30) NULL,
	[Área de Usuario] [nvarchar](100) NULL,
	[SedeUsu] [nvarchar](100) NULL,
	[Analista] [nvarchar](201) NULL,
	[Grupo] [nvarchar](100) NULL,
	[Reportado_Por] [nvarchar](201) NULL,
	[ContractServiceType] [nvarchar](30) NULL,
	[SLATResolución] [int] NULL,
	[Categoría] [nvarchar](128) NULL,
	[DescCat] [nvarchar](500) NULL,
	[GrupoCat] [nvarchar](100) NULL,
	[Descripción] [ntext] NULL,
	[Resumen] [nvarchar](240) NULL,
	[Estado] [nvarchar](30) NULL,
	[Met_Reporte] [nvarchar](60) NULL,
	[RootCause] [nvarchar](240) NULL,
	[Acción a Seguir] [nvarchar](40) NULL,
	[Proveedor] [nvarchar](100) NULL,
	[¿Activo?] [int] NOT NULL,
	[Nivel de Servicio] [varchar](14) NOT NULL,
	[OpenDate] [nvarchar](30) NULL,
	[CloseDate] [nvarchar](30) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[View_SatisfaccionEncuestas]    Script Date: 09/16/2011 13:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[View_SatisfaccionEncuestas](
	[Ticket] [nvarchar](30) NOT NULL,
	[Tipo] [nvarchar](10) NULL,
	[Prioridad] [nvarchar](12) NULL,
	[FechaApe] [datetime] NULL,
	[FechaRes] [datetime] NULL,
	[FechaCie] [datetime] NULL,
	[Usuario] [nvarchar](201) NULL,
	[ST Usuario] [nvarchar](30) NULL,
	[Área de Usuario] [nvarchar](100) NULL,
	[SedeUsu] [nvarchar](100) NULL,
	[Analista] [nvarchar](201) NULL,
	[Reportado_Por] [nvarchar](201) NULL,
	[Categoría] [nvarchar](128) NULL,
	[DescCat] [nvarchar](500) NULL,
	[Grupo] [nvarchar](100) NULL,
	[Descripción] [ntext] NULL,
	[Resumen] [nvarchar](240) NULL,
	[Estado] [nvarchar](30) NULL,
	[Met_Reporte] [nvarchar](60) NULL,
	[description] [nvarchar](240) NULL,
	[Proveedor] [nvarchar](100) NULL,
	[¿Activo?] [int] NOT NULL,
	[OpenDate] [nvarchar](30) NULL,
	[CloseDate] [nvarchar](30) NULL,
	[FechaRespuesta] [datetime] NULL,
	[nx_comment] [nvarchar](200) NULL,
	[SurveyAnswerSequence] [int] NULL,
	[RespuestaReporte] [varchar](16) NULL,
	[EncuestaContestada] [varchar](13) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo]    Script Date: 09/16/2011 13:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo](
	[codigo] [varchar](10) NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[View_TicketsPorEstados]    Script Date: 09/16/2011 13:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'View_TicketsPorEstados', N'U') IS NOT NULL
	DROP TABLE View_TicketsPorEstados
GO
CREATE TABLE [dbo].[View_TicketsPorEstados](
	[Ticket] [nvarchar](30) NOT NULL,
	[Tipo] [nvarchar](10) NULL,
	[Prioridad] [nvarchar](60) NULL,
	[FechaApe] [datetime] NULL,
	[FechaRes] [datetime] NULL,
	[FechaCie] [datetime] NULL,
	[Usuario] [nvarchar](201) NULL,
	[ST Usuario] [nvarchar](60) NULL,
	[Área de Usuario] [nvarchar](100) NULL,
	[SedeUsu] [nvarchar](100) NULL,
	[Analista] [nvarchar](201) NULL,
	[Reportado_Por] [nvarchar](201) NULL,
	[ContractServiceType] [nvarchar](30) NULL,
	[Categoría] [nvarchar](1000) NULL,
	[DescCat] [nvarchar](500) NULL,
	[Grupo] [nvarchar](100) NULL,
	[Descripción] [ntext] NULL,
	[Resumen] [nvarchar](240) NULL,
	[Estado] [nvarchar](60) NULL,
	[Met_Reporte] [nvarchar](60) NULL,
	[description] [nvarchar](240) NULL,
	[Proveedor] [nvarchar](100) NULL,
	[¿Activo?] [int] NOT NULL,
	[OpenDate] [nvarchar](30) NULL,
	[CloseDate] [nvarchar](30) NULL,
	[GrupoReporte] [nvarchar](100) NULL,
	[EstadoReporte] [varchar](17) NULL
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
IF OBJECT_ID (N'View_TicketsEstadosAñosMesAgrupado', N'U') IS NOT NULL
	DROP TABLE View_TicketsEstadosAñosMesAgrupado
GO
CREATE TABLE [dbo].[View_TicketsEstadosAñosMesAgrupado](
	[Año] [int] NULL,
	[Mes] [int] NULL,
	[Tipo] [nvarchar](10) NULL,
	[Área] [nvarchar](100) NULL,
	[GrupoReporte] [nvarchar](100)  NULL,
	[EstadoReporte] [varchar](17)  NULL,
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
IF OBJECT_ID (N'View_TicketsEstadosAñoMes', N'U') IS NOT NULL
	DROP TABLE View_TicketsEstadosAñoMes
GO
CREATE TABLE [dbo].[View_TicketsEstadosAñoMes](
	[Ticket] [nvarchar](30) NOT NULL,
	[Tipo] [nvarchar](10) NULL,
	[Prioridad] [nvarchar](60) NULL,
	[FechaApe] [datetime] NULL,
	[FechaRes] [datetime] NULL,
	[FechaCie] [datetime] NULL,
	[Usuario] [nvarchar](201) NULL,
	[ST Usuario] [nvarchar](60) NULL,
	[Área] [nvarchar](100) NULL,
	[SedeUsu] [nvarchar](100) NULL,
	[Analista] [nvarchar](201) NULL,
	[Reportado_Por] [nvarchar](201) NULL,
	[ContractServiceType] [nvarchar](30) NULL,
	[Categoría] [nvarchar](1000) NULL,
	[DescCat] [nvarchar](500) NULL,
	[Grupo] [nvarchar](100) NULL,
	[Descripción] [ntext] NULL,
	[Resumen] [nvarchar](240) NULL,
	[Estado] [nvarchar](60) NULL,
	[Met_Reporte] [nvarchar](60) NULL,
	[description] [nvarchar](240) NULL,
	[Proveedor] [nvarchar](100) NULL,
	[¿Activo?] [int] NOT NULL,
	[OpenDate] [nvarchar](30) NULL,
	[CloseDate] [nvarchar](30) NULL,
	[GrupoReporte] [varchar](26)  NULL,
	[EstadoReporte] [varchar](17)  NULL,
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
IF OBJECT_ID (N'View_TicketsConSLA', N'U') IS NOT NULL
	DROP TABLE View_TicketsConSLA
GO
CREATE TABLE [dbo].[View_TicketsConSLA](
	[Ticket] [nvarchar](30) NOT NULL,
	[Tipo] [nvarchar](10) NULL,
	[Prioridad] [nvarchar](60) NULL,
	[FechaApe] [datetime] NULL,
	[FechaRes] [datetime] NULL,
	[FechaCie] [datetime] NULL,
	[Usuario] [nvarchar](201) NULL,
	[ST Usuario] [nvarchar](60) NULL,
	[Área de Usuario] [nvarchar](100) NULL,
	[SedeUsu] [nvarchar](100) NULL,
	[Analista] [nvarchar](201) NULL,
	[Grupo] [nvarchar](100) NULL,
	[Reportado_Por] [nvarchar](201) NULL,
	[ContractServiceType] [nvarchar](30) NULL,
	[SLATResolución] [int] NULL,
	[Categoría] [nvarchar](1000) NULL,
	[DescCat] [nvarchar](500) NULL,
	[GrupoCat] [nvarchar](100) NULL,
	[Descripción] [ntext] NULL,
	[Resumen] [nvarchar](240) NULL,
	[Estado] [nvarchar](60) NULL,
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
/****** Object:  Table [dbo].[tipo]    Script Date: 09/16/2011 13:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'tipo', N'U') IS NOT NULL
	DROP TABLE tipo
GO
CREATE TABLE [dbo].[tipo](
	[codigo] [varchar](10) NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

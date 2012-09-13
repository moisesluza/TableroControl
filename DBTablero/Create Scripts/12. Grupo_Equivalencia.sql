if exists(select * from sys.objects where type_desc='USER_TABLE' and name='Grupo_Equilavencia')
	drop table Categoria_Equilavencia
GO

CREATE TABLE dbo.Grupo_Equilavencia
(
	Grupo varchar(128) NOT NULL,
	GrupoReporte varchar(128) NULL
)  ON [PRIMARY]
GO


CREATE UNIQUE CLUSTERED INDEX [IX_Grupo_Equivalencai] ON [dbo].[Grupo_Equilavencia] 
(	[Grupo] ASC) WITH (STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]

GO
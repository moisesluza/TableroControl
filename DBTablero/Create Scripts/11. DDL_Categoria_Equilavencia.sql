
if exists(select * from sys.objects where type_desc='USER_TABLE' and name='Categoria_Equilavencia')
	drop table Categoria_Equilavencia

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Categoria_Equilavencia
	(
		Categoria varchar(128) NOT NULL,
		CategoriaReporte varchar(128) NULL
	)  ON [PRIMARY]
GO
COMMIT
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Categoria_Equivalencai] ON [dbo].[Categoria_Equilavencia] 
(	[Categoria] ASC) WITH (STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]

GO
/*
insert into Categoria_Equilavencia 
select distinct categoría, desccat from view_ticketsporestados where charindex('.',categoría)=0

INSERT INTO Categoria_Equilavencia VALUES ('A/X Financiero','A/X Financiero')
INSERT INTO Categoria_Equilavencia VALUES ('A/X Tecnico','A/X Tecnico')
INSERT INTO Categoria_Equilavencia VALUES ('ACLXA','A/X Financiero')
INSERT INTO Categoria_Equilavencia VALUES ('ACLXT','A/X Tecnico')
INSERT INTO Categoria_Equilavencia VALUES ('ASLX','A/X Financiero')
INSERT INTO Categoria_Equilavencia VALUES ('AST','REQ')
INSERT INTO Categoria_Equilavencia VALUES ('BCK','BCK')
INSERT INTO Categoria_Equilavencia VALUES ('Desarrollo','Desarrollo')
INSERT INTO Categoria_Equilavencia VALUES ('Google','Google')
INSERT INTO Categoria_Equilavencia VALUES ('INC','INC')
INSERT INTO Categoria_Equilavencia VALUES ('LNTS','Lotus')
INSERT INTO Categoria_Equilavencia VALUES ('Lotus','Lotus')
INSERT INTO Categoria_Equilavencia VALUES ('Novasys','Novasys')
INSERT INTO Categoria_Equilavencia VALUES ('NSY','Novasys')
INSERT INTO Categoria_Equilavencia VALUES ('REQ','REQ')
INSERT INTO Categoria_Equilavencia VALUES ('SCTR','SCTR')
INSERT INTO Categoria_Equilavencia VALUES ('WEB','WEB')
INSERT INTO Categoria_Equilavencia VALUES ('XX','Sin categoria')
*/
SELECT * FROM Categoria_Equilavencia


--DROP TABLE Categoria_Equilavencia


IF OBJECT_ID (N'[S_View_TicketsPorEstados_Eficacia]', N'P') IS NOT NULL
	DROP PROCEDURE [S_View_TicketsPorEstados_Eficacia]

GO
CREATE PROCEDURE [S_View_TicketsPorEstados_Eficacia]
	@TIPO NVARCHAR(510),
	@GRUPO NVARCHAR(510),
	@AREA NVARCHAR(510),
	@ANIO INT,
	@MES INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT	ISNULL(GRUPO,'SIN GRUPO') AS GRUPO, 
			ESTADOREPORTE,
			COUNT(TICKET) AS CANTIDAD
	FROM VIEW_TICKETSPORESTADOS WITH(NOLOCK)
	WHERE
		[TIPO] = CASE WHEN LEN(LTRIM(RTRIM(@TIPO)))=0 THEN [TIPO] ELSE @TIPO END AND
		[GRUPO] = CASE WHEN LEN(LTRIM(RTRIM(@GRUPO)))=0 THEN [GRUPO] ELSE @GRUPO END AND
		ISNULL([ÁREA DE USUARIO],'') = CASE WHEN LEN(LTRIM(RTRIM(@AREA)))=0 THEN ISNULL([ÁREA DE USUARIO],'') ELSE @AREA END AND
		(MONTH(FECHARES) = @MES OR @MES is null) AND
		YEAR(FechaRes)=@ANIO 
	GROUP BY GRUPO, ESTADOREPORTE
	ORDER BY 1,3

	SET NOCOUNT OFF
END
GO
--[S_View_TicketsPorEstados_Eficacia] '','','',2011,null

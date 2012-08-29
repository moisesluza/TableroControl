IF OBJECT_ID (N'View_SatisfaccionEncuestas', N'V') IS NOT NULL
	DROP VIEW View_SatisfaccionEncuestas 
GO 

create view View_SatisfaccionEncuestas as 
SELECT a.*, b.FechaRespuesta, b.nx_comment, b.SurveyAnswerSequence, 
	CASE b.SurveyAnswerSequence 
		WHEN '10' THEN 'Muy Satisfecho' 
		WHEN '20' THEN 'Satisfecho' 
		WHEN '30' THEN 'Insatisfecho' 
		WHEN '40' THEN 'Muy Insatisfecho'
	END AS RespuestaReporte, 
	CASE b.SurveyAnswerSequence 
		WHEN '10' THEN 'Contestada' 
		WHEN '20' THEN 'Contestada' 
		WHEN '30' THEN 'Contestada' 
		WHEN '40' THEN 'Contestada'
		ELSE 'No Contestada' 
	END AS EncuestaContestada
FROM View_EncuestasEnviadas_BBVA a LEFT OUTER JOIN View_Encuestas_BBVA_V2 b ON a.Ticket = b.Ticket
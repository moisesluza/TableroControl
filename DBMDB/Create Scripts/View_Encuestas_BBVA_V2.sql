IF OBJECT_ID (N'View_Encuestas_BBVA_V2', N'V') IS NOT NULL
	DROP VIEW View_Encuestas_BBVA_V2 
GO 

CREATE VIEW View_Encuestas_BBVA_V2 as
SELECT TOP 100 PERCENT 
	a.id, DATEADD(ss, a.last_mod_dt - 18000, '19700101') AS FechaRespuesta, g.ref_num AS Ticket, g.type AS Tipo, 
	g.description AS Descripción, f.org_name AS Organización, e.location_name AS Sede, j.sym AS Categoría, d.first_name + ' ' + d.last_name AS Usuario, 
	h.first_name + ' ' + h.last_name AS Analista, i.last_name AS Grupo, a.sym AS SurveyName, a.comment_label, a.nx_comment, 
	a.object_type + ':' + STR(a.object_id) AS ObjectRef, a.object_type, b.sequence AS SurveyQuestionSequence, b.id AS SurveyQuestionId, 
	b.txt AS SurveyQuestionTxt, b.qcomment_label AS SurveyQuestionQcommentLabel, b.qcomment AS SurveyQuestionQcomment, 
	c.selected AS SurveyAnswerSelect, c.sequence AS SurveyAnswerSequence, c.id AS SurveyAnswerId, c.txt AS SurveyAnswerTxt
FROM dbo.survey a LEFT OUTER JOIN
	dbo.survey_question b ON a.id = b.owning_survey LEFT OUTER JOIN
	dbo.survey_answer c ON b.id = c.own_srvy_question LEFT OUTER JOIN
	dbo.ca_contact d ON a.last_mod_by = d.contact_uuid LEFT OUTER JOIN
	dbo.ca_location e ON d.location_uuid = e.location_uuid LEFT OUTER JOIN
	dbo.ca_organization f ON d.organization_uuid = f.organization_uuid LEFT OUTER JOIN
	dbo.call_req g ON a.object_id = g.id LEFT OUTER JOIN
	dbo.ca_contact h ON g.assignee = h.contact_uuid LEFT OUTER JOIN
	dbo.ca_contact i ON g.group_id = i.contact_uuid LEFT OUTER JOIN
	dbo.prob_ctg j ON g.category = j.persid
WHERE  (c.selected = 1) 
ORDER BY FechaRespuesta, a.id 
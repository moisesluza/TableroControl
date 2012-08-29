--View_TicketsConSLA
create view View_TicketsConSLA as
SELECT     TOP 100 PERCENT a.ref_num AS Ticket, a.type AS Tipo, g.sym AS Prioridad, DATEADD(ss, a.open_date - 18000, '19700101') AS FechaApe, 
                      DATEADD(ss, a.resolve_date - 18000, '19700101') AS FechaRes, DATEADD(ss, a.close_date - 18000, '19700101') AS FechaCie, 
                      c.first_name + ' ' + c.last_name AS Usuario, t .sym AS [ST Usuario], u.name AS [Área de Usuario], n.location_name AS SedeUsu, 
                      h.first_name + ' ' + h.last_name AS Analista, b.last_name AS Grupo, m.first_name + ' ' + m.last_name AS Reportado_Por, 
                      q.sym AS ContractServiceType, a.sla_violation AS SLATResolución, j.sym AS Categoría, j.description AS DescCat, r.last_name AS GrupoCat, 
                      a.description AS Descripción, a.summary AS Resumen, d .sym AS Estado, k.sym AS Met_Reporte, l.description AS RootCause, 
                      a.string2 AS [Acción a Seguir], e.company_name AS Proveedor, a.active_flag AS [¿Activo?], 
                      CASE a.sla_violation WHEN 0 THEN 'SLA CUMPLIDO' ELSE 'SLA INCUMPLIDO' END AS [Nivel de Servicio], CONVERT(nvarchar(30), DATEADD(ss, 
                      a.open_date - 18000, '19700101'), 103) AS OpenDate, CONVERT(nvarchar(30), DATEADD(ss, a.close_date - 18000, '19700101'), 103) 
                      AS CloseDate
FROM         dbo.call_req a LEFT OUTER JOIN
                      dbo.ca_contact b ON a.group_id = b.contact_uuid LEFT OUTER JOIN
                      dbo.ca_contact c ON a.customer = c.contact_uuid LEFT OUTER JOIN
                      dbo.cr_stat d ON a.status = d .code LEFT OUTER JOIN
                      dbo.ca_company e ON a.zprovider = e.company_uuid LEFT OUTER JOIN
                      dbo.ca_organization f ON c.organization_uuid = f.organization_uuid LEFT OUTER JOIN
                      dbo.pri g ON a.priority = g.enum LEFT OUTER JOIN
                      dbo.ca_contact h ON a.assignee = h.contact_uuid LEFT OUTER JOIN
                      dbo.prob_ctg j ON a.category = j.persid LEFT OUTER JOIN
                      dbo.repmeth k ON a.cr_zrepme = k.id LEFT OUTER JOIN
                      dbo.rootcause l ON a.rootcause = l.id LEFT OUTER JOIN
                      dbo.ca_contact m ON a.log_agent = m.contact_uuid LEFT OUTER JOIN
                      dbo.ca_location n ON c.location_uuid = n.location_uuid LEFT OUTER JOIN
                      dbo.attached_sla p ON a.persid = p.mapped_cr LEFT OUTER JOIN
                      dbo.srv_desc q ON p.map_sdsc = q.code LEFT OUTER JOIN
                      dbo.ca_contact r ON j.group_id = r.contact_uuid LEFT OUTER JOIN
                      dbo.usp_contact s ON c.contact_uuid = s.contact_uuid LEFT OUTER JOIN
                      dbo.srv_desc t ON s.c_service_type = t .code LEFT OUTER JOIN
                      dbo.ca_resource_department u ON c.department = u.id
WHERE     (a.resolve_date IS NOT NULL) AND (a.status <> 'CANCEL') AND (a.status <> 'CLREQ') 
                      AND (a.status <> 'CLUNRSLV') AND q.sym IS NOT NULL AND q.sym <> 'Sin SLA' AND ((j.service_type IS NOT NULL AND 
                      (q.sym NOT LIKE '%LIM01%' AND q.sym NOT LIKE '%PRV01%')) OR
                      (j.service_type IS NULL AND (q.sym LIKE '%LIM01%' OR
                      q.sym LIKE '%PRV01%')))
UNION ALL
SELECT     TOP 100 PERCENT a.ref_num AS Ticket, a.type AS Tipo, g.sym AS Prioridad, DATEADD(ss, a.open_date - 18000, '19700101') AS FechaApe, 
                      DATEADD(ss, a.resolve_date - 18000, '19700101') AS FechaRes, DATEADD(ss, a.close_date - 18000, '19700101') AS FechaCie, 
                      c.first_name + ' ' + c.last_name AS Usuario, t .sym AS [ST Usuario], u.name AS [Área de Usuario], n.location_name AS SedeUsu, 
                      h.first_name + ' ' + h.last_name AS Analista, b.last_name AS Grupo, m.first_name + ' ' + m.last_name AS Reportado_Por, 
                      q.sym AS ContractServiceType, a.sla_violation AS SLATResolución, j.sym AS Categoría, j.description AS DescCat, r.last_name AS GrupoCat, 
                      a.description AS Descripción, a.summary AS Resumen, d .sym AS Estado, k.sym AS Met_Reporte, l.description AS RootCause, 
                      a.string2 AS [Acción a Seguir], e.company_name AS Proveedor, a.active_flag AS [¿Activo?], 'SIN SLA' AS [Nivel de Servicio2], CONVERT(nvarchar(30), 
                      DATEADD(ss, a.open_date - 18000, '19700101'), 103) AS OpenDate, CONVERT(nvarchar(30), DATEADD(ss, a.close_date - 18000, '19700101'), 103) 
                      AS CloseDate
FROM         dbo.call_req a LEFT OUTER JOIN
                      dbo.ca_contact b ON a.group_id = b.contact_uuid LEFT OUTER JOIN
                      dbo.ca_contact c ON a.customer = c.contact_uuid LEFT OUTER JOIN
                      dbo.cr_stat d ON a.status = d .code LEFT OUTER JOIN
                      dbo.ca_company e ON a.zprovider = e.company_uuid LEFT OUTER JOIN
                      dbo.ca_organization f ON c.organization_uuid = f.organization_uuid LEFT OUTER JOIN
                      dbo.pri g ON a.priority = g.enum LEFT OUTER JOIN
                      dbo.ca_contact h ON a.assignee = h.contact_uuid LEFT OUTER JOIN
                      dbo.prob_ctg j ON a.category = j.persid LEFT OUTER JOIN
                      dbo.repmeth k ON a.cr_zrepme = k.id LEFT OUTER JOIN
                      dbo.rootcause l ON a.rootcause = l.id LEFT OUTER JOIN
                      dbo.ca_contact m ON a.log_agent = m.contact_uuid LEFT OUTER JOIN
                      dbo.ca_location n ON c.location_uuid = n.location_uuid LEFT OUTER JOIN
                      dbo.attached_sla p ON a.persid = p.mapped_cr LEFT OUTER JOIN
                      dbo.srv_desc q ON p.map_sdsc = q.code LEFT OUTER JOIN
                      dbo.ca_contact r ON j.group_id = r.contact_uuid LEFT OUTER JOIN
                      dbo.usp_contact s ON c.contact_uuid = s.contact_uuid LEFT OUTER JOIN
                      dbo.srv_desc t ON s.c_service_type = t .code LEFT OUTER JOIN
                      dbo.ca_resource_department u ON c.department = u.id
WHERE     (a.resolve_date IS NOT NULL) AND (a.status <> 'CANCEL') AND (a.status <> 'CLREQ') AND (a.status <> 'CLUNRSLV') AND q.sym IS NULL
ORDER BY a.ref_num;

go

--View_TicketsEstadosAñoMes
create view View_TicketsEstadosAñoMes as 
SELECT     TOP 100 PERCENT a.ref_num AS Ticket, a.type AS Tipo, g.sym AS Prioridad, DATEADD(ss, a.open_date - 18000, '19700101') AS FechaApe, 
                      DATEADD(ss, a.resolve_date - 18000, '19700101') AS FechaRes, DATEADD(ss, a.close_date - 18000, '19700101') AS FechaCie, 
                      c.first_name + ' ' + c.last_name AS Usuario, t.sym AS [ST Usuario], u.name AS Área, n.location_name AS SedeUsu, 
                      h.first_name + ' ' + h.last_name AS Analista, m.first_name + ' ' + m.last_name AS Reportado_Por, q.sym AS ContractServiceType, j.sym AS Categoría, 
                      j.description AS DescCat, b.last_name AS Grupo, a.description AS Descripción, a.summary AS Resumen, d.sym AS Estado, k.sym AS Met_Reporte, 
                      l.description, e.company_name AS Proveedor, a.active_flag AS [¿Activo?], CONVERT(nvarchar(30), DATEADD(ss, a.open_date - 18000, '19700101'), 
                      103) AS OpenDate, CONVERT(nvarchar(30), DATEADD(ss, a.close_date - 18000, '19700101'), 103) AS CloseDate, 
                      b.last_name AS GrupoReporte, 
                      CASE a.status WHEN 'CL' THEN 'Cerrado' WHEN 'RE' THEN 'Cerrado' WHEN 'CLEXP' THEN 'Cerrado' WHEN 'CLATM' THEN 'Cerrado' WHEN 'CANCEL' THEN
                       'Cancelado/Anulado' WHEN 'CLREQ' THEN 'Cancelado/Anulado' WHEN 'CLUNRSLV' THEN 'Cancelado/Anulado' ELSE 'Pendiente' END AS EstadoReporte,
                       YEAR(DATEADD(ss, a.open_date - 18000, '19700101')) AS Año, MONTH(DATEADD(ss, a.open_date - 18000, '19700101')) AS Mes
FROM         dbo.call_req a LEFT OUTER JOIN
                      dbo.ca_contact b ON a.group_id = b.contact_uuid LEFT OUTER JOIN
                      dbo.ca_contact c ON a.customer = c.contact_uuid LEFT OUTER JOIN
                      dbo.cr_stat d ON a.status = d.code LEFT OUTER JOIN
                      dbo.ca_company e ON a.zprovider = e.company_uuid LEFT OUTER JOIN
                      dbo.ca_organization f ON c.organization_uuid = f.organization_uuid LEFT OUTER JOIN
                      dbo.pri g ON a.priority = g.enum LEFT OUTER JOIN
                      dbo.ca_contact h ON a.assignee = h.contact_uuid LEFT OUTER JOIN
                      dbo.prob_ctg j ON a.category = j.persid LEFT OUTER JOIN
                      dbo.repmeth k ON a.cr_zrepme = k.id LEFT OUTER JOIN
                      dbo.rootcause l ON a.rootcause = l.id LEFT OUTER JOIN
                      dbo.ca_contact m ON a.log_agent = m.contact_uuid LEFT OUTER JOIN
                      dbo.ca_location n ON c.location_uuid = n.location_uuid LEFT OUTER JOIN
                      dbo.attached_sla p ON a.persid = p.mapped_cr LEFT OUTER JOIN
                      dbo.srv_desc q ON p.map_sdsc = q.code LEFT OUTER JOIN
                      dbo.ca_contact r ON j.group_id = r.contact_uuid LEFT OUTER JOIN
                      dbo.usp_contact s ON c.contact_uuid = s.contact_uuid LEFT OUTER JOIN
                      dbo.srv_desc t ON s.c_service_type = t.code LEFT OUTER JOIN
                      dbo.ca_resource_department u ON c.department = u.id
ORDER BY a.ref_num

go

--View_TicketsEstadosAñosMesAgrupado
create view  View_TicketsEstadosAñosMesAgrupado as
SELECT     Año, Mes, Tipo, Área, GrupoReporte, EstadoReporte, COUNT(*) AS Tickets
FROM         dbo.View_TicketsEstadosAñoMes
GROUP BY Año, Mes, Tipo, Área, GrupoReporte, EstadoReporte

go

--View_TicketsPorEstado
create view  View_TicketsPorEstado as 
SELECT     TOP 100 PERCENT a.ref_num AS Ticket, a.type AS Tipo, g.sym AS Prioridad, DATEADD(ss, a.open_date - 18000, '19700101') AS FechaApe, 
                      DATEADD(ss, a.resolve_date - 18000, '19700101') AS FechaRes, DATEADD(ss, a.close_date - 18000, '19700101') AS FechaCie, 
                      c.first_name + ' ' + c.last_name AS Usuario, t.sym AS [ST Usuario], u.name AS [Área de Usuario], n.location_name AS SedeUsu, 
                      h.first_name + ' ' + h.last_name AS Analista, m.first_name + ' ' + m.last_name AS Reportado_Por, q.sym AS ContractServiceType, j.sym AS Categoría, 
                      j.description AS DescCat, b.last_name AS Grupo, a.description AS Descripción, a.summary AS Resumen, d.sym AS Estado, k.sym AS Met_Reporte, 
                      l.description, e.company_name AS Proveedor, a.active_flag AS [¿Activo?], CONVERT(nvarchar(30), DATEADD(ss, a.open_date - 18000, '19700101'), 
                      103) AS OpenDate, CONVERT(nvarchar(30), DATEADD(ss, a.close_date - 18000, '19700101'), 103) AS CloseDate, 
                       b.last_name AS GrupoReporte, 
                      CASE a.status WHEN 'CL' THEN 'Cerrado' WHEN 'RE' THEN 'Cerrado' WHEN 'CLEXP' THEN 'Cerrado' WHEN 'CANCEL' THEN 'Cancelado/Anulado' WHEN
                       'CLREQ' THEN 'Cancelado/Anulado' WHEN 'CLUNRSLV' THEN 'Cancelado/Anulado' ELSE 'Pendiente' END AS EstadoReporte
FROM         dbo.call_req a LEFT OUTER JOIN
                      dbo.ca_contact b ON a.group_id = b.contact_uuid LEFT OUTER JOIN
                      dbo.ca_contact c ON a.customer = c.contact_uuid LEFT OUTER JOIN
                      dbo.cr_stat d ON a.status = d.code LEFT OUTER JOIN
                      dbo.ca_company e ON a.zprovider = e.company_uuid LEFT OUTER JOIN
                      dbo.ca_organization f ON c.organization_uuid = f.organization_uuid LEFT OUTER JOIN
                      dbo.pri g ON a.priority = g.enum LEFT OUTER JOIN
                      dbo.ca_contact h ON a.assignee = h.contact_uuid LEFT OUTER JOIN
                      dbo.prob_ctg j ON a.category = j.persid LEFT OUTER JOIN
                      dbo.repmeth k ON a.cr_zrepme = k.id LEFT OUTER JOIN
                      dbo.rootcause l ON a.rootcause = l.id LEFT OUTER JOIN
                      dbo.ca_contact m ON a.log_agent = m.contact_uuid LEFT OUTER JOIN
                      dbo.ca_location n ON c.location_uuid = n.location_uuid LEFT OUTER JOIN
                      dbo.attached_sla p ON a.persid = p.mapped_cr LEFT OUTER JOIN
                      dbo.srv_desc q ON p.map_sdsc = q.code LEFT OUTER JOIN
                      dbo.ca_contact r ON j.group_id = r.contact_uuid LEFT OUTER JOIN
                      dbo.usp_contact s ON c.contact_uuid = s.contact_uuid LEFT OUTER JOIN
                      dbo.srv_desc t ON s.c_service_type = t.code LEFT OUTER JOIN
                      dbo.ca_resource_department u ON c.department = u.id
ORDER BY a.ref_num

go

create view View_EncuestasEnviadasPPS as
SELECT     TOP 100 PERCENT a.ref_num AS Ticket, a.type AS Tipo, g.sym AS Prioridad, DATEADD(ss, a.open_date - 18000, '19700101') AS FechaApe, 
                      DATEADD(ss, a.resolve_date - 18000, '19700101') AS FechaRes, DATEADD(ss, a.close_date - 18000, '19700101') AS FechaCie, 
                      c.first_name + ' ' + c.last_name AS Usuario, t.sym AS [ST Usuario], u.name AS [Área de Usuario], n.location_name AS SedeUsu, 
                      h.first_name + ' ' + h.last_name AS Analista, m.first_name + ' ' + m.last_name AS Reportado_Por, j.sym AS Categoría, j.description AS DescCat, 
                      b.last_name AS Grupo, a.description AS Descripción, a.summary AS Resumen, d.sym AS Estado, k.sym AS Met_Reporte, l.description, 
                      e.company_name AS Proveedor, a.active_flag AS [¿Activo?], CONVERT(nvarchar(30), DATEADD(ss, a.open_date - 18000, '19700101'), 103) 
                      AS OpenDate, CONVERT(nvarchar(30), DATEADD(ss, a.close_date - 18000, '19700101'), 103) AS CloseDate
FROM         dbo.call_req a LEFT OUTER JOIN
                      dbo.ca_contact b ON a.group_id = b.contact_uuid LEFT OUTER JOIN
                      dbo.ca_contact c ON a.customer = c.contact_uuid LEFT OUTER JOIN
                      dbo.cr_stat d ON a.status = d.code LEFT OUTER JOIN
                      dbo.ca_company e ON a.zprovider = e.company_uuid LEFT OUTER JOIN
                      dbo.ca_organization f ON c.organization_uuid = f.organization_uuid LEFT OUTER JOIN
                      dbo.pri g ON a.priority = g.enum LEFT OUTER JOIN
                      dbo.ca_contact h ON a.assignee = h.contact_uuid LEFT OUTER JOIN
                      dbo.prob_ctg j ON a.category = j.persid LEFT OUTER JOIN
                      dbo.repmeth k ON a.cr_zrepme = k.id LEFT OUTER JOIN
                      dbo.rootcause l ON a.rootcause = l.id LEFT OUTER JOIN
                      dbo.ca_contact m ON a.log_agent = m.contact_uuid LEFT OUTER JOIN
                      dbo.ca_location n ON c.location_uuid = n.location_uuid LEFT OUTER JOIN
                      dbo.ca_contact r ON j.group_id = r.contact_uuid LEFT OUTER JOIN
                      dbo.usp_contact s ON c.contact_uuid = s.contact_uuid LEFT OUTER JOIN
                      dbo.srv_desc t ON s.c_service_type = t.code LEFT OUTER JOIN
                      dbo.ca_resource_department u ON c.department = u.id
WHERE      (a.status = 'CL')
ORDER BY a.ref_num

go

create view View_EncuestasPPS_V2 as
SELECT     TOP 100 PERCENT a.id, DATEADD(ss, a.last_mod_dt - 18000, '19700101') AS FechaRespuesta, g.ref_num AS Ticket, g.type AS Tipo, 
                      g.description AS Descripción, f.org_name AS Organización, e.location_name AS Sede, j.sym AS Categoría, d.first_name + ' ' + d.last_name AS Usuario, 
                      h.first_name + ' ' + h.last_name AS Analista, i.last_name AS Grupo, a.sym AS SurveyName, a.comment_label, a.nx_comment, 
                      a.object_type + ':' + STR(a.object_id) AS ObjectRef, a.object_type, b.sequence AS SurveyQuestionSequence, b.id AS SurveyQuestionId, 
                      b.txt AS SurveyQuestionTxt, b.qcomment_label AS SurveyQuestionQcommentLabel, b.qcomment AS SurveyQuestionQcomment, 
                      c.selected AS SurveyAnswerSelect, c.sequence AS SurveyAnswerSequence, c.id AS SurveyAnswerId, c.txt AS SurveyAnswerTxt
FROM         dbo.survey a LEFT OUTER JOIN
                      dbo.survey_question b ON a.id = b.owning_survey LEFT OUTER JOIN
                      dbo.survey_answer c ON b.id = c.own_srvy_question LEFT OUTER JOIN
                      dbo.ca_contact d ON a.last_mod_by = d.contact_uuid LEFT OUTER JOIN
                      dbo.ca_location e ON d.location_uuid = e.location_uuid LEFT OUTER JOIN
                      dbo.ca_organization f ON d.organization_uuid = f.organization_uuid LEFT OUTER JOIN
                      dbo.call_req g ON a.object_id = g.id LEFT OUTER JOIN
                      dbo.ca_contact h ON g.assignee = h.contact_uuid LEFT OUTER JOIN
                      dbo.ca_contact i ON g.group_id = i.contact_uuid LEFT OUTER JOIN
                      dbo.prob_ctg j ON g.category = j.persid
WHERE     (c.selected = 1) 
ORDER BY FechaRespuesta, a.id

go 

create view View_SatisfaccionEncuestas as 
SELECT     a.*, b.FechaRespuesta, b.nx_comment, b.SurveyAnswerSequence, 
                      CASE b.SurveyAnswerSequence WHEN '10' THEN 'Muy Satisfecho' WHEN '20' THEN 'Satisfecho' WHEN '30' THEN 'Insatisfecho' WHEN '40' THEN 'Muy Insatisfecho'
                       END AS RespuestaReporte, 
                      CASE b.SurveyAnswerSequence WHEN '10' THEN 'Contestada' WHEN '20' THEN 'Contestada' WHEN '30' THEN 'Contestada' WHEN '40' THEN 'Contestada'
                       ELSE 'No Contestada' END AS EncuestaContestada
FROM         dbo.View_EncuestasEnviadasPPS a LEFT OUTER JOIN
                      dbo.View_EncuestasPPS_V2 b ON a.Ticket = b.Ticket


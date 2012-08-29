IF OBJECT_ID (N'View_TicketsConSLA_BBVA', N'V') IS NOT NULL
	DROP VIEW View_TicketsConSLA_BBVA 
GO
  
CREATE  VIEW View_TicketsConSLA_BBVA as
SELECT TOP 100 PERCENT 
	a.ref_num AS Ticket, a.type AS Tipo, g.sym AS Prioridad, DATEADD(ss, a.open_date - 18000, '19700101') AS FechaApe, 
	DATEADD(ss, a.resolve_date - 18000, '19700101') AS FechaRes, DATEADD(ss, a.close_date - 18000, '19700101') AS FechaCie, 
	c.first_name + ' ' + c.last_name AS Usuario, t .sym AS [ST Usuario], u.name AS [Área de Usuario], n.location_name AS SedeUsu, 
	h.first_name + ' ' + h.last_name AS Analista, b.last_name AS Grupo, m.first_name + ' ' + m.last_name AS Reportado_Por, 
	q.sym AS ContractServiceType, a.sla_violation AS SLATResolución, j.sym AS Categoría, j.description AS DescCat, r.last_name AS GrupoCat, 
	a.description AS Descripción, a.summary AS Resumen, d .sym AS Estado, k.sym AS Met_Reporte, l.description AS RootCause, 
	a.string2 AS [Acción a Seguir], e.company_name AS Proveedor, a.active_flag AS [¿Activo?], 
	CASE a.sla_violation WHEN 0 THEN 'SLA CUMPLIDO' ELSE 'SLA INCUMPLIDO' END AS [Nivel de Servicio], CONVERT(nvarchar(30), DATEADD(ss, 
	a.open_date - 18000, '19700101'), 103) AS OpenDate, CONVERT(nvarchar(30), DATEADD(ss, a.close_date - 18000, '19700101'), 103) 
	AS CloseDate
FROM dbo.call_req a LEFT OUTER JOIN
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
WHERE 
	(a.resolve_date IS NOT NULL) 
	AND (a.status <> 'CANCEL') AND (a.status <> 'CLREQ') AND (a.status <> 'CLUNRSLV') 
	AND q.sym IS NOT NULL AND q.sym <> 'Sin SLA' 
	AND ((j.service_type IS NOT NULL AND (q.sym NOT LIKE '%LIM01%' AND q.sym NOT LIKE '%PRV01%')) OR (j.service_type IS NULL AND (q.sym LIKE '%LIM01%' OR q.sym LIKE '%PRV01%')))
	AND (f.org_name LIKE 'BBVA%')
	
UNION ALL
SELECT TOP 100 PERCENT a.ref_num AS Ticket, a.type AS Tipo, g.sym AS Prioridad, DATEADD(ss, a.open_date - 18000, '19700101') AS FechaApe, 
	DATEADD(ss, a.resolve_date - 18000, '19700101') AS FechaRes, DATEADD(ss, a.close_date - 18000, '19700101') AS FechaCie, 
	c.first_name + ' ' + c.last_name AS Usuario, t .sym AS [ST Usuario], u.name AS [Área de Usuario], n.location_name AS SedeUsu, 
	h.first_name + ' ' + h.last_name AS Analista, b.last_name AS Grupo, m.first_name + ' ' + m.last_name AS Reportado_Por, 
	q.sym AS ContractServiceType, a.sla_violation AS SLATResolución, j.sym AS Categoría, j.description AS DescCat, r.last_name AS GrupoCat, 
	a.description AS Descripción, a.summary AS Resumen, d .sym AS Estado, k.sym AS Met_Reporte, l.description AS RootCause, 
	a.string2 AS [Acción a Seguir], e.company_name AS Proveedor, a.active_flag AS [¿Activo?], 'SIN SLA' AS [Nivel de Servicio2], CONVERT(nvarchar(30), 
	DATEADD(ss, a.open_date - 18000, '19700101'), 103) AS OpenDate, CONVERT(nvarchar(30), DATEADD(ss, a.close_date - 18000, '19700101'), 103) 
	AS CloseDate
FROM dbo.call_req a LEFT OUTER JOIN
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
WHERE 
	(a.resolve_date IS NOT NULL) 
	AND (a.status <> 'CANCEL') 
	AND (a.status <> 'CLREQ') 
	AND (a.status <> 'CLUNRSLV') 
	AND q.sym IS NULL
	AND (f.org_name LIKE 'BBVA%')
ORDER BY a.ref_num;
IF OBJECT_ID (N'View_TicketsEstadosAñoMes_BBVA', N'V') IS NOT NULL
	DROP VIEW View_TicketsEstadosAñoMes_BBVA 
GO
            
CREATE VIEW View_TicketsEstadosAñoMes_BBVA as 
SELECT TOP 100 PERCENT 
	a.ref_num AS Ticket, a.type AS Tipo, g.sym AS Prioridad, DATEADD(ss, a.open_date - 18000, '19700101') AS FechaApe, 
	DATEADD(ss, a.resolve_date - 18000, '19700101') AS FechaRes, DATEADD(ss, a.close_date - 18000, '19700101') AS FechaCie, 
	c.first_name + ' ' + c.last_name AS Usuario, t.sym AS [ST Usuario], u.name AS Área, n.location_name AS SedeUsu, 
	h.first_name + ' ' + h.last_name AS Analista, m.first_name + ' ' + m.last_name AS Reportado_Por, q.sym AS ContractServiceType, j.sym AS Categoría, 
	j.description AS DescCat, b.last_name AS Grupo, a.description AS Descripción, a.summary AS Resumen, d.sym AS Estado, k.sym AS Met_Reporte, 
	l.description, e.company_name AS Proveedor, a.active_flag AS [¿Activo?], CONVERT(nvarchar(30), DATEADD(ss, a.open_date - 18000, '19700101'), 
	103) AS OpenDate, CONVERT(nvarchar(30), DATEADD(ss, a.close_date - 18000, '19700101'), 103) AS CloseDate, 
	b.last_name AS GrupoReporte, 
	CASE a.status 
		WHEN 'CL' THEN 'Cancelado/Anulado' 
		WHEN 'RE' THEN 'Cerrado' 
		WHEN 'CANCEL' THEN 'Cerrado' 
		ELSE 'Pendiente' 
	END AS EstadoReporte,
	YEAR(DATEADD(ss, a.open_date - 18000, '19700101')) AS Año, 
	MONTH(DATEADD(ss, a.open_date - 18000, '19700101')) AS Mes
FROM dbo.call_req a LEFT OUTER JOIN
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
WHERE (f.org_name LIKE N'BBVA%')
ORDER BY a.ref_num

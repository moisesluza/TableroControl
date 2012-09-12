IF OBJECT_ID (N'View_TicketsPorEstado_BBVA', N'V') IS NOT NULL
	DROP VIEW View_TicketsPorEstado_BBVA 
GO

CREATE VIEW View_TicketsPorEstado_BBVA as 
SELECT TOP 100 PERCENT 
	a.ref_num AS Ticket, a.type AS Tipo, g.sym AS Prioridad, DATEADD(ss, a.open_date - 18000, '19700101') AS FechaApe, 
	DATEADD(ss, a.resolve_date - 18000, '19700101') AS FechaRes, DATEADD(ss, a.close_date - 18000, '19700101') AS FechaCie, 
	isnull(c.first_name,'') + ' ' + isnull(c.last_name,'') AS Usuario, t.sym AS [ST Usuario], u.name AS [Área de Usuario], n.location_name AS SedeUsu, 
	isnull(h.first_name,'') + ' ' + isnull(h.last_name,'') AS Analista, 
	m.first_name + ' ' + m.last_name AS Reportado_Por, 
	j.sym AS Categoría, 
	j.description AS DescCat, b.last_name AS Grupo, a.description AS Descripción, a.summary AS Resumen, d.sym AS Estado, k.sym AS Met_Reporte, 
	l.description, e.company_name AS Proveedor, a.active_flag AS [¿Activo?], 
	CONVERT(nvarchar(30), DATEADD(ss, a.open_date - 18000, '19700101'), 103) AS OpenDate, 
	CONVERT(nvarchar(30), DATEADD(ss, a.close_date - 18000, '19700101'), 103) AS CloseDate, 
	b.last_name AS GrupoReporte, 
	CASE a.status 
		WHEN 'CL' THEN 'Cerrado' 
		WHEN 'RE' THEN 'Cerrado' 
		WHEN 'CANCEL' THEN 'Cancelado/Anulado' 
		ELSE 'Pendiente' 
	END AS EstadoReporte
FROM dbo.call_req a with(nolock) LEFT OUTER JOIN
	dbo.ca_contact b with(nolock) ON a.group_id = b.contact_uuid LEFT OUTER JOIN
	dbo.ca_contact c with(nolock) ON a.customer = c.contact_uuid LEFT OUTER JOIN
	dbo.cr_stat d with(nolock) ON a.status = d.code LEFT OUTER JOIN
	dbo.ca_company e with(nolock) ON a.zprovider = e.company_uuid LEFT OUTER JOIN
	dbo.ca_organization f with(nolock) ON c.organization_uuid = f.organization_uuid LEFT OUTER JOIN
	dbo.pri g with(nolock) ON a.priority = g.enum LEFT OUTER JOIN
	dbo.ca_contact h with(nolock) ON a.assignee = h.contact_uuid LEFT OUTER JOIN
	dbo.prob_ctg j with(nolock) ON a.category = j.persid LEFT OUTER JOIN
	dbo.repmeth k with(nolock) ON a.cr_zrepme = k.id LEFT OUTER JOIN
	dbo.rootcause l with(nolock) ON a.rootcause = l.id LEFT OUTER JOIN
	dbo.ca_contact m with(nolock) ON a.log_agent = m.contact_uuid LEFT OUTER JOIN
	dbo.ca_location n with(nolock) ON c.location_uuid = n.location_uuid LEFT OUTER JOIN
	dbo.ca_contact r with(nolock) ON j.group_id = r.contact_uuid LEFT OUTER JOIN
	dbo.usp_contact s with(nolock) ON c.contact_uuid = s.contact_uuid LEFT OUTER JOIN
	dbo.srv_desc t with(nolock) ON s.c_service_type = t.code LEFT OUTER JOIN
	dbo.ca_resource_department u with(nolock) ON c.department = u.id
WHERE (f.org_name LIKE N'BBVA%')
	and b.last_name  not in ('BANCO','BBVA GATM','DIEBOLD','HERMES','NCR','Oracle','PORTAVALOR','PROSEGUR','Responsables Cajeros 01','Responsables Cajeros 02','Responsables Cajeros 03','Responsables Cajeros 04','Responsables Cajeros 05','Responsables Cajeros 06','Responsables Cajeros 07','SQL','TECNICO')
	and j.sym not like ('INC.GESTION ATM%')
	and j.sym not like ('INC.GPS%')
	and j.sym not like ('ASIS.GPS%')
	and j.sym not like ('ASIS.CONS.SRV.ATM%')
	and j.sym not like ('Incidencia BD.Aplicativos Oracle.CHECKER ATM%')
	and j.sym not like ('Incidencia BD.Aplicativos Oracle.Proyecto GPS%')
	and j.sym not like ('REQ.GPS%')

ORDER BY a.ref_num


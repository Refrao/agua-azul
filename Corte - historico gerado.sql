SELECT
C.Corr_corte,
C.corr_reaviso,
to_ddmmyyyy(date(h.data_reaviso)) as data_reaviso,
C.Fecha_solicitud,
C.numero_cliente,
C.Numero_solicitud,
eot.numero_tdc,
C.numero_ordem,
C.sucursal,
C.Estado,
A.Descripcion as Motivo,
B.descricao_tipo,
Area.Descripcion as Sucursal,
C.Funcionario,
eot2.numero_tdc,
z.nombre
FROM Corsoco C, Outer Tabla A, Outer Tipo_corte B,
outer Area, outer hisreav H, outer eorder_transferencia eot,
outer eorder_transferencia eot2,
cliente z
WHERE c.numero_cliente = z.numero_cliente
and A.Nomtabla = 'CORMOT'
AND A.Codigo = c.motivo_sol
AND A.Sucursal = C.sucursal
And ((A.fecha_activacion >= A.fecha_desactivac And A.fecha_desactivac > Today)  Or A.fecha_desactivac is null)
AND B.tipo_corte = c.tipo_corte
AND Area.Area = c.Oficina
AND H.numero_cliente = C.numero_cliente 
AND H.corr_reaviso = C.corr_reaviso 
AND c.numero_ordem = eot.numero_ordem 
AND c.numero_livro = eot2.numero_livro 
AND c.numero_cliente = eot2.numero_cliente 
AND (eot.tipo_tdc = 'SCR.01' Or eot.tipo_tdc = 'SCR.02')
AND C.Fecha_solicitud between "2020-09-15 00:00" and "2020-09-30 23:59" 
Order By C.Corr_corte Desc

SELECT C.numero_cliente,to_ddmmyyyy(date(C.fecha_corte)) as fecha_corte, to_ddmmyyyy(date(C.data_solic_corte)) as data_solic_corte, b.descripcion as motivo_corte,a.descricao_tipo as descricao_tipo, f.descripcion as retorno_corte, to_ddmmyyyy(date(c.fecha_reposicion)) as fecha_reposicion, d.descripcion as motivo_relig, e.descripcion as retorno_relig, COUNT(*), AVG(valor_divida)
FROM CORREP C, outer tabla b, outer tabla f, outer tabla d, outer tipo_corte a, outer tabla e
WHERE
b.nomtabla = 'CORMOT' And b.codigo = c.motivo_corte AND b.sucursal = '0000'  And ((b.fecha_activacion >= b.fecha_desactivac And b.fecha_desactivac > Today)  Or b.fecha_desactivac is null) 
AND f.nomtabla = 'ACRECO' AND f.codigo = c.acc_realizada_cor AND b.sucursal = '0000'  And ((f.fecha_activacion >= f.fecha_desactivac And f.fecha_desactivac > Today)  Or  f.fecha_desactivac is null) 
AND d.nomtabla = 'REPMOT' AND d.codigo = c.motivo_repo And d.sucursal = '0000' And ((d.fecha_activacion >= d.fecha_desactivac And d.fecha_desactivac > Today)  Or d.fecha_desactivac is null) 
AND e.nomtabla = 'ACRERE' AND e.codigo = c.acc_realizada_rep And e.sucursal = '0000' And ((e.fecha_activacion >= e.fecha_desactivac And e.fecha_desactivac > Today)  Or e.fecha_desactivac is null)
AND a.tipo_corte = c.tipo_corte
and C.fecha_corte >= '01/01/2021'
GROUP BY 1,2,3,4,5,6,7,8,9

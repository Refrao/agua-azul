SELECT c.numero_cliente,
T1.descripcion,
c.fecha_reposicion,
eot2.numero_tdc
FROM correp C,
OUTER tabla t1,
OUTER eorder_transferencia eot2
WHERE T1.nomtabla = 'ACRERE'
AND T1.codigo = c.acc_realizada_rep
AND T1.sucursal = '0000'
AND c.num_ordem_serv_rep = eot2.numero_ordem
And eot2.tipo_tdc = 'SCR.02'
AND C.fecha_reposicion >= "2021-07-01 00:00"
AND c.numero_cliente IN ('26231',
'129218')
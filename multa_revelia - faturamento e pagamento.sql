

SELECT
c.numero_cliente,
c.nombre,
c.sector,
h.referencia,
h.fecha_facturacion,
h.corr_facturacion,
h.ind_saldo,
round(ca.valor_cargo,2) valor_cargo,
tb.descripcion tipo_ligacao
FROM hisfac h, carfac ca, cliente c, tabla tb
WHERE
ca.numero_cliente = h.numero_cliente
and c.numero_cliente = h.numero_cliente
and ca.corr_facturacion = h.corr_facturacion
and ca.codigo_cargo in ('181', '929')
and tb.sucursal = '0000'
and tb.nomtabla = 'TIPLIG'
and tb.codigo = c.tipo_ligacao
and h.referencia >= 202108 
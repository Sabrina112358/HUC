CREATE TABLE inventario_pampa
AS
(SELECT * FROM produtos_11_31_pampa_p1)
UNION
(SELECT * FROM produtos_11_31_pampa_p2);
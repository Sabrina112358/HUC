CREATE TABLE inventario_mata_atlantica
AS
(SELECT * FROM produtos_15_35_mata_atlantica_p1)
UNION
(SELECT * FROM produtos_15_35_mata_atlantica_p2)
UNION
(SELECT * FROM produtos_15_35_mata_atlantica_p3)
UNION
(SELECT * FROM produtos_15_35_mata_atlantica_p4)
UNION
(SELECT * FROM produtos_15_35_mata_atlantica_p5)
UNION
(SELECT * FROM produtos_15_35_mata_atlantica_p6)
UNION
(SELECT * FROM produtos_15_35_mata_atlantica_p7)
UNION
(SELECT * FROM produtos_15_35_mata_atlantica_p8)
UNION
(SELECT * FROM produtos_15_35_mata_atlantica_p9)
UNION
(SELECT * FROM produtos_15_35_mata_atlantica_p10)
UNION
(SELECT * FROM produtos_15_35_mata_atlantica_p11);
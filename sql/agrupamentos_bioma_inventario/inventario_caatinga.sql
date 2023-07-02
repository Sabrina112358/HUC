CREATE TABLE inventario_caatinga
AS
(SELECT * FROM produtos_12_32_caatinga_p1)
UNION
(SELECT * FROM produtos_12_32_caatinga_p2)
UNION
(SELECT * FROM produtos_12_32_caatinga_p3)
UNION
(SELECT * FROM produtos_12_32_caatinga_p4)
UNION
(SELECT * FROM produtos_12_32_caatinga_p5)
UNION
(SELECT * FROM produtos_12_32_caatinga_p6)
UNION
(SELECT * FROM produtos_12_32_caatinga_p7)
UNION
(SELECT * FROM produtos_12_32_caatinga_p8)
UNION
(SELECT * FROM produtos_12_32_caatinga_p9);
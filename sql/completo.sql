-- Agrupamentos
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

ALTER TABLE inventario_mata_atlantica
ALTER COLUMN geom TYPE geometry(MultiPolygon)
USING ST_Force2D(geom);

SELECT DISTINCT gid, ST_GeometryType(geom), ST_NDims(geom), ST_SRID(geom)
FROM inventario_mata_atlantica
LIMIT 100;

-- Correcao de geometrias
-- SELECT 'non valide' AS nb, count(*) FROM inventario_mata_atlantica WHERE NOT ST_IsValid(geom)
-- UNION
-- SELECT 'geom nulle' AS nb, count(*) FROM inventario_mata_atlantica WHERE geom is null
-- UNION
-- SELECT 'collection' AS nb, count(*) FROM inventario_mata_atlantica WHERE not ST_IsValid(geom)
-- AND ST_GeometryType(ST_MakeValid(geom))='ST_GeometryCollection';

UPDATE inventario_mata_atlantica SET geom = ST_MakeValid(geom) WHERE NOT ST_IsValid(geom);

UPDATE inventario_mata_atlantica
SET geom = 
	ST_Multi(ST_Simplify(ST_Multi(ST_CollectionExtract(ST_ForceCollection(ST_MakeValid(geom)),3)),0))
WHERE ST_GeometryType(geom) = 'ST_GeometryCollection';

DELETE FROM inventario_mata_atlantica WHERE geom IS NULL;

UPDATE inventario_mata_atlantica SET geom = ST_Multi(ST_Simplify(geom,0));

UPDATE inventario_mata_atlantica SET geom = ST_Multi(ST_Buffer(geom,0)) WHERE NOT ST_IsValid(geom);

-- Reclassificacao para o raster
ALTER TABLE inventario_mata_atlantica
ADD COLUMN id_classe_raster_2016 INT;

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 = 1
WHERE cagr_2016 = 'FM';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =2
WHERE cagr_2016 = 'FNM';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =3
WHERE cagr_2016 = 'Fsec' OR cagr_2016 = 'FSec';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =4
WHERE cagr_2016 = 'CS';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =5
WHERE cagr_2016 = 'Ref';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =6
WHERE cagr_2016 = 'GM';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =7
WHERE cagr_2016 = 'GNM';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =8
WHERE cagr_2016 = 'GSec';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =9
WHERE cagr_2016 = 'AP' or cagr_2016 = 'Ap';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =10
WHERE cagr_2016 = 'APD';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =11
WHERE cagr_2016 = 'OFLM';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =12
WHERE cagr_2016 = 'OFLNM';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =13
WHERE cagr_2016 = 'OFLSec';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =14
WHERE cagr_2016 = 'AC' or cagr_2016 = 'Ac';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =15
WHERE cagr_2016 = 'PER';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =16
WHERE cagr_2016 = 'CANA';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =17
WHERE cagr_2016 = 'A';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =18
WHERE cagr_2016 = 'RES' OR cagr_2016 = 'Res';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =19
WHERE cagr_2016 = 'S';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =20
WHERE cagr_2016 = 'DnM';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =21
WHERE cagr_2016 = 'DnNM';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =22
WHERE cagr_2016 = 'ArM';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =23
WHERE cagr_2016 = 'ArNM';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =24
WHERE cagr_2016 = 'Min';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =25
WHERE cagr_2016 = 'SE';

UPDATE inventario_mata_atlantica
SET id_classe_raster_2016 =26
WHERE cagr_2016 = 'NO';

SELECT cagr_2016
FROM inventario_mata_atlantica
WHERE id_classe_raster_2016 IS NULL
GROUP BY cagr_2016;
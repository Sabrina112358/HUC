SELECT 'non valide' AS nb, count(*) FROM inventario_pantanal WHERE NOT ST_IsValid(geom)
UNION
SELECT 'geom nulle' AS nb, count(*) FROM inventario_pantanal WHERE geom is null
UNION
SELECT 'collection' AS nb, count(*) FROM inventario_pantanal WHERE not ST_IsValid(geom)
AND ST_GeometryType(ST_MakeValid(geom))='ST_GeometryCollection';

UPDATE inventario_pantanal SET geom = ST_MakeValid(geom) WHERE NOT ST_IsValid(geom);

UPDATE inventario_pantanal
SET geom = 
	ST_Multi(ST_Simplify(ST_Multi(ST_CollectionExtract(ST_ForceCollection(ST_MakeValid(geom)),3)),0))
WHERE ST_GeometryType(geom) = 'ST_GeometryCollection';

DELETE FROM inventario_pantanal WHERE geom IS NULL;

UPDATE inventario_pantanal SET geom = ST_Multi(ST_Simplify(geom,0));

UPDATE inventario_pantanal SET geom = ST_Multi(ST_Buffer(geom,0)) WHERE NOT ST_IsValid(geom);

ALTER TABLE inventario_pantanal
ALTER COLUMN geom TYPE geometry;
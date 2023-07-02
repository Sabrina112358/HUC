ALTER TABLE inventario_caatinga
ADD COLUMN id_classe_raster_2016 INT;

UPDATE inventario_caatinga
SET id_classe_raster_2016 = 1
WHERE cagr_2016 = 'FM';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =2
WHERE cagr_2016 = 'FNM';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =3
WHERE cagr_2016 = 'Fsec' OR cagr_2016 = 'FSec';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =4
WHERE cagr_2016 = 'CS';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =5
WHERE cagr_2016 = 'Ref';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =6
WHERE cagr_2016 = 'GM';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =7
WHERE cagr_2016 = 'GNM';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =8
WHERE cagr_2016 = 'GSec';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =9
WHERE cagr_2016 = 'AP' or cagr_2016 = 'Ap';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =10
WHERE cagr_2016 = 'APD';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =11
WHERE cagr_2016 = 'OFLM';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =12
WHERE cagr_2016 = 'OFLNM';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =13
WHERE cagr_2016 = 'OFLSec';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =14
WHERE cagr_2016 = 'AC' or cagr_2016 = 'Ac';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =15
WHERE cagr_2016 = 'PER';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =16
WHERE cagr_2016 = 'CANA';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =17
WHERE cagr_2016 = 'A';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =18
WHERE cagr_2016 = 'RES' OR cagr_2016 = 'Res';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =19
WHERE cagr_2016 = 'S';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =20
WHERE cagr_2016 = 'DnM';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =21
WHERE cagr_2016 = 'DnNM';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =22
WHERE cagr_2016 = 'ArM';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =23
WHERE cagr_2016 = 'ArNM';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =24
WHERE cagr_2016 = 'Min';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =25
WHERE cagr_2016 = 'SE';

UPDATE inventario_caatinga
SET id_classe_raster_2016 =26
WHERE cagr_2016 = 'NO';

SELECT cagr_2016
FROM inventario_caatinga
WHERE id_classe_raster_2016 IS NULL
GROUP BY cagr_2016;
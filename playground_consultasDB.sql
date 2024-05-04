USE playground;

/* Obtener los 5 cursos con más unidades: Escribe una consulta que devuelva los títulos de los 5 cursos 
que tienen más unidades. Los resultados deben estar ordenados en orden descendente por el número de unidades.*/

SELECT cursos.titulo as "Cursos", count(unidades.titulo) as "Cantidad de Unidades" 
FROM cursos
INNER JOIN unidades ON cursos.id = cursos_id
GROUP BY (cursos.titulo) 
ORDER BY count(unidades.titulo) DESC
limit 5;

/* Obtener la media de unidades por curso: Escribe una consulta que calcule la media de unidades por curso. 
Los resultados deben estar agrupados por el título del curso.*/

SELECT cursos.titulo as "Cursos", (count(unidades.titulo)/(SELECT count(cursos.titulo) FROM cursos)) as "Media Unidades por curso" 
FROM cursos
INNER JOIN unidades ON cursos.id = cursos_id
GROUP BY (cursos.titulo) 
ORDER BY (count(unidades.titulo)/(SELECT count(cursos.titulo) FROM cursos)) DESC;

/*Obtener los usuarios asociados a más de 3 cursos: Escribe una consulta que devuelva los nombres de los usuarios que están asociados a más de 3 cursos. 
Los resultados deben estar ordenados en orden ascendente por el nombre del usuario.*/

SELECT usuarios.nombre as "Usuarios", count(cursos.titulo) as "Cantidad de Cursos" 
FROM cursos
INNER JOIN cursos_usuarios ON cursos.id = cursos_id
INNER JOIN usuarios ON usuarios.id = usuarios_id
GROUP BY (usuarios.nombre)
HAVING count(cursos.titulo) > 3;

/*Obtener las 10 primeras clases que comienzan después de una fecha determinada: Escribe una consulta que devuelva las 10 primeras clases 
que comienzan después de una fecha determinada. Los resultados deben estar ordenados en orden ascendente por la fecha de inicio.*/

SELECT clases.titulo as "Clases", clases.fecha_inicio as "Fecha de inicio"
FROM clases
WHERE  clases.fecha_inicio > "2024-05-09"
ORDER BY clases.fecha_inicio ASC
LIMIT 10; 

/*Obtener el nombre y el apellido de los usuarios, sustituyendo los valores nulos por una cadena vacía: Escribe una consulta que 
devuelva el nombre y el apellido de los usuarios, utilizando una función para sustituir los valores nulos por una cadena vacía.*/

SELECT coalesce(usuarios.nombre, " ") as "Nombre", coalesce(usuarios.apellido, " ") as "Apellido"
FROM usuarios;

/*Obtener los 3 cursos con la mayor cantidad de usuarios: Escribe una consulta que devuelva los títulos de los 3 cursos que tienen más usuarios asociados. 
Los resultados deben estar ordenados en orden descendente por el número de usuarios.*/

SELECT cursos.titulo as "Cursos", count(usuarios.nombre) as "Cantidad de Usuarios" 
FROM cursos
INNER JOIN cursos_usuarios ON cursos.id = cursos_id
INNER JOIN usuarios ON usuarios.id = usuarios_id
GROUP BY cursos.titulo 
ORDER BY count(usuarios.nombre) DESC
LIMIT 3;

/*Obtener el promedio de clases por unidad para cada curso: Escribe una consulta que calcule el promedio de 
clases por unidad para cada curso. Los resultados deben estar agrupados por el título del curso.*/

SELECT cursos.titulo as "Cursos", count(clases.titulo)/(SELECT count(unidades.titulo) FROM unidades) AS "Promedio"
FROM cursos 
RIGHT JOIN unidades ON cursos.id = cursos_id
LEFT JOIN clases ON unidades.id = unidades_id
GROUP BY (cursos.titulo)
ORDER BY count(clases.titulo)/(SELECT count(unidades.titulo) FROM unidades) DESC;

/* Obtener los usuarios con más de 2 cursos que comienzan después de una fecha determinada: Escribe una consulta que devuelva los nombres de los usuarios que están 
asociados a más de 2 cursos que comienzan después de una fecha determinada. Los resultados deben estar ordenados en orden ascendente por el nombre del usuario. */

SELECT usuarios.nombre as "Usuarios", count(cursos.titulo) as "Cantidad de Cursos", cursos.fecha_inicio as "Fecha de inicio"
FROM cursos
INNER JOIN cursos_usuarios ON cursos.id = cursos_id
INNER JOIN usuarios ON usuarios.id = usuarios_id
WHERE  cursos.fecha_inicio > "2024-05-09"
GROUP BY (usuarios.nombre)
HAVING count(cursos.titulo) > 2;

/* Obtener las 5 últimas unidades que comienzan después de una fecha determinada: Escribe una consulta que devuelva las 5 últimas unidades que comienzan 
después de una fecha determinada. Los resultados deben estar ordenados en orden descendente por la fecha de inicio. */

SELECT unidades.titulo, unidades.fecha_inicio
from unidades
WHERE  unidades.fecha_inicio > "2024-05-09"
order by unidades.fecha_inicio ASC
limit 5;

/* Obtener el número de usuarios por categoría para un curso específico: Escribe una consulta que devuelva el número de usuarios 
por categoría para un curso específico. Los resultados deben estar agrupados por la categoría del usuario. */

SELECT categorias.categorias as "categorias", count(usuarios.nombre) as "Usuarios", cursos.titulo as "Cursos"
FROM cursos
INNER JOIN cursos_usuarios ON cursos.id = cursos_id
INNER JOIN usuarios ON usuarios.id = usuarios_id
RIGHT JOIN categorias ON categorias.id = categorias_id
GROUP BY (categorias.categorias);
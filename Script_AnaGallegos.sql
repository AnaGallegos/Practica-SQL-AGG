
select a.matricula, g.grupo || ' ' || m.marca || ' '|| b.modelo as datos_carroceria, a.id_color, a.kilometros, a.f_compra, a.id_poliza, p.id_aseguradora 
from car_database.coches a left join  car_database.modelos b on a.id_modelo  = b.id_modelo 
left join car_database.marca m on m.id_marca = b.id_marca 
left join car_database.grupo g on g.id_grupo = m.id_grupo 
left join car_database.poliza p on a.id_poliza = p.id_poliza 
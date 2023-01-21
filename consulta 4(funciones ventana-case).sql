select 
 	categoria,  
	total_cobrado,
	-- la clausula case sirve para agregar campos calculados de acorde a las --
	--condicionales que le vallamos a dar esta no sirve para filtrar datos  --
	CASE 
	      	WHEN total_cobrado > 200 then 0.07*total_cobrado
			 	else 0 
	END			  as decuento,
	
	cliente,
	/*aqui lo que estoy haciendo es sumar el total_cobrado y particionandolo por cliente,
	es decir me devuelve la sumatoria por cliente */
	sum(total_cobrado) over(partition by cliente )as sumatoria , 
	
	
	/*aqui lo que estoy haciendo es identificar que tanto por ciento representa el total_cobrado
	de la sumatoria particionada por cliente */
	total_cobrado/sum(total_cobrado)  over(partition by cliente ) as porcentaje,
 	
	total_cobrado,
	
	/*en esta seccion particionamos la suma del total_cobrado por cliente y lo ordenamos por fecha 
	de forma ascendente de tal manera que lo que se mostrara en pantalla sera el monto acumulativo  
	por fecha y particionado por cliente */
	sum(total_cobrado) over(partition by cliente order by fecha asc )as monto_acumulativo , 
	
	
	/*en esta seccion identificamos que tanto por ceinto representa los montos acumulativos por 
	 fecha partionado por cliente*/
	sum(total_cobrado) over(partition by cliente order by fecha asc )/sum(total_cobrado) over(partition by cliente ) as "%acumulativo",
	fecha
	
		
	FROM 
		ABRIL    
		where cliente ilike 'A-%' or cliente ilike 'B-%' 
		 
		
			
		 
		
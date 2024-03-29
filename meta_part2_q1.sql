-- Question #1: 
-- The clients that have a client ID with a number between 0 and 1000 are the earliest are most loyal Meta customers
-- and need to be treated with the best care possible.

-- Your manager wants to understand how the sales teams performed on these customers over the last years.

-- What is the total revenue generated by Meta per year on clients that have a client ID with a number between 0 and 1000?




SELECT  years,
				SUM(revenue) AS total_revenue
        FROM
						(
        SELECT 
              EXTRACT(YEAR FROM meta_revenue.dates) AS years,
              (meta_revenue.revenue) AS revenue,
    					CAST(SUBSTRING(meta_clients.client_id,8,100) AS INTEGER) AS client_id_num
              
								FROM meta_clients
           			LEFT JOIN meta_revenue ON meta_clients.client_id = meta_revenue.client_id
                              
              GROUP BY years, client_id_num,revenue
              
              
          ) 
          AS subquery
          WHERE client_id_num BETWEEN 0 AND 1000

          GROUP BY
   					 years
					ORDER BY
    				 years;


            

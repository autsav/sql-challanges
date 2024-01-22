-- Question #2: 
-- Your manager mentions that the client information of long term clients tends to not get updated regularly since the clients 
-- are already in the system for such a long time. He asks you to check this.

-- What is the average number of days since the client information was last updated for clients that have a client ID with a number
-- between 0 and 1000? 

-- You can calculate average number of days since the client was last updated by comparing the current date and the last updated date.


SELECT  
				AVG(diff_date) AS avg_days_since_update
        FROM
							(
        SELECT         
							CURRENT_DATE - meta_clients.last_updated_date AS diff_date,
    					CAST(SUBSTRING(meta_clients.client_id,8,100) AS INTEGER) AS client_id_num
              
								FROM meta_clients
           			LEFT JOIN meta_revenue ON meta_clients.client_id = meta_revenue.client_id
                              
              GROUP BY client_id_num,diff_date  
          	) 
          AS subquery
          WHERE client_id_num BETWEEN 0 AND 1000







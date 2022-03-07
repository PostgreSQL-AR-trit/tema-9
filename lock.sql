-------------------
-- Quién bloquea --
-------------------

SELECT l.pid AS "PID",
       l.client_addr AS "IP",
       l.query AS "Query"
  FROM pg_stat_activity w JOIN pg_locks l1 ON w.pid = l1.pid AND NOT l1.granted
                          JOIN pg_locks l2 ON l1.relation = l2.relation AND l2.granted
                          JOIN pg_stat_activity l ON l2.pid = l.pid;


 
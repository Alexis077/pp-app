SELECT *
FROM   (SELECT *,
                ( Row_number()
                    OVER (
                        partition BY d.category_name
                        ORDER BY d.total_quantity desc) ) AS row_num
        FROM   (SELECT c.NAME            AS category_name,
                        p.NAME            AS product_name,
                        Sum(pi2.quantity) AS total_quantity
                FROM   categories c
                        INNER JOIN product_categories pc
                                ON pc.category_id = c.id
                        INNER JOIN products p
                                ON pc.product_id = p.id
                        INNER JOIN purchase_items pi2
                                ON pi2.product_id = p.id
                GROUP  BY c."name",
                            p.NAME
                ORDER  BY c."name",
                            total_quantity DESC) d) pur
WHERE  pur.row_num <= 3
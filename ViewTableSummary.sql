CREATE VIEW `orders_view` AS
    SELECT 
        OrderID, Quantity, TotalCost
    FROM
        Orders
    WHERE
        Quantity > 2;


Select * from OrdersView;


CREATE VIEW `new_view` AS
    SELECT 
        c.CustomerID,
        c.FullName,
        o.OrderID,
        o.TotalCost AS 'Cost',
        m.MenuName,
        mi.CourseName
    FROM
        Customers c
            JOIN
        Orders o USING (CustomerID)
            JOIN
        Menus m USING (MenuID)
            JOIN
        MenuItems mi USING (MenuItemsID)
    WHERE
        o.TotalCost > 150
    ORDER BY o.TotalCost ASC;




CREATE VIEW `MenuName_quantity_view` AS
    SELECT 
        MenuName
    FROM
        Menus
    WHERE
        MenuID = ANY (SELECT 
                MenuID
            FROM
                Orders
            WHERE
                Quantity > 2);


SELECT * FROM MenuName_quantity_view;

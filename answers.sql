-- QUESTION 1--
    --Create a normalized table--
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);
    --Insert data in 1NF format--
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- QUESTION 2--
    -- Create the NormalizedOrders table (removes partial dependency)
CREATE TABLE NormalizedOrders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

    -- Create the NormalizedOrderItems table
CREATE TABLE NormalizedOrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES NormalizedOrders(OrderID)
);

    -- Insert data into NormalizedOrders
INSERT INTO NormalizedOrders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

    -- Insert data into NormalizedOrderItems
INSERT INTO NormalizedOrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

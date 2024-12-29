# Simple
# Retrieve all properties with 3 bedrooms and a price below $500,000.
SELECT property_id, address, price
FROM propertyintel.properties
WHERE no_of_bedrooms = 3 AND price < 500000;

#Aggregate
#Calculate the average price paid for the properties grouped by their payment type.
SELECT AVG(amount) AS average_payment, payment_type
FROM propertyintel.payment
GROUP BY payment_type;

#Inner join or #Outer join
#Retrieve All Properties with Amenities and Their Maintenance Status:
SELECT 
    p.property_id, 
    p.address, 
    a.amenity_name, 
    a.amenity_description, 
    mt.type_of_maintenance, 
    mt.category AS maintenance_status
FROM 
    propertyintel.properties p
JOIN 
    propertyintel.amenities a ON p.property_id = a.property_id
LEFT JOIN 
    propertyintel.maintenance_team mt ON p.property_id = mt.property_id
ORDER BY 
    p.property_id;

## Nested Query: Retrieve the names of buyers who have made payments greater than $10,000.
SELECT u.username AS buyer_name
FROM propertyintel.users u
WHERE u.user_id IN (
    SELECT b.buyer_id
    FROM propertyintel.buyer b
    WHERE b.payment_id IN (
        SELECT p.payment_id
        FROM propertyintel.payment p
        WHERE p.amount > 10000
    )
);

#Correlated
#Find Properties in Locations with an Average Price Above $500,000
SELECT property_id, price, location
FROM propertyintel.properties p
WHERE (
    SELECT AVG(price)
    FROM propertyintel.properties
    WHERE location = p.location
) > 500000;


# >=ALL
#Retrieve properties whose price is greater than or equal to the maximum price of properties in "Downtown".
SELECT property_id, address, price
FROM propertyintel.properties
WHERE price >= ALL (
    SELECT price
    FROM propertyintel.properties
    WHERE location = 'Downtown'
);

#Set operations
# List all properties that are either owned or listed for sale, along with their status.
SELECT property_id, 'Owned' AS property_status
FROM propertyintel.owns
UNION
SELECT property_id, 'Listed' AS property_status
FROM propertyintel.listing;


#Subquery in select and from
#1. SELECT
#Retrieve property details along with the count of amenities available for each property.
SELECT 
    property_id, 
    address, 
    (SELECT COUNT(*)
     FROM propertyintel.amenities a
     WHERE a.property_id = p.property_id) AS total_amenities
FROM propertyintel.properties p;

# FROM SUBQUERY:
#Find the total commission percentage grouped by buyer agents
SELECT buyer_agent_id, SUM(percent) AS total_commission
FROM (
    SELECT buyer_agent_id, percent
    FROM propertyintel.b_commission
) AS commission_data
GROUP BY buyer_agent_id;












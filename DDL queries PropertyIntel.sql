-- Create Table: Users
CREATE TABLE propertyintel.users (
    user_id INT PRIMARY KEY,
    email VARCHAR(255),
    phone BIGINT,
    username VARCHAR(200),
    user_type VARCHAR(255)
);

-- Create Table: Payment
CREATE TABLE propertyintel.payment (
    payment_id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    payment_type VARCHAR(255),
    payment_date DATETIME
);

-- Create Table: Buyer Agent
CREATE TABLE propertyintel.buyer_agent (
    buyer_agent_id INT PRIMARY KEY,
    years_of_experience INT,
    licence_number BIGINT,
    current_listings VARCHAR(255),
    client_testimonials VARCHAR(255),
    FOREIGN KEY (buyer_agent_id) REFERENCES propertyintel.users(user_id)
);

-- Create Table: Seller Agent
CREATE TABLE propertyintel.seller_agent (
    seller_agent_id INT PRIMARY KEY,
    years_of_experience INT,
    licence_number BIGINT,
    sold_listings VARCHAR(255),
    client_testimonials VARCHAR(255),
    FOREIGN KEY (seller_agent_id) REFERENCES propertyintel.users(user_id)
);

-- Create Table: Buyer
CREATE TABLE propertyintel.buyer (
    buyer_id INT PRIMARY KEY,
    payment_id INT,
    price_range INT,
    FOREIGN KEY (buyer_id) REFERENCES propertyintel.users(user_id),
    FOREIGN KEY (payment_id) REFERENCES propertyintel.payment(payment_id)
);

-- Create Table: Seller
CREATE TABLE propertyintel.seller (
    seller_id INT PRIMARY KEY,
    payment_id INT,
    ownership_info VARCHAR(255),
    FOREIGN KEY (seller_id) REFERENCES propertyintel.users(user_id),
    FOREIGN KEY (payment_id) REFERENCES propertyintel.payment(payment_id)
);

-- Create Table: Properties
CREATE TABLE propertyintel.properties (
    property_id INT PRIMARY KEY,
    no_of_bedrooms INT,
    size INT,
    type_of_property VARCHAR(100),
    price DECIMAL(10, 2),
    address VARCHAR(255),
    year_built INT,
    location VARCHAR(255)
);

-- Create Table: Buyer Commission
CREATE TABLE propertyintel.b_commission (
    buyer_id INT,
    buyer_agent_id INT,
    percent INT,
    PRIMARY KEY (buyer_id, buyer_agent_id),
    FOREIGN KEY (buyer_id) REFERENCES propertyintel.buyer(buyer_id),
    FOREIGN KEY (buyer_agent_id) REFERENCES propertyintel.buyer_agent(buyer_agent_id)
);

-- Create Table: Seller Commission
CREATE TABLE propertyintel.s_commission (
    seller_id INT,
    seller_agent_id INT,
    percent INT,
    PRIMARY KEY (seller_id, seller_agent_id),
    FOREIGN KEY (seller_id) REFERENCES propertyintel.seller(seller_id),
    FOREIGN KEY (seller_agent_id) REFERENCES propertyintel.seller_agent(seller_agent_id)
);

-- Create Table: Makes
CREATE TABLE propertyintel.makes (
    buyer_id INT,
    payment_id INT,
    payment_method VARCHAR(255),
    PRIMARY KEY (buyer_id, payment_id),
    FOREIGN KEY (buyer_id) REFERENCES propertyintel.buyer(buyer_id),
    FOREIGN KEY (payment_id) REFERENCES propertyintel.payment(payment_id)
);

-- Create Table: Receives
CREATE TABLE propertyintel.receives (
    seller_id INT,
    payment_id INT,
    receive_date DATETIME,
    PRIMARY KEY (seller_id, payment_id),
    FOREIGN KEY (seller_id) REFERENCES propertyintel.seller(seller_id),
    FOREIGN KEY (payment_id) REFERENCES propertyintel.payment(payment_id)
);

-- Create Table: Owns
CREATE TABLE propertyintel.owns (
    number_of_properties INT,
    property_id INT,
    buyer_id INT,
    PRIMARY KEY (buyer_id, property_id),
    FOREIGN KEY (property_id) REFERENCES propertyintel.properties(property_id),
    FOREIGN KEY (buyer_id) REFERENCES propertyintel.buyer(buyer_id)
);

-- Create Table: Listing
CREATE TABLE propertyintel.listing (
    location VARCHAR(255),
    listing_description VARCHAR(255),
    listing_status VARCHAR(100),
    seller_agent_id INT,
    property_id INT,
    PRIMARY KEY (seller_agent_id, property_id),
    FOREIGN KEY (seller_agent_id) REFERENCES propertyintel.seller_agent(seller_agent_id),
    FOREIGN KEY (property_id) REFERENCES propertyintel.properties(property_id)
);

CREATE TABLE propertyintel.has_listing (
    number_of_properties_sold INT,
    property_id INT,
    buyer_agent_id INT,
    PRIMARY KEY (buyer_agent_id, property_id),
    FOREIGN KEY (property_id) REFERENCES propertyintel.properties(property_id),
    FOREIGN KEY (buyer_agent_id) REFERENCES propertyintel.buyer_agent(buyer_agent_id)
);

CREATE TABLE propertyintel.has (
    no_of_tours_conducted INT,
    property_id INT,
    buyer_agent_id INT,
    PRIMARY KEY (buyer_agent_id, property_id),
    FOREIGN KEY (property_id) REFERENCES propertyintel.properties(property_id),
    FOREIGN KEY (buyer_agent_id) REFERENCES propertyintel.buyer_agent(buyer_agent_id)
);

-- Create Table: Virtual Tour
CREATE TABLE propertyintel.virtual_tour (
    tour_id INT PRIMARY KEY,
    virtualtour_date DATE,
    timeslot DATETIME,
    property_id INT,
    payment_id INT,
    FOREIGN KEY (property_id) REFERENCES propertyintel.properties(property_id),
    FOREIGN KEY (payment_id) REFERENCES propertyintel.payment(payment_id)
);

CREATE TABLE propertyintel.attends (
    duration TIME,
    tour_mode VARCHAR(100),
    buyer_id INT,
    buyer_agent_id INT,
    PRIMARY KEY (buyer_id, buyer_agent_id),
    FOREIGN KEY (buyer_id) REFERENCES propertyintel.buyer(buyer_id),
    FOREIGN KEY (buyer_agent_id) REFERENCES propertyintel.buyer_agent(buyer_agent_id)
);

-- Create Table: Amenities
CREATE TABLE propertyintel.amenities (
    amenity_name VARCHAR(100),
    property_id INT PRIMARY KEY,
    amenity_description VARCHAR(255),
    availability DATETIME,
    FOREIGN KEY (property_id) REFERENCES propertyintel.properties(property_id)
);

-- Create Table: Maintenance Team
CREATE TABLE propertyintel.maintenance_team (
    type_of_maintenance VARCHAR(100),
    maintenance_description VARCHAR(255),
    category VARCHAR(100),
    property_id INT PRIMARY KEY,
    FOREIGN KEY (property_id) REFERENCES propertyintel.properties(property_id)
);

-- Create Table: Contract
CREATE TABLE propertyintel.contract (
    deal_id INT PRIMARY KEY,
    property_id INT,
    payment_id INT,
    buyer_agent_id INT,
    buyer_id INT,
    seller_agent_id INT,
    seller_id INT,
    offer_price DECIMAL(10, 2),
    acceptance_date DATE,
    terms_and_conditions VARCHAR(255),
    closing_date DATE,
    buyer_bank_details BIGINT,
    seller_bank_details BIGINT,
    FOREIGN KEY (seller_id) REFERENCES propertyintel.seller(seller_id),
    FOREIGN KEY (buyer_id) REFERENCES propertyintel.buyer(buyer_id),
    FOREIGN KEY (buyer_agent_id) REFERENCES propertyintel.buyer_agent(buyer_agent_id),
    FOREIGN KEY (seller_agent_id) REFERENCES propertyintel.seller_agent(seller_agent_id),
    FOREIGN KEY (property_id) REFERENCES propertyintel.properties(property_id),
    FOREIGN KEY (payment_id) REFERENCES propertyintel.payment(payment_id)
);
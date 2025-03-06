# PropertyIntel: Real Estate Property Management 🏡📊

## 📌 Project Overview
**PropertyIntel** is a **data-driven real estate management platform** that streamlines property transactions, listings, and insights into market trends. By integrating **relational databases (MySQL), NoSQL operations, and Python analytics**, the system provides actionable insights for **buyers, sellers, investors, and agents** to make informed decisions.

The project aims to **reduce inefficiencies in real estate transactions**, optimize market analysis, and provide structured workflows for seamless buyer-seller interactions.

## 🚀 Features
- **Property Listings & Transactions**: Complete management of buying, selling, renting properties.
- **Database Management**: Efficient **MySQL relational schema** for handling entities (buyers, sellers, agents, properties).
- **NoSQL Operations**: For flexible and high-performance data retrieval.
- **Market Trend Analysis**: Price forecasting and agent performance evaluation using **Python & analytics**.
- **Data Visualization**: Graphs, charts, and **interactive dashboards** for insights.

## 🛠️ Tech Stack
- **Database**: MySQL (relational database), MongoDB (NoSQL)
- **Backend**: Python (for advanced analytics)
- **Data Processing**: Pandas, NumPy
- **Visualization**: Matplotlib, Seaborn, Tableau
- **Querying & Data Handling**: SQL, NoSQL, MapReduce


## 📊 Dataset Overview
The system integrates multiple datasets:
- **properties.csv**: Property details (ID, size, location, price, etc.).
- **users.csv**: Buyer and seller information.
- **transactions.csv**: Payment tracking and transaction history.
- **listings.csv**: Active property listings by agents.
- **commissions.csv**: Commission earnings for agents.
- **virtual_tours.csv**: Records of online property visits.

## 🔍 Conceptual Modeling (EER Diagram)
![EER Model](visualizations/EER_model.png)

- **Primary entities**: Users, Buyers, Sellers, Properties, Agents, Contracts, Listings.
- **Key relationships**: Buyer-Seller contracts, agent commissions, property ownership.

## 📌 MySQL Implementation
Example queries:
1. **Retrieve properties owned by each buyer**
   ```sql
   SELECT BuyerID,
   PropertyID FROM Owns;
2. **Find total commission percentage for each seller agent**
   SELECT SellerAgentID, SUM(Commission)
   FROM s_commission GROUP BY SellerAgentID;
3. **Retrieve all properties with their maintenance status**
   SELECT p.PropertyID, p.Type, p.Price, m.Description
   FROM Properties p
   JOIN Maintenance_Team m ON p.PropertyID = m.PropertyID;

## 📈 Data Visualization

1️⃣ Price Distribution by Property Type
![EER Model](visualizations/User_Distribution_by_Type.png)

2️⃣ Property Listings by Status
![EER Model](visualizations/Property Listings by Status.png)

3️⃣ Average Price per Location
![EER Model](visualizations/Average Property Price by Listings.png)

4️⃣ Property Price vs Size
![EER Model](visualizations/EER_model.png)



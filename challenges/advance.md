# Advance

## 1. Given the following Hospital Management System Table

- Identify the entities involved
- Normalize the table to save space

```sql
CREATE TABLE HospitalManagementSystem (
    PatientID INT,
    PatientName VARCHAR(100),
    DoctorID VARCHAR(10),
    DoctorName VARCHAR(100),
    Department VARCHAR(50),
    TreatmentID VARCHAR(10),
    TreatmentName VARCHAR(100),
    DateOfVisit DATE,
    RoomNo INT,
    TreatmentCost NUMERIC(10, 2),
    InsuranceProvider VARCHAR(100),
    InsuranceClaim VARCHAR(3)
);
```

### Extra Challenge

- Load a CSV (`./challenges/data/hms.csv`) into the original table
- Write alembic migrations to safely migrate the data to the new tables

## 2. Mini [1 billion row challenge](https://github.com/gunnarmorling/1brc)

- Download the file: https://github.com/gunnarmorling/1brc/blob/main/data/weather_stations.csv

```bash
curl https://raw.githubusercontent.com/gunnarmorling/1brc/refs/heads/main/data/weather_stations.csv > weather_stations.csv
wc -l weather_stations.csv # 44693
```

- Load the csv into postgres (note: the separator here is `;`)

- Calculate the min, mean, and max temperature value per weather station

## 3. Analyze & optimize an inefficient query

Create tables and populate data using: `./challenges/data/user_orders.sql`

```bash
psql `<your-database>` -f ./challenges/data/user_orders.sql
```

```sql
SELECT u.name, o.amount, p.name AS product_name, oi.quantity
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE u.name = 'Alice'
AND p.price > 100
AND o.amount > 150;
```

# Vehicle Rental System – Database Design & SQL Queries

## 📌 Overview
This project demonstrates the design and implementation of a **Vehicle Rental System** database.  
It focuses on **Entity Relationship Diagram (ERD) design**, **relational database concepts**, and **SQL query writing** using real-world business logic.

The assignment evaluates understanding of:
- Database normalization and relationships
- Primary keys and foreign keys
- SQL queries using `JOIN`, `WHERE`, `EXISTS`, `GROUP BY`, and `HAVING`

---

## 🎯 Objectives
By completing this project, the following concepts are applied:

- Design an ERD with **One-to-Many**, **Many-to-One**, and **logical One-to-One** relationships
- Understand and apply **Primary Keys (PK)** and **Foreign Keys (FK)**
- Write optimized SQL queries using:
  - `INNER JOIN`
  - `NOT EXISTS`
  - `WHERE`
  - `GROUP BY` and `HAVING`

---

## 🧱 Database Design Overview

The system manages three core entities:

- **Users**
- **Vehicles**
- **Bookings**

### 🔹 Business Rules Supported
- Users can be **Admins** or **Customers**
- Each user must have a **unique email**
- Vehicles have a **unique registration number**
- Vehicles can be **available**, **rented**, or under **maintenance**
- Each booking:
  - Belongs to **one user**
  - Reserves **one vehicle**
  - Has a defined rental period and status

---

## 📊 Entity Relationship Diagram (ERD)

### Entities
1. **Users**
   - `user_id` (PK)
   - role
   - name
   - email (unique)
   - password
   - phone

2. **Vehicles**
   - `vehicle_id` (PK)
   - name
   - type (car / bike / truck)
   - model
   - registration_number (unique)
   - rental_per_day
   - vehicle_status

3. **Bookings**
   - `booking_id` (PK)
   - `user_id` (FK → Users)
   - `vehicle_id` (FK → Vehicles)
   - start_date
   - end_date
   - booking_status
   - total_cost

### Relationships
- **One-to-Many:** Users → Bookings  
- **Many-to-One:** Bookings → Vehicles  
- **Logical One-to-One:** Each booking connects exactly one user and one vehicle

📌 The ERD was created using **Lucidchart** and shared as a public link during submission.
    https://drive.google.com/file/d/1_g3xlfvYt1ZLpdjovolIc60SyvAf5vIn/view?usp=sharing
---

## 🧪 SQL Queries Implemented

### Query 1: INNER JOIN
Retrieve booking details along with:
- Customer name
- Vehicle name

**Concepts used:** `INNER JOIN`

---

### Query 2: NOT EXISTS
Find all vehicles that have **never been booked**.

**Concepts used:** `NOT EXISTS`

---

### Query 3: WHERE Clause
Retrieve all **available vehicles** of a specific type (e.g., cars).

**Concepts used:** `SELECT`, `WHERE`

---

### Query 4: GROUP BY & HAVING
Find vehicles that have **more than 2 bookings** and display the total booking count.

**Concepts used:** `GROUP BY`, `HAVING`, `COUNT`

---


## 📁 Project Structure


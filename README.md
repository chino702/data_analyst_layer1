# Data Analyst Layer 1 – SQL Foundations

This repository contains hands-on SQL practice using a **synthetic product analytics dataset** designed to mirror real-world tech and fintech analytics work.

The goal of this project is to build strong fundamentals in:
- SQL querying
- JOINs and correct data grain
- Aggregations and KPIs
- Window functions
- Cohort-style analysis

---

## Dataset Overview
The dataset simulates an e-commerce / product analytics environment with the following tables:

- **users** – one row per user (signup info, acquisition channel, plan)
- **sessions** – one row per session
- **events** – one row per event (page views, add to cart, purchase, etc.)
- **orders** – one row per order
- **order_items** – one row per product line item
- **payments** – one row per payment attempt

> Note: Database files (`.db`) and raw data are intentionally excluded from version control.

---

## SQL Work Completed

### Day 1 – Core Aggregations
- Daily revenue, order count, and average order value (AOV)
- Basic grouping and sorting
- Clean, well-documented SQL queries

### Day 2 – JOINs and Advanced Analysis
- Revenue by acquisition channel
- Top customers by lifetime value
- Product-level revenue and gross margin
- Ranking products within categories using window functions
- **Bonus:** New vs returning customers by month (cohort logic)

All SQL files are located in the `sql/` directory and include inline comments explaining key logic.

---

## Tools Used
- SQLite
- VS Code
- Git & GitHub

---

## Next Steps
- Load SQL outputs into pandas for further analysis
- Build cohort retention tables
- Add visualization and insights in Jupyter notebooks
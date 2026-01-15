# Data Analyst Layer 1 – SQL Foundations

This repository contains hands on SQL practice using a **synthetic product analytics dataset** designed to mirror real world tech and fintech analytics work.

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
- Clean, well documented SQL queries

### Day 2 – JOINs and Advanced Analysis
- Revenue by acquisition channel
- Top customers by lifetime value
- Product level revenue and gross margin
- Ranking products within categories using window functions
- **Bonus:** New vs returning customers by month (cohort logic)

All SQL files are located in the `sql/` directory and include inline comments explaining key logic.

### Day 3 – pandas Analysis Workflow
- Connected Python to a SQLite database
- Pulled analysis-ready datasets using SQL queries
- Reaggregated metrics at different time grains (daily → monthly)
- Built attribution metrics (revenue by acquisition channel)
- Created customer-level metrics (LTV proxy)
- Performed exploratory analysis and sanity check visualizations
- Saved clean outputs for downstream use

### Day 4 - Statistics & Distribution Thinking
- Analyzed distribution properties of customer revenue
- Identified skewness and fat tailed behavior
- Used percentiles and log transforms for robust insight
- Built intution for risk aware analysis

### Day 4 – Probability & Expected Value
- Computed win rates and payoff magnitudes
- Calculated expected value from real transaction data
- Demonstrated why win rate alone is misleading
- Built intuition applicable to trading strategies

### Day 5 – Volatility & Rolling Risk
- Constructed a time series of daily revenue changes
- Measured volatility as a risk metric
- Computed rolling volatility to identify regime changes
- Visualized volatility clustering over time
- Introduced risk-adjusted thinking (Sharpe-like intuition)

### Day 5 – Cohort Retention Analysis
- Defined user cohorts based on first activity
- Built cohort retention matrices over time
- Visualized lifecycle decay and persistence
- Connected retention behavior to time-series decay concepts

### Day 6 - Statstical Inference & Simulation
- Performed hypothesis testing and confidence interval analysis
- Decomposed time series into trend and noise components
- Simulated future outcomes using Monte Carlo methods
- Quantified uncertainty and tail risk using percentile analysis

### Day 7 – Backtesting & Risk Management

- Implemented an end-to-end backtesting framework using historical time-series data
- Built and evaluated a moving-average crossover strategy
- Prevented lookahead bias through proper signal shifting
- Compared strategy performance against a baseline (market)
- Measured risk-adjusted performance and drawdowns
- Modeled risk of ruin and position sizing using Monte Carlo simulation
- Analyzed the impact of transaction costs, slippage, and turnover
- Performed parameter sensitivity analysis to detect overfitting and assess robustness

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
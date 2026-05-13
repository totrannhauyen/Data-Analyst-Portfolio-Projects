# Data-Analyst-Portfolio-Projects
A portfolio repository showcasing end-to-end Data Analyst projects, including data cleaning, exploratory data analysis (EDA), SQL correlation analysis, Tableau dashboards, Power BI dashboards, and business insights. This repository highlights practical skills in data preprocessing, visualization, querying, and storytelling using real-world datasets and analytics workflows.

# Data Analyst Portfolio Projects
This repository contains real-world data analytics projects focused on:

- SQL Data Exploration.
- Data Cleaning.
- Data Visualization.
- Exploratory Data Analysis (EDA).
- Correlation Analysis.
- Dashboard Development with Tableau.
- Dashboard Development with Power BI.

These projects were built as part of my learning journey inspired by [Alex The Analyst](https://www.youtube.com/@AlexTheAnalyst) and [Data Tutorials](https://www.youtube.com/@datatutorials1).

---

# About Me

Hi, I'm **To Tran Nha Uyen** — an aspiring Data Analyst passionate about transforming raw data into meaningful insights and visual stories.

This portfolio demonstrates my ability to:
- Query and analyze data using SQL.
- Clean messy datasets.
- Build interactive dashboards.
- Perform exploratory data analysis using Python.
- Communicate insights through visualizations.

---

# Tools & Technologies

| Category | Tools |
|---|---|
| Programming | Python, SQL |
| Database | SQL Server |
| Data Analysis | Pandas, NumPy |
| Visualization | Tableau, Power BI, Matplotlib, Seaborn |
| Notebook | Jupyter Notebook |
| Version Control | Git, GitHub |

---

# Repository Structure

```bash
Data-Analyst-Portfolio-Projects/
│
├── Global Covid-19/
│   ├── data/
│   ├── sql-data-exploration/
│   └── tableau/
│
├── Nashville Housing/
│   ├── data/
│   └── sql-data-cleaning/
│
├── Movies/
│   ├── data/
│   └── movie-correlation/
│
├── Road Accident/
│   ├── data/
│   ├── sql/
│   ├── power-bi/
│   └── tableau/
│
└── README.md
```

---

# Projects Overview

# 1. Global Covid-19 Analysis

## Project Overview

This project analyzes global COVID-19 data from [Our World in Data – COVID Deaths Dataset](https://ourworldindata.org/covid-deaths)

### Data Range
- From: **01/01/2020**.
- To: **14/08/2024**.

The project includes:
- SQL Data Exploration.
- Data Analysis.
- Tableau Dashboard Visualization.

---

## Tools Used

- SQL Server.
- Tableau.
- Excel / CSV Data.

---

## Tableau Dashboard Features [Global Covid-19]([https://ourworldindata.org/covid-deaths](https://public.tableau.com/app/profile/tr.n.nh.uy.n.t./viz/GlobalCovid-19_17781804232530/Dashboard1?publish=yes))

### KPI Cards
Summary metrics displayed at the top-left of the dashboard:
- Total Cases.
- Total Deaths.
- Death Percentage.

---

### Bar Chart — Total Death Count Per Continent

Compares total death counts across continents:

- Europe.
- North America.
- Asia.
- South America.
- Africa.
- Oceania.

---

### Choropleth Map — Total Infection by Country

A filled world map visualizing infection levels by country using color intensity.

---

### Line Chart — Percent Population Infected

Displays infection trends over time for multiple countries based on:

- Percentage of population infected.
- Timeline from 2020–2024.

---

### Visual Legends

Dashboard legends help interpret:
- Infection percentage intensity.
- Country line colors.
- Visual comparisons across charts.

---

## Dashboard Summary

The dashboard contains:

- 3 KPI Cards.
- 1 Bar Chart.
- 1 Choropleth Map.
- 1 Line Chart.
- Interactive Legends.

---

# 2️. Nashville Housing Data Cleaning

## Project Overview

This project focuses on cleaning and transforming raw housing data using SQL.

The goal is to prepare messy real-world data for analysis by handling:
- Null values.
- Duplicate records.
- Inconsistent formatting.
- Data standardization.

---

## Skills Demonstrated

- Data Cleaning with SQL.
- String Functions.
- Joins.
- CTEs.
- Data Transformation.
- Handling Missing Data.

---

## Cleaning Tasks Performed

- Standardized date formats.
- Populated missing property addresses.
- Split address columns into individual fields.
- Removed duplicates.
- Converted data types.
- Deleted unused columns.

---

# 3️. Movies Correlation Analysis

## Project Overview

This project explores movie industry data from Kaggle: [Movies Dataset on Kaggle](https://www.kaggle.com/datasets/danielgrijalvas/movies)

The analysis investigates relationships between movie features such as:
- Budget.
- Gross Revenue.
- Votes.
- Runtime.
- Score.

to determine which variables have the strongest correlation with movie success.

---

## Tools Used

- Python.
- Pandas.
- NumPy.
- Matplotlib.
- Seaborn.
- Jupyter Notebook.

---

## Analysis Workflow

### 1. Data Cleaning
- Handling missing values.
- Removing duplicates.
- Formatting columns.

### 2. Exploratory Data Analysis (EDA)
- Distribution analysis.
- Trend exploration.
- Outlier detection.

### 3. Correlation Analysis
- Pearson correlation.
- Correlation matrix heatmap.
- Feature relationship analysis.

---

## Key Insights

- Budget and gross revenue show strong positive correlation.
- Votes are positively related to revenue.
- Some variables show weak or minimal correlation with success.

---

# 4. Road Accident Analysis Dashboard

## Project Overview

This project analyzes road accident and casualty data to identify accident trends, casualty severity, road conditions, and vehicle involvement.

The project combines:

- SQL data querying and analysis.
- Power BI dashboard development.
- Tableau dashboard visualization.
- Interactive business intelligence reporting.

The SQL scripts are used to generate statistical results and metrics displayed in both the Tableau and Power BI dashboards.

---

## Tools Used

- SQL Server.
- Power BI.
- Tableau.
- Excel / CSV Data.

---

## Dashboard Features

### KPI Cards

Key accident statistics displayed in dashboard summary cards:

- Total Casualties
- Total Accidents
- Fatal Casualties
- Serious Casualties
- Slight Casualties

---

### Vehicle Type Analysis

Analyzes casualties by vehicle categories:

- Cars
- Bikes
- Buses
- Vans
- Agricultural Vehicles
- Other Vehicles

---

### Road Type Analysis

Breakdown of casualties across different road types:

- Single carriageway
- Dual carriageway
- Roundabout
- One-way street
- Slip road

---

### Weather & Road Surface Analysis

Visualizes accident severity and casualty distribution based on:

- Weather conditions
- Road surface conditions
- Wet vs Dry roads
- Snow / Ice conditions

---

### Urban vs Rural Analysis

Compares accident casualties between:

- Urban Areas
- Rural Areas

---

### Day vs Night Analysis

Evaluates accident distribution under:

- Daylight conditions
- Dark / Night conditions

---

### Location-Based Accident Mapping

Interactive maps showing accident hotspots and casualty distributions across the United Kingdom.

---

## Dashboard Insights

Some important insights discovered from the analysis:

- Cars account for the highest number of casualties
- Most accidents occur on single carriageway roads
- Urban areas have significantly higher casualty counts than rural areas
- Daytime accidents are more common than nighttime accidents
- Dry road conditions account for the majority of reported casualties

---

# How to Use

## Clone the Repository

```bash
git clone https://github.com/totrannhauyen/Data-Analyst-Portfolio-Projects.git
```

## Navigate Through Projects

Each folder contains:
- SQL scripts.
- Jupyter notebooks.
- Dataset files.
- Tableau visualizations.
- Power BI dashboards.

---

# Learning Goals

Through these projects, I practiced:

- Writing advanced SQL queries.
- Cleaning real-world datasets.
- Creating professional dashboards.
- Performing exploratory data analysis.
- Building data storytelling skills.
- Developing business intelligence dashboards with Power BI and Tableau.

---

# Acknowledgements

Special thanks to [Alex The Analyst](https://www.youtube.com/@AlexTheAnalyst) and [Data Tutorials](https://www.youtube.com/@datatutorials1) for providing valuable tutorials and guidance throughout my data analytics learning journey.

---

# Contact

## GitHub
[github.com/totrannhauyen](https://github.com/totrannhauyen)

## LinkedIn
[linkedin.com/in/ttrnhu](https://www.linkedin.com/in/ttrnhu)

---

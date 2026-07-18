# Movie Data Project Plan

## 1. Understand the Data
The `movie_data.xlsx` contains the following columns:  
- **movie title**  
- **release date**  
- **wikipedia url**  
- **genre1**, **genre2**  
- **director1**, **director2**  
- **cast1**, **cast2**, **cast3**, **cast4**, **cast5**  
- **budget**  
- **box office revenue**  

This data will need normalization for SQL analysis.

---

## 2. Project Goals
### 2.1 Movie Dashboard (Excel)
- KPIs: total movies, avg. budget, avg. box office, profit/loss  
- Genre distribution charts  
- Top directors or actors by revenue  
- Trends over time (release year vs revenue)  

### 2.2 SQL Database
- Normalize data into tables:
  - `movies` (title, release date, budget, revenue, url)  
  - `genres` (linked by movie_id)  
  - `directors` (linked by movie_id)  
  - `casts` (linked by movie_id)  
- Queries to explore:
  - Which director has the highest-grossing films?  
  - Which actors appear most frequently?  
  - Which genre has the best average ROI (revenue/budget)?  

### 2.3 Excel–SQL Connection
- Store cleaned dataset in SQL  
- Use Excel to connect and visualize (pivot tables, dashboards)  

---

## 3. Data Cleaning & Structuring Plan
1. **Excel Cleaning**
   - Ensure dates are in proper `yyyy-mm-dd` format  
   - Remove duplicates  
   - Standardize genres (e.g., "Sci-fi" → "Science Fiction")  
   - Standardize names for actors and directors  

2. **Split Into SQL Tables**
- Create a `movie_id` key  
- Separate many-to-many relationships:  
  - `movie_genres` table  
  - `movie_directors` table  
  - `movie_cast` table  

**Example structure:**  

**movies**
| movie_id | title | release_date | budget | revenue | wiki_url |

**movie_genres**
| movie_id | genre |

**movie_directors**
| movie_id | director |

**movie_cast**
| movie_id | actor |

---

## 4. Analysis Ideas
- Profitability = `revenue - budget`  
- ROI % = `(revenue / budget) * 100`  
- Which genres have the best profitability  
- Which directors/actors work together often  
- Revenue trends by decade/year  
- Outliers: huge successes or big losses  

---

## 5. Tools & Workflow
- **Excel** → Data cleaning, pivot tables, dashboards  
- **SQL (SQLite/MySQL)** → Storage, queries, normalization  
- (Optional) Python/Power BI/Tableau for advanced visuals
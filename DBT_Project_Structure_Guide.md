
# 🗂️ DBT Project Structure & Purpose (Data Engineer Guide)

This document explains the structure of a DBT project folder and the purpose of each file/folder from a **data engineering** perspective.

---

## 📁 Example Structure

```plaintext
dbtdemo1/
├── analyses/
├── logs/
├── macros/
├── models/
│   ├── schema.yml
│   ├── my_first_dbt_model.sql
│   └── my_second_dbt_model.sql
├── seeds/
├── snapshots/
├── target/
├── tests/
├── dbt_project.yml
├── requirements.txt
└── README.md
```

---

## 🔍 Folder & File Descriptions

### 1. `dbt_project.yml`
- **Main configuration file** for the project
- Defines project name, model paths, profile, and clean targets

---

### 2. `models/`
- **Core SQL models**
- Materialized as views/tables/incremental
- Contains `schema.yml` for metadata and tests

---

### 3. `tests/`
- Custom **SQL-based tests**
- For advanced data validation scenarios

---

### 4. `analyses/`
- Ad-hoc and exploratory SQL scripts
- Not materialized into warehouse

---

### 5. `macros/`
- Jinja macros (like functions) for **reusable SQL logic**
- Helps reduce code repetition

---

### 6. `seeds/`
- CSV files to be loaded as static tables
- Ideal for lookups or static reference data

---

### 7. `snapshots/`
- Used for **Slowly Changing Dimensions (SCD)**
- Tracks history of changing data

---

### 8. `target/`
- Compiled SQL and run artifacts (auto-generated)
- Safe to ignore or clean

---

### 9. `logs/`
- Logs from `dbt run`, `dbt test`, etc.
- Useful for debugging

---

### 10. `README.md`
- Project overview and developer guide
- Write how to set up and use this project

---

### 11. `requirements.txt`
- Python dependency list
- Ensures consistent dev environments

---

## ✅ Summary Table

| Folder/File       | What It Does                                | Real-World Purpose                          |
|------------------|---------------------------------------------|---------------------------------------------|
| `models/`         | SQL transformations                         | Business logic and core data models         |
| `tests/`          | SQL tests                                   | Ensure data quality and validation          |
| `snapshots/`      | Historical tracking                         | For slowly changing dimensions (SCD)        |
| `macros/`         | Jinja utilities                             | Reusable logic (like Python functions)      |
| `seeds/`          | CSV uploads                                 | Static reference/look-up tables             |
| `analyses/`       | Ad-hoc SQLs                                 | Analysis without affecting pipelines        |
| `target/`         | Compiled files                              | Auto-generated — for debugging              |
| `logs/`           | Execution logs                              | Helps with tracing issues                   |
| `dbt_project.yml` | Main project config                         | Controls paths, profiles, materializations  |
| `README.md`       | Docs for team                               | Quick onboarding guide                      |
| `requirements.txt`| Python environment                         | Reproduce dbt environment                   |

---

💡 Use this guide while navigating or building a DBT project to understand what each folder is responsible for.

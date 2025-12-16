# Azure Synapse Data Warehouse (End-to-End ELT)

## Overview
- Lands raw data in Azure Data Lake Storage Gen2
- Uses Azure Data Factory to copy curated data into Azure Synapse
- Transforms data with dbt models into dimensional marts
- Publishes a lightweight demo page under `docs/` for GitHub Pages

## Architecture
- Sources → ADLS Gen2 (raw) → ADF Copy → Synapse (curated) → dbt models → BI

## Prerequisites
- Azure subscription with ADLS Gen2, Synapse Workspace, Data Factory
- Local machine with `git`, `dbt` (Core), and Python
- Access keys stored in Azure Key Vault or environment variables

## Folder Structure
- `adf/adf_pipeline.json`: ADF pipeline (Copy to Synapse and dbt run step)
- `synapse/synapse_tables.sql`: Curated table DDL in Synapse
- `dbt/dbt_project.yml`: dbt project config
- `dbt/models/dim_customers.sql`: Example dbt model
- `dbt/profiles.example.yml`: Example dbt profile (do not commit secrets)
- `docs/index.html`: GitHub Pages demo site

## Setup Steps
- Create ADLS Gen2 containers: `raw`, `curated`
- Upload sample CSVs to `raw/sales/` and `raw/customers/`
- In Synapse, run `synapse/synapse_tables.sql`
- Import `adf/adf_pipeline.json` into Azure Data Factory
- Configure ADF linked services: ADLS Gen2 and Synapse
- Set ADF dataset mappings from `raw` to `curated` tables
- Trigger ADF pipeline run and verify loads in Synapse

## dbt
- Copy `dbt/profiles.example.yml` to `~/.dbt/profiles.yml` and set credentials
- From `dbt/`, run:
```
dbt deps
dbt run
dbt test
```

## GitHub
- Initialize and push to your repo:
```
git init
git add .
git commit -m "Azure Synapse ELT project"
git branch -M main
git remote add origin https://github.com/lenindeveloper/azure-synapse-warehouse.git
git push -u origin main
```

## GitHub Pages
- Ensure `docs/index.html` exists
- In GitHub → Settings → Pages:
  - Source: Deploy from a branch
  - Branch: `main`, Folder: `/docs`
- Open: `https://lenindeveloper.github.io/azure-synapse-warehouse/`

## Portfolio Wiring
- Use the Pages URL in your portfolio’s `live_demo_link` and `demo_url`

## Notes
- Keep secrets out of source control; prefer Key Vault or environment variables

# run.ps1

# Set your virtual environment path
$venvPath = "D:\Rajendra-Tech\GitHubRepos\DBT-Learn-by-Doing\dbt_env\Scripts\Activate.ps1"

# Activate the virtual environment
Write-Host "Activating virtual environment..."
& $venvPath

# Navigate to your dbt project directory
cd "D:\Rajendra-Tech\GitHubRepos\DBT-Learn-by-Doing\dbtdemo_sqlserver"

# Debug to check connection
Write-Host "`n--- Running dbt debug ---`n"
dbt debug --profile dbtdemo_sqlserver

# Run models
Write-Host "`n--- Running dbt run ---`n"
dbt run --select test_selected_skills

# Run tests
Write-Host "`n--- Running dbt test ---`n"
dbt test --select test_selected_skills

# (Optional) Generate and serve docs
# Write-Host "`n--- Generating docs ---`n"
# dbt docs generate
# Write-Host "`n--- Serving docs ---`n"
# dbt docs serve

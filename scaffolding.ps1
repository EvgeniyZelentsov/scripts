param (    
    [string]$contextDir = 'Context',
    [string]$outputDir = 'Entities',
    [string]$contextName = 'TestDbContext'
)

Write-Output "--context-dir set as $contextDir"
Write-Output "--output-dir set as $outputDir"
Write-Output "--context set as $contextName"
Write-Output "User ID set as ${env:zelen-sqlserver-user}"
Write-Output "Password set as ${env:zelen-sqlserver-password}"

$connectionString = "Server=localhost,1433;DataBase=test;User ID=${env:zelen-sqlserver-user};Password=${env:zelen-sqlserver-password};TrustServerCertificate=True"

Write-Output "connection string set as $connectionString"

dotnet ef dbcontext scaffold "$connectionString" Microsoft.EntityFrameworkCore.SqlServer `
    --context "$contextName" `
    --context-dir "$contextDir" `
    --output-dir "$outputDir" `
    --force
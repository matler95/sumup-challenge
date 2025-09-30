import duckdb
import pandas as pd

con = duckdb.connect('dev.duckdb')

# Use fetch_df() and convert all columns to string
df = con.execute("SELECT * FROM raw_transactions").fetchdf()

# Ensure numeric-looking columns are treated as strings
for col in ['product_sku', 'card_number']:
    df[col] = df[col].astype(str)

print(df.head())

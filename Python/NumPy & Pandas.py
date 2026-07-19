import pandas as pd
import numpy as np

# ---------------- Q1: Load dataset, display first 5 rows and info ----------------
df = pd.read_csv('retail_dataset .csv')
print(df.head())
print(df.info())

# ---------------- Q2: Check missing values ----------------
print(df.isnull().sum())
print(df.isnull().sum().sum())

# ---------------- Q3: Fill missing Quantity and Price with mean ----------------
df['Quantity'] = df['Quantity'].fillna(df['Quantity'].mean())
df['Price'] = df['Price'].fillna(df['Price'].mean())

# ---------------- Q4: Drop rows with missing Product Category or Region ----------------
df = df.dropna(subset=['Product Category', 'Region'])

# ---------------- Q5: Create Revenue column using NumPy ----------------
df['Revenue'] = np.multiply(df['Quantity'].values, df['Price'].values)
print(df.head())

# ---------------- Q6: Total revenue using NumPy ----------------
total_revenue = np.sum(df['Revenue'].values)
print("Total Revenue:", total_revenue)

# ---------------- Q7: Revenue grouped by Product Category ----------------
category_revenue = df.groupby('Product Category')['Revenue'].sum().sort_values(ascending=False)
print(category_revenue)

# ---------------- Q8: Top 3 and Bottom 3 categories by revenue ----------------
print("Top 3:\n", category_revenue.head(3))
print("Bottom 3:\n", category_revenue.tail(3))

# ---------------- Q9: Revenue grouped by Region ----------------
region_revenue = df.groupby('Region')['Revenue'].sum().sort_values(ascending=False)
print(region_revenue)
print("Highest region:", region_revenue.idxmax())
print("Lowest region:", region_revenue.idxmin())

# ---------------- Q10: Monthly revenue and statistics ----------------
df['Date'] = pd.to_datetime(df['Date'], format='%d-%m-%Y')
df['Month'] = df['Date'].dt.month

monthly_revenue = df.groupby('Month')['Revenue'].sum()
print(monthly_revenue)

print("Mean:", np.mean(df['Revenue'].values))
print("Median:", np.median(df['Revenue'].values))
print("Std Dev:", np.std(df['Revenue'].values))
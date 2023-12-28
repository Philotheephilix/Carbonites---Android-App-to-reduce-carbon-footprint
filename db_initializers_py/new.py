import random
from pymongo import MongoClient

# Sample data
categories = ['Food', 'Travel', 'Goods', 'Lifestyle','Healthcare','Loan',"Service",]
months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
customer="nirmal"
# Function to generate random transaction
def generate_random_transaction():
  # Replace this with your logic to generate customer names
    email = customer+"@example.com"  # Replace this with your logic to generate emails
    password = customer+"@123"  # Replace this with your logic to generate passwords
    category = random.choice(categories)
    month = random.choice(months)
    date = round(random.uniform(1, 31))
    year = round(random.uniform(2023,2023))
    amount = round(random.uniform(10.0, 1000.0), 2)  # Generates a random amount between 10.0 and 200.0
    year = round(random.uniform(1, 31))  # Generates a random amount between 10.0 and 200.0
    return {
        "category": category,
        "amount": amount,
        "month": month,
        'date': date,
        'year' : year
    }

# Connect to MongoDB
client = MongoClient("mongodb+srv://maintainer_philix:qwertyuiop@carbonpi.hiozz58.mongodb.net/?retryWrites=true&w=majority")  # Replace with your MongoDB connection details
db = client['Project-X']  # Replace 'your_database' with your database name
collection = db[str(customer)]  # Replace 'your_collection' with your collection name
for i in range(200):
# Generate a random transaction
    random_transaction = generate_random_transaction()

# Insert the random transaction into MongoDB collection
    collection.insert_one(random_transaction)
    print(i)

# Close the MongoDB connection
client.close()

import pandas as pd
from pymongo import MongoClient

# Read the CSV file using pandas
data = pd.read_csv('customer_transactions.csv')

# Convert the data to a list of dictionaries
records = data.to_dict(orient='records')

# Connect to MongoDB
client = MongoClient("mongodb+srv://maintainer_philix:qwertyuiop@carbonpi.hiozz58.mongodb.net/?retryWrites=true&w=majority")  # Replace with your MongoDB connection details
db = client['Project-X']  # Replace 'your_database' with your database name
collection = db['customerdata']  # Replace 'your_collection' with your collection name
print(db,collection)
# Insert the records into MongoDB collection
#collection.insert_many(records)
print(collection.find_one({"customer":"Oliver"}))

# Close the MongoDB connection
client.close()

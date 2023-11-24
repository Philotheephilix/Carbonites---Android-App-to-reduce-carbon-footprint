import csv
import random

def generate_transactions(customer_names, categories, num_transactions,month):
    transactions = []

    for _ in range(num_transactions):
        customer = random.choice(customer_names)
        email=customer+"@gmail.com"
        category = random.choice(categories)
        amount = round(random.uniform(10, 200), 2)  # Random amount between 10 and 200
        month = int(round(random.uniform(1,12),0))
        transactions.append({
            'customer': customer,
            'email':email,
            "pass": customer+"@123",
        })

    return transactions

def main():
    month=["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    customer_names = ["philo", "nirmal", "juanita", "sasidaran", "rihana"]
    print(len(customer_names))
    categories = ['Grocery', 'Lifestyle', 'Electronics', 'Fashion','medicine','Loan']

    num_transactions = 5
    transactions = generate_transactions(customer_names, categories, num_transactions,month)

    # Writing the dataset to a CSV file
    with open('customer_transactions.csv', 'w', newline='') as csvfile:
        fieldnames = ['customer','email','pass', 'category', 'amount','month']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

        writer.writeheader()
        for transaction in transactions:
            writer.writerow(transaction)

if __name__ == "__main__":
    main()

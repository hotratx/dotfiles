import csv

# Open the CSV file for reading
with open('path/to/your/file.csv', mode='r', newline='') as file:
    # Read the CSV file
    reader = csv.reader(file)
    import csv
    
    # Open the CSV file for reading
    with open('path/to/your/file.csv', mode='r', newline='') as file:
        # Read the CSV file
        reader = csv.reader(file)
        # Print each row in the CSV
    for row in reader:
        print(row)


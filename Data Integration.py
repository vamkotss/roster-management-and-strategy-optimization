from datetime import timedelta
import mysql.connector as mysql
from pymongo import MongoClient
import sys
from decimal import Decimal
from bson.decimal128 import Decimal128

def convert_decimal(value):
    """Convert Decimal to MongoDB-compatible Decimal128"""
    if isinstance(value, Decimal):
        return Decimal128(str(value))
    return value

def convert_timedelta(value):
    """Convert timedelta to seconds for MongoDB storage"""
    if isinstance(value, timedelta):
        return value.total_seconds()
    return value

def transfer_data(batch_size=1000):
    mysql_conn = None
    mysql_cursor = None
    mongo_client = None

    try:
        # MySQL Connection
        mysql_conn = mysql.connect(
            host="localhost",
            user="root",
            password="123456",
            database="bruins_project",
            charset='utf8mb4',
            use_pure=True
        )

        mysql_cursor = mysql_conn.cursor(buffered=True)

        # Get total count
        mysql_cursor.execute("SELECT COUNT(*) FROM venue")
        total_records = mysql_cursor.fetchone()[0]
        print(f"Total records to transfer: {total_records}")

        # Get column names
        mysql_cursor.execute("SELECT * FROM venue LIMIT 0")
        columns = [desc[0] for desc in mysql_cursor.description]

        # MongoDB Connection
        mongo_client = MongoClient(
            "mongodb+srv://jadhavsaurabh360:369123Broly@cluster0.dld3p.mongodb.net/",
            serverSelectionTimeoutMS=5000
        )
        mongo_db = mongo_client["BRUINS_DB"]
        mongo_collection = mongo_db["Venue"]

        # Clear existing data
        mongo_collection.delete_many({})

        # Batch processing
        offset = 0
        while offset < total_records:
            mysql_cursor.execute(f"SELECT * FROM venue LIMIT {batch_size} OFFSET {offset}")
            batch = mysql_cursor.fetchall()

            if not batch:
                break

            # Convert to documents with both decimal and timedelta handling
            documents = []
            for row in batch:
                doc = {}
                for col, val in zip(columns, row):
                    # Apply both conversions in sequence
                    val = convert_timedelta(val)  # First convert timedelta
                    val = convert_decimal(val)    # Then convert decimal
                    doc[col] = val
                documents.append(doc)

            # Insert batch
            if documents:
                mongo_collection.insert_many(documents)

            offset += batch_size
            print(f"Processed {min(offset, total_records)}/{total_records} records")

        # Verify counts
        final_count = mongo_collection.count_documents({})
        print(f"\nFinal verification:")
        print(f"MySQL records: {total_records}")
        print(f"MongoDB records: {final_count}")

        if total_records == final_count:
            print("✓ Transfer completed successfully!")
        else:
            print("✗ Transfer incomplete - counts don't match")

    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)
    finally:
        try:
            if mysql_cursor:
                mysql_cursor.close()
            if mysql_conn:
                mysql_conn.close()
            if mongo_client:
                mongo_client.close()
            print("Connections closed successfully")
        except Exception as e:
            print(f"Error closing connections: {e}")

if __name__ == "__main__":
    try:
        transfer_data()
    except KeyboardInterrupt:
        print("\nTransfer interrupted by user")
        sys.exit(1)
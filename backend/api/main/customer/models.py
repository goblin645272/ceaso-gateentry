"""Application Models"""
import bson, os
from dotenv import load_dotenv
from pymongo import MongoClient

load_dotenv()

DATABASE_URL=os.environ.get('DATABASE_URL') or 'mongodb+srv://ceasowrath:Rizq7tkT2RmmWn37@cluster0.t1ez4iv.mongodb.net/gateentry?retryWrites=true&w=majority'
client = MongoClient(DATABASE_URL)
db = client.gateentry

class Customer:
    """Customer Model"""
    def __init__(self):
        return

    def create(self, name="", address=""):
        """Create a new Customer"""
        customer = self.get_by_name_and_address(name, address)
        if customer:
            return customer
        new_customer = db.customers.insert_one(
            {   
                "name": name,
                "address": address
            }
        )
        return self.get_by_id(new_customer.inserted_id)

    def get_all(self):
        """Get all customers"""
        customers = db.customers.find({})
        return [{**customer, "_id": str(customer["_id"])} for customer in customers]

    def get_by_id(self, customer_id):
        """Get a customer by id"""
        customer = db.customers.find_one({"_id": bson.ObjectId(customer_id)})
        if not customer:
            return
        customer["_id"] = str(customer["_id"])
        customer.pop("password")
        return customer



    def get_by_name_and_address(self, name, address = ""):
        """Get a customer by name and address"""
        customer = db.customers.find_one(
            {
                "name": name, 
                "address": address if address!="" else None
            }
        )
        if not customer:
            return
        customer["_id"] = str(customer["_id"])
        return customer

    def update(self, customer_id, name=""):
        """Update a customer"""
        data = {}
        if name:
            data["name"] = name
        customer = db.customers.update_one(
            {"_id": bson.ObjectId(customer_id)},
            {
                "$set": data
            }
        )
        customer = self.get_by_id(customer_id)
        return customer

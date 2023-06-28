"""Application Models"""
import bson, os, datetime
from dotenv import load_dotenv
from pymongo import MongoClient

from main.user.models import User

load_dotenv()

DATABASE_URL=os.environ.get('DATABASE_URL') or 'mongodb+srv://ceasowrath:Rizq7tkT2RmmWn37@cluster0.t1ez4iv.mongodb.net/gateentry?retryWrites=true&w=majority'
client = MongoClient(DATABASE_URL)
db = client.gateentry


class Entry:
    """Entry Model"""
    def __init__(self):
        return

    def create(self,userid, gateEntryNumber,created_name, recieving_details="", shipping_details={}, customer_details="", items_list=[],comments=""):
        if len(items_list) == 0:
            return
        """Create a new gate entry"""
        new_entry = db.entries.insert_one(
            {
                "uniqueId": gateEntryNumber,
                "recieving_details": recieving_details,
                "shipping_details": shipping_details,
                "customer_details": customer_details,
                "items_list": items_list,
                "created_name": created_name,
                "comments": comments,
                "createdBy": userid,
                "timestamp": datetime.datetime.now().isoformat()
            }
        )
        return self.get_by_id(new_entry.inserted_id)
    
    def update(self,id, employee_code):
        """Update a gate entry"""
        db.entries.update_one(
            {"_id": bson.ObjectId(id)},
             {
               "$set":{ 
                   "collection_details": {
                    "employee_name": f"{str(employee_code)} ({User().get_by_employee_code(int(employee_code))['name']})",
                    "timestamp": datetime.datetime.now().isoformat()
                    }
                }
            }
        )
        return self.get_by_id(id)

    def get_all(self):
        """Get all entries"""
        entries = db.entries.find({})
            
        return [{**entry, "_id": str(entry["_id"])} for entry in entries]

    def get_by_id(self, entry_id):
        """Get a entry by id"""
        entry = db.entries.find_one({"_id": bson.ObjectId(entry_id)})
        if not entry:
            return
        entry["_id"] = str(entry["_id"])
        return entry

    def get_by_user_id(self, user_id):
        """Get all entries created by a user"""
        entries = db.entries.find({"user_id": user_id})
        
        return [{**entry, "_id": str(entry["_id"])} for entry in entries]

"""Application Models"""
import bson, os
from dotenv import load_dotenv
from pymongo import MongoClient
from werkzeug.security import generate_password_hash, check_password_hash
load_dotenv()

DATABASE_URL=os.environ.get('DATABASE_URL') or 'mongodb+srv://ceasowrath:Rizq7tkT2RmmWn37@cluster0.t1ez4iv.mongodb.net/gateentry?retryWrites=true&w=majority'
client = MongoClient(DATABASE_URL)
db = client.gateentry


class User:
    """User Model"""
    def __init__(self):
        return

    def create(self, name="",employee_code="", email="", password="", collection_auth=False):
        """Create a new user"""
        user = self.get_by_employee_code(employee_code)
        if user:
            return
        new_user = db.users.insert_one(
            {
                "name": name,
                "email": email,
                "employee_code": employee_code,
                "password": self.encrypt_password(password),
                "collection_auth": collection_auth
            }
        )
        return self.get_by_id(new_user.inserted_id)

    def get_all(self):
        """Get all users"""
        users = db.users.find({"collection_auth": True})
        return [{**user, "_id": str(user["_id"]), "password": None} for user in users]

    def get_by_id(self, user_id):
        """Get a user by id"""
        user = db.users.find_one({"_id": bson.ObjectId(user_id)})
        if not user:
            return
        user["_id"] = str(user["_id"])
        user.pop("password")
        return user

   

    def get_by_email(self, email):
        """Get a user by email"""
        user = db.users.find_one({"email": email})
        if not user:
            return
        user["_id"] = str(user["_id"])
        return user
    
    def get_by_employee_code(self, employee_code):
        """Get a user by employee_code"""
        user = db.users.find_one({"employee_code": employee_code})
        if not user:
            return
        user["_id"] = str(user["_id"])
        return user

    def update(self, user_id, name=""):
        """Update a user"""
        data = {}
        if name:
            data["name"] = name
        user = db.users.update_one(
            {"_id": bson.ObjectId(user_id)},
            {
                "$set": data
            }
        )
        user = self.get_by_id(user_id)
        return user

   

    def encrypt_password(self, password):
        """Encrypt password"""
        return generate_password_hash(password)

    def login(self, employee_code, password):
        """Login a user"""
        user = self.get_by_employee_code(employee_code)
        if not user or not check_password_hash(user["password"], password):
            return
        user.pop("password")
        return user

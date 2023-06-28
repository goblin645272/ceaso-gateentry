from flask import Blueprint, jsonify, request
from main.auth import token_required
from main.customer.models import Customer
from main.entry.models import Entry
from main.user.models import User
from main.validation import  validate_add_entry

customer_blueprint = Blueprint("customer", __name__)

@customer_blueprint.route("/", methods=["GET"])
@token_required
def get_all_customers(current_user):
    customers = Customer().get_all()
    return jsonify({
        "message": "successfully retrieved user profile",
        "data": customers
    })


@customer_blueprint.route("/add", methods=["POST"])
@token_required
def addEntry(current_user):
    try:
        data = request.json
        if not data:
            return {
                "message": "Please provide entry details",
                "data": None,
                "error": "Bad request"
            }, 400
        # validate input
        is_validated = validate_add_entry(created_by=current_user['_id'], **request.json)
        
        if is_validated is not True:
            return dict(message='Invalid data', data=None, error=is_validated), 400
        entry = Entry().create(userid=current_user['_id'], **request.json)
        if entry:
            try:
                return {
                    "message": "Successfully created a entry",
                    "data": entry
                }
            except Exception as e:
                return {
                    "error": "Something went wrong",
                    "message": str(e)
                }, 500
        return {
            "message": "Error creating entry, form validation failed",
            "data": None,
            "error": "Validation failed"
        }, 404
    except Exception as e:
        return {
                "message": "Something went wrong!",
                "error": str(e),
                "data": None
        }, 500
    

@customer_blueprint.route("/update", methods=["PUT"])
@token_required
def updateEntry(current_user):
    try:
        user = request.json
        if user.get("name"):
            user = User().update(current_user["_id"], user["name"])
            return jsonify({
                "message": "successfully updated account",
                "data": user
            }), 201
        return {
            "message": "Invalid data, you can only update your account name!",
            "data": None,
            "error": "Bad Request"
        }, 400  
    except Exception as e:
        return jsonify({
            "message": "failed to update account",
            "error": str(e),
            "data": None
        }), 400


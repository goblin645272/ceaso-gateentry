import datetime, json
from flask import Blueprint, jsonify, request
from flask import current_app as app
from main.auth import token_required
from main.customer.models import Customer
from main.entry.models import Entry
from main.validation import  validate_add_entry


entry_blueprint = Blueprint("entry", __name__)

@entry_blueprint.route("/", methods=["GET"])
@token_required
def get_all_entries(current_user):
    return jsonify({
        "message": "successfully retrieved user profile",
        "data": [{**entry, "createdBy": None} for entry in Entry().get_all()]
    })


@entry_blueprint.route("/add", methods=["POST"])
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
        
        Customer().create(
            name=request.json['customer_details']['name'],
            address=request.json['customer_details']['address']
        )

        entries =Entry().get_all()
 
        gateEntryNumber = "QBD/"
        str_value = str(len(entries) + 1)
        pad = "0000"
        ans = pad[:len(pad) - len(str_value)] + str_value

        today = datetime.datetime.now()
        if today.month > 2:
            gateEntryNumber += str(today.year)[-2:] + "-" + str(today.year + 1)[-2:]
        else:
            gateEntryNumber += str(today.year - 1)[-2:] + "-" + str(today.year)[-2:]

        gateEntryNumber += "/" +today.strftime("%b").upper() + "/" +ans

        entry = Entry().create(userid=current_user['_id'], created_name= current_user['name'], gateEntryNumber=gateEntryNumber, **request.json, )
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
    

@entry_blueprint.route("/update", methods=["PUT"])
@token_required
def updateEntry(current_user):
    try:
        data = request.json
        print(data)
        entry = Entry().update(id=data["_id"], employee_code=data["employee_code"])
        return jsonify({
            "message": "successfully updated entry",
            "data": entry
        }), 201
        
    except Exception as e:
        return jsonify({
            "message": "failed to update entry",
            "error": str(e),
            "data": None
        }), 400


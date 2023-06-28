from flask import Blueprint, jsonify, request
from flask import current_app as app
from main.auth import token_required
from main.user.models import User
from main.validation import  validate_user, validate_employee_code_and_password
import jwt

user_blueprint = Blueprint("user", __name__)

@user_blueprint.route("/", methods=["GET"])
@token_required
def get_current_user(current_user):
    return jsonify({
        "message": "successfully retrieved user profile",
        "data": current_user    
    })

@user_blueprint.route("/get-all", methods=["GET"])
@token_required
def get_all_users(current_user):
    users = User().get_all()
    return jsonify({
        "message": "successfully retrieved user profile",
        "data": users
    })


@user_blueprint.route("/", methods=["POST"])
def add_user():
    try:
        user = request.json
        if not user:
            return {
                "message": "Please provide user details",
                "data": None,
                "error": "Bad request"
            }, 400
        is_validated = validate_user(**user)
        if is_validated is not True:
            return dict(message='Invalid data', data=None, error=is_validated), 400
        user = User().create(**user)
        if not user:
            return {
                "message": "User already exists",
                "error": "Conflict",
                "data": None
            }, 409
        return {
            "message": "Successfully created new user",
            "data": user
        }, 201
    except Exception as e:
        return {
            "message": "Something went wrong",
            "error": str(e),
            "data": None
        }, 500


@user_blueprint.route("/login/", methods=["POST"])
def login():
    try:
        data = request.json
        if not data:
            return {
                "message": "Please provide user details",
                "data": None,
                "error": "Bad request"
            }, 400
        # validate input
        is_validated = validate_employee_code_and_password(data.get('employee_code'), data.get('password'))
        
        if is_validated is not True:
            return dict(message='Invalid data', data=None, error=is_validated), 400
        user = User().login(
            data["employee_code"],
            data["password"]
        )
        if user:
            try:
                # token should expire after 24 hrs
                user["token"] = jwt.encode(
                    {"user_id": user["_id"]},
                    app.config["SECRET_KEY"],
                    algorithm="HS256"
                )
                return {
                    "message": "Successfully fetched auth token",
                    "data": user
                }
            except Exception as e:
                return {
                    "error": "Something went wrong",
                    "message": str(e)
                }, 500
        return {
            "message": "Error fetching auth token!, invalid Employee code or password",
            "data": None,
            "error": "Unauthorized"
        }, 404
    except Exception as e:
        return {
                "message": "Something went wrong!",
                "error": str(e),
                "data": None
        }, 500
    

@user_blueprint.route("/", methods=["PUT"])
@token_required
def update_user(current_user):
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


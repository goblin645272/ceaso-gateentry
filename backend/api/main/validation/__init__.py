"""Validator Module"""
import re


def validate(data, regex):
    """Custom Validator"""
    return True if re.match(regex, data) else False

def validate_password(password: str):
    """Password Validator"""
    reg = r"\b^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!#%*?&]{8,20}$\b"
    return validate(password, reg)

def validate_email(email: str):
    """Email Validator"""
    regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
    return validate(email, regex)

def validate_employee_code(employee_code: int):
    """Employee code Validator"""
    return isinstance(employee_code, int)

def validate_string(item: str):
    """String item Validator"""
    return isinstance(item, str)

def validate_shipping_details(**args):
    """Shipping Details Validator"""
    if not args.get('type_of_shipment'):
        print("hdwaa")
        return {
            'type_of_shipment': "type_of_shipment is required",
        }
    if args.get("type_of_shipment") == "By courier":
        if not args.get('courier_name') or not args.get('name'):
            return {
                'courier_name': "courier_name is required",
                'name': 'name is required'
            }
        if not isinstance(args.get('courier_name'), str) or not isinstance(args.get('name'), str):
            return {
                'courier_name': 'Courier name must be a string',
                'name': 'Name is must be a string',
            }
    else:
        if not args.get('name'):
            return {
                'name': 'name is required'
            }
    return True

def validate_customer_details(**args):
    """Customer Details Validator"""
    if  not args.get('name') or not args.get('address'):
        return {
            'name': 'Name is required',
            'address': 'address is required',
        }
    if not isinstance(args.get('name'), str) or not isinstance(args.get('address'), str):
        return {
            'name': 'Name must be a string',
            'address': 'address is must be a string',
        }
    return True


def validate_item(**args):
    """Item Validator"""
    if not args.get('description') or not args.get('pack_quantity'):
        return {
            "description": "Description is required",
            "pack_quantity": "pack_quantity is required",
        }
    description_valid = validate_string(args.get('description'))
    pack_quantity_valid = isinstance(args.get('pack_quantity'), int)

    if not description_valid or not pack_quantity_valid:
        return {
            "description": "Description must be a string",
            "pack_quantity": "pack_quantity must be a int",
        }
    return True


def validate_items_list(args):
    """Items List validator"""
    if not args:
        return {
            "items_list": 'items_list is required'
        }
    if args and not isinstance(args, list):
        return {
            "items_list": 'items_list should be an array of items objects'
        }
    for item in args:
        isValid = validate_item(**item)
        if isValid is False:
            return {
                "items_list": f"An Item with description ${item['description']} is not valid in items_list"
            }
    return True


def validate_add_entry(**args):
    """Add Entry Validation"""
    if not args.get("recieving_details") or not args.get('shipping_details') or not args.get('customer_details') or not args.get('items_list') or not args.get('comments') or not args.get('created_by'):
        return {
            "recieving_details": "Recieving Details are Required",
            "shipping_details": "Shipping details are required",
            "customer_details": "Customer details are required",
            "items_list": "Item's list is required",
            "comments": "Comments field cannot be empty.",
            "created_by": "Created by user id is required."
        }
    print(validate_shipping_details(**args.get('shipping_details')))
    if  validate_shipping_details(**args.get('shipping_details')):
        return validate_shipping_details(**args.get('shipping_details'))
    if validate_customer_details(**args.get('customer_details')):
        return validate_customer_details(**args.get('customer_details'))
    if validate_items_list(args.get('items_list')):
        return validate_items_list(args.get('items_list'))
    if   not isinstance(args.get('recieving_details'), str) or \
       not isinstance(args.get('comments'), str) or \
       not isinstance(args.get('created_by'), str):
        return {
            "recieving_details": "Recieving Details should only contain strings",
            "comments": "Comments  has to be of type String",
            "created_by": "Created By User Id Should Be A string"
        }
    return True


def validate_user(**args):
    """User Validator"""
    if  not args.get('employee_code') or not args.get('password') or not args.get('name'):
        return {
            'employee_code': 'employee_code is required',
            'password': 'Password is required',
            'name': 'Name is required'
        }
    if not isinstance(args.get('name'), str) or \
        not isinstance(args.get('employee_code'), int) or \
        not isinstance(args.get('password'), str):
        return {
            'employee_code': 'employee_code must be a number',
            'password': 'Password must be a string',
            'name': 'Name must be a string'
        }
    
    if args.get('email') and not validate_email(args.get('email')):
        return {
            'email': 'Email is invalid'
        }
    if args.get('collection_auth') and not isinstance(args.get('collection_auth'), bool):
        return {
            'collection_auth': 'collection_auth is invalid, must be a boolean'
        }
    if not validate_password(args.get('password')):
        return {
            'password': 'Password is invalid, Should be atleast 8 characters with \
                upper and lower case letters, numbers and special characters'
        }
    if not 2 <= len(args['name'].split(' ')) <= 30:
        return {
            'name': 'Name must be between 2 and 30 words'
        }
    return True

def validate_email_and_password(email, password):
    """Email and Password Validator"""
    if not (email and password):
        return {
            'email': 'Email is required',
            'password': 'Password is required'
        }
    if not validate_email(email):
        return {
            'email': 'Email is invalid'
        }
    if not validate_password(password):
        return {
            'password': 'Password is invalid, Should be atleast 8 characters with \
                upper and lower case letters, numbers and special characters'
        }
    return True

def validate_employee_code_and_password(employee_code, password):
    """Employee Code and Password Validator"""
    if not (employee_code and password):
        return {
            'employee_code': 'Employee Code is required',
            'password': 'Password is required'
        }
    if not validate_employee_code(employee_code):
        return {
            'employee_code': 'Employee Code is invalid'
        }
    if not validate_password(password):
        return {
            'password': 'Password is invalid, Should be atleast 8 characters with \
                upper and lower case letters, numbers and special characters'
        }
    return True
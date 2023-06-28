import  os
from dotenv import load_dotenv
from flask import Flask, jsonify
from main.user.routes import user_blueprint
from main.entry.routes import entry_blueprint
from main.customer.routes import customer_blueprint
from pymongo import MongoClient
load_dotenv()

app = Flask(__name__)
SECRET_KEY = os.environ.get('SECRET_KEY') or 'this is a secret'
app.config['SECRET_KEY'] = SECRET_KEY

app.register_blueprint(user_blueprint, url_prefix="/user")
app.register_blueprint(entry_blueprint, url_prefix="/entry")
app.register_blueprint(customer_blueprint, url_prefix="/customer")

@app.route("/", methods=['GET'])
def status():
    DATABASE_URL=os.environ.get('DATABASE_URL') or 'mongodb+srv://ceasowrath:Rizq7tkT2RmmWn37@cluster0.t1ez4iv.mongodb.net/gateentry?retryWrites=true&w=majority'
    client = MongoClient(DATABASE_URL)
    db = client.gateentry
    print(db.metadata.find_one())
    return jsonify({"showApp" :db.metadata.find_one()['showApp']})

@app.errorhandler(403)
def forbidden(e):
    return jsonify({
        "message": "Forbidden",
        "error": str(e),
        "data": None
    }), 403

@app.errorhandler(404)
def forbidden(e):
    return jsonify({
        "message": "Endpoint Not Found",
        "error": str(e),
        "data": None
    }), 404


if __name__ == "__main__":
    app.run(debug=True, port=5004)

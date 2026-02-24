# import flask

from flask import*

# initialize our app
app=Flask(__name__)

# creating routes
@app.route("/api/home")

def home():
    return jsonify({"message":"welcome to home APi"})


# api for proudcts

@app.route("/api/products")
def products():
    return jsonify({"message":"welcome to product api"})



# end point to calculate two numbers
@app.route("/api/calc",methods=["POST"])

def calc():
    num1=request.form["num1"]
    num2=request.form["num2"]
    sum=int(num1)+int(num2)
    return jsonify({"the sum is":sum})


@app.route("/api/si",methods=["POST"])

def si():
    principal=request.form["principal"]
    rate=request.form["rate"]
    time=request.form["time"]
    si=int(principal)*int(rate)/100*int(time)
    return jsonify({"the simple intrest is":si})


# running the app 

app.run(debug=True) 
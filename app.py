#point to note
# line(11,12,7,107,111,104-108) will be reqiured for upcomimg project ideas

# import flask
from flask import *
import pymysql
import os
# initialize your app
app=Flask(__name__)

# configure our project to store all our images inside static/images
app.config["UPLOAD_FOLDER"]="static/images"
# define our routes      
@app.route("/api/signup",methods=["post"])
# @app-decotator that maps path to ur url
# ("/api/signup",methods=["post"]) gives path to  ur url to sign up page
def signup():

    # extracting user inputs from a form
# 
    username=request.form["username"]
    email=request.form["email"]
    password=request.form["password"]
    phone=request.form["phone"]

    # connect to our database
    connection=pymysql.connect(user="root",host="localhost",password="",database="farasisokogarden")

    # define our cursor
    # tool that allow u to execute detaila to query
    cursor=connection.cursor()
    
    # connect api to data base  tom request for something/give u somethings
    
    # execute query
    sql="insert into users(username,password,email,phone)values(%s,%s,%s,%s)"
    
    # to prevent sql injection
    # define our data
    # (%s,%s,%s,%s)place holder 
    data=(username,password,email,phone)

    # execute our cursor
    cursor.execute(sql,data)
    # tool that alow u to communicate with data base

    # saving to our data base
    connection.commit()

    return jsonify({"message":"Thanks you for joining"})
    # return msg if user is succefull regester to data base




# sign in end point
# define our route
# yesterday work

@app.route("/api/signin",methods=["POST"])

def signin():
    # extracting user input from a form
    email=request.form["email"]
    password=request.form["password"]


    # connect to database

    connection=pymysql.connect(user="root",host="localhost",password="",database="farasisokogarden")

    cursor=connection.cursor(pymysql.cursors.DictCursor)
    # enable u to perform sql query
    sql="select * from users where email=%s and %s"

    # executiuon
    data=(email,password)

    cursor.execute(sql,data)

    # check if user exists
    if cursor.rowcount==0:
        return jsonify({"messsagge":"login failed"})
    
    else:
        user=cursor.fetchone()
        return jsonify({"mesage":"login successful","user":user})


    return jsonify({"message":"login successful"})

# today work
# add product

@app.route("/api/addproducts",methods=["POST"])
def addproduct():
    # extarcting product from a form
    product_name=request.form["product_name"]
    product_description=request.form["product_description"]
    product_cost=request.form["product_cost"]
    # from files becoz we are auploading data
    product_photo=request.files["product_photo"]

    # exrtracting the file name from the product photo
    filename=product_photo.filename
    # specify the path to our image
    photopath=os.path.join(app.config["UPLOAD_FOLDER"],filename)
    product_photo.save(photopath)

    # file name is the one which will apppear to the data base insted of productphoto
    # (.) to accees the file name only

    # connect to database``

    connection=pymysql.connect(user="root",host="localhost",password="",database="farasisokogarden")
    #enable our api to communicate to data base by executing sql queries
    cursor=connection.cursor()
    

    sql="insert into product_details(product_name,product_description,product_cost,product_photo)values(%s,%s,%s,%s)"


    # defining data
    data=(product_name,product_description,product_cost,filename)
    # file name will be prefeerded becuse the i,age will take log to load
    cursor.execute(sql,data)
    # get we dont commit becuse it already exit
    # commit  we are saving to our data base
    connection.commit()
    # jsonify to reurn msg infor of dictionary key and value
    return jsonify({"message":"product added succefull"})


    # get product api
@app.route("/api/getproductsdetails")
def getproductdetails():

    # connectiong to data basde
    connection=pymysql.connect(user="root",host="localhost",password="",database="farasisokogarden")

    cursor=connection.cursor(pymysql.cursors.DictCursor)

    cursor.execute("select * from product_details")

    productdetails=cursor.fetchall()

    return(productdetails)


import requests
# send safaricom
import datetime
# to show current date and time
import base64
# make password strong
from requests.auth import HTTPBasicAuth

@app.route('/api/mpesa_payment', methods=['POST'])
def mpesa_payment():
    if request.method == 'POST':
    # pst we are requesting some data
    # Extract POST Values sent
        amount = request.form['amount']
        phone = request.form['phone']

        # Provide consumer_key and consumer_secret provided by safaricom
        consumer_key = "GTWADFxIpUfDoNikNGqq1C3023evM6UH"
        consumer_secret = "amFbAoUByPV2rM5A"
        # both are commimg from daraja portal

        # Authenticate Yourself using above credentials to Safaricom Services, and Bearer Token this is used by safaricom for security identification purposes - Your are given Access
        api_URL = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials" 
        # AUTH entication url URL
        # Provide your consumer_key and consumer_secret
        response = requests.get(api_URL, auth=HTTPBasicAuth(consumer_key, consumer_secret))
        # Get response as Dictionary
        data = response.json()
        # Retrieve the Provide Token
        # Token allows you to proceed with the transaction
        access_token = "Bearer" + ' ' + data['access_token']

        # GETTING THE PASSWORD
        timestamp = datetime.datetime.today().strftime('%Y%m%d%H%M%S') # Current Time
        passkey = 'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919' # Passkey(Safaricom Provided)
        business_short_code = "174379" # Test Paybile (Safaricom Provided)
        # Combine above 3 Strings to get data variable
        data = business_short_code + passkey + timestamp
        # Encode to Base64
        encoded = base64.b64encode(data.encode())
        password = encoded.decode()

        # BODY OR PAYLOAD
        payload = {
        "BusinessShortCode": "174379",
        "Password":password,
        "Timestamp": timestamp,
        "TransactionType": "CustomerPayBillOnline",
        "Amount": '1', # use 1 when testing
        "PartyA": phone, # change to your number
        "PartyB": "174379",
        "PhoneNumber": phone,
        "CallBackURL": "https://coding.co.ke/api/confirm.php",
        # to receive poayment confimation
        "AccountReference": " chui SokoGarden Online",
        "TransactionDesc": "Payments for Products"
        }

        # POPULAING THE HTTP HEADER, PROVIDE THE TOKEN ISSUED EARLIER
        headers = {
        "Authorization": access_token,
        "Content-Type": "application/json"
        }

        # Specify STK Push Trigger URL
        url = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"
        # Create a POST Request to above url, providing headers, payload
        # Below triggers an STK Push to the phone number indicated in the payload and the amount.
        response = requests.post(url, json=payload, headers=headers)
        print(response.text) #
        # Give a Response
        return jsonify({"message": "An MPESA Prompt has been sent to Your Phone, Please Check & Complete Payment"})







































app.run(debug=True)

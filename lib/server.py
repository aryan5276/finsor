from flask import Flask, request, jsonify
app = Flask(__name__)
# Importing the necessary libraries
import math
import pandas_datareader as web
import numpy as np
from keras.models import Sequential
from keras.layers import Dense, LSTM
import tensorflow
# Importing the required modules
from urllib.request import urlopen, Request
from bs4 import BeautifulSoup
from nltk.sentiment.vader import SentimentIntensityAnalyzer
import nltk
import pandas as pd
# import matplotlib.pyplot as plt
import datetime
from datetime import date as currentdate


def rsi(company):
    today = currentdate.today()
    FB = web.DataReader(company, data_source='yahoo', start=today-datetime.timedelta(days = 30), end=today)
    delta = FB['Adj Close'].diff(1)
    delta = delta.dropna()
    up = delta.copy()
    down = delta.copy()
    up[up < 0] = 0
    down[down > 0] = 0
    period = 14
    AVG_Gain = up.rolling(window = period).mean()
    AVG_Loss = abs(down.rolling(window = period).mean())
    rs = AVG_Gain / AVG_Loss
    rsi = 100.0 - (100.0 / (1.0 + rs))
    new_df = pd.DataFrame()
    new_df['Adj Close'] = FB['Adj Close']
    new_df['RSI'] = rsi
    last_rsi = new_df['RSI'].iat[-1]
    value = 50-last_rsi
    green, red = 255, 255
    if value > 0:
        red = red - int(value*(255/50))
    else:
        green = green - int(-1*value*(255/50))
    return[last_rsi, red, green, 0]




def predict(symb):
    #symb = request.form.get('symb')
    df = web.DataReader(symb, data_source='yahoo', start='2014-01-01', end='2022-10-1')
    data = df.filter(['Close'])
    dataset = data.values
    scaled_data = dataset
    training_data_len = math.ceil(len(dataset)*0.8)
    train_data = scaled_data[0:training_data_len, :]
    x_train = []
    y_train=[]
    for i in range(60, len(train_data)):
        x_train.append(train_data[i-60:i, 0])
        y_train.append(train_data[i, 0])
    x_train, y_train = np.array(x_train), np.array(y_train)
    x_train = np.reshape(x_train,(x_train.shape[0], x_train.shape[1], 1))
    
    model = Sequential()
    model.add(LSTM(100, return_sequences=True, input_shape = (x_train.shape[1], 1)))
    model.add(LSTM(50, return_sequences=True, input_shape = (x_train.shape[1], 1)))
    model.add(LSTM(10, return_sequences=True))
    model.add(tensorflow.keras.layers.LeakyReLU(alpha = 0.01))
    model.add(Dense(25))
    model.add(Dense(1))
    
    model.compile(optimizer="adam", loss="mean_squared_error")
    model.fit(x_train, y_train, batch_size=8, epochs=8)
    test_data = scaled_data[training_data_len - 60: , :]
    x_test = []
    for i in range(60, len(test_data)):
        x_test.append(test_data[i-60:i, 0])

    day7 = []
    for i in range(7):
        x_test = np.array(x_test)
        x_test = np.reshape(x_test, (x_test.shape[0], x_test.shape[1], 1))
        predictions = model.predict(x_test)
        for j in range(len(x_test)-1):
            x_test[j] = x_test[j+1]
        for z in range(59):
            x_test[-1][z] = x_test[-1][z+1]
        x_test[-1][-1] = predictions[0][0]
        day7.append(predictions[0][0][0])
    return day7

def sentiment(company):
    finviz_url = "https://finviz.com/quote.ashx?t="
    tickers = [company]
    nltk.download("vader_lexicon")
    news_tables = {}
    for ticker in tickers:
        url = finviz_url + ticker
        req = Request(url=url, headers={'user-agent': 'my-app'})
        response = urlopen(req)
        html = BeautifulSoup(response,  'html')
        news_table = html.find(id='news-table')
        news_tables[ticker] = news_table
    
    parsed_data = []
    sample_news = []
    for ticker, news_table in news_tables.items():
        for row in news_table.findAll("tr"):
            title = str(row.a).split(">")
        if title[0] != "None":
            title = title[1].split("<")[0]
        else:
            continue
        if len(sample_news) < 10:
            sample_news.append(title)
        date_data = row.td.text.split(' ')
        if len(date_data) == 1:
            time = date_data[0]
        else: 
            date = date_data[0]
            time = date_data[1]
        if currentdate.today().strftime("%b-%d-%y") != date:
            break
        parsed_data.append([ticker, date, time, title])
        break
    df = pd.DataFrame(parsed_data, columns=['Ticker', 'Date', 'Time', 'Title'])
    vader = SentimentIntensityAnalyzer()
    f = lambda title: vader.polarity_scores(title)['compound']
    df['compound'] = df['Title'].apply(f)
    df['Date'] = pd.to_datetime(df.Date).dt.date
    mean_df = df.groupby(['Ticker', 'Date']).mean().unstack()
    mean_df = mean_df.xs('compound', axis='columns').transpose()
    return (mean_df[company][0])
    

#print(sentiment("TSLA"))
@app.route('/getmsg/', methods=['GET'])
def respond():
    # Retrieve the name from the url parameter /getmsg/?name=
    name = request.args.get("name", None)
    
    # For debugging
    print(f"Received: {name}")

    response = {}

    # Check if the user sent a name at all
    if not name:
        response["ERROR"] = "No name found. Please send a name."
    # Check if the user entered a number
    elif str(name).isdigit():
        response["ERROR"] = "The name can't be numeric. Please send a string."
    else:
        response["PRED"] = predict(name)
        response["RSI"] = rsi(name)
        response["SENTI"] = sentiment(name)

    # Return the response in json format
    return jsonify(response)


@app.route('/post/', methods=['POST'])
def post_something():
    param = request.form.get('name')
    print(param)
    # You can add the test cases you made in the previous function, but in our case here you are just testing the POST functionality
    if param:
        x = predict(param)
        return jsonify({
            "Message": f" {x} ",
            # Add this option to distinct the POST request
            "METHOD": "POST"
        })
    else:
        return jsonify({
            "ERROR": "No name found. Please send a name."
        })


@app.route('/')
def index():
    # A welcome message to test our server
    return "<h1>Welcome to our medium-greeting-api!</h1>"


if __name__ == '__main__':
    # Threaded option to enable multiple instances for multiple user access support
    app.run(threaded=True, port=5000)
# #performing flask imports
# from flask import Flask,jsonify


# app = Flask(__name__) #intance of our flask application 

# #Route '/' to facilitate get request from our flutter app
# @app.route('/user', methods = ['GET'])
# def index():
#     return jsonify({'greetings' : 'Hi! this is python'}) #returning key-value pair in json format


# if __name__ == "__main__":
#     app.run(host='0.0.0.0',port=5000, debug=True) #debug will allow changes without shutting down the server 
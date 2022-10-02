# finsor

Official submission of hackUMBC for Kushal Kapoor, Aadesh Kheria, Aryan Agrawal, Rishabh Chheda

finsor is an financial advising application that uses Machine and Deep Learning (ML and DL) to predict the future price of stocks. Using ML and DL provides us with the ability to study years of past data, study patterns, and predict the future price of the share.

Our app works on three indicators: Sentiment Analysis score of headlines related to the company, the Relative Strength Index of the share price of the company, and predictions of the future share price of the company.

Sentiment Analysis is a way to detect emotions in sentences. We adapted models to study today's headlines that are related to the company of choice. After studying the effect the news have on the stock market, we are able to provide an index value that indicates whether the price of the share increases or decreases.

We also used an index known as the Relative Strength Index (RSI). The RSI is a measure of how quickly the price of the share changes. The value of the RSI ranges from 0 to 100, where a lower value relates to the stock being oversold and a higher value relates to the stock being overbought. Using this RSI value, we are able to provide an interpretation of how risky it is to buy a stock at any given point of time.

We have studied the history of the share prices of companies and trained an LSTM model that predicts the future share price. Using this prediction, we are able to suggest whether buying the stock at a certain time point is ideal or not.

## Getting Started

This project currently runs on a local server, and hence it would be required for our laptop to be present.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

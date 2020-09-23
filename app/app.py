from flask import Flask, render_template, request
# import pickle
import numpy as np
from ml_model import iris_prediction

app = Flask(__name__)


@app.route('/', methods=['POST', 'GET'])
def ml_model_function():

    if request.method == 'POST':

        sepal_length = float(request.form['sepal_length'])
        sepal_width = float(request.form['sepal_width'])
        petal_length = float(request.form['petal_length'])
        petal_width = float(request.form['petal_width'])

        prediction = iris_prediction(
            sepal_length, sepal_width, petal_length, petal_width)

        return render_template('main.html', output=prediction)

    return render_template('main.html')


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)

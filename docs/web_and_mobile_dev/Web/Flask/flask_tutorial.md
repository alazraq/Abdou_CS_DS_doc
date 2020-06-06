# Flask tutorial

## What is Flask?

Flask is a **micro web framework** written in Python. It is classified as a microframework because it does not require particular tools or libraries. 
It has no database abstraction layer, form validation, or any other components where pre-existing third-party libraries provide common functions. Nevertheless, it is among the most popular Python web-development frameworks.

## Installing Flask: 

$ pip install flask

## Flask Hello world:

```python
# In app.py

from flask import Flask
app = Flask(__name__)

@app.route('/') # Routing: use the route() decorator on the app variable to tell Flask what URL should trigger our function. The desired URL pattern should be written in the string to the route decorator. The function which should be triggered by the route will be declared under it. “/” is the home route, as soon as you run your server it triggers first.
def hello_world():
    return 'Hello, World!'

if __name__ =="__main__":
    app.run(debug=True,port=8080)
```

Now run ```python app.py``` and Flask app should be running on http://127.0.0.1:8080/

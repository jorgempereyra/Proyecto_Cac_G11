from flask import Flask
from flask import render_template
app = Flask(__name__)

@app.route('/')
def index():
    try:
        return render_template('./templates/index.html')
    except Exception as e:
        # Handle the exception here or log it for debugging purposes
        # You can also return an error page or a custom error message
        return 'An error occurred: {}'.format(str(e)), 500
if __name__=='__main__':
 app.run(debug=True)
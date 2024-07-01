from flask import Flask
from flask import render_template
app = Flask(__name__)

@app.route('/')
def index():
    try:
        return render_template('./index.html')
    except Exception as e:
        # Handle the exception here or log it for debugging purposes
        # You can also return an error page or a custom error message
        return 'An error occurred: {}'.format(str(e)), 500

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/proyectos')
def proyectos():
    return render_template('proyectos.html')

@app.route('/formulario_contacto')
def formulario_contacto():
    return render_template('formulario_contacto.html')

@app.route('/tarjeta_incidente')
def tarjeta_incidente():
    return render_template('tarjeta_incidente.html')


if __name__=='__main__':
 app.run(debug=True)
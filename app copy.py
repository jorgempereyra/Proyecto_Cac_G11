from flask import Flask, render_template, redirect, url_for, flash, request
from flask_sqlalchemy import SQLAlchemy
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import DataRequired, Length, EqualTo, Email
from werkzeug.security import generate_password_hash, check_password_hash
from config import Config

app = Flask(__name__)
app.config.from_object(Config)
db = SQLAlchemy(app)

class Usuario(db.Model):
    idusers = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(45), unique=True, nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    password = db.Column(db.String(150), nullable=False)

    def set_password(self, password):
        self.password = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password, password)

# Forms
class RegistrationForm(FlaskForm):
    username = StringField('usuario', validators=[DataRequired(), Length(min=3, max=20)])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired(), Length(min=8)])
    confirm_password = PasswordField('Confirmar Password', validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Registrar')

class LoginForm(FlaskForm):
    username = StringField('usuario', validators=[DataRequired(), Length(min=3, max=20)])
    password = PasswordField('Password', validators=[DataRequired(), Length(min=8)])
    submit = SubmitField('Login')


@app.route('/')
def index():
    try:
        return render_template('./index.html')
    except Exception as e:
        # Handle the exception here or log it for debugging purposes
        # You can also return an error page or a custom error message
        return 'An error occurred: {}'.format(str(e)), 500

@app.route('/proyectos')
def proyectos():
    return render_template('proyectos.html')

@app.route('/formulario_contacto')
def formulario_contacto():
    return render_template('formulario_contacto.html')


@app.route('/tarjeta_incidente')
def tarjeta_incidente():
    return render_template('tarjeta_incidente.html')


@app.route('/formulario_registro', methods=['GET', 'POST'])
def formulario_registro():
    form = RegistrationForm()
    if form.validate_on_submit():
        existing_user = Usuario.query.filter_by(username=form.username.data).first()
        if existing_user:
            flash('Username already exists.')
            return redirect(url_for('register'))
        new_user = Usuario(username=form.username.data, email=form.email.data)
        new_user.set_password(form.password.data)
        db.session.add(new_user)
        db.session.commit()
        flash('Registrato Existoso. Puede haacer log in.')
        return redirect(url_for('login'))
    return render_template('form_registro_usuario.html', form=form)

@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = Usuario.query.filter_by(username=form.username.data).first()
        if user and user.check_password(form.password.data):
            flash('Login successful!')
            return redirect(url_for('index'))
        else:
            flash('Invalid username or password.')
    return render_template('login.html', form=form)


if __name__=='__main__':
 app.run(debug=True)
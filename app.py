import os
from flask import Flask, render_template, redirect, url_for, flash, request, jsonify,session
from flask_sqlalchemy import SQLAlchemy
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import DataRequired, Length, Email, EqualTo
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import datetime
from dotenv import load_dotenv
from config import Config

app = Flask(__name__)
load_dotenv()  # Cargar las variables de entorno desde el archivo .env
app.config.from_object(Config)


# Configuración de la base de datos usando las variables de entorno
# user = os.getenv('DATABASE_USER')
# password = os.getenv('DATABASE_PASSWORD')
# host = os.getenv('DATABASE_HOST')
# port = os.getenv('DATABASE_PORT')
# dbname = os.getenv('DATABASE_NAME')

# app.config['SQLALCHEMY_DATABASE_URI'] = f'mysql+pymysql://{user}:{password}@{host}:{port}/{dbname}'
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')
db = SQLAlchemy(app)

# Modelos de Base de Datos
class Usuario(db.Model):
    idusers = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(45), unique=True, nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    password = db.Column(db.String(150), nullable=False)

    def set_password(self, password):
        self.password = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password, password)
    

class Persona(db.Model):
    __tablename__ = 'Personas'
    id_Persona = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Nombre = db.Column(db.String(50), nullable=False)
    proyectos = db.relationship('Proyecto', back_populates='persona', cascade='all, delete-orphan')

class Proyecto(db.Model):
    __tablename__ = 'Proyectos'
    id_Proyecto = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Nombre_Proyecto = db.Column(db.String(50), nullable=False)
    Descripcion_Proyecto = db.Column(db.Text, nullable=False)
    id_Persona = db.Column(db.Integer, db.ForeignKey('Personas.id_Persona'))
    persona = db.relationship('Persona', back_populates='proyectos')

class Tarea(db.Model):
    __tablename__ = 'Tareas'
    id_Tarea = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Tarea_Nombre = db.Column(db.String(50), nullable=False)
    Tarea_Descripcion = db.Column(db.Text, nullable=False)
    Tarea_Tipo = db.Column(db.String(50), nullable=False)
    Fecha_Vencimiento = db.Column(db.Date, nullable=False)
    Fecha_Creacion = db.Column(db.Date, nullable=False)
    id_Proyecto = db.Column(db.Integer, db.ForeignKey('Proyectos.id_Proyecto'))
    id_Persona = db.Column(db.Integer, db.ForeignKey('Personas.id_Persona'))
    proyecto = db.relationship('Proyecto', back_populates='tareas')
    persona = db.relationship('Persona', back_populates='tareas')

Persona.tareas = db.relationship('Tarea', order_by=Tarea.id_Tarea, back_populates='persona')
Proyecto.tareas = db.relationship('Tarea', order_by=Tarea.id_Tarea, back_populates='proyecto')
Persona.proyectos = db.relationship("Proyecto", order_by=Proyecto.id_Proyecto, back_populates="persona")

# Forms
class RegistrationForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired(), Length(min=3, max=20)])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired(), Length(min=8)])
    confirm_password = PasswordField('Confirm Password', validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Register')

class LoginForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired(), Length(min=3, max=20)])
    password = PasswordField('Password', validators=[DataRequired(), Length(min=8)])
    submit = SubmitField('Login')

# Rutas CRUD para Personas
@app.route('/personas', methods=['POST'])
def create_persona():
    data = request.get_json()
    nueva_persona = Persona(Nombre=data['Nombre'])
    db.session.add(nueva_persona)
    db.session.commit()
    return jsonify({"message": "Persona creada", "persona": {"id_Persona": nueva_persona.id_Persona, "Nombre": nueva_persona.Nombre}}), 201

@app.route('/select_persona')
def select_persona():
    personas = Persona.query.all()
    return render_template('select_persona.html', personas=personas)

@app.route('/personas/<int:id_persona>', methods=['GET'])
def get_persona(id_persona):
    persona = Persona.query.get(id_persona)
    if persona:
        return jsonify({"id_Persona": persona.id_Persona, "Nombre": persona.Nombre})
    return jsonify({"message": "Persona no encontrada"}), 404

@app.route('/personas/<int:id_persona>', methods=['PUT'])
def update_persona(id_persona):
    data = request.get_json()
    persona = Persona.query.get(id_persona)
    if persona:
        persona.Nombre = data['Nombre']
        db.session.commit()
        return jsonify({"message": "Persona actualizada", "persona": {"id_Persona": persona.id_Persona, "Nombre": persona.Nombre}})
    return jsonify({"message": "Persona no encontrada"}), 404

@app.route('/personas/<int:id_persona>', methods=['DELETE'])
def delete_persona(id_persona):
    persona = Persona.query.get(id_persona)
    if persona:
        db.session.delete(persona)
        db.session.commit()
        return jsonify({"message": "Persona eliminada"})
    return jsonify({"message": "Persona no encontrada"}), 404

# Rutas CRUD para Proyectos
@app.route('/proyectos/<int:id_persona>', endpoint='proyectos' )
def proyectos(id_persona):
    persona = Persona.query.get(id_persona)
    if not persona:
        flash('Persona no encontrada.')
        return redirect(url_for('index'))
    
    proyectos = persona.proyectos
    return render_template('proyectos.html', proyectos=proyectos)

@app.route('/proyectos', methods=['POST'])
def create_proyecto():
    data = request.get_json()
    nuevo_proyecto = Proyecto(
        Nombre_Proyecto=data['Nombre_Proyecto'],
        Descripcion_Proyecto=data['Descripcion_Proyecto'],
        id_Persona=data['id_Persona']
    )
    db.session.add(nuevo_proyecto)
    db.session.commit()
    return jsonify({"message": "Proyecto creado", "proyecto": {"id_Proyecto": nuevo_proyecto.id_Proyecto, "Nombre_Proyecto": nuevo_proyecto.Nombre_Proyecto}}), 201

@app.route('/proyectos/<int:id_proyecto>', methods=['GET'])
def get_proyecto(id_proyecto):
    proyecto = Proyecto.query.get(id_proyecto)
    if proyecto:
        return jsonify({"id_Proyecto": proyecto.id_Proyecto, "Nombre_Proyecto": proyecto.Nombre_Proyecto, "Descripcion_Proyecto": proyecto.Descripcion_Proyecto, "id_Persona": proyecto.id_Persona})
    return jsonify({"message": "Proyecto no encontrado"}), 404

@app.route('/proyectos/<int:id_proyecto>', methods=['PUT'])
def update_proyecto(id_proyecto):
    data = request.get_json()
    proyecto = Proyecto.query.get(id_proyecto)
    if proyecto:
        proyecto.Nombre_Proyecto = data['Nombre_Proyecto']
        proyecto.Descripcion_Proyecto = data['Descripcion_Proyecto']
        proyecto.id_Persona = data['id_Persona']
        db.session.commit()
        return jsonify({"message": "Proyecto actualizado", "proyecto": {"id_Proyecto": proyecto.id_Proyecto, "Nombre_Proyecto": proyecto.Nombre_Proyecto}})
    return jsonify({"message": "Proyecto no encontrado"}), 404

@app.route('/proyectos/<int:id_proyecto>', methods=['DELETE'])
def delete_proyecto(id_proyecto):
    proyecto = Proyecto.query.get(id_proyecto)
    if proyecto:
        db.session.delete(proyecto)
        db.session.commit()
        return jsonify({"message": "Proyecto eliminado"})
    return jsonify({"message": "Proyecto no encontrado"}), 404

# Rutas CRUD para Tareas
@app.route('/tareas', methods=['POST'])
def create_tarea():
    data = request.get_json()
    nueva_tarea = Tarea(
        Tarea_Nombre=data['Tarea_Nombre'],
        Tarea_Descripcion=data['Tarea_Descripcion'],
        Tarea_Tipo=data['Tarea_Tipo'],
        Fecha_Vencimiento=datetime.strptime(data['Fecha_Vencimiento'], '%Y-%m-%d').date(),
        Fecha_Creacion=datetime.strptime(data['Fecha_Creacion'], '%Y-%m-%d').date(),
        id_Proyecto=data['id_Proyecto'],
        id_Persona=data['id_Persona']
    )
    db.session.add(nueva_tarea)
    db.session.commit()
    return jsonify({"message": "Tarea creada", "tarea": {"id_Tarea": nueva_tarea.id_Tarea, "Tarea_Nombre": nueva_tarea.Tarea_Nombre}}), 201

@app.route('/tareas/<int:id_tarea>', methods=['GET'])
def get_tarea(id_tarea):
    tarea = Tarea.query.get(id_tarea)
    if tarea:
        return jsonify({"id_Tarea": tarea.id_Tarea, "Tarea_Nombre": tarea.Tarea_Nombre, "Tarea_Descripcion": tarea.Tarea_Descripcion, "Tarea_Tipo": tarea.Tarea_Tipo, "Fecha_Vencimiento": tarea.Fecha_Vencimiento, "Fecha_Creacion": tarea.Fecha_Creacion, "id_Proyecto": tarea.id_Proyecto, "id_Persona": tarea.id_Persona})
    return jsonify({"message": "Tarea no encontrada"}), 404

@app.route('/tareas/<int:id_tarea>', methods=['PUT'])
def update_tarea(id_tarea):
    data = request.get_json()
    tarea = Tarea.query.get(id_tarea)
    if tarea:
        tarea.Tarea_Nombre = data['Tarea_Nombre']
        tarea.Tarea_Descripcion = data['Tarea_Descripcion']
        tarea.Tarea_Tipo = data['Tarea_Tipo']
        tarea.Fecha_Vencimiento = datetime.strptime(data['Fecha_Vencimiento'], '%Y-%m-%d').date()
        tarea.Fecha_Creacion = datetime.strptime(data['Fecha_Creacion'], '%Y-%m-%d').date()
        tarea.id_Proyecto = data['id_Proyecto']
        tarea.id_Persona = data['id_Persona']
        db.session.commit()
        return jsonify({"message": "Tarea actualizada", "tarea": {"id_Tarea": tarea.id_Tarea, "Tarea_Nombre": tarea.Tarea_Nombre}})
    return jsonify({"message": "Tarea no encontrada"}), 404

@app.route('/tareas/<int:id_tarea>', methods=['DELETE'])
def delete_tarea(id_tarea):
    tarea = Tarea.query.get(id_tarea)
    if tarea:
        db.session.delete(tarea)
        db.session.commit()
        return jsonify({"message": "Tarea eliminada"})
    return jsonify({"message": "Tarea no encontrada"}), 404

# Rutas para Registro y Login
@app.route('/register', methods=['GET', 'POST'])
def register():
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
        flash('Registration successful. Please log in.')
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


@app.route('/')
def index():
    personas = Persona.query.all()
    if not personas:
        flash('No hay personas registradas. Por favor, crea una persona primero.')
        return redirect(url_for('select_persona'))
    return render_template('index.html', personas=personas)


if __name__ == '__main__':
    app.run(debug=True)

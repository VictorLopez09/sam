from flask import Flask, request, session, redirect, url_for, render_template, flash
from passlib.hash import pbkdf2_sha256
from db_config import get_db_connection

app = Flask(__name__)
app.secret_key = 'tu_clave_secreta'  # Cambia esto por una clave secreta

# Ruta de inicio de sesión
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        contrasena = request.form['contrasena']
        
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT contrasena FROM empleados WHERE email = %s", (email,))
        user = cur.fetchone()
        cur.close()
        conn.close()
        
        if user and pbkdf2_sha256.verify(contrasena, user[0]):
            session['email'] = email
            flash('Inicio de sesión exitoso', 'success')
            return redirect(url_for('home'))
        else:
            flash('Correo o contraseña incorrectos', 'danger')
    
    return render_template('login.html')

# Ruta de inicio
@app.route('/home')
def home():
    if 'email' in session:
        return render_template('home.html', email=session['email'])
    return redirect(url_for('login'))

# Ruta de cierre de sesión
@app.route('/logout')
def logout():
    session.pop('email', None)
    flash('Has cerrado sesión', 'info')
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)


# Ruta de registro
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        primer_nombre = request.form['primer_nombre']
        apellido_paterno = request.form['apellido_paterno']
        apellido_materno = request.form['apellido_materno']
        email = request.form['email']
        telefono = request.form.get('telefono', None)
        id_puesto = request.form.get('id_puesto', None)
        contrasena = request.form['contrasena']
        
        # Hashear la contraseña
        hashed_password = pbkdf2_sha256.hash(contrasena)

        # Guardar el nuevo empleado en la base de datos
        conn = get_db_connection()
        cur = conn.cursor()
        try:
            cur.execute("""
                INSERT INTO empleados (primer_nombre, apellido_paterno, apellido_materno, email, telefono, id_puesto, contrasena)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """, (primer_nombre, apellido_paterno, apellido_materno, email, telefono, id_puesto, hashed_password))
            conn.commit()
            flash('Usuario registrado exitosamente', 'success')
            return redirect(url_for('login'))
        except Exception as e:
            conn.rollback()
            flash(f'Error al registrar el usuario: {e}', 'danger')
        finally:
            cur.close()
            conn.close()

    return render_template('register.html')

# Otras rutas, como login y home, ya definidas aquí...

if __name__ == '__main__':
    app.run(debug=True)
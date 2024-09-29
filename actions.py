from flask import Flask, render_template, request, redirect, url_for, flash
from flask_login import LoginManager, UserMixin, login_user, login_required, current_user, logout_user
from DAO.concours_dao import SelectionDao
from concours import selection

app = Flask(__name__)
app.config['SECRET_KEY'] = 'your_secret_key'

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'

# Simuler une base de données d'utilisateurs
users = {
    "juror": {"password": "juror_password", "role": "juror"},
    "president": {"password": "president_password", "role": "president"}
}

class User(UserMixin):
    def __init__(self, username, role):
        self.id = username
        self.role = role

@login_manager.user_loader
def load_user(username):
    user_info = users.get(username)
    if user_info:
        return User(username, user_info["role"])
    return None

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user_info = users.get(username)
        if user_info and password == user_info['password']:
            user = User(username, user_info['role'])
            login_user(user)
            return redirect(url_for('dashboard'))
        else:
            flash('Nom d\'utilisateur ou mot de passe incorrect', 'danger')
    return render_template('login.html')

@app.route('/dashboard')
@login_required
def dashboard():
    if current_user.role == "president":
        return render_template('president_dashboard.html')
    elif current_user.role == "juror":
        return render_template('juror_dashboard.html')
    else:
        return "Accès refusé", 403

# Route pour choisir une sélection
@app.route('/choisir_selection', methods=['GET', 'POST'])
@login_required
def choisir_selection():
    if current_user.role in ["juror", "president"]:
        if request.method == 'POST':
            stage = int(request.form.get('stage', 0))
            my_selection = SelectionDao()
            resultat = my_selection.palmares(choix=stage)
            return render_template('selection_result.html', resultat=resultat, stage=stage)
        return render_template('choisir_selection.html')
    return "Accès refusé", 403

# Route pour voter (juror uniquement)
@app.route('/vote', methods=['POST'])
@login_required
def vote():
    if current_user.role == "juror":
        book_id = request.form.get('book_id')
        stage = request.form.get('stage')
        ma_select = SelectionDao()
        ids = ma_select.get_sel_id(stage=int(stage), book_id=int(book_id))
        obj = ma_select.read(ids)
        obj.vote += 1
        if ma_select.update(obj):
            return "Vote enregistré!"
    return "Accès refusé", 403

# Route pour ajouter une sélection (president uniquement)
@app.route('/add_selection', methods=['POST'])
@login_required
def add_selection():
    if current_user.role == "president":
        book_id = int(request.form['book_id'])
        tour = int(request.form['tour'])
        nouvelle_selection = selection(s_id=0, stage=tour, book_id=book_id, vote=0)
        commis = SelectionDao()
        commis.create(nouvelle_selection)
        return "Sélection ajoutée!"
    return "Accès refusé", 403

# Route pour se déconnecter
@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)

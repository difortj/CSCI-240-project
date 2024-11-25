from flask import Flask, render_template, request, redirect, url_for
import sqlite3

app = Flask(__name__)

def get_db_connection():
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def index():
    conn = get_db_connection()
    ships = conn.execute('SELECT * FROM Ship').fetchall()
    battles = conn.execute('SELECT * FROM Battles').fetchall()
    conn.close()
    return render_template('index.html', ships=ships, battles=battles)

@app.route('/ship/<int:ship_id>')
def ship_operations(ship_id):
    conn = get_db_connection()
    ship = conn.execute('SELECT * FROM Ship WHERE ShipID = ?', (ship_id,)).fetchone()
    operations = conn.execute('''
        SELECT Battles.Name AS BattleName, Operations.Shipoutcome
        FROM Operations
        JOIN Battles ON Operations.BattleID = Battles.BattleID
        WHERE Operations.ShipID = ?
    ''', (ship_id,)).fetchall()
    conn.close()
    return render_template('ship_operations.html', ship=ship, operations=operations)

@app.route('/battle/<int:battle_id>')
def battle_operations(battle_id):
    conn = get_db_connection()
    battle = conn.execute('SELECT * FROM Battles WHERE BattleID = ?', (battle_id,)).fetchone()
    operations = conn.execute('''
        SELECT Ship.Name AS ShipName, Operations.Shipoutcome
        FROM Operations
        JOIN Ship ON Operations.ShipID = Ship.ShipID
        WHERE Operations.BattleID = ?
    ''', (battle_id,)).fetchall()
    conn.close()
    return render_template('battle_operations.html', battle=battle, operations=operations)

@app.route('/add_operation', methods=('GET', 'POST'))
def add_operation():
    if request.method == 'POST':
        ship_id = request.form['ship_id']
        battle_id = request.form['battle_id']
        ship_outcome = request.form['ship_outcome']

        conn = get_db_connection()
        conn.execute('INSERT INTO Operations (ShipID, BattleID, Shipoutcome) VALUES (?, ?, ?)',
                     (ship_id, battle_id, ship_outcome))
        conn.commit()
        conn.close()
        return redirect('/')

    conn = get_db_connection()
    ships = conn.execute('SELECT * FROM Ship').fetchall()
    battles = conn.execute('SELECT * FROM Battles').fetchall()
    conn.close()
    return render_template('add_operation.html', ships=ships, battles=battles)

if __name__ == '__main__':
    app.run(debug=True, port=8000)
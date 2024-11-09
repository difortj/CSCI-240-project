from flask import Flask, render_template, request, redirect
import sqlite3

app = Flask(__name__)

def get_db_connection(): 
    conn = sqlite3.connect('database.db') 
    conn.row_factory = sqlite3.Row 
    return conn

@app.route('/') 
def index(): 
    conn = get_db_connection() 
    aircraft_carriers = conn.execute('SELECT * FROM AircraftCarriers').fetchall() 
    conn.close()
    return render_template('index.html', aircraft_carriers=aircraft_carriers)

@app.route('/add', methods=('GET', 'POST')) 
def add(): 
    if request.method == 'POST': 
        ship_id = request.form['ship_id'] 
        number_of_aircraft = request.form['number_of_aircraft'] 
        runway_length_in_feet = request.form['runway_length_in_feet'] 
        commission_date = request.form['commission_date']

        conn = get_db_connection() 
        conn.execute('INSERT INTO AircraftCarriers (ShipID, NumberofAircraft, Runwaylengthinfeet, CommissionDate) VALUES (?, ?, ?, ?)', 
                    (ship_id, number_of_aircraft, runway_length_in_feet, commission_date))
        conn.commit() 
        conn.close() 
        return redirect('/')
    
    return render_template('add.html')

if __name__ == '__main__': 
    app.run(debug=True, port=8000)
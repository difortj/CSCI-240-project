from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def form():
    print("Form page accessed")
    return render_template('form.html')

@app.route('/submit')
def submit():
    carrier_id = request.args.get('carrier_id')
    ship_id = request.args.get('ship_id')
    num_aircraft = request.args.get('num_aircraft')
    runway_length = request.args.get('runway_length')
    commission_date = request.args.get('commission_date')
    print("Recieved Data")
    return render_template('table.html', carrier_id=carrier_id, ship_id=ship_id, num_aircraft=num_aircraft, runway_length=runway_length, commission_date=commission_date)

if __name__ == '__main__':
    app.run(debug=True, port=8000)
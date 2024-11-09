import sqlite3 

connection = sqlite3.connect('database.db') 
cursor = connection.cursor() 
 
cursor.execute(''' 
    CREATE TABLE IF NOT EXISTS AircraftCarriers ( 
        CarrierID TEXT PRIMARY KEY, 
        ShipID INTEGER NOT NULL, 
        NumberofAircraft INTEGER NOT NULL, 
        Runwaylengthinfeet INTEGER NOT NULL, 
        CommissionDate TEXT NOT NULL
    ) 
''') 
connection.commit() 
connection.close()
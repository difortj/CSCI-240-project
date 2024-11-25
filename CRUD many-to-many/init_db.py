import sqlite3

connection = sqlite3.connect('database.db')
cursor = connection.cursor()

# Create Ship table
cursor.execute('''
    CREATE TABLE IF NOT EXISTS Ship (
        ShipID INTEGER PRIMARY KEY AUTOINCREMENT,
        Name TEXT NOT NULL
    )
''')

# Create Battles table
cursor.execute('''
    CREATE TABLE IF NOT EXISTS Battles (
        BattleID INTEGER PRIMARY KEY AUTOINCREMENT,
        Name TEXT NOT NULL,
        Date TEXT NOT NULL,
        Location TEXT NOT NULL
    )
''')

# Create Operations table
cursor.execute('''
    CREATE TABLE IF NOT EXISTS Operations (
        ShipID INTEGER NOT NULL,
        BattleID INTEGER NOT NULL,
        Shipoutcome TEXT NOT NULL,
        PRIMARY KEY (ShipID, BattleID),
        FOREIGN KEY (ShipID) REFERENCES Ship (ShipID),
        FOREIGN KEY (BattleID) REFERENCES Battles (BattleID)
    )
''')

connection.commit()
connection.close()
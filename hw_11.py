import sqlite3


def create_bd(conn):
    cur = conn.cursor()
    cur.execute("""
        CREATE TABLE IF NOT EXISTS clients (
            client_id INTEGER PRIMARY KEY AUTOINCREMENT,
            first_name VARCHAR(60) NOT NULL,
            last_name VARCHAR(100) NOT NULL,
            email VARCHAR(255) UNIQUE NOT NULL CHECK(email LIKE '%@%.%')
            )""")
    
    cur.execute("""
        CREATE TABLE IF NOT EXISTS phones (
            phone_id INTEGER PRIMARY KEY AUTOINCREMENT,
            client_id INTEGER,
            tel VARCHAR(10) UNIQUE,
            FOREIGN KEY (client_id) REFERENCES clients(client_id) ON DELETE CASCADE
            )""")
        
    conn.commit()
    

def add_client(conn, first_name, last_name, email):
    cur = conn.cursor()
    cur.execute("""
        INSERT INTO clients(first_name, last_name, email)
        VALUES(?,?,?)""", (first_name, last_name, email))
    conn.commit()
    
    

def add_phonenumber(conn, client_id, tel):
    cur = conn.cursor()
    cur.execute("""
        INSERT INTO phones(client_id, tel)
        VALUES(?,?)""", (client_id, tel))
    conn.commit()
    

def update_client(conn, new_fname, new_lname, new_email, client_id):
    cur = conn.cursor()
    cur.execute("""
        UPDATE clients 
        SET first_name = ?, last_name = ?, email = ?
        WHERE client_id = ?""", (new_fname, new_lname, new_email, client_id))
    conn.commit()
    
def delete_phonenumber(conn, client_id):
    cur = conn.cursor()
    cur.execute("""
        DELETE FROM phones
        WHERE client_id = ?""", (client_id))
    conn.commit()


def delete_client(conn, client_id):
    cur = conn.cursor()
    cur.execute("""
        DELETE FROM clients
        WHERE client_id = ?""", (client_id))
    conn.commit()
  
  
def find_client(conn, first_name=None, last_name=None, email=None, phone=None):
    conditions = []
    params = []
        
    if first_name:
        conditions.append("c.first_name LIKE ?")
        params.append(f"%{first_name}%")
    if last_name:
        conditions.append("c.last_name LIKE ?")
        params.append(f"%{last_name}%")
    if email:
        conditions.append("c.email LIKE ?")
        params.append(f"%{email}%")
    if phone:
        conditions.append("p.tel LIKE ?")
        params.append(f"%{phone}%")
        
    if not conditions:
        return []
    
    query = """
    SELECT DISTINCT c.client_id, c.first_name, c.last_name, c.email, 
    GROUP_CONCAT(p.tel, ', ') AS phones
    FROM clients c
    LEFT JOIN phones p ON c.client_id = p.client_id
    """
    
    if conditions:
        query += " WHERE " + " AND ".join(conditions)
    
    query += " GROUP BY c.client_id"
    
    try:
        cur = conn.cursor()
        cur.execute(query, params)
        return print(cur.fetchall())
    except Exception as e:
        print(f"Ошибка поиска клиента: {e}")
        return []   
    

with sqlite3.connect("hw_11.db") as conn:
    # create_bd(conn)
    # add_client(conn, 'ivan', 'ivars', 'sdf@sdf.com')
    # add_phonenumber(conn, 1, '+79621234567')
    # update_client(conn, 'sd', 'qwerw', 'dfsd@sdf.sdf', 1)
    # print_table(conn, 'clients')
    # print_table(conn, 'phones')
    find_client(conn, 'sd')

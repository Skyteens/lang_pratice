### open csv and put into dataframe and get a certain type of data

import pandas as pd
import sqlalchemy 
from sqlalchemy import create_engine, MetaData, Table, Column, Integer, String 

def read_csv():
    new_data = pd.read_csv("")
    return new_data

def get_data():
    data = read_csv()

    query = data[data['a'] == 0 ]
    print(query)

## connect to a mysql database and create 3 tables and do 1 sql query

def connect_to_db():
    # Replace 'username', 'password', 'host', 'database_name' with your MySQL credentials  
    engine = create_engine('mysql+mysqlconnector://username:password@host/database_name')  
    return engine
  
def create_tables():
    metadata = MetaData()  
  
    # Define the 'users' table  
    users = Table('users', metadata,  
        Column('id', Integer, primary_key=True),  
        Column('name', String(50)),  
        Column('age', Integer)  
    )  
    
    # Define the 'products' table  
    products = Table('products', metadata,  
        Column('id', Integer, primary_key=True),  
        Column('name', String(100)),  
        Column('price', Integer)  
    )  
    
    # Define the 'orders' table  
    orders = Table('orders', metadata,  
        Column('id', Integer, primary_key=True),  
        Column('user_id', Integer),  
        Column('product_id', Integer),  
        Column('quantity', Integer)  
    )  

    engine = connect_to_db()
    metadata.create_all(engine)  

def get_db_data():

    engine = connect_to_db()

    with engine.connect() as connection:  
        result = connection.execute("SELECT * FROM your_table")  
        for row in result:  
            print(row)
import pymonetdb
import psycopg2

table_list = ["acs_yg_household_income_5"]

# MONETDB

connection = pymonetdb.connect(
    username="monetdb", 
    password="monetdb", 
    hostname="34.70.197.119", 
    database="datausa")

for table in table_list:
    print("\nMONETDB\n")
    print("Table Name: {}".format(table))
    cursor = connection.cursor()
    cursor.execute('SELECT count(1) FROM acs.{} WHERE "year"<>2018;'.format(table))
    print("Total Rows (2018 Excluded): ", cursor.fetchone()[0])
    cursor.execute('SELECT count(1) FROM acs.{} WHERE "year"=2018;'.format(table))
    print("2018 Rows: ", cursor.fetchone()[0], "\n")

#print("\n Finished query.")

# POSTGRESQL

try:
    connection = psycopg2.connect(user = "postgres",
                                  password = "4ZgFMJZNa4s9K7QoUJsUAQMztpd9Bg",
                                  host = "35.223.122.36",
                                  port = "5432",
                                  database = "datausa_vp")

    cursor = connection.cursor()
    # Print PostgreSQL Connection properties
    #print ( connection.get_dsn_parameters(),"\n")

    # Print PostgreSQL version
    cursor.execute("SELECT version();")
    record = cursor.fetchone()
    #print("You are connected to - ", record,"\n")
    
    for table in table_list:
        print("POSTGRESQL\n")
        print("Table Name: ", table)
        cursor.execute('SELECT count(1) FROM acs.{} WHERE "year"!=2018;'.format(table))
        record = cursor.fetchone()
        print("Total Rows (2018 Excluded): ", record[0])
        cursor.execute('SELECT count(1) FROM acs.{} WHERE "year"=2018;'.format(table))
        record = cursor.fetchone()
        print("2018 Rows: ", record[0], "\n")

except (Exception, psycopg2.Error) as error :
    print ("Error while connecting to PostgreSQL", error)
finally:
    #closing database connection.
        if(connection):
            cursor.close()
            connection.close()
            #print("PostgreSQL connection is closed")
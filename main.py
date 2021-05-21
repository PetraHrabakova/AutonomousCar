from flask import Flask, render_template
import psycopg2



try:
    connection = psycopg2.connect(user='postgres',
                                  password='unicorn123',
                                  host='127.0.0.1',
                                  port='5432',
                                  database='AutonomousCar')
    print("Connected")

except (Exception, psycopg2.Error) as error:
    print("Error while connecting to PostgreSQL", error)


cursor = connection.cursor()
app = Flask(__name__, template_folder="templates")


# Menu with options
print('Welcome to a database that holds data about all cars and drivers from the entire world')
print('Please select one of the options bellow:')
print('1. See all data about you and your vehicle')
print('2. Speeding ticket database')
print('3. You are a new driver and would like insert data to the database')
answer = input('Which option do you choose? (Please type 1, 2, or 3 as an answer): ')



if answer == '1':
    ssn = input("SSN:")
    @app.route('/viewdata')
    def viewdata():
        table_data = []                                                                                # array for data to be displayed on the website

        # Enter Driver database
        postgres_view_driver = """SELECT * from driver where ssn = %s"""                               # Fetch data from Driver table based on SSN number
        cursor.execute(postgres_view_driver, (ssn,))
        data1 = cursor.fetchall()

        table_data.append(data1[0][0])                                                                 # Insert data to the data array (to be displayed on website)
        table_data.append(data1[0][1])                                                                 # Insert data to the data array (to be diplayed on website)
        table_data.append(data1[0][2])                                                                 # Insert data to the data array (to be displayed on website)

        licenseplate = table_data[0]

       # Enter Car database
        postgres_view_car = """SELECT * from car where licenseplate = %s"""                             # Fetch data from the Car table based on license plate
        cursor.execute(postgres_view_car, (licenseplate,))

        data2 = cursor.fetchall()
        table_data.append(data2[0][0])                                                                  # Insert data to the data array (to be displayed on website)
        table_data.append(data2[0][1])                                                                  # Insert data to the data array (to be displayed on website)

        return render_template('index.html', data=table_data)                                        # Render template and display data on the website


    if __name__ == "__main__":
        app.run(debug=True)





if answer == '2':
    ssn = input('Please enter your SSN to find out whether you got a ticket: ')
    postgres_view_ticket = """Select * from ticket where ssn = %s"""
    cursor.execute(postgres_view_ticket, (ssn,))
    data = cursor.fetchall()

    if data != '':
        # If fetched data is an empty array, the user is not in the database and got no ticket
        if data == []:
            print("It is your luck day. Your did not receive a ticket. Yet, muhahahahahahahah.")
        # Display the ticket price
        else:
            print('Oops! You got a ticket.')
            print('The price is ', data[0][2])
            print('Do you wonder why you got a ticket?')
            user_answer = input('Would you like to know why? [y/n]')
            if user_answer == 'y' or 'Y':
                licenseplate = data[0][1]
                postgres_view_speed = """Select * from speed where licenseplate = %s"""
                cursor.execute(postgres_view_speed, (licenseplate,))
                speed = cursor.fetchall()
                print('Because you have been speeding!!!')
                print('Your speed: ', speed[0][1], ' km/h')
            else:
                print('Okay, bye.')



if answer == '3':
    print('Nice! Welcome to the world of drivers.')
    print('Please insert information about yourself.')
    ssn = input('SSN: ')
    name = input('Full name: ')
    address = input('Address: ')
    print('And information about your car.')
    licenseplate = input('License plate: ')
    brand = input('Brand: ')
    year = input('Year: ')

    postgres_insert_car = """INSERT INTO Car (brand, year, licenseplate) VALUES (%s,%s,%s)"""
    cursor.execute(postgres_insert_car, (brand, year, licenseplate))
    print(cursor.rowcount, "Record inserted successfully into Car table")

    postgres_insert_driver = """INSERT INTO Driver (licenseplate, name, address, ssn) VALUES (%s,%s,%s,%s)"""
    cursor.execute(postgres_insert_driver, (licenseplate, name, address, ssn))
    print(cursor.rowcount, "Record inserted successfully into Driver table")

    connection.commit()



















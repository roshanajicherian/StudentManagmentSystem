import pymysql as sql

db=None
cursor=None

def connectToDatabase():
    try:
        global cursor,db
        db=sql.connect(host="localhost",user="root",password="root",db="studentmanagmentsystem")
        cursor=db.cursor()
        print("Connected to database.")
    except:
        print("Could not connect to the database.")

def endDatabaseConnection():
    global db
    db.close()
    print("Database connection sucessfully terminated.")

def findHighestMarks(classIn,subjectIn):
    global cursor
    sqlQuery="""CALL findHighestMarks({},'{}');""".format(classIn,subjectIn)
    cursor.execute(sqlQuery)
    output=cursor.fetchall()
    for record in output:
        print(record)

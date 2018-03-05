import time
import MySQLdb


class Database:

    def __init__(self, user, password, db, db_host):

        self.conn = MySQLdb.connect(
            user=user,
            passwd=password,
            db=db,
            host=db_host)

    # utility function to retrieve database data:
    def get_data(self, sql):

        cur = self.conn.cursor()
        cur.execute(sql)

        results = []

        try:
            results = cur.fetchall()
        except (ValueError, IndexError):
            pass

        return results

from flask import Flask, jsonify
import MySQLdb
import config

app = Flask(__name__)


def get_mysql_data(sql):

    conn = MySQLdb.connect(user=config.db['user'], passwd=config.db['passwd'], db=config.db['db'], host=config.db['host'])
    cur = conn.cursor()
    cur.execute(sql)

    results = []

    try:
        results = cur.fetchall()
    except (ValueError, IndexError):
        pass

    return results


@app.route('/')
def index():
    list_of_endpoints = [
        {
            'name': 'Count Number of Images with a Given Tag',
            'end_point': '/tag/<tag_label>',
            'description': 'Searches for a count of all images that have a tag of tag_label'
        },
        {
            'name': 'Return counts of all tags...',
            'end_point': '/all',
            'description': 'Searches and returns a count of all tags...'
        }
    ]

    return jsonify(results=list_of_endpoints)


@app.route('/all')
def get_all():

    sql = "SELECT distinct(tag), count(tag) FROM image_storage.image_tags group by tag"

    results = get_mysql_data(sql)

    return jsonify(results=results)


@app.route('/tag/<tag_label>')
def get_tag_counts(tag_label):
    sql = "SELECT \
                distinct(tag), count(tag) \
                FROM image_storage.image_tags \
                where file_id in (select file_id from image_tags where tag = '" + tag_label + "') \
                group by tag"

    results = get_mysql_data(sql)

    return jsonify(results=results)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

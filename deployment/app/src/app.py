from flask import Flask, jsonify
import MySQLdb
import config
import jwt
import datetime


app = Flask(__name__)


# utility function to retrieve database data:
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


# check for jwt validity
def jwt_is_valid(auth_token):

    try:
        jwt.decode(auth_token, config.app['sess_key'], algorithms=['HS256'])
        return True

    except jwt.ExpiredSignatureError:
        return False

    except jwt.DecodeError:
        return False

    # Just in case:
    return False


# do encode token
def encode_auth_token(sent_obj):

    message = {'data': sent_obj, 'exp': datetime.datetime.utcnow() + datetime.timedelta(seconds=360)}

    encoded_message = jwt.encode(message, config.app['sess_key'], algorithm='HS256')

    return encoded_message


# do decode token
def decode_auth_token(auth_token):
    try:
        return jwt.decode(auth_token, config.app['sess_key'], algorithms=['HS256'])

    except jwt.ExpiredSignatureError:
        return "[]"

    except jwt.DecodeError:
        return "[]"

    # Just in case:
    return "[]"


@app.route('/')
def index():
    list_of_endpoints = [
        {
            'name': 'Get JWT Token',
            'end_point': '/jwt',
            'description': 'Returns a JWT Token that is valid for 6 minutes'
        },
        {
            'name': 'Count Number of Images with a Given Tag',
            'end_point': '/tag/<tag_label>',
            'description': 'Searches for a count of all images that have a tag of tag_label'
        },
        {
            'name': 'Return counts of all tags...',
            'end_point': '/all/<jwt_token>',
            'description': 'Searches and returns a count of all tags... Uses /jwt token to authorize...'
        }
    ]

    return jsonify(results=list_of_endpoints)


# this method returns a valid jwt that is good for 6 minutes
@app.route('/jwt')
def jwt_testing():

    # any message can go here...
    message = {'tid': 15,'user_type': 3,'user_name':'robr'}

    # make encoded message:
    encoded_token = encode_auth_token(message)

    # and return to caller:
    return encoded_token


# light attempt at jwt authorization...
@app.route('/all/<auth_token>')
def get_all(auth_token):

    if jwt_is_valid(auth_token):

        sql = "SELECT distinct(tag), count(tag) FROM image_storage.image_tags group by tag"

        results = get_mysql_data(sql)

        return jsonify(results=results)

    else:
        return str([])


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

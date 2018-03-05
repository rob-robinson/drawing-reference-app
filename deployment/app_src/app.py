from flask import Flask, jsonify, render_template
import config
from Database import Database

app = Flask(__name__)
DB = Database(config.db['user'], config.db['passwd'], config.db['db'], config.db['host'])


@app.route('/')
def index():

    sql = "select distinct(tag), count(*) \
        from image_tags \
        group by tag"

    tags = DB.get_data(sql)

    return render_template("index.html", items=tags)


@app.route('/s/<query>')
def search(query):

    sql = "select tag, location  \
            from image_tags inner join images on images.id=image_tags.file_id \
            where tag like '%" + query + "%' \
            limit 50"

    list_of_endpoints = DB.get_data(sql)

    return render_template("search.html", items=list_of_endpoints)


@app.route('/tag/<tag_label>')
def get_tag_counts(tag_label):

    sql = "SELECT \
            distinct(tag), count(tag) \
            FROM image_storage.image_tags \
            where file_id in (select file_id from image_tags where tag = '" + tag_label + "') \
            group by tag"

    results = DB.get_data(sql)

    return jsonify(results=results)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

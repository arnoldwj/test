import subprocess

from flask import Flask, render_template

from main import scrape

app = Flask(__name__, template_folder='pages')

@app.route('/')
def hello():
    app.logger.info(f'/ accessed')
    return render_template("home.html")

@app.route('/scrape')
def hello_world():
    app.logger.info(f'/scrape accessed')
    count = scrape()
    return render_template("scrape.html", count=count)

if __name__ == '__main__':
    app.run(debug=True)

from flask import Flask, render_template, request
from lib.yt_dl_comments import obtener_comentarios

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('comments.html', comments=[])

@app.route('/get_comments', methods=['POST'])
def get_comments():
    video_url = request.form.get('video_url')
    comments = obtener_comentarios(video_url)
    return render_template('comments.html', comments=comments)

if __name__ == '__main__':
    app.run(debug=True)

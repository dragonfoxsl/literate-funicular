from flask import Blueprint, render_template, Flask, render_template, request
from flask_login import login_required, current_user
from . import db
import boto3

main = Blueprint('main', __name__)

@main.route('/')
def index():
    return render_template('index.html')

@main.route('/upload')
@login_required
def upload():
    return render_template('upload.html', name=current_user.name)

@main.route('/upload', methods=['POST'])
@login_required
def signup_post():
    file = request.files['upload']
    # Create the client (Since IAM role is attached to the instance no need to specify the credentials)
    s3 = boto3.client('s3')
    s3.upload_fileobj(file, 'bisi-test-bucket', file.filename)
    return render_template('upload-success.html', name=current_user.name, file=file.filename)

from flask import Flask, redirect, url_for, request, render_template, jsonify, make_response
from werkzeug.utils import secure_filename
from keras.preprocessing.image import img_to_array
from keras.models import load_model
import cv2
import imutils
from keras.preprocessing import image
import numpy as np
import sys
import os
import glob
import re
from flask_sqlalchemy import SQLAlchemy
import pymysql
from random import seed
from random import randint
import base64

seed(1)


detection_model_path = 'haarcascade_files/haarcascade_frontalface_default.xml'
emotion_model_path = 'models/_mini_XCEPTION.73.hdf5'


face_detection = cv2.CascadeClassifier(detection_model_path)
emotion_classifier = load_model(emotion_model_path, compile=False)
EMOTIONS = ["angry","angry","angry","happy","sad","happy","neutral"]


app = Flask(__name__)
app.config['DEBUG'] = True

app.config['UPLOAD_FOLDER'] = 'static/images'

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://Om_movie:Password@localhost:3306/movierecommender'
app.config['SQLALCHEMY_ECHO'] = True
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


db = SQLAlchemy(app)
app.secret_key = 'key'



class result(db.Model):

    Rid = db.Column(db.Integer, primary_key=True)
    ans = db.Column(db.String(20), unique=False, nullable = False)

class happy(db.Model):

    mid = db.Column(db.Integer, primary_key=True)
    mnane = db.Column(db.String(40), unique=False, nullable = False)
    imglink = db.Column(db.String(100), unique=False, nullable=True)

class sad(db.Model):
    
    mid = db.Column(db.Integer, primary_key=True)
    mnane = db.Column(db.String(40), unique=False, nullable = False)
    imglink = db.Column(db.String(100), unique=False, nullable=True)

class angry(db.Model):
    
    mid = db.Column(db.Integer, primary_key=True)
    mnane = db.Column(db.String(40), unique=False, nullable = False)
    imglink = db.Column(db.String(100), unique=False, nullable=True)

class neutral(db.Model):
    
    mid = db.Column(db.Integer, primary_key=True)
    mnane = db.Column(db.String(40), unique=False, nullable = False)
    imglink = db.Column(db.String(100), unique=False, nullable=True)

@app.route("/")
def home():
    return render_template('index.html')

@app.route('/collectFace',methods = ['GET','POST'])
def collectFace():
    if request.method == "POST":
        f = open('temp.jpg', 'wb')
        b = base64.decodestring(request.get_json()['image'][23:].encode())
        f.write(b)
        f.close()
        emotion_classifier = load_model(emotion_model_path, compile=False)
        frame = cv2.imread('temp.jpg',1)

        frame = imutils.resize(frame,width=300)

        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        faces = face_detection.detectMultiScale(gray,scaleFactor=1.1,minNeighbors=5,minSize=(30,30),flags=cv2.CASCADE_SCALE_IMAGE)
        
        canvas = np.zeros((250, 300, 3), dtype='uint8')
        frameClone = frame.copy()

        faces = sorted(faces, reverse=True,
        key=lambda x: (x[2] - x[0])*(x[3]-x[1]))[0]
        (fX, fY, fW, fH) = faces

        roi = gray[fY:fY + fH, fX:fX + fW]

        roi = cv2.resize(roi, (48, 48))
        roi = roi.astype("float") / 255.0
        roi = img_to_array(roi)
        roi = np.expand_dims(roi, axis=0)

        preds = emotion_classifier.predict(roi)[0]
        label = EMOTIONS[preds.argmax()]

        print(label)


        # r=[]
        # for _ in range(5):
        #     value=randint(0, 10)
        #     q = "select * from "+label+" where mid="+str(value)+""
        #     r1 = db.engine.execute(q)
        #     r.append(r1)


        return jsonify(label)
        

    return render_template('index.html')

@app.route('/list_movies/')
def list_movies():
    label = request.args.get("label",0)
    q = "select * from "+label+" order by rand() limit 6"
    r = db.engine.execute(q)
    # r=[]
    # for _ in range(5):
    #     value=randint(0, 10)
    #     q = "select * from "+label+" where mid="+str(value)+""
    #     r1 = db.engine.execute(q)
    #     r.append(r1)

    db.session.commit()

    return render_template('predict.html', label=label, r = r)

# @app.route('/predict')
# def upload():
    
#     camera = cv2.VideoCapture(0)
#     while True:
#         frame = camera.read()[1]
#         # print(temp)
#         print("hi 1")


#         cv2.imshow('frame', frame)
#         print("hi 2")
        
        
#         if cv2.waitKey(1) & 0xFF == ord('q'):
#             cv2.imwrite('static/images/1.jpg',frame)
#             break
#     camera.release()
#     cv2.destroyAllWindows()

#     emotion_classifier = load_model(emotion_model_path, compile=False)
#     frame = cv2.imread('static/images/1.jpg',1)

#     frame = imutils.resize(frame,width=300)

#     gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
#     faces = face_detection.detectMultiScale(gray,scaleFactor=1.1,minNeighbors=5,minSize=(30,30),flags=cv2.CASCADE_SCALE_IMAGE)
    
#     canvas = np.zeros((250, 300, 3), dtype='uint8')
#     frameClone = frame.copy()

#     faces = sorted(faces, reverse=True,
#     key=lambda x: (x[2] - x[0])*(x[3]-x[1]))[0]
#     (fX, fY, fW, fH) = faces

#     roi = gray[fY:fY + fH, fX:fX + fW]

#     roi = cv2.resize(roi, (48, 48))
#     roi = roi.astype("float") / 255.0
#     roi = img_to_array(roi)
#     roi = np.expand_dims(roi, axis=0)

#     preds = emotion_classifier.predict(roi)[0]
#     label = EMOTIONS[preds.argmax()]

#     print(label)

#     q = "select * from "+label+""
#     r = db.engine.execute(q)
#     # r=[]
#     # for _ in range(5):
#     #     value=randint(0, 10)
#     #     q = "select * from "+label+" where mid="+str(value)+""
#     #     r1 = db.engine.execute(q)
#     #     r.append(r1)

#     entry = result(ans=label)
#     db.session.add(entry)

#     db.session.commit()

#     return render_template('predict.html', label=label, r = r)





app.run(debug=True)


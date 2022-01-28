from flask import Flask, render_template
import random
app=Flask(__name__)
#list of cat images
images=[
"https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGNhdHxlbnwwfHwwfH>
"https://media.istockphoto.com/photos/cat-with-blue-eyes-looks-at-camera-picture-id1067347086?k=20&m=1067347086&s=612x612&w=0&h=Wxch207C>
"https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554__340.jpg"
]
@app.route('/')
def index():
  url=random.choice(images)
  return render_template('index.html', url=url)

if __name__=="__main__":
  app.run(host ="0.0.0.0")

import subprocess
from fastapi import FastAPI, Request
from pydantic import BaseModel, Field
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
import json
import re

app = FastAPI()

templates = Jinja2Templates(directory="template")

@app.get("/list_topics")
def main():
    cmd = ["ros2", "topic", "list"]
    output = subprocess.Popen( cmd, stdout=subprocess.PIPE ).communicate()[0].decode('utf-8')
    topic_list = output.splitlines()
    json_topics = json.dumps(topic_list)
    return topic_list

@app.get("/play_bag")
def main():
    subprocess.run(["ros2", "bag", "play", "/home/user/ros2_ws/src/bags/rosbag2_2021_09_27-09_21_33"])
    # results = {'files': path, 'files_2': path_2}
    return 

@app.get("/kill_bag")
def main():
    subprocess.run(["ps"])
    # results = {'files': path, 'files_2': path_2}
    return 
# subprocess.run(["ros2", "bag", "play", "/home/user/ros2_ws/src/bags/rosbag2_2021_09_27-09_21_33"])

@app.get("/")
async def main(request: Request):
    return templates.TemplateResponse("homepage.html",{"request":request})
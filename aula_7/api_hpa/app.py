from flask import Flask
import os
import threading
import multiprocessing


app = Flask(__name__)

my_env = os.getenv('AMBIENTE')
print(f'AMBIENTE={my_env}')

@app.route('/')
def home():
    return 'Hello, Docker!'

@app.route('/AMBIENTE')
def env():
    return f'AMBIENTE={my_env}'

@app.route('/HEALTH')
def health():
    return 'OK'


def task(arg):
    print(f'Running task for {arg}')
    return sum([task(i) for i in range(1, arg)])


def cpu_load():
    task(15)

@app.route('/calc')
def calc():
    for i in range(multiprocessing.cpu_count()):
        thread = threading.Thread(target=cpu_load)
        thread.start()
    
    return 'OK'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
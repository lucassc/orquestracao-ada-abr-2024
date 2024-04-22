import threading
import multiprocessing


def task(arg):
    print(f'Running task for {arg}')
    return sum([task(i) for i in range(1, arg)])


def cpu_load():
    while True:
        task(6666665)

if __name__ == "__main__":
    for i in range(multiprocessing.cpu_count()):
        thread = threading.Thread(target=cpu_load)
        thread.start()
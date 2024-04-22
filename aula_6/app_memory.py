import time

def consume_memory():
    memory_hog = []
    try:
        while True:
            memory_hog.append(' ' * 10**6)  # each string ~1MB in size
            time.sleep(0.1)  # delay to watch memory fill up gradually
            print(f"Memory consumed: {len(memory_hog)}MB")
    except MemoryError:
        print("Memory filled!")
        while True:
            time.sleep(1)  # keep the process alive after filling memory

if __name__ == "__main__":
    consume_memory()

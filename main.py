#!/usr/bin/env python
# coding: utf-8
import time
import os
import shutil
import multiprocessing
import signal

# create folder if not exists
if not os.path.exists('experimental_results'):
    os.makedirs('experimental_results')

shutil.copyfile('config.json', '/home/default/IndustrialAPI/config.json')

def start_app():
    os.system('python3 /home/default/IndustrialAPI/app.py')

def start_devices():
    os.system('python3 /home/default/IndustrialAPI/launch_devices.py')

def start_controller():
    os.system('python3 /home/default/controller.py')

if __name__ == '__main__':
    p = multiprocessing.Process(target=start_app)
    p.start()
    time.sleep(5)

    p2 = multiprocessing.Process(target=start_devices)
    p2.start()
    time.sleep(5)

    p3 = multiprocessing.Process(target=start_controller)
    p3.start()

    time.sleep(10)

    p3.join()

    os.killpg(os.getpgid(p2.pid), signal.SIGTERM)

    os.killpg(os.getpgid(p.pid), signal.SIGTERM)

    p2.join()

    p.join()
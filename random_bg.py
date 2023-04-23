#!/bin/python

# Link This File In .config/hypr/scripts

import os
import random
import subprocess
import getpass


# current_dir = os.getcwd()
# parent_dir = os.path.abspath(os.path.join(current_dir, os.pardir))
# images_dir = os.path.join(parent_dir, "images")
username = getpass.getuser()
main_dir = '/home/{}/.config/hypr/images'.format(username)
list_img = os.listdir(main_dir)

random_img = random.choice(list_img)

change_bg = subprocess.run(['swww','img', main_dir + f'/{random_img}', '--transition-fps', '60', '--transition-type', 'wipe', '--transition-duration', '5'])

import subprocess
import json

def workspaces():
    return subprocess.check_output(["bspc", "query", "-D", "--names"], encoding='utf-8').split()

def current_workspace():
    return subprocess.check_output(["bspc", "query", "-D", "-d", "focused", "--names"], encoding='utf-8').strip()

def current_bounds():
    jsonInfo = subprocess.check_output(["bspc", "query", "-T", "-m"], encoding='utf-8')
    info = json.loads(jsonInfo)
    
    rect = info['rectangle']
    return (rect['x'], rect['y'], rect['x'] + rect['width'], rect['y'] + rect['height'])

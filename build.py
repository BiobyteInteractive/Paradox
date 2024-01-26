#!python
import os
import platform

target = platform.platform()
debug = True

def build(project_path, output_path):
    if not os.path.exists("bin"):
        os.makedirs("bin")
    pass

def run(path):
    pass

def main():
    build("./sandbox", "./bin/sandbox")
    run("./bin/sandbox/sandbox.exe")

if __name__ == "__main__":
    main()
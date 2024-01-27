#!python
import os
import platform
import subprocess

target = platform.platform()
debug = True

def build(project_path, output_path, project, debug):
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    if debug:
        subprocess.run(["odin", "build", project_path, "-out:{0}/{1}.exe".format(output_path, project), "-o:none", "-debug"])
    else:
        subprocess.run(["odin", "build", project_path, "-out:{0}/{1}.exe".format(output_path, project), "-o:none"])

def run(path, debug):
    if debug:
        subprocess.run(["raddbg", path])
    else:
        subprocess.run([path])

def main():
    debug = True
    build("./sandbox", "./bin/sandbox", "sandbox", debug)
    run("./bin/sandbox/sandbox.exe", debug)

if __name__ == "__main__":
    main()
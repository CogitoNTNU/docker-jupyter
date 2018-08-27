import sys
import hashlib
import uuid

base_url = sys.argv[1]
salt = uuid.uuid4().hex
password = hashlib.sha256((sys.argv[2] + salt).encode()).hexdigest()

with open('/root/.jupyter/jupyter_notebook_config.py', 'w') as f:
	f.write("c.NotebookApp.base_url = '/group/%s'\n" % base_url)
	f.write("c.NotebookApp.password = 'sha256:%s:%s'\n" % (salt, password))
	f.write("c.NotebookApp.ip = '0.0.0.0'\n")
	f.write("c.NotebookApp.open_browser = False\n")
	f.write("c.NotebookApp.notebook_dir = '/code/notebook/'\n")

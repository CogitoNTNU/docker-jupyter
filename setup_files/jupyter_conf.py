import sys
import hashlib
import uuid

base_url = sys.argv[1]
salt = uuid.uuid4().hex
password = hashlib.sha256((sys.argv[2] + salt).encode()).hexdigest()

with open('/code/tmp/jupyter.conf', 'r') as f:
	content = f.read()

content = content % {
	'salt': salt,
	'password': password,
	'base_url': base_url,
}

with open('/root/.jupyter/jupyter_notebook_config.py', 'w') as f:
	f.write(content)

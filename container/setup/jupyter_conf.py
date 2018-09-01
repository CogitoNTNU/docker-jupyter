import sys, hashlib, uuid, os

with open('/code/tmp/jupyter.conf', 'r') as f:
	content = f.read()

salt = uuid.uuid4().hex
content = content % {
	'salt': salt,
	'password': hashlib.sha256((sys.argv[1] + salt).encode()).hexdigest(),
	'base_url': sys.argv[2] if len(sys.argv) > 2 else '',
}

with open('/root/.jupyter/jupyter_notebook_config.py', 'w') as f:
	f.write(content)

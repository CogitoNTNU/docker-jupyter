import sys
import os
import uuid

def launch(n):
	for i in range(1, int(n)+1):
		password = uuid.uuid4().hex[:6]
		group = str(i).rjust(2, '0')
		os.system('sudo docker run --runtime=nvidia -d -p 80%s:8888 -v $PWD/notebooks/%s:/code/notebook -e BASE_URL=%s -e PASSWORD=%s jupyter' % (group, group, group, password))
		message = 'Group %s: %s' % (group, password)
		print(message)
		with open('passwords.txt', 'a') as f:
			f.write(message + '\n')

def gen_index(n):
        with open('index.html', 'r') as f:
                content = f.read()

        paragraphs = '\n'.join(['<p><a href="/group/%s">Group %r</a></p>' % (str(i).rjust(2, '0'), i) for i in range(1, int(n)+1)])
        content = content % {'body_content': paragraphs}

        with open('/var/www/html/index.html', 'w') as f:
                f.write(content)

gen_index(sys.argv[1])
launch(sys.argv[1])

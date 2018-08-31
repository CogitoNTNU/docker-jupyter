import sys
import os
import uuid

def launch(n):
	n = int(n)
	if n == 1:
		os.system('sudo docker run --runtime=nvidia -d -p 9000:8888 -v $PWD/notebook/:/code/notebook -e -e PASSWORD=%s jupyter "export SINGLE=true"' % password)
	else:
		gen_index(n)
		for i in range(1, n+1):
			password = uuid.uuid4().hex[:6]
			group = str(i).rjust(2, '0')
			os.system('sudo docker run --runtime=nvidia -d -p 90%s:8888 -v $PWD/notebooks/%s:/code/notebook -e BASE_URL=%s -e PASSWORD=%s jupyter' % (group, group, group, password))
			message = 'Group %s: %s' % (group, password)
			print(message)
			with open('passwords.txt', 'a') as f:
				f.write(message + '\n')

def gen_index(n):
        with open('etc/index.html', 'r') as f:
                content = f.read()

        paragraphs = '\n'.join(['<p><a href="/%s">%r</a></p>' % (str(i).rjust(2, '0'), i) for i in range(1, n+1)])
        content = content % {'body_content': paragraphs}

        with open('/var/www/html/index.html', 'w') as f:
                f.write(content)

launch(sys.argv[1])

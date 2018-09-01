import sys
import os
import uuid

def launch(n):
	runtime = '--runtime=nvidia' if 'gpu' in os.listdir('etc') else ''
	n = int(n)
	if n == 1:
		os.system('sudo cp etc/nginx_single.conf /etc/nginx/sites-enabled/default && sudo systemctl restart nginx')
		password = uuid.uuid4().hex[:6]
		os.system('sudo docker run %s -d -p 8000:8888 -v $PWD/notebook/:/code/notebook -e BASE_URL=/ -e PASSWORD=%s jupyter' % (runtime, password))
		message = 'Password: %s' % password
		print(message)
		with open('passwords.txt', 'a') as f:
			f.write(message + '\n')
	else:
		os.system('sudo cp etc/nginx_multiple.conf /etc/nginx/sites-enabled/default && sudo systemctl restart nginx')
		gen_index(n)
		for i in range(1, n+1):
			password = uuid.uuid4().hex[:6]
			group = str(i).rjust(2, '0')
			os.system('sudo docker run %s -d -p 80%s:8888 -v $PWD/notebooks/%s:/code/notebook -e BASE_URL=/%s -e PASSWORD=%s jupyter' % (runtime, group, group, group, password))
			message = 'Group %s: %s' % (group, password)
			print(message)
			with open('passwords.txt', 'a') as f:
				f.write(message + '\n')

def gen_index(n):
        with open('etc/index.html', 'r') as f:
                content = f.read()

        paragraphs = '\n'.join(['<p class="notebook"><a href="/%s">%s</a></p>' % (*2*[str(i).rjust(2, '0')],) for i in range(1, n+1)])
        content = content % {'body_content': paragraphs}

        with open('/var/www/html/index.html', 'w') as f:
                f.write(content)

launch(sys.argv[1])

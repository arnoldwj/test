FROM python:3.7

ADD main.py .

RUN pip install selenium && \
    pip install flask

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

ENV PATH="/usr/bin/chromedriver:$PATH"

COPY . .

#run this command for docker only
#CMD ["python3", "./main.py"]
COPY . .

#run this command for docker with flask
#CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
CMD ["app.py"]
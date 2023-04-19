FROM python:3.7

ADD main.py .

RUN pip install selenium

#pip install --upgrade pip && \
#    pip install pytest && \
#    pip install pytest-mock && \
#    pip install pytest-smtp && \
#    pip install mock && \
#    pip install schedule && \
#    pip install selenium &&
#    pip install Selenium-Screenshot

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

#RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

#RUN wget https://chromedriver.storage.googleapis.com/112.0.5615.49/chromedriver_linux64.zip
#RUN unzip chromedriver_linux64.zip
#RUN mv chromedriver /usr/bin/chromedriver
#RUN chown root:root /usr/bin/chromedriver
#RUN chmod +x /usr/bin/chromedriver

ENV PATH="/usr/bin/chromedriver:$PATH"

CMD ["python", "./main.py"]
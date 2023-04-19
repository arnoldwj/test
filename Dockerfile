FROM python:3.7

ADD main.py .

RUN pip install --upgrade pip && \
    pip install pytest && \
    pip install pytest-mock && \
    pip install pytest-smtp && \
    pip install mock && \
    pip install schedule && \
    pip install selenium && \
    pip install Selenium-Screenshot

#RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install
#
#RUN wget https://chromedriver.storage.googleapis.com/112.0.5615.49/chromedriver_linux64.zip
#RUN unzip chromedriver_linux64.zip
#RUN mv chromedriver /usr/bin/chromedriver
#RUN chown root:root /usr/bin/chromedriver
#RUN chmod +x /usr/bin/chromedriver

#ENV PATH="/usr/bin/chromedriver:$PATH"

CMD ["python", "./main.py"]
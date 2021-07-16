FROM python:3.8-alpine

ADD backend /opt/backend
ADD requirements.txt /opt/backend
WORKDIR /opt/backend

RUN pip install --no-cache-dir https://github.com/Philogag/Flask-HDFS-Cloud-Disk/releases/download/Pre-0.0.1/pycryptodome-3.10.1-cp35-abi3-linux_x86_64.whl \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir gunicorn 

CMD ["gunicorn", "-w 4", "-b 0.0.0.0:5000", "main:app"]
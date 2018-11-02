FROM python:2
RUN groupadd -r dockerpytwox && useradd --no-log-init --create-home -r -g dockerpytwox dockerpytwox
WORKDIR /usr/src/app
COPY deep_disfluency/experiments/requirements.txt ./
RUN pip install --no-cache-dir -r deep_disfluency/experiments/requirements.txt
COPY . .
USER dockerpytwox

# Exposing ports in your Docker container
EXPOSE 8888
CMD [ "demo.py" ]
CMD [ "jupyter", "notebook", "--ip", "0.0.0.0", "demo.ipynb" ]

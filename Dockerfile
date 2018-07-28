FROM python:3.7
WORKDIR /work
ENV PATH="/root/.local/bin/:${PATH}"
COPY run.sh /work
RUN pip install pyparsing && \
    git clone https://achary@bitbucket.org/achary/rx-marbles.git && \
    cd rx-marbles && \
    pip install --user . && \
    apt-get update -y && \
    apt-get install -y imagemagick librsvg2-bin && \
    mkdir -p /data   && \
    chmod +x /work/run.sh
WORKDIR /data
ENTRYPOINT /work/run.sh
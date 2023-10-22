FROM python:3.11.3-slim
WORKDIR /app
EXPOSE 8080


COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/
COPY alpen_stream_r.py /app/
COPY StreamlitCallbackHandlerOEHV.py /app/
ADD .streamlit /app/.streamlit

ENTRYPOINT ["streamlit", "run", "alpen_stream_r.py", "--server.port=8080", "--server.address=0.0.0.0"]
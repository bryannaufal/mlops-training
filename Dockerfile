FROM python:3.11-slim 
WORKDIR /app 
COPY requirements.txt . 
RUN pip install --no-cache-dir -r requirements.txt 
COPY serve.py . 
COPY ./mlruns/2/models/m-9dc7cdfcbd704e80807e9746afa5df05/artifacts ./model
EXPOSE 8080 
CMD ["uvicorn", "serve:app", "--host", "0.0.0.0", "--port", "8080"]
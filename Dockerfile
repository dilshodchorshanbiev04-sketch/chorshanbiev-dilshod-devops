FROM python:3.12-slim
WORKDIR /app
COPY app/app.py .
RUN echo "Image built for Dilshod Chorshanbiev, IT2-2312" > /app/build_info.txt
EXPOSE 8080
CMD ["python", "app.py"]

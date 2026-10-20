FROM python:3.12-alpine
WORKDIR /app
COPY app/app.py .
RUN adduser -D student
ENV STUDENT_NAME=Diyar \
    STUDENT_SURNAME=Bakhyt \
    STUDENT_GROUP=IT2-2301 \
    STUDENT_ID=38310
USER student
EXPOSE 8080
CMD ["python", "app.py"]

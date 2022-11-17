FROM nginx:stable-alpine AS mtg_cards
RUN rm -rf /usr/share/nginx/html/*
COPY ./build/web /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]


FROM python:bullseye AS django
WORKDIR /app
COPY backend/requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY backend/ .
RUN python manage.py migrate
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
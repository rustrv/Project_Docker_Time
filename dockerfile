# Используем официальный образ Python
FROM python:3.8-slim

# Устанавливаем необходимые зависимости
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Создаем рабочую директорию /app
WORKDIR ./

# Копируем файл main.py из GitHub в текущую директорию
ARG CACHEBUST=6

RUN curl -LJO https://raw.githubusercontent.com/rustrv/Time_screen/master/main.py
#RUN curl -LJO https://raw.githubusercontent.com/rustrv/Time_screen/master/time.py

# Устанавливаем зависимости Python
RUN pip install --no-cache-dir colorama

# Запускаем приложение
CMD ["python", "./main.py"]


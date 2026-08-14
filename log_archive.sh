#!/bin/bash

# $0 - take first word, $1 - second, $# - count arguments
if [ $# -ne 1 ]; then
	echo "Ошибка: введите путь к дерриктории с логами."
	echo "Используйте: $0 <log directory>"
	exit 1
fi

# -d "$log_dir" — проверяет, что путь существует и является директорией.
log_dir="$1"
if [ ! -d "$log_dir" ]; then
	echo "$log_dir не является директорией."
	exit 1
fi

# Создаем папку если ее не существует в домашней директории юзера
mkdir -p ~/log_archives/logs
mkdir -p ~/log_archives/archives
touch ~/log_archives/logs/archive_log.txt
log_file="$HOME/log_archives/logs/archive_log.txt"

#  Создаем переменные для сохранения времени создания архива в названии файла
timestamp=$(date +%Y%m%d_%H%M%S)
archive_name="logs_archive_${timestamp}.tar.gz"

#  Создаем архив
tar -czf ~/log_archives/archives/"$archive_name" -C "$log_dir" .

# Проверяем успешность операции
if [ $? -eq 0 ]; then
    echo "Архив успешно создан: $HOME/log_archives/archives/$archive_name"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Archived $log_dir to $archive_name" >> "$log_file"
else
    echo "Ошибка при создании архива" >&2
    exit 1
fi

# Log Archive Tool

Скрипт для архивации логов из указанной директории с добавлением временной метки.

## Возможности

- Принимает путь к директории с логами как обязательный аргумент.
- Проверяет существование директории.
- Создаёт архив в формате `tar.gz` с именем `logs_archive_YYYYMMDD_HHMMSS.tar.gz`.
- Сохраняет архивы в `~/log_archives/archives/`.
- Ведёт лог-файл `archive_log.txt` в `~/log_archives/logs/` с записью даты, времени, исходной директории и имени архива.
- Сообщает пользователю об успехе или ошибке.

## Требования

- Bash
- Утилиты: `tar`, `date` (обычно уже установлены в любой Linux-системе).

## Установка

Клонируйте репозиторий и перейдите в папку:

```bash
git clone git@github.com:goha46/log-archive.git
cd log-archive
```

## Использование

Дайте права на выполнение:

```bash
chmod +x log_archive.sh
Запустите скрипт, указав путь к директории с логами:
```

```bash
./log_archive.sh /var/log
```

## Пример вывода
```text
Архив успешно создан: /home/user/log_archives/archives/logs_archive_20240816_100648.tar.gz
Структура каталогов после запуска
```

```text
~/log_archives/
├── archives/
│   └── logs_archive_20240816_100648.tar.gz
└── logs/
    └── archive_log.txt
```

## Логирование

В файл ~/log_archives/logs/archive_log.txt добавляется строка вида:

```text
2024-08-16 10:06:48 - Archived /var/log to logs_archive_20240816_100648.tar.gz
```

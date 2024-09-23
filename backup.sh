#!/bin/bash

# 백업할 디렉터리와 백업 저장 위치를 정의
SOURCE_DIR="/home/username/step02shell"
BACKUP_DIR="/home/username/step02shell_$(date +\%Y\%m\%d_\%H\%M\%S)"

# 백업 디렉터리가 존재하지 않으면 생성
mkdir -p "$BACKUP_DIR"

# 디렉터리를 복사하여 백업
cp -r "$SOURCE_DIR" "$BACKUP_DIR"

echo "백업 완료: $SOURCE_DIR -> $BACKUP_DIR"

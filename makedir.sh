#!/bin/bash

# 디렉토리 이름과 생성할 갯수를 입력 받음
echo "생성할 디렉토리 이름을 입력하세요:"
read dir_name

echo "생설한 디렉토리 갯수를 입력하세요:"
read dir_number

# 디렉토리가 이미 존재하는지 확인하고, 없다면 생성
for ((i=1; i<=dir_number; i++))
do
    dir="${dir_name}${i}"

if [ -d "$dir_name" ]; then
    echo "디렉토리 '$dir_name'가 이미 존재합니다."
else
    mkdir "$dir"
    echo "디렉토리 '$dir'가 생성되었습니다."
fi

done
exit 0

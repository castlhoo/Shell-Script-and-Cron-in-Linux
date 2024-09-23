# Shell-Script-and-Cron-in-Linux
개인 프로젝트 개요
: Shell 프로그래밍 실습으로 이해 증진 및 Cron을 활용한 업무 자동화
  Shell을 이용하여 가상머신 내에 파일 및 디렉터리를 for문과 if문을 활용하여 만들어보고, 만든 디렉터리 내 모든 파일들이 오전 9시에 매일 백업이 되도록 Cron을 활용하여 설정하였다.

  1. Shell을 이용하여 디렉터리 생성하기
  ![image](https://github.com/user-attachments/assets/f81f5c56-dd9e-4949-a671-9519e5c5a1df)

  #!/bin/bash

  # 디렉토리 이름과 생성할 갯수를 입력 받음
  echo "생성할 디렉토리 이름을 입력하세요:"  
  read dir_name

  echo "생성할 디렉토리 갯수를 입력하세요:"
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

  ![image](https://github.com/user-attachments/assets/48e222f4-f25c-4a2d-8185-57180c404d7d)
  ![image](https://github.com/user-attachments/assets/d55625e2-7de4-4fde-959c-a8edf4230d2c)


  > 먼저 생성할 디렉토리의 이름과 갯수를 read를 통해 입력받는다. 그 후에는 for문을 사용하여 1부터 생성하고자 하는 갯수까지 설정을 하고, 입력받은 dir_name과 i를 합쳐서 새로운 변수인 dir을 생성한다. if문으로는 이 디렉토리가 이미 존재하는 디렉토리인지 확인하고 존재한다면 "디렉토리 '$dir_name'가 이미 존재합니다."를 출력하고, 존재하지 않는다면 생성하도록 한다.

  2. 백업하기 위한 준비작업
     백업하기 위해 shell scrpit로 백업하는 프로그램을 설정해준다.

    #!/bin/bash

    # 백업할 디렉터리와 백업 저장 위치를 정의
     SOURCE_DIR="/home/username/step02shell"
     BACKUP_DIR="/home/username/step02shell_$(date +\%Y\%m\%d_\%H\%M\%S)"

    # 백업 디렉터리가 존재하지 않으면 생성
    mkdir -p "$BACKUP_DIR"

    # 디렉터리를 복사하여 백업
    cp -r "$SOURCE_DIR" "$BACKUP_DIR"

    echo "백업 완료: $SOURCE_DIR -> $BACKUP_DIR"

  ![image](https://github.com/user-attachments/assets/d3050a33-864f-4eef-8afd-82bf4ff5294f)
  > 먼저 백업할 디렉터리와 백업 저장위치를 정의하고, 백업 디렉터리가 존재하지 않는다면 따로 생성하도록 한다.

  ![image](https://github.com/user-attachments/assets/b8e215e8-472f-4d34-bd4c-714ef39d1791)
  > 이후, 해당 파일에 실행하는 권한을 부여하여 백업파일이 실행이 가능하도록 설정한다.

  3. Cron 설정
     crontab -e로 자동화 설정을 실시한다.
     0 9 * * * /path/to/backup_step02shell.sh
     ![image](https://github.com/user-attachments/assets/9f4f8d31-cb0b-430e-9755-6d9085873e1b)

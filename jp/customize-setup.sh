#!/bin/bash

function info(){
  echo -e "\e[1m$1 \e[21m"
}

info "ipアドレスを割り当てます"
info "まだコマンドが作成されていません..."

info "ユーザー名をcluster$1に変更します。"
usermod -l cluster$1 -d /home/cluster$1 -m masterpi

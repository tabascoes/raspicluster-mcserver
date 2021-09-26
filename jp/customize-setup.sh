#!/bin/bash

function info(){
  echo -e "\e[1m$1 \e[21m"
}

info "ipアドレスを割り当てます"
info "固定ipアドレスは$3$1のようになります"
if [ $2 = "lan" ]; then
  info "有線LAN(LAN)を設定しています"
  cat <<EOF | tee /etc/dhcpcd.conf
interface eth0
static ip_address=$3$1/24
static routers=$4
static domain_name_servers=$5
EOF
else
  info "無線LAN(Wi-FI)を設定しています"
  cat <<EOF | tee /etc/dhcpcd.conf
interface wlan0
static ip_address=$3$1/24
static routers=$4
static domain_name_servers=$5
EOF
fi

info ファイルを確認しています
cat /etc/dhcpcd.conf

# info "まだコマンドが作成されていません..."

info "ユーザー名をcluster$1に変更します。"
usermod -l cluster$1 -d /home/cluster$1 -m masterpi

num="$1"
nnum="$((num + 1))"
if [ ${#nnum} = 1 ]; then
  nnum="0$nnum"
fi

info 次回は以下のコマンドを実行してください
info 'curl -sSL https://git.io/JziqO | sh '"$nnum $2 $3 $4 $5"

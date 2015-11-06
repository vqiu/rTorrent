#!/bash/bash
# Finename: rTorrent_Install.sh

# 下载目录
Down_Dir="/data/rTorrent/Download"

# Session 目录
Sess_Dir="/data/rTorrent/session"

# 种子目录
Torrent_Dir="/data/rTorrent/torrent"

if [[ $(id -u) -ne '0' ]]; then
	echo "Please use root role run this script"
	exit 1;
fi

yum -y install rtorrent

for i in ${Down_Dir} ${Sess_Dir} ${Torrent_Dir}; do
	if [[ ! -d ${i} ]]; then
		mkdir -p ${i}
	fi
done

wget -c https://down.vqiu.cn/conf/Linux_conf/xTorrent/rtorrent.rc -O ${HOME}/.rtorrent.rc

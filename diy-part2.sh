#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

#修改默认主题
sed -i 's/bootstrap/argon/g' ./feeds/luci/collections/luci/Makefile

#设置TTYD登录无需密码
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

#设置管理密码
sed -i 's/root:$1$Tp0WlehU$7fTieRPHm4ie41xa22r9T/:19673:0:99999:7:::/g' package/base-files/files/etc/shadow

#更改设备名
sed -i "/uci commit system/i\uci set system.@system[0].hostname='N4505'" package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='N4505'/g" ./package/base-files/files/bin/config_generate
#修改连接数
echo "net.netfilter.nf_conntrack_max=165535" >> package/base-files/files/etc/sysctl.conf
#sed -i '5i\uci set luci.main.mediaurlbase=/luci-static/openwrt2020' package/lean/default-settings/files/zzz-default-settings

rm -rf package/lean/autocore
echo " ____  _                        _      ___                __        __    _   " > package/base-files/files/etc/banner
echo "/ ___|| |_ __ _ _ __ _ __   ___| |_   / _ \ _ __   ___ _ _\ \      / / __| |_ " >> package/base-files/files/etc/banner
echo "\___ \| __/ _\` | '__| '_ \ / _ \ __| | | | | '_ \ / _ \ '_ \ \ /\ / / '__| __|" >> package/base-files/files/etc/banner
echo " ___) | || (_| | |  | | | |  __/ |_  | |_| | |_) |  __/ | | \ V  V /| |  | |_ " >> package/base-files/files/etc/banner
echo "|____/ \__\__,_|_|  |_| |_|\___|\__|  \___/| .__/ \___|_| |_|\_/\_/ |_|   \__|" >> package/base-files/files/etc/banner
echo "                                           |_|                                " >> package/base-files/files/etc/banner
echo "------------------------------------------------------------------------------" >> package/base-files/files/etc/banner
echo "                        %D %V %C                         " >> package/base-files/files/etc/banner
echo "------------------------------------------------------------------------------" >> package/base-files/files/etc/banner


#安装
./scripts/feeds install -af



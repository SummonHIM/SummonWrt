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
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify System Setting
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
sed -i "s/hostname='OpenWrt'/hostname='SummonWrt'/g" package/base-files/files/bin/config_generate
sed -i "s/timezone='UTC'/timezone='CST-8'/g" package/base-files/files/bin/config_generate
sed -i "/CST-8/a\\\t\tset system.@system[-1].zonename=\'Asia/Shanghai\'" package/base-files/files/bin/config_generate
sed -i "s/openwrt.pool.ntp.org/cn.pool.ntp.org/g" package/base-files/files/bin/config_generate
echo 'chsh -s /usr/bin/zsh' >>package/base-files/files/bin/config_generate
sed -i "s/\/bin\/ash/\/usr\/bin\/zsh/g" package/base-files/files/etc/passwd
echo '/usr/bin/zsh' >package/base-files/files/etc/shells
echo '/bin/ash' >>package/base-files/files/etc/shells

wget https://raw.githubusercontent.com/SummonHIM/SummonWrt/master/Scripts/f.init.sh -O package/base-files/files/bin/f.init.sh
chmod +x package/base-files/files/bin/f.init.sh

sed -i 's/START=60/START=90/g' feeds/packages/net/softethervpn/files/vpnbridge.init
sed -i 's/START=60/START=90/g' feeds/packages/net/softethervpn/files/vpnclient.init
sed -i 's/START=60/START=90/g' feeds/packages/net/softethervpn/files/vpnserver.init
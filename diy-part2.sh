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

#package
cd package/lean
git clone https://github.com/openwrt-develop/luci-theme-atmaterial
cd ../..

#update & install feeds
./scripts/feeds update -a && ./scripts/feeds install -a

#update kernel
#sed -i 's/KERNEL_PATCHVER:=4.9/KERNEL_PATCHVER:=5.4/g' target/linux/ar71xx/Makefile

#set theme
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

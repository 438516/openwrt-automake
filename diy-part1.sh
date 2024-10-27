sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default

sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default

echo "src-git mihomo https://github.com/morytyann/OpenWrt-mihomo.git;main" >> "feeds.conf.default"

git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird

./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns

rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

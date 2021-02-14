#### 支持机型

[![x86-64](https://github.com/vgist/OpenWrt-Autobuild/workflows/x86-64/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions?query=workflow%3Ax86-64)
[![NanoPi-R2S](https://github.com/vgist/OpenWrt-Autobuild/workflows/NanoPi-R2S/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions?query=workflow%3ANanoPi-R2S)
[![ZeroPi](https://github.com/vgist/OpenWrt-Autobuild/workflows/ZeroPi/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions?query=workflow%3AZeroPi)
[![Phicomm-K3](https://github.com/vgist/OpenWrt-Autobuild/workflows/Phicomm-K3/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions?query=workflow%3APhicomm-K3)
[![Phicomm-K2P](https://github.com/vgist/OpenWrt-Autobuild/workflows/Phicomm-K2P/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions?query=workflow%3APhicomm-K2P)
[![Xiaomi-MiWifi-Mini](https://github.com/vgist/OpenWrt-Autobuild/workflows/Xiaomi-MiWifi-Mini/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions?query=workflow%3AXiaomi-MiWifi-Mini)

#### 部分应用来源

[![coolsnowwolf](https://img.shields.io/badge/Lede-Lean-orange.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede)
[![Lienol](https://img.shields.io/badge/OpenWrt-Lienol-orange.svg?style=flat&logo=appveyor)](https://github.com/Lienol/openwrt)
[![CTCGFW](https://img.shields.io/badge/OpenWrt-CTCGFW-orange.svg?style=flat&logo=appveyor)](https://github.com/project-openwrt/openwrt)

#### 特色及功能

- Dropbear 打开 ECC 支持
- 已进入上游稳定分支的设备，只跟进稳定分支
- 默认密码: 无
- 依赖性不强的应用不考虑集成，有依赖问题再考虑
- 弱鸡的 cpu，不考虑集成 golang 应用

#### 分支

| 版本   |x86_64 |NanoPi R2S|ZeroPi |Phicomm K3|Phicomm K2P|MiWiFi-Mini|
|--------|:-----:|:--------:|:-----:|:--------:|:---------:|:---------:|
| master |       | &check;  |&check;|          |           |           |
| 19.07.6|&check;|          |       | &check;  |  &check;  |  &check;  |

#### 第三方应用列表

| 应用        |x86_64 |NanoPi R2S|ZeroPi |Phicomm K3|Phicomm K2P|MiWiFi-Mini|
|-------------|:-----:|:--------:|:-----:|:--------:|:---------:|:---------:|
|AdGuard Home |&check;| &check;  |&check;| &check;  |           |           |
| AutoCore    |&check;| &check;  |&check;| &check;  |           |           |
| cpufreq     |       | &check;  |&check;|          |           |           |
| DDNS        |&check;| &check;  |&check;| &check;  |           |           |
|FullCone NAT |&check;| &check;  |&check;| &check;  |  &check;  |  &check;  |
| frpc        |&check;| &check;  |&check;| &check;  |           |           |
| frps        |&check;| &check;  |&check;| &check;  |           |           |
| HWNAT       |       |          |       |          |  &check;  |           |
| IPSEC       |&check;| &check;  |&check;| &check;  |           |           |
| MiniUPnP    |&check;| &check;  |&check;| &check;  |           |           |
| OpenClash   |&check;| &check;  |&check;| &check;  |  &check;  |           |
| PassWall    |&check;| &check;  |&check;| &check;  |           |  &check;  |
| Server 酱   |&check;| &check;  |&check;| &check;  |           |           |
| SFE         |&check;| &check;  |&check;| &check;  |           |  &check;  |
| usb 打印    |&check;| &check;  |&check;| &check;  |           |  &check;  |
| vlmcsd 服务 |&check;| &check;  |&check;| &check;  |  &check;  |  &check;  |
| Zerotier    |&check;| &check;  |&check;| &check;  |  &check;  |           |
| 定时重启    |&check;| &check;  |&check;| &check;  |  &check;  |  &check;  |
|解锁灰色歌曲 |&check;| &check;  |&check;| &check;  |           |           |
| 流量监控    |&check;| &check;  |&check;| &check;  |  &check;  |  &check;  |
|上网时间控制 |&check;| &check;  |&check;| &check;  |  &check;  |  &check;  |
| 网络共享    |&check;| &check;  |&check;| &check;  |           |  &check;  |
| 文件传输    |&check;| &check;  |&check;| &check;  |           |           |
| 迅雷快鸟    |&check;| &check;  |&check;| &check;  |           |           |
| 应用过滤    |&check;| &check;  |&check;| &check;  |           |           |
| 自动挂载    |&check;| &check;  |&check;| &check;  |           |  &check;  |

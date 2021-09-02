#### 支持机型

[![X86-64](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/x86_64.yml/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/x86_64.yml)
[![NanoPi-R2C](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/r2c.yml/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/r2c.yml)
[![NanoPi-R2S](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/r2s.yml/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/r2s.yml)
[![ZeroPi](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/zeropi.yml/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/zeropi.yml)
[![Phicomm-K3](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/k3.yml/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/k3.yml)
[![Phicomm-K2P](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/k2p.yml/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/k2p.yml)
[![MiWiFi-Mini](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/miwifi-mini.yml/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions/workflows/miwifi-mini.yml)

#### 特色及功能

- 上游 stable 分支中设备，只跟进 stable
- 默认密码: 无
- 依赖内核模块时，再考虑编译进固件
- 二进制 golang 应用，尽量不编译进小闪存设备
- K2P blob 的 wifi 采用闭源驱动

#### 分支

| 版本    |x86-64 |NanoPi<br>R2C R2S ZeroPi|Phicomm K3|Phicom K2P|MiWiFi mini|
|:-------:|:-----:|:----------------------:|:--------:|:--------:|:---------:|
| 21.02.0 |&check;|        &check;         | &check;  | &check;  |  &check;  |

#### 第三方应用列表

| 应用        |x86-64 |NanoPi<br>R2C R2S ZeroPi|Phicomm K3|Phicomm K2P|MiWiFi-mini|
|-------------|:-----:|:----------------------:|:--------:|:---------:|:---------:|
|Adbyby plus+ |       |                        |          |  &check;  |  &check;  |
|AdGuard Home |&check;|        &check;         | &check;  |           |           |
| AutoCore    |&check;|        &check;         | &check;  |           |           |
| cpufreq     |       |        &check;         |          |           |           |
| DDNS        |&check;|        &check;         | &check;  |  &check;  |  &check;  |
|FullCone NAT |&check;|        &check;         | &check;  |  &check;  |  &check;  |
| frpc & frps |&check;|        &check;         | &check;  |           |           |
|IPv6 兼容助手|&check;|        &check;         | &check;  |  &check;  |  &check;  |
| IPSEC       |&check;|        &check;         | &check;  |           |           |
| MiniUPnP    |&check;|        &check;         | &check;  |  &check;  |  &check;  |
| OpenClash   |&check;|        &check;         | &check;  |           |           |
| PassWall    |&check;|        &check;         | &check;  |  &check;  |  &check;  |
| Server 酱   |&check;|        &check;         | &check;  |  &check;  |  &check;  |
| SSRP+       |&check;|        &check;         | &check;  |  &check;  |  &check;  |
| usb 打印    |&check;|        &check;         | &check;  |           |  &check;  |
| vlmcsd 服务 |&check;|        &check;         | &check;  |  &check;  |  &check;  |
| Zerotier    |&check;|        &check;         | &check;  |  &check;  |  &check;  |
| 定时重启    |&check;|        &check;         | &check;  |  &check;  |  &check;  |
| 流量监控    |&check;|        &check;         | &check;  |  &check;  |  &check;  |
|上网时间控制 |&check;|        &check;         | &check;  |  &check;  |  &check;  |
| 释放内存    |&check;|        &check;         | &check;  |  &check;  |  &check;  |
| 网络共享    |&check;|        &check;         | &check;  |           |  &check;  |
| 文件传输    |&check;|        &check;         | &check;  |           |           |
| 迅雷快鸟    |&check;|        &check;         | &check;  |  &check;  |  &check;  |
| 应用过滤    |&check;|        &check;         | &check;  |           |           |
| 自动挂载    |&check;|        &check;         | &check;  |           |  &check;  |

#### TODO

- [ ] 考虑 opkg feeds，减少固件大小，如此可以按需安装

#### 感谢

- [![coolsnowwolf](https://img.shields.io/badge/Lede-Lean-orange.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede)
- [![Lienol](https://img.shields.io/badge/OpenWrt-Lienol-orange.svg?style=flat&logo=appveyor)](https://github.com/Lienol/openwrt)
- [![CTCGFW](https://img.shields.io/badge/OpenWrt-CTCGFW-orange.svg?style=flat&logo=appveyor)](https://github.com/immortalwrt/immortalwrt)

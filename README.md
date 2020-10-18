#### 支持机型

[![NanoPi-R2S](https://github.com/vgist/OpenWrt-Autobuild/workflows/NanoPi-R2S/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions?query=workflow%3ANanoPi-R2S)
[![x86-64](https://github.com/vgist/OpenWrt-Autobuild/workflows/x86-64/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions?query=workflow%3Ax86-64)
[![Phicomm-K3](https://github.com/vgist/OpenWrt-Autobuild/workflows/Phicomm-K3/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions?query=workflow%3APhicomm-K3)
[![Phicomm-K2P](https://github.com/vgist/OpenWrt-Autobuild/workflows/Phicomm-K2P/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions?query=workflow%3APhicomm-K2P)
[![Xiaomi-MiWifi-Mini](https://github.com/vgist/OpenWrt-Autobuild/workflows/Xiaomi-MiWifi-Mini/badge.svg)](https://github.com/vgist/OpenWrt-Autobuild/actions?query=workflow%3AXiaomi-MiWifi-Mini)

#### 部分应用来源

[![coolsnowwolf](https://img.shields.io/badge/Lede-Lean-orange.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede)
[![Lienol](https://img.shields.io/badge/OpenWrt-Lienol-orange.svg?style=flat&logo=appveyor)](https://github.com/Lienol/openwrt)
[![CTCGFW](https://img.shields.io/badge/OpenWrt-CTCGFW-orange.svg?style=flat&logo=appveyor)](https://github.com/project-openwrt/openwrt)

#### 特色及功能

- 支持 ECC 密钥
- 后续只跟进稳定分支
- IP: 192.168.2.1
- 密码: 无
- 部分官方源存在，依赖性不强的应用不考虑集成，有依赖问题再考虑集成进固件
- 弱鸡的 cpu，不考虑集成 golang 应用

#### 第三方应用列表

|    插件名称    | NanoPi R2S | x86_64  | Phicomm K3 | Phicomm K2P | MiWiFi-Mini |
|----------------|:----------:|:-------:|:-----------:|:----------:|:-----------:|
| 分支：master   |  &#9745;   | &#9744; |   &#9744;   |  &#9744;   |   &#9744;   |
| 分支：19.07    |  &#9744;   | &#9745; |   &#9745;   |  &#9745;   |   &#9745;   |
| AdGuard Home   |  &#9745;   | &#9745; |   &#9745;   |  &#9744;   |   &#9744;   |
| AutoCore       |  &#9745;   | &#9745; |   &#9745;   |  &#9744;   |   &#9744;   |
| cpufreq        |  &#9745;   | &#9744; |   &#9745;   |  &#9744;   |   &#9744;   |
| DDNS           |  &#9745;   | &#9745; |   &#9745;   |  &#9745;   |   &#9745;   |
| fullcone nat   |  &#9745;   | &#9745; |   &#9745;   |  &#9745;   |   &#9745;   |
| frpc           |  &#9745;   | &#9745; |   &#9745;   |  &#9744;   |   &#9744;   |
| frps           |  &#9745;   | &#9745; |   &#9745;   |  &#9744;   |   &#9744;   |
| IPSEC          |  &#9745;   | &#9745; |   &#9745;   |  &#9744;   |   &#9744;   |
| MiniUPnP       |  &#9745;   | &#9745; |   &#9745;   |  &#9745;   |   &#9745;   |
| OpenClash      |  &#9745;   | &#9745; |   &#9745;   |  &#9745;   |   &#9744;   |
| PassWall       |  &#9745;   | &#9745; |   &#9745;   |  &#9744;   |   &#9745;   |
| Server 酱      |  &#9745;   | &#9745; |   &#9745;   |  &#9744;   |   &#9744;   |
| usb 打印       |  &#9745;   | &#9745; |   &#9745;   |  &#9744;   |   &#9745;   |
| vlmcsd 服务    |  &#9745;   | &#9745; |   &#9745;   |  &#9745;   |   &#9745;   |
| Zerotier       |  &#9745;   | &#9745; |   &#9745;   |  &#9744;   |   &#9744;   |
| 定时重启       |  &#9745;   | &#9745; |   &#9745;   |  &#9745;   |   &#9745;   |
| 解锁灰色歌曲   |  &#9745;   | &#9745; |   &#9745;   |  &#9744;   |   &#9744;   |
| 流量监视       |  &#9745;   | &#9745; |   &#9745;   |  &#9745;   |   &#9745;   |
| 上网时间控制   |  &#9745;   | &#9745; |   &#9745;   |  &#9745;   |   &#9745;   |
| 实时监控       |  &#9745;   | &#9745; |   &#9745;   |  &#9744;   |   &#9744;   |
| 文件传输       |  &#9745;   | &#9745; |   &#9745;   |  &#9744;   |   &#9744;   |

#### 针对开发者

- 提供 imagebuilder
- 提供 toolchain

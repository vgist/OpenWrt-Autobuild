#### 提醒

- 默认密码：无
- 二进制 golang：尽量不编译进小闪存设备
- 上游为 openwrt 官方，原汁原味，一些 package 取自第三方
- 内置一些 usb 无线 ac 网卡与千兆有线网卡，具体查看 config 文件夹
- 如需添加特色 package，请 fork 后自行在如下文件中添加
    - scripts/01_customize_packages.sh
    - config/*
- 如果 upnpd 在 nat 网关之后，则需要（自己寻找免费的 stun 服务器）

        uci set upnpd.config.use_stun='1'
        uci set upnpd.config.stun_host='stun.qq.com'
        uci set upnpd.config.stun_port='3478'
        uci commit upnpd

#### 分支

| 版本      |x86<br>64/generic|NanoPi<br>R2C R2S ZeroPi|Phicomm<br>K3|Phicomm<br>K2P|
|-----------|:-------------------:|:----------------------:|:------------:|:------------:|
| 22.03.x   |       &check;       |        &check;         |    &check;   |   &check;    |
| 21.02.x   |       &check;       |        &check;         |    &check;   |   &check;    |

#### 第三方应用列表

| 应用        |x86<br>64/generic|NanoPi<br>R2C/R2S/ZeroPi|Phicomm<br>K3|Phicomm<br>K2P|
|-------------|:----------------:|:----------------------:|:-----------:|:------------:|
| AutoCore    |      &check;     |        &check;         |   &check;   |              |
| cpufreq     |                  |        &check;         |             |              |
| DDNS        |      &check;     |        &check;         |   &check;   |              |
| FullCone NAT|      &check;     |        &check;         |   &check;   |   &check;    |
| OpenClash   |      &check;     |        &check;         |   &check;   |              |
| Server 酱   |      &check;     |        &check;         |   &check;   |              |
| SSRP+       |      &check;     |        &check;         |   &check;   |   &check;    |
| usb 打印    |      &check;     |        &check;         |   &check;   |              |
| vlmcsd 服务 |      &check;     |        &check;         |   &check;   |   &check;    |
| Zerotier    |      &check;     |        &check;         |   &check;   |   &check;    |
| 定时重启    |      &check;     |        &check;         |   &check;   |   &check;    |
| 上网时间控制|      &check;     |        &check;         |   &check;   |   &check;    |
| 释放内存    |      &check;     |        &check;         |   &check;   |   &check;    |
| 迅雷快鸟    |      &check;     |        &check;         |   &check;   |              |
| 网络共享    |      &check;     |        &check;         |   &check;   |              |
| 文件传输    |      &check;     |        &check;         |   &check;   |              |
| 自动挂载    |      &check;     |        &check;         |   &check;   |              |

#### TODO

- [ ] 考虑 opkg feeds，减少固件大小，如此可以按需安装

#### 感谢

- [![coolsnowwolf](https://img.shields.io/badge/Lede-Lean-orange.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede)
- [![Lienol](https://img.shields.io/badge/OpenWrt-Lienol-orange.svg?style=flat&logo=appveyor)](https://github.com/Lienol/openwrt)
- [![CTCGFW](https://img.shields.io/badge/OpenWrt-CTCGFW-orange.svg?style=flat&logo=appveyor)](https://github.com/immortalwrt/immortalwrt)

#### 提醒

- 默认密码：无
- 二进制 golang：尽量不编译进小闪存设备
- 上游为 openwrt 官方，原汁原味，一些 package 取自第三方
- 发布：
    - 21.02.x：稳定
    - 22.03.x：iptables -> nftables，fw3 -> fw4，等上游填坑
    - snapshot：不要使用，纯测试
- 如需添加特色 package，请 fork 后自行在如下文件中添加
    - scripts/01_customize_packages.sh
    - config/*_defconfig

#### 分支

| 版本      |x86<br>x86/generic|NanoPi<br>R2C R2S ZeroPi|Phicomm<br>K3|Phicomm<br>K2P|
|:---------:|:-------------------:|:----------------------:|:------------:|:------------:|
| snapshot  |       &check;       |        &check;         |    &check;   |   &check;    |
|22.03.0-rc1|       &check;       |        &check;         |    &check;   |   &check;    |
| 21.02.3   |       &check;       |        &check;         |    &check;   |   &check;    |

#### 第三方应用列表

| 应用        |x86<br>x86/generic|NanoPi<br>R2C/R2S/ZeroPi|Phicomm<br>K3|Phicomm<br>K2P|
|-------------|:----------------:|:----------------------:|:-----------:|:------------:|
|ADBYBY Plus +|      &check;     |        &check;         |   &check;   |              |
| AutoCore    |      &check;     |        &check;         |   &check;   |              |
| cpufreq     |                  |        &check;         |             |              |
| DDNS        |      &check;     |        &check;         |   &check;   |              |
|FullCone NAT |      &check;     |        &check;         |   &check;   |   &check;    |
| IPSEC       |      &check;     |        &check;         |   &check;   |              |
| OpenClash   |      &check;     |        &check;         |   &check;   |              |
| Server 酱   |      &check;     |        &check;         |   &check;   |              |
| SQM QoS     |      &check;     |        &check;         |   &check;   |              |
| SSRP+       |      &check;     |        &check;         |   &check;   |   &check;    |
| usb 打印    |      &check;     |        &check;         |   &check;   |              |
| vlmcsd 服务 |      &check;     |        &check;         |   &check;   |   &check;    |
| Zerotier    |      &check;     |        &check;         |   &check;   |   &check;    |
| 定时重启    |      &check;     |        &check;         |   &check;   |   &check;    |
| 流量监控    |      &check;     |        &check;         |   &check;   |   &check;    |
|上网时间控制 |      &check;     |        &check;         |   &check;   |   &check;    |
| 释放内存    |      &check;     |        &check;         |   &check;   |   &check;    |
| 迅雷快鸟    |      &check;     |        &check;         |   &check;   |              |
| 网络共享    |      &check;     |        &check;         |   &check;   |              |
| 文件传输    |      &check;     |        &check;         |   &check;   |              |
| 应用过滤    |      &check;     |        &check;         |   &check;   |              |
| 自动挂载    |      &check;     |        &check;         |   &check;   |              |

#### TODO

- [ ] 考虑 opkg feeds，减少固件大小，如此可以按需安装

#### 感谢

- [![coolsnowwolf](https://img.shields.io/badge/Lede-Lean-orange.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede)
- [![Lienol](https://img.shields.io/badge/OpenWrt-Lienol-orange.svg?style=flat&logo=appveyor)](https://github.com/Lienol/openwrt)
- [![CTCGFW](https://img.shields.io/badge/OpenWrt-CTCGFW-orange.svg?style=flat&logo=appveyor)](https://github.com/immortalwrt/immortalwrt)

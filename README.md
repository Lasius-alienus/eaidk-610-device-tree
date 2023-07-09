# EAIDK 610 安装系统
搭载了rk3399的eaidk610，提供的mali-t860能够提供一定的GPU图形加速能力，但由于其官方网站已经无法访问，因此其系统的选择被限制在百度云镜像站与第三方系统的范围内。
##### - [百度云镜像](https://pan.baidu.com/s/1-upIbUf1v9CZNB-tTa07Lg?pwd=hptp "百度云镜像")
 1. Fedora 28 对GPU适配最好，但仅停留在kernel，貌似没有userspace的部分，可以驱动mipi，有fdt支持，镜像源需要[更换](https://github.com/Lasius-alienus/eaidk-610-device-tree/blob/main/tools/EAIDK_610.sh "更换")，只能使用fedora官方镜像，速度慢，rk维护的uboot貌似不倾向于在emmc有可启动系统的情况下卡启？
 1. ubuntu 16.04 没有对GPU的适配，可以驱动mipi但触摸需要校准，使用uboot传参未获取dtb，，若不扩容刷入后根目录大约只有300MiB剩余空间，不怎么能用，扩容的大致思路是用SD卡内的系统操作gparted修改emmc分区，但本人没有成功。
 1. Android 8.1 貌似没有适配GPU，mipi正常（毫无疑问），可以使用magisk获取root权限，修补boot就行了，在此不再赘述。
 1. armbian 两个镜像都没有适配GPU，无法驱动mipi，没有dtb支持，只有这个镜像支持烧录sd卡启动（毕竟别的都是分区镜像）。


 ##### - ophub（[armbian](https://github.com/ophub/amlogic-s9xxx-armbian/releases "armbian")/[op](https://github.com/ophub/amlogic-s9xxx-openwrt/releases "op")）
 1. 目前暂不支持驱动GPU和mipi，其他功能正常
 1. 卡启适配较好，如要直接烧录到emmc，使用[烧写工具](https://github.com/Lasius-alienus/eaidk-610-device-tree/tree/main/tools/RKDevTool "烧写工具")，修改第二项为你使用的镜像即可。
 
### 但正如上文所述一个板卡有GPU支持（况且性能还不差），那就应该把GPU驱动起来。以下还有一些适配一般但驱动了GPU的镜像。

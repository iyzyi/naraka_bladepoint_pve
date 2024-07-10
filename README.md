# naraka_bladepoint_pve

永劫无间 征神之路 全/半自动脚本 武器熟练度速刷

原理：图像识别与键鼠模拟

## 全自动脚本

使用前需手动选择征神之路的**雪满弓刀**关卡，单排三排都可以。然后将需要使用的英雄大厅展示。

脚本会自动通关该关卡（锁定boss一直出3a），并循环进行，整个过程是全自动的，包括跳过动画、返魂后重新进入战场等。

| 快捷键 | 功能 |
|-|-|
| F10    | 开启 |
| F12    | 关闭 |

三排的时候，如果返魂后的第一时间，boss恰好不在视野内，则会锁定boss失败，这个bug暂时无法解决。

所以建议选择单排哈，不要坑队友。而且有的队友一直不跳过动画，反而会坑我们。

单排的话建议带保证生存的魂玉，比如：

![image-20240525095428636](http://image.iyzyi.com/img/202405251008584.png)

上述等级的魂玉搭配，10个英雄的单排通关时间（只含对战时间）基本在两分半到三分半之间。

PS：如果不想刷武器熟练度，而是想刷通币任务、账号等级、通行证等级等，我建议选宁红夜（必带蓝月、选带天蚕茧），刷起来速度更快，即使是没怎么打过征神的萌新，也能有较快的速度。

### 注意：

1. 需要管理员权限运行

2. 不要把exe文件单独拿出来，请解压后直接使用

3. 修改系统分辨率为1920*1080，缩放比例为100%（2K、4K显示器和笔记本玩家一定要注意这一点）

   ![image-20240706231014201](http://image.iyzyi.com/img/202407062313960.png)

4. 游戏内分辨率设置为1920*1080，画面模式为全屏

![image-20240706231314390](http://image.iyzyi.com/img/202407062313962.png)

5. 如果出现3A连击不稳定（A一下之后站着不动过好几秒才会再A一次），可尝试将高帧率（如无限制）改为75或60。

## 半自动脚本

> 老旧版本，不会提供后续支持，不建议使用。

使用前需选好关卡（不限关卡），并将需要使用的英雄大厅展示。

脚本会自动帮我们完成所有非对战操作（通关后退出操作除外）。

对战操作需要手打。

| 快捷键     | 功能           | 备注                          |
| ---------- | -------------- | ----------------------------- |
| F10        | 开启           |                               |
| F12        | 关闭           |                               |
| 鼠标侧上键 | 通关后退出副本 | 如果不手动按，则15s后自动退出 |

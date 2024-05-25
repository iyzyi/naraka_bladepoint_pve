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

![image-20240525095428636](D:\ENG\typora-img\image-20240525095428636.png)

上述等级的魂玉搭配，10个英雄的单排通关时间（只含对战时间）基本在两分半到三分半之间。

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

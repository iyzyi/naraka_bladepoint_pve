# naraka_bladepoint_pve

永劫无间 征神之路 全/半自动脚本 武器熟练度速刷

原理：图像识别与键鼠模拟

前排提醒：我自己用了两年没问题，但根据 issue #2 反馈，该脚本有可能会被官方判定为消极游戏而暂时封禁，所以我不建议大家使用（但其实根据各社区的反馈，消极游戏的判定还是比较模糊的，很多人开局强退次数多了或者被人举报了都容易被判消极游戏。）。我初步测试了下，永劫后台驱动能够捕获模拟按键类的振刀操作并不予输出反馈，但其他所有的操作都能正常给予输出反馈，这说明永劫的驱动程序Hook了SendInput等函数，并对输入进行了一定的过滤处理。目前游戏内显示出来的效果表明只对振刀做了特定处理，但是其他按键他也完全能够知悉是否为模拟按键，包括所谓的AHK、按键精灵、抑或是鼠标宏（在驱动层发送模拟按键，谁更厉害取决于谁位于Hook链的最底层）。但同时，按照常理而言，官方并不能简单地通过是否使用SendInput等函数来向系统或进程发送键鼠信号来判定是否为游戏辅助，因为很多正常程序也会调用此类函数来实现自身的正常功能，比如远程桌面控制软件、虚拟机等，是否一刀切就是实际环境下反外挂反辅助的主要矛盾点。总之，使用的决定权给大家。

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

上述等级的魂玉搭配，10个英雄的单排通关时间（只含对战时间）基本在两分半到三分半之间。不一定非要带上述魂玉，一般来说低等级的萌新推荐带天蚕茧，没有天蚕茧的自己找自己拥有的保命魂玉（因为一旦返魂会浪费大量时间），其他的可以自己搭配，高等级的大佬不需要我在这里推荐。

PS：如果不想刷武器熟练度，而是想刷通币任务、账号等级、通行证等级等，我建议选宁红夜（必带蓝月、选带天蚕茧），刷起来速度更快，即使是没怎么打过征神的萌新，也能有较快的速度。我下面的魂玉搭配能在大概70秒内打完：

![image-20240710192032429](http://image.iyzyi.com/img/202407101924755.png)

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

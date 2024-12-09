#import "../template.typ": sectionline, gray_table, colored
#let dx = $dif x$
#let dy = $dif y$
#let dp = $dif p$
#let dt = $dif t$
#let _to_ = $quad => quad$
#let __to__ = $quad #_to_ quad$

= 一元微分方程

== 杂鱼一阶微分方程 (可分离变量)

如果可以把含 $y$ 的部分都赶到 $dy$ 前面, 含 $x$ 的部分都赶到 $dx$ 前面, 那么直接左右两边积分就可以解了.

有时候要注意看形如 $y dx + x dy$ 的部分, 它可以合成 $dif (x y)$, 有时候这样代换一下就可以接着解.

== 一阶齐次方程

特征为方程的每个项里 $y$ 和 $x$ 的总阶数是一样的, 这意味着可以两边除以 $x$ 再整理成左边这样:

$ 
y' = phi (y / x) #__to__ dp / (phi(p) - p) = dx / x 
$

其中 $p = y/x$, 整理成 $y = p x$ 后两边开 $dif$ 就能得到好看的 $dif y$ 换 $dif p$ 的结果.

如果希望做得快, 可以背一下右边的代换后结果.

== 一阶线性方程

不同于高阶情况, 一阶方程即使不是常系数的也可以解:

$
y' + p y = q #__to__ y = e^(-P) (integral e^P q " " dx + C)
$

其中大 $P$ 是小 $p$ 的原函数, 即 $P = integral p " " dx$. 

在套公式的时候要特别注意 $p$ 有时候是带着负号的, 不要丢了.

== 伯努利方程

如果一阶方程里的 "自由项" 多了一个 $y^n$, 那么可以左右除以 $y^n$ 再做代换 $z = y^(1 - n)$, 然后式子就可以变成一阶线性方程:

$
y' + p y = q y^n #__to__ z' + (1 - n) p z = (1 - n) q
$

== 可降阶的二阶方程

如果二阶方程里没有 $y$, 只有 $y''$, $y'$, $x$, 那么可以做代换 $p = y'$, 视为 $p$ 与 $x$ 的一阶方程.

如果二阶方程里没有 $x$, 只有 $y''$, $y'$, $y$, 那么同样可以做代换 $p = y'$, 但此时要视为 $p$ 与 $y$ 的一阶方程.

== 高阶线性方程

=== 任意系数通用结论

对于高阶线性方程而言, 它的解的结构都是一样的: 非齐次通解 = 线性组合的齐次通解 + 非齐次特解:

$
sum_(i=0)^(n) p_i y^((i)) = f #__to__ y = sum_(i=0)^(n) C_i y_i + y^* 
$

有时候题目会给一个抽象的高阶线性方程然后考这个关系, 比如两个非齐次通解相减能得到什么之类的.

=== 常系数 + 齐次

常系数的高阶线性方程是我们真正能解的方程. 首先我们要写出它的特征多项式方程: #footnote()[为什么? 可以参考: #link("https://zh.wikipedia.org/zh-cn/线性微分方程") 中的 "欧拉注意到..." 部分]

$
sum_(i=0)^(n) p_i r^i = 0
$

它在 $CC$ 上有 $n$ 个复根 $z$. 每一个都对应一个形如 $e^(z x)$ 的解. 额外考虑重根并使用欧拉公式换掉复指数, 可以得到以下结论:

对于一个 $k$ 重实根 $r = r_i$, 它贡献一个含 $k$ 个待定系数的通解:

$
y = ( sum_(j=0)^(k-1) C_j x^j ) e^(r_i x)
$

对于一对共轭的 $k$ 重复根 $r = alpha plus.minus beta i$, 它们一起贡献一个含 $2k$ 个待定系数的通解:

$
y = [( sum_(j=0)^(k-1) C^(+)_j x^j ) cos beta x + ( sum_(j=0)^(k-1) C^(-)_j x^j ) sin beta x] e^(alpha x)
$

=== 常系数 + 非齐次

对于特殊形式的非齐次项, 我们可以用*待定系数法*求特解:

#let mblue(x) = text(fill: blue)[$#x$]
#let mgreen(x) = text(fill: green)[$#x$]

$
f = p_m mblue(e^(lambda x)) 
#_to_ 
y^* = Q_m mblue(x^k e^(lambda x)) \

f = (p_m^+ cos omega x + p_m^- sin omega x) mblue(e^(lambda x))
#_to_ 
y^* = [Q_m^+ cos omega x + Q_m^- sin omega x] mblue(x^k e^(lambda x))
$

#set list(marker: ([⤥], [›]))

记忆方法:

- $e^(lambda x)$ 对应 $x^(lambda "重数") e^(lambda x)$
  - 带三角的应该计算 $lambda + omega i$ 重数 
- 多项式或者虚多项式替换成同阶的待定系数的多项式

特解由三个部分组成

- $x^k$ 是重根修正项
  - 如果 $lambda$ 或 ($lambda + omega i$) 恰好是特征方程的 $k$ 重根, 那么就要多一项 $x^k$; 
  - 如果 $lambda$ 或 ($lambda + omega i$) 不是根, 那么 $k = 0$, $x^k = 1$ 可直接省略.
- $Q_m$ 是一个和 $p_m$ 阶数相同的多项式, 系数待定, 等待代回原微分方程求解.
- $e^(lambda x)$ 是特解必须具有的形式

== 欧拉方程

如果一个方程很像常系数线性方程, 但是每个项却多了一个 $x^i$, 那么它就是欧拉方程, 可用 $x = e^t$ 代换:

$
sum_(i=0)^(n) a_i y^((i)) colored(x^i) = 0
$

代换后的方程会把 $x^i$ 都消去, 变成一个关于 $y$ 和 $t$ 的常系数线性方程.

== 积分方程

通用做法是疯狂求导变成微分方程再做. 但是要注意求导过程中会丢掉一些*常数*上的约束. 一般往回找可以到全部的关于常数的条件.

#pagebreak()

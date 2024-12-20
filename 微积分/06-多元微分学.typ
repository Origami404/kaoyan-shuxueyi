#import "../template.typ": sectionline, gray_table, colored
#let dx = $dif x$
#let dy = $dif y$
#let dz = $dif z$
#let pr(F, x) = $(partial #F) / (partial #x)$

= 多元微积分

== 多元微分

=== 概念与基础

#set list(marker: ([★], [⤥], [›]))

- 二重极限证不存在
  - 取常数 $lambda$ 后令 $y = lambda x$,代入原极限证明 $lambda$ 不同时极限不同即可
- 证连续
  - 极限存在且等于函数值即可
- 求给定点的偏导数
  - 根据定义求: $f'_x(x_0, y_0) = lim_(Delta x -> 0) (f(x_0 + Delta x, y_0) - f(x_0, y_0)) / (Delta x)$
- 全微分存在性
  - 定义: 函数的差 = *所有*变量的差的线性组合 + 一个无穷小
  - 证明存在常数使得可以通过变量的线性组合组出函数差即可
  - 或者证明 $Delta z - (diff z) / (diff x) Delta x - (diff z) / (diff y) Delta y$ 是 $sqrt((Delta x)^2 + (Delta y)^2)$ 的高阶无穷小
- 相互关系
  - 偏导连续 $->$ 可微 $->$ 连续 / 偏导存在 
- 隐函数 / 复合函数 求导
  - 使用微分形式不变性嗯做即可
  - 对于求 $(dif^2 y) / (dif x^2)$, 可以在等式两边做 $dif^2 / (dif x^2)$, 会超级快
- 隐函数在给定点上的偏导存在性 (隐函数存在定理)
  - 直接两边求全微分, 求完剩下什么变量的微分就能确定什么偏导

=== 无条件极值 (Hessin 矩阵)

- 必要条件: 所有偏导都是 $0$
- 充分条件: $f''_(x x) f''_(y y) - (f''_(x y))^2 > 0$
  - 若式子是负则必不是极值, 是零则不能确定
  - $f''_(x x)$ 是正则极小, 是负则极大
  - 常记作 $A C - B^2 > 0$

上面的条件是 Hessin 矩阵的行列式, 即函数梯度的雅可比行列式.

=== 有条件极值 (拉格朗日定理)

对于函数 $f(x, y)$ 和条件 $phi(x, y) = 0$, 构造拉格朗日函数 $L(x, y, lambda) = f(x, y) + lambda phi(x, y)$, 然后解方程组即可.

$
cases(
  (diff L) / (diff x) = (diff L) / (diff y) = 0,
  phi(x, y) = 0,
)
$

如果让确定是最大还是最小, 那随便带几个数字进 $f$, 比较一下它们和求出来的值的大小即可.

=== 闭区域极值

$f$ 在闭区域 $D$ 上的极值要看两个地方: 在 $D$ 内的无条件极值和在 $D$ 上的有条件极值.

#pagebreak()

== 多元积分

=== 极座标

换极座标记得 $x = r cos theta$, 不要把三角函数对应错, 也不要随随便便换 $x - 1 = r cos theta$ 之类的.

#let pp(f, v) = $(diff #f) / (diff #v)$
$
dx dy = mat(delim: "|", pp(x, r), pp(x, theta); pp(y, r), pp(y, theta)) dif r dif theta = r dif r dif theta
$

对三角函数积分时, 一定要注意函数在区间内的正负性, 应该先看积分区间判断积分是不是 $0$ 或者是否需要对半切, 然后再积. 点火公式要看准 $[0, pi / 2]$ 套, 不能乱套.

=== 看区域

先确定区域, 再积分; 多重积分中区域本身比积分函数还要重要一点, 从区域到积分限本身就是一个考点. 直接给出两个积分上下限的, 可能需要识别出区域然后换序积分.

区域的对称性也必须在积分之前优先考虑. 

- 区域内函数对某个变量为奇函数可以直接让积分为 $0$ 
- 区域内函数对某个变量为偶函数可以只在一半区域上积分
- 区域内函数对两个变量具有轮换对称性, 可以在两倍的区域上积分, 或者直接把被积函数里的其中一个变量换成另一个变量. 比如 $x + 2y = 3x$ 这样. 
- 区间 $D$ 对 $y = x$ 对称, 则可以修改积分内的函数为 $1/2 integral.double_D f(x, y) + f(y, x) dx dy$ 使其强制具有轮换对称性

=== 先二后一

适合三重积分中有两个变量的区域是圆或椭圆的情况. 这种能简单算出面积/简单换成极座标的积分一定要先把那两个变量组成的区域拿来算. 比如如果 $Omega: F(x, y, z) <= 0$ 且可以解出给定 $z$ 时 $(x, y)$ 的区域 $D(z)$

$
integral.triple_Omega f(x, y, z) dif V = integral dz integral.double_((x, y) in D(z)) g(x, y) dx dy 
$

=== 线面积分

各个公式可以直接算:

$
  "格林":& quad dif (P dx + Q dy) = (pr(Q, x) - pr(P, y)) dx dy \
  "高斯":& quad dif (P dx dy + Q dy dz + R dz dx) = (pr(P, x) + pr(Q, y) + pr(R, z)) dx dy dz \
  "斯托":& quad dif (P dx + Q dy + R dz) = (pr(R, y) - pr(Q, z)) dy dz + (pr(P, z) - pr(R, x)) dz dx + (pr(Q, x) - pr(P, y)) dx dy \
$

或者斯托克斯公式也有行列式形式:

$
dif (P dx + Q dy + R dz) = 
mat(delim: "|", 
  dy dz, dz dx, dx dy;
  pr("", x), pr("", y), pr("", z);
  P, Q, R
)
$

要额外注意 $P, Q, R$ 要可导 (含抽象函数时要注意题目条件), 有分母时要有定义(经常考挖洞). 挖洞的时候洞里的线/面取的方向要反向.

#pagebreak()

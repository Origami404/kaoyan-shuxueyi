#import "../template.typ": sectionline, gray_table, colored

= 极限与导数


== 公式

=== 等价无穷小

#let 等价 = math.class(
  "relation",
  $" " ~ "  "$ 
)

$
x 等价 sin x 等价 tan x 等价 arcsin x 等价 arctan x \ \
x 等价 ln(1 + x) 等价 e^x - 1 \ \
(1 + x)^alpha 等价 1 - alpha x \
1 - cos x 等价 1/2 x^2
$

=== 洛必达

#set list(marker: ([⤥], [›]))

只有 $0\/0$ 或 $c\/infinity$ 的时候能用, 求出来的结果如果存在就是对的, 如果不存在并不代表极限不存在.

- $infinity \/ infinity$: 取倒数再洛, 或直接抓最高阶
- $0 dot infinity$: 无穷项取倒数变成 $0\/0$
- $infinity - infinity$: 通分变成 $0\/0$ 
- $0^0$ 或 $infinity^0$: 取对数

=== $n$ 阶导

$
[a^x]^((n)) = a^x colored((ln a)^n) \
[sin x | cos x]^((n)) = [sin | cos](x + colored(n pi/2)) \
[x^a]^((n)) = a (a - 1) dots.c (a - (n - 1)) " " x^(a - n) \
[ln x]^((n + 1)) = [1 / x]^((n)) = (-1)^n n! " " x^(-(n + 1)) \
$

只需要把 $x$ 替换成 $k x + b$ 并乘以 $k^n$ 就可以得到 $k x + b$ 版本的 $n$ 阶导.

=== 泰勒展开

有了 $n$ 阶导后, $n$ 阶泰勒就容易推了. 但常见函数的二阶麦克劳林和其无穷小余项还是有必要记的, 可以用来对付一些洛毕达对付不了的,分子分母上有加减的情况:

$
e^x           &approx 1 + x + x^2 / 2 + o(x^2) \
ln(1 + x)     &approx x - x^2 / 2 + o(x^2) \
(1 + x)^alpha &approx 1 + alpha x + (alpha (alpha - 1)) / 2 x^2 + o(x^2)
$

三角系的麦克劳林一般无穷小余项会多一阶, 因为刚好那下一阶的导数是 $0$.

$
sin x &approx x - x^3 / 6 + colored(o(x^4)) quad quad arcsin &approx x colored(+) x^3 / 6 + colored(o(x^4)) \
cos x &approx 1 - x^2 / 2 + colored(o(x^3)) quad quad & \
tan x &approx x + x^3 / 3 + colored(o(x^4)) quad quad arctan &approx x colored(-) x^3 / 3 + colored(o(x^4)) \
$

== 定义与概念
#set list(marker: ([★], [⤥], [›]))

=== 极限和无穷小

- *函数单点极限存在* $<=>$ 左右极限存在且相等
- *数列极限存在*
  - 放缩夹逼
  - 单调有界
  - 奇偶项拆分
  - 形式为黎曼定积分定义式的数列
- *$A$ 是 $B$ 的无穷小* $eq.def$ $lim A/B = 0$

=== 连续和可导

- *函数单点连续*
  - 极限存在且等于函数值
  - 可导 $=>$ 连续
- *函数可导*
  - 极限 $lim_(x -> x_0) (f(x) - f(x_0)) / (x - x_0)$ 存在
  - 左右导数 (上述极限的左右极限) 存在且相等
- *函数可微* 
  - 存在常数 $A$ 使得 $Delta x -> 0$ 时 $Delta y = A Delta x + o(x)$
  - 等价于 函数可导
- *函数区间连续*
  - 开区间: 处处连续
  - 闭区间: 开区间连续, 左端点右连续, 右端点左连续
- *函数间断点*: 不连续的点
  - 第一类: 左右极限存在
    - 可去: 左 $=$ 右 (函数在该点无定义)
    - 跳跃: 左 $!=$ 右
  - 第二类: 左右极限至少一个不存在
    - 无穷: 有一个是无穷大
    - 震荡: 两个都不是无穷大, 或者单纯不存在

=== 应用

- *切线*
  - $y = f'(x_0) (x - x_0) + f(x_0)$
  - 法线: 与切线垂直的线, 斜率是 $- 1 / k$
- *渐进线*
  - 垂直: $lim_(x -> a^+ "/" a^-) f(x) = plus.minus infinity$           #h(5em)   $=>$ #h(1em) $x = a$
  - 水平: $lim_(x -> + infinity "/" - infinity) f(y) = a$               #h(5.4em) $=>$ #h(1em) $y = a$
  - 倾斜: $lim_(x -> + infinity "/" - infinity) [f(x) - (k x + b)] = 0$ #h(0.3em) $=>$ #h(1em) $y = k x + b$
    - $k = lim y / x$, $b = lim (y - k x)$
- *单调性*
  - 同济的单调性是严格单调性
  - 对任意两点 $x_1 > x_2 => f(x_1) > f(x_2)$
  - 导数恒大于等于零, 但不在任一子区间上为零
- *凹凸性*
  - 同济的凹凸是图像向下凹叫凹, 和国际相反. 凹是 $f'' > 0$, 凸是 $f'' < 0$
    - 记忆: $y = x^2$ 是凹
  - 对任意两点, 凹函数 $f((x_1 + x_2) / 2) < (f(x_1) + f(x_2)) / 2$
- *极值点*
  - 定义上只要存在邻域使得点在邻域内最大或最小即可, 不需要导数存在
  - 第一充分: $f'(x_0) = 0$, 且左右邻域中导数正负不同
  - 第二充分: $f'(x_0) = 0$, $f''(x_0) != 0$
- *拐点*: 一阶导极值点
  - 拐点是形如 $(x, y)$ 的二维点, 极值点才可以直接写 $x = x_0$

== 定理

#pagebreak()


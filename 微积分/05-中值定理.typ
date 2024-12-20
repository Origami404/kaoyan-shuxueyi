#import "../template.typ": sectionline, gray_table, colored
#let dx = $dif x$

= 中值定理
#set list(marker: ([★], [⤥], [›]))

== 定理本体

- 普通定理
  - 最值定理: 闭连, 闭区间内必有最值
  - 介值定理: 闭连, 闭区间内必能取到最值之间的任意一个值
  - 零点存在: 闭连, $f(a) f(b) < 0$, 零点存在
- 微分中值
  - 费马: 极值点 $and$ 可导 $==>$ $f'(x_0) = 0$ 
  - *罗尔*: 闭连开导, $f(a) = f(b) ==> exists xi in (a, b): f'(xi) = 0$
  - *拉中*: 闭连开导, $exists xi in (a, b): (f(a) - f(b)) / (a - b) = f'(xi)$
  - *柯西*: 闭连开导, $exists xi in (a, b): (f(a) - f(b)) / (g(a) - g(b)) = (f'(xi)) / (g'(xi))$
- 积分中值
  - 普通形式: 闭连, $exists xi in [a, b]: integral^b_a f(x) dx = f(xi)(b - a)$
  - 加强形式: $xi$ 在开区间里, 需要先对变限函数用拉中证了才能用
  - 二重形式: 闭区域 $D$ 内连续, 则存在 $(xi, eta) in D$ 使得 $integral.double_D f dif sigma = f(xi, eta) S$, $S$ 为 $D$ 的面积
- 证明
  - 罗尔证明: 闭连 $->$ 有最值; $f(a) = f(b)$ $->$ 最值不在端点, 在区间内; 然后费马引理立得
  - 拉中证明: 令 $h(x) = f(x) - (f(a) - f(b)) / (a - b)$, 然后对 $h$ 罗尔
  - 柯西证明: 令 $h(x) = f(x) - (f(a) - f(b)) / (g(a) - g(b))$, 然后对 $h$ 罗尔

== 技巧

- 可用中值定理做的极限
  - 在极限中很明显有两个同样形式的函数相减, 并且有个参数在变
  - 比如 $arctan sqrt(n) - arctan sqrt(n + 1)$, 可以固定 $n$ 取函数 $h(x) = arctan sqrt(n + t)$
  - 然后拉中取导数后代回原极限, 并把 $n$ 拉到极限处后忽略引入的 $xi$ 即可
- 待证明的式子比较复杂
  - 尽可能尝试全部丢一边变成 $dots.c = 0$, 然后积分左边的式子观察原函数, 并对原函数用罗尔
  - 常用观察技巧
    - $lambda f + xi f' -> x^lambda f(x)$ $(x != 0)$
    - $f + lambda f' -> e^(lambda x) f(x)$
    - $f f' -> f^2(x)$
- 待证明的式子里有两个中值出来的东西
  - 两个参数具有轮换对称性或要求不相同: 用*相同的函数, 不同的区间*做中值, 然后拼起来
  - 若否: 把两个中值出来的东西丢两边, 用*不同的函数, 相同的区间*做中值, 然后拼起来

#pagebreak()

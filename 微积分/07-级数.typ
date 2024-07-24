#import "../template.typ": sectionline, gray_table, colored

= 级数

== 常数项级数

#set list(marker: ([⤥], [›]))

主要标杆:

$
a_n = a p^n, quad
cases(
  |q| < 1 quad => quad a/(1-q), 
  |q| >= 1 quad => quad infinity
)
$

$
a_n = 1 / n^p = n^(-p), quad
cases(
  p > 1 quad => quad A,
  p <= 1 quad => quad infinity
)
$

$
a_n = 1 / (n^p ln^q n), quad
cases(
  p > 1 quad => quad A,
  p = 1 and q > 1 quad => quad A,
  p = 1 and q <= 1 quad => quad infinity,
  p < 1 quad => quad infinity 
)
$

条件收敛重要标杆:

$
a_n = (-1)^n / n^p, quad
cases(
  p > 1 quad => quad "Abs",
  0 < p <= 1 quad => quad "Cond",
  p <= 0 quad => quad infinity 
)
$

标准步骤:

- 通用检查
  - 检查是否为简单形式 (主要标杆)
  - 检查是否可以通过加括号后发散, 或者 $lim a_n != 0$ 证发散
- 若是正项级数
  - 检查 $S_n$ 是否有界
  - 检查 $a_n$ 是否可以等价为标杆的同阶无穷小
  - 检查 $a_(n+1) / a_n$ 和 $root(n, a_n)$ 是否趋 $0$
- 若是交错级数
  - 检查绝对值是否收敛 (绝对收敛)
  - 检查 $u_n$ 是否单调减 且 趋于 $0$ (莱布尼茨判别法)
- 最后的最后
  - 尝试使用夹逼定理

== 函数项级数

TODO

#pagebreak()

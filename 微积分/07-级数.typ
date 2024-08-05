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

#pagebreak()

== 函数项级数

只考虑形如下面的函数项级数 (幂级数):

$
sum_(n=0) f_n (x) = sum_(n=0)^infinity a_n (x - c)^n
$

=== 求收敛域

幂级数必在 $|x - c| < R$ 内绝对收敛; 在 $|x - c| = R$ 时可绝对收, 可条件收, 也可不收; 在外边则一定不收敛. $R$ 可通过下面两个公式求出:

$
1/R = lim |(f_(n+1)(x)) / (f_n (x))| = lim root(n, |a_n|)
$

在求出 $R$ 后, 将 $|x - c| = R$ 的两个边界点代回去级数, 用判断常数项级数收敛的方式判断是否条件/绝对收敛, 然后得到区间开闭.

若已知 $x_0$ 使得级数条件收敛, 那 $|x_0 - c|$ 必定为收敛边界 $R$.

=== 求函数的展开式

等价于直接泰勒展开. 如果函数比较复杂, 可以拆开成若干简单函数的和再展开. 值得额外记住的展开式是 (代入 $-x$ 也成立):

$
1/(1 - x) = sum x^n
$

=== 求展开式的和函数

只有一眼是某函数泰勒展开的式子, 或者是 $sum x^n$, 才能得到和函数. 任何函数项级数要求和函数都要尝试把和式通过加减乘除, 微分积分, 拆成 $sum x^n$.

级数微分定理可以从 $a_n$ 里乘走一个 $1/n$:

$
f'(x) = sum (a_n x^n)' = sum (a_n n) x^(n-1)
$

级数积分定理可以从 $a_n$ 里乘走一个 $(n+1)$:

$
integral_0^t f(x) dif x = sum integral_0^t (a_n x^n) dif x = sum (a^n / (n+1)) t^(n+1)
$

用积分微分处理完的级数, 求出和函数后, 再微分积分回去即可得到所求函数. 注意函数是有*定义域*的, 和函数的定义域就是级数的*收敛区间*, 要顺带求出这个.

#pagebreak()

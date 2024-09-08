#import "./template.typ": sectionline, gray_table, colored

#let Ex = $upright(E)$
#let Var = $upright(D)$
#let Cov = $"Cov"$

= 概率与统计

== 常用概念

#set list(marker: ([★], [⤥], [›]))

- 抽签原理: 不放回抽样, 第 $k$ 次抽到的概率和第一次抽到的概率是一样的
- 多个变量互相独立 $=>$ 两两独立, 反之不然
- 随机变量是样本空间到 $RR$ 的函数
  - 累积分布函数 (CDF) $F(x) = P{X <= x}$
  - 概率分布函数 PDF $f(x)$ 定义为能积分得到 CDF 的函数 (注意*不是* $P{X = x}$)
- 两个变量独立 $=>$ 不相关, 反之不然
  - 不相关 *且* 遵循二维正态 $=>$ 独立

两个常用积分:

$
integral_0^(+infinity) x^n e^(-x) dif x = n! 
quad quad
integral_0^(+infinity) e^(-x^2) dif x = sqrt(pi)/2 
$

#gray_table(
  columns: (auto, 1fr, 1fr, 1fr),

  [], [二项分布], [几何分布], [泊松分布],
  [符号],  [$B(n, p)$], [$G(p)$], [$P(lambda)$],
  [分布律], [$P{X=k} = C_n^k p^k (1-p)^(n-k)$], [$P{X=k}=(1-p)^(k-1) p$], [$P{X=k} = lambda^k / k! e^(-lambda)$],
  [期望], [$n p$], [$1/p$], [$lambda$], 
  [方差], [$n p (1-p)$], [$(1-p)/p^2$], [$lambda$]
)

#gray_table(
  columns: (auto, 1fr, 1fr, 1fr),

  [], [均匀分布], [指数分布], [正态分布],
  [符号],  [$U(a, b)$], [$E(lambda)$], [$N(mu, sigma^2)$],
  [范围], [$(a, b)$], [$(0, +infinity)$], [$(-infinity, +infinity)$],
  [PDF], [$f(x) = 1/(b-a)$], [$f(x) = lambda e^(- lambda x)$], [$f(x) = 1/sqrt(2 pi sigma^2) e^(-(x-mu)^2 / (2 sigma^2))$],
  [期望], [$(a+b)/2$], [$1/lambda$], [$mu$], 
  [方差], [$(a-b)^2/12$], [$1/lambda^2$], [$sigma^2$]
)

指数分布有无记忆性: $P{X > s + t | Y > s} = P{Y > t}$

== 分布函数求法

$
F(x) = integral_0^x f(x) dif x 
quad quad 
f(x) = dif / (dif x) F(x)
$

$
F(x, y) = integral_0^x integral_0^y f(x, y) dif y dif x
quad quad
f(x, y) = partial^2 / (partial x partial y) F(x, y)
$

$
F_X (x) = lim_(y -> + infinity) F(x, y)
quad quad
f_X (x) = integral_0^(+infinity) f(x, y) dif y
$

$
f_(X|Y) = f(x, y) / (f_X (x)) 
$

== 随机变量的函数与特征

记 $Y = g(X)$, 若 $g$ 可逆则记 $X = h(Y)$

$
F_Y (y) = F_X (h(y))
quad quad
f_Y (y) = f_X (h(y)) colored(|h'(y)|)
$

期望, 方差, 协方差:

$
Ex(X) = sum x p(x) = integral x f(x) dif x \
Var(X) = Ex((X - Ex(X))^2) = Ex(X^2) - [Ex(X)]^2 = Cov(X, X) \
Cov(X, Y) = Ex((X - Ex(X))(Y - Ex(Y))) = Ex(X Y) - Ex(X)Ex(Y) \
rho_(X Y) = Cov(X, Y) / sqrt(Var(X) * Var(Y))
$

常用性质

$
Ex(c) = c quad Ex(a X) = a Ex(X) quad E(X+Y) = Ex(X) + Ex(Y) \
Var(c) = 0 quad Var(a X) = a^2 Var(X) quad Var(X plus.minus Y) = Var(X) + Var(Y) colored(plus.minus 2 Cov(X, Y)) \
Cov(X, Y) = Cov(Y, X) quad Cov(X, a Y) = a Cov(X, Y) \
Cov(X, Y+Z) = Cov(X, Y) + Cov(X, Z) \
\
|rho_(X Y)| = 1 <=> P{Y = a X + b} = 1
$

*正交*性质 (只有 $X tack.t Y$ 时才成立)

$
Ex(X, Y) = Ex(X) Ex(Y) \
Var(X + Y) = Var(X) + Var(Y) \
rho_(X Y) = Cov(X, Y) = 0
$

- 做题的时候一定要看清楚:
  1. 求的是 $Var$ 还是 $Ex$
  2. 里边是 $X Y$ 还是 $X + Y$ 

== 数理统计

#let avg(x) = $overline(#x)$

研究许多独立同分布 (i.i.d.) 的随机变量的学科. 

- 基本概念
  - 总体: 一个分布
  - 样本: $n$ 个独立同分布的随机变量
  - 样本值: 样本的一个取值
  - 统计量: 样本上的一个函数: $g(X_1, ..., X_n)$ (因此也是一个随机变量)
- 重要统计量
  - 均值: $avg(X) = 1/n sum X_i$
  - 方差: $S^2 = colored(1/(n-1)) sum (X_i - avg(X))^2$
  - $k$ 阶原点矩: $A_k = 1/n sum X_i^k$
  - $k$ 阶中心矩: $B_k = 1/n sum (X_i - avg(X))^k$
- 重要统计量性质
  - $Ex(avg(X)) = Ex("分布")$, $Var(avg(X)) = 1/n Var("分布")$
  - $Ex(S^2) = Var("分布")$

=== 抽样分布

标准正态分布总体的样本的一些统计量满足的分布比较有用, 这类分布统称为抽样分布.

- $chi^2$ 分布
  - 对 ${X_i}_n ~ N(0, 1)$: 统计量 $chi^2 = sum X_i^2$ 满足的分布, 记为 $chi^2(n)$
  - 可加性: 若 $chi_1^2 tack.t chi_2^2$, 则 $chi_1^2 + chi_2^2 ~ chi^2(n_1 + n_2)$
  - 期望和方差: $Ex(chi^2) = n$, $Var(chi^2) = 2 n$
- $t$ 分布
  - 对 $X ~ N(0, 1), Y ~ chi^2(n), X tack.t Y$: 统计量 $t = X/sqrt(Y \/ n)$ 满足的分布, 记为 $t(n)$
  - PDF 为偶函数, 即 $f_t (x) = f_t (-x)$
- $F$ 分布
  - 对 $U ~ chi^2(n_1), V ~ chi^2(n_2), U tack.t V$: 统计量 $F = (U\/n_1) / (V\/n_2)$ 满足的分布, 记为 $F(n_1, n_2)$
  - $1/F ~ F(n_2, n_1)$
  - $t^2 ~ F(1, n)$

利用上边的抽样分布, 可以得到一些非标准正态分布总体下样本的统计量性质. 设样本 ${X_i}_n ~ N(mu, sigma^2)$:
$
avg(X) ~ N(mu, sigma^2 / n) quad quad avg(X) tack.t S^2 quad quad sum ((X_i - mu) / sigma)^2 ~ chi^2(n) \
((n-1)S^2) / sigma^2 = sum ((X_i - avg(X))/sigma)^2 ~ chi^2(n - 1) quad quad Var(S^2) = (2 sigma^2)/(n - 1) \
(avg(X) - mu) / (S \/ sqrt(n)) quad~quad t(n - 1)
$

== 参数估计

- 矩估计
  - 原理: 可以假设 样本矩 $approx$ 分布矩
  - 先将分布矩表示为参数的函数, 再用样本值计算样本矩, 然后令二者相等, 解方程即可
- 最大似然估计
  - 原理: 假设参数是使得样本值出现的可能性最大的那个参数
  - 先计算在任意参数 $theta$ 下能取到样本值 $X_1, ..., X_n$ 的概率, 然后取对数后用拉格朗日求最大值即可
- 评价参数估计方法的好坏
  - 由于估计参数是样本的统计量, 我们可以用随机变量的特征来评判参数估计方法的好坏
  - 无偏性: $Ex(hat(theta)) = theta$
  - 比较哪个估计更有效: $Var(hat(theta_1)) < Var(hat(theta_2))$
  - 相合性: $n -> +infinity$ 时, $hat(theta)$ 依概率收敛到 $theta$

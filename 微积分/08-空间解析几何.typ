#import "../template.typ": sectionline, gray_table, colored

#let vi = $bold(i)$
#let vj = $bold(j)$
#let vk = $bold(k)$
#let vx = $bold(x)$
#let vp = $bold(p)$
#let prl = $\/\/$
#let cross = $times$
#let clr(exp) = text(fill: red)[$#exp$] 

= 空间解析几何

== 基本元素

=== 向量运算

- 注意叉积的反交换和自乘零
- 注意混合积的轮换不变性, 反交换性和自乘零
- 叉积的计算可以用三阶行列式算, 也可以记住 "23-31-12"
  - $(clr(a_2 b_3) - a_3 b_2) vi + (clr(a_3 b_1) - a_1 b_3) vj + (clr(a_1 b_2) - a_2 b_1) vk$

=== 平面

*点法式*: 平面上的两个点组成的向量和法向量垂直

$
(vx - vx_0) dot vp = 0 
quad quad quad
A(x - x_0) + B(y - y_0) + C(z - z_0) = 0
$

*三点式*: 平面上一个点和其他三个点组成的三个向量张成的平行体体积为 $0$

$
[(vx-vx_0) (vx-vx_1) (vx-vx_2)] = 0
quad quad quad
mat(delim: "|", 
  x - x_0, y - y_0, z - z_0;
  x - x_1, y - y_1, z - z_1;
  x - x_2, y - y_2, z - z_2
) = 0
$

*一般式*:

$
A x + B y + C z + D = 0
$

=== 直线

*点向式*: 两个点的方向和方向向量的方向相同

$
(vx - vx_0) prl vp 
quad quad quad
(x - x_0) / A = (y - y_0) / B = (z - z_0) / C
$ 

*两点式*: 另外一个点和两个点组成的两个向量平行

$
(vx - vx_0) prl (vx - vx_1) 
quad quad quad
(x - x_0) / (x - x_1) = (y - y_0) / (y - y_1) = (z - z_0) / (z - z_z)
$

注意此时有 $vp = vx_0 - vx_1$

*一般式*: 两个平面相交

$
cases(
  A_1 x + B_1 y + C_1 z + D_1 = 0,
  A_2 x + B_2 y + C_2 z + D_2 = 0,
)
$

#pagebreak()

== 基本元素之间关系

*点与点之间共线或共面*: 存在非零系数, 线性组合得零

*直线 平行/垂直 直线*: 方向向量 平行/垂直, 注意排除重合

*直线 平行/垂直 平面*: 方向向量 垂直/平行 法向量, 注意关系是*反*过来的, 并且要排除重合

*平面 平行 平面*: 法向量平行, 注意排除重合


*点到直线距离*: 叉积求出平行四边形面积, 除以底得到高

$
d = (vp cross (vx - vx_0)) / (||vp||)
$


*点到平面距离*: 和平面上的点组成的向量到法向量方向的投影长度

$
d = "Prj"_vp (vx - vx_0) = ((vx - vx_0) dot vp) / (||vp||)
$

== 常见求法

#set list(marker: ([★], [⤥], [›]))

- 尽量减少待定系数, 方向/法 向量可以用垂直关系叉积求的尽量叉积求

=== 旋转面

对任意曲线, 从它的参数方程形式可以求出它绕某个坐标轴旋转得到的曲面. 以 $z$ 轴为例, 此时的关键是曲线上任意一点到 $z$ 轴距离不变, 由此可以得到曲面方程:

$
x^2 + y^2 = x^2(t) + y^2(t)
$

其中 $t$ 用 $t = z^(-1)(z)$ 代替, 即可得到方程.

特别地, 对于在过坐标轴平面上的曲线, 如 $x O z$ 上的曲线, 可以直接通过一般式求出曲面方程:

$
cases(f(x, z) = 0, y = 0) quad => quad f(sqrt(x^2+y^2), z) = 0
$

原理是原先曲线中的 $x$ 就是代表到 $z$ 轴的距离, 旋转后用新的到 $z$ 轴距离替换掉变量 $x$ 即可. 

旋转体的体积可以参考一元积分中的内容.

=== 投影

从曲线的一般式可以求出它到坐标平面上的投影柱面和投影曲线:

$
cases(
  F_1(x, y, z) = 0,
  F_2(x, y, z) = 0,
) quad => quad phi(x, y) = 0
$

例如求曲线投影到 $x O y$ 上, 只需要联立两方程消 $z$ 即可得到投影柱面. 投影柱面和平面方程联立即可得到投影曲线.

特别地, 直线到平面上的投影可以通过直线方向向量和平面法向量叉积求得一个过直线且垂直于平面的平面, 然后此二平面相交即可得到投影直线. 当然, 也可以用方向向量求出它在平面法向量上的垂直分量, 并上直线和平面的交点直接得到投影直线的点法式.

=== 形心

$
hat(x) = (integral.triple_Omega x dif V) / V
quad quad
hat(y) = (integral.triple_Omega y dif V) / V
quad quad
hat(z) = (integral.triple_Omega z dif V) / V
$

#pagebreak()

#import "../template.typ": sectionline, gray_table, colored
#let dx = $dif x$

= 一元积分学

== 不定积分

=== 基本积分模式

多项式和对数:

$
integral x^a dx &= 1 / (a + 1) x^(a + 1) + C \
integral a^x dx &= 1 / (ln a) a^x + C \
$

三角函数:

#gray_table(
  columns: 7,
  [导数], [$cos$], [$-sin$], [$sec^2$], [$-cot^2$], [$sec tan$], [$-csc cot$],
  [函数], [$sin$], [$cos$], [$tan$], [$cot$], [$sec$], [$csc$], 
  [原函数], [$-cos$], [$sin$], [$-ln|cos|$], [$ln|sin|$], [$ln|sec + tan|$], [$ln|csc - cot|$],
) \

反三角函数 (带系数的形式在后边有理分式积分里有用):

$
integral 1 / ((a x)^2 + b^2) dx     &= colored(1 / (a b))  arctan (a x) / b + C \
integral 1 / sqrt(b^2 - (a x)^2) dx &= colored(1 / a)      arcsin (a x) / b + C \ 
integral 1 / colored(sqrt(x^2 plus.minus a^2)) &= ln |x + colored(sqrt(x^2 plus.minus a^2))| + C 
$

=== 换元 / 凑微分

识别到常见的微分结构, 但是这个结构里的 "$x$" 比较复杂, 而且旁边还多乘了一个东西的时候可以用.

识别到无法直接处理的函数复合的时候可以用 ($arctan sqrt(x)$ 之类).

识别到需要三角换元的时候可以用:

#figure(image("../assets/第一类换元-三角换元.png", width: 60%))

换元的时候一定要记得有时候

=== 分部积分

$
u v = integral u dif v + integral v dif u
$

识别到目标积分是两个部分乘起来, 并且其中一个部分求导之后比原来简单的时候用. 一般来讲反三角和多项式求导后比求导前简单, 所以优先尝试让它们被导一次. 

要额外注意分部后的正负号, 一般都是负号.

=== 有理分式积分

考试基本上只考二次的, 所以我们只考虑下面形式的有理分式积分:

$
I = integral (M x + N) / (x^2 + m x + n) dx 
$

首先上面的函数肯定可以拆成两部分, 其中一部分含 $x$, 并且刚好能凑出微分来; 另一部分只有一个常数:

$
I = M / 2 integral (dif (x^2...)) / (x^2...) dx quad + quad integral N' / (x^2 + m x + n) dx 
$

前者可以直接按照幂函数模式积出来, 后者则需要根据分母的 $Delta$ 不同来处理:

$
Delta = 0 quad &=> quad I = integral N' / (x - x_0)^2 dx          quad &=> quad "直接积分" \
Delta < 0 quad &=> quad I = integral N' / ((x - x_0)^2 + R^2) dx  quad &=> quad arctan ... \
Delta > 0 quad &=> quad I = integral N' / ((x - a) (x - b)) dx = integral (A / (x - a) + B / (x - b)) dx quad &=> quad ln ...
$

=== 三角有理式

$
I = integral sin^m x cos ^n x dx
$

- 当 $m$, $n$ 都是偶数时或都是奇数时, 可以用半角公式把指数除以 $2$.
- 当 $m$, $n$ 有一个是奇数时, 就可以把奇数那个拿一个去凑微分得到 $dif sin$ 或者 $dif cos$, 然后剩下的两个偶数里可以直接用 $sin^2 + cos^2 = 1$ 换成另一个

对于三角有理分式, 可以直接用万能公式换成普通有理分式, 然后暴力算就可以了: 

$
sin x = (2 t) / (1 + t^2) quad quad cos x = (1 - t^2) / (1 + t^2) quad quad (t = tan (x / 2))
$

=== 指数有理式

直接换元换上去变成分母多一阶的有理分式, 然后暴力算就可以了:

$
integral f(a^x) dx = 1 / (ln a) integral f(t) / t dif t
$

#pagebreak()

== 定积分

=== 定积分检查步骤

#set list(marker: ([★], [⤥], [›]))

- 检查定积分内函数的奇偶性
  - 奇函数原点对称区间内定积分恒 $0$
  - 偶函数则把区间折半并加上系数 $2$
  - 定积分的换元一定要保证换元函数的可逆性
- 检查区间内函数是否有瑕点
  - 一般看分母在区间内有没有可能为 $0$ 即可
  - 区间中有瑕点, 需要分段积分; 区间端点是瑕点或无穷则直接积到最后结果再取极限即可

=== 变限积分

$
dif / (dif x) integral^x_c f(t) dif t = f(x)
$

遇到内层积分是变限积分的二重积分时, 可以把变限积分视作 "容易取得导数的函数", 然后套分部积分公式处理. 一般而言乘积项都会被题目的设计消掉.

=== 华莱士公式 / 点火公式

#set math.cases(gap: 1em)

$
integral^(pi / 2)_0 sin^n x dx = 
integral^(pi / 2)_0 cos^n x dx = 
cases(
  (n-1)!! / n!!  " , " n = 2k + 1,
  (n-1)!! / n!! dot.c pi / 2 " , " n = 2k,
)
$

#pagebreak()
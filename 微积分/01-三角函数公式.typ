#import "../template.typ": sectionline, gray_table, colored

= 三角函数

== 定义和关系

#figure(image("../assets/三角函数六角图.png", width: 75%))

== 和差化积 (积化和差可以一起推出来)

$
sin(alpha plus.minus beta) &= sin alpha cos beta plus.minus cos alpha sin beta \
cos(alpha plus.minus beta) &= cos alpha cos beta plus.minus sin alpha sin beta  \
tan(alpha plus.minus beta) &= (tan alpha plus.minus tan beta) / (1 minus.plus tan alpha tan beta)
$

== 二倍角

$
sin 2 &= 2 sin cos \
cos 2 &= cos^2 - sin^2 \
             &= 2 cos^2 - 1 = 1 - 2 sin^2 \
tan 2 &= (2 tan) / (1 - tan^2)
$

== 导数和原函数

#gray_table(
  columns: 7,
  [函数], [$sin$], [$cos$], [$tan$], [$cot$], [$sec$], [$csc$], 
  [导数], [$cos$], [$-sin$], [$sec^2$], [$-cot^2$], [$sec tan$], [$-csc cot$],
  [原函数], [$-cos$], [$sin$], [$-ln|cos|$], [$ln|sin|$], [$ln|sec + tan|$], [$ln|csc - cot|$],
)

$
dif arcsin &= 1 / sqrt(1 - x^2) dif x 
quad quad
dif arctan &= 1 / (1 + x^2) dif x \
$

== 级数

$
sin &= sum (-1)^n / (2n + 1)! x^(2n + 1)
quad quad
cos &= sum (-1)^n / (2n)! x^(2n) \
$

#pagebreak()

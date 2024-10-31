#import "template.typ": *
#show: template.with(
  title: [考研数学一 复习笔记],
  short_title: "数一笔记",
  description: [
    复习考研数学一时的背诵大纲
  ],
  date: datetime(year: 2024, month: 06, day: 04),
  authors: (
    (
      name: "GitHub @ Origami404",
      link: "",
      affiliations: "",
    ),
  ),
  affiliations: (),
  lof: false,
  lot: false,
  lol: false,
  // bibliography_file: "refs.bib",
  paper_size: "a4",
  cols: 1,
  text_font: "Noto Serif CJK SC",
  code_font: "CaskaydiaCove NFM",
  accent: blue, // blue
)

#show heading: it => { it; h(1em) }

#include "./微积分/01-三角函数公式.typ"
#include "./微积分/02-极限与导数.typ"
#include "./微积分/03-一元积分.typ"
#include "./微积分/04-一元微分方程.typ"
#include "./微积分/05-中值定理.typ"
#include "./微积分/06-多元微分学.typ"
#include "./微积分/07-级数.typ"
#include "./微积分/08-空间解析几何.typ"
#include "./线性代数.typ"
#include "./概率与统计.typ"

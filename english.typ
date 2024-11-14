#import "template.typ": *
#show: template.with(
  title: [考研英语 大小作文背诵模版],
  short_title: "英语作文模版",
  description: [
    复习考研英语时的背诵大纲
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
#set list(marker: ([★], [⤥], [›]))

#let colored(it) = text(fill: red, weight: "bold", it)

= 小作文

== 内容

- 建议
  - render several practical suggestions
  - if you could be so kind as to (...), we would be grateful
  - take my suggestions into consideration
- 请求
  - seek your help
  - ask for your assistance
  - My appreciation for your time and generous help is beyond words
- 推荐
- 邀请
  - We are greatly honored to invite you to our ...
  - You are #colored[cordially] invited to #colored[participate] in our ...
  - is to be held, has be arranged 
- 投诉
  - far from satisfactory
  - draw your attention to (...)
  - Personally, I found this to be completely unacceptable
- 道歉
  - convery my sincere guilt that
  - 
- 感谢

== 通用

- 分点
  - (the primary reasons are) as follow#colored[s]
  - First and foremost, Moreover, Last but not least
  - To begin with, In addition, Finally
- 结尾感谢
  - Thank you for your time and attention/consideration
  - If you need any further (...), plaese do not #colored[hesitate] to contact me
  - Please give my best regar#colored[s] to your family
- 代表身份
  - As (a representative of) (...)
  - On behalf of (...)
- 原因
  - since
  - owing to the fact that
- 意图
  - intent



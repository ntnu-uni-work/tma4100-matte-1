#let subject = "Matematikk 1 / TMA4100"
#let candidate = "Tien Tran"

#set text(size: 12pt, lang: "nb", font: "Calibri")
#set par(
  leading: 14pt,
  justify: true,
)
#show par: set block(above: 16pt)
#set math.equation(numbering: "(1)")

#set page(
  header: [
    #subject / #datetime.today().display("[day].[month].[year]")
    #h(1fr)
    #candidate
    #line(length: 100%)
  ],
  numbering: (..nums) => "Side " + nums.pos().map(str).join(" av ")
)

#set heading(numbering: "1a.")

#let pair(a, b) = {
  $angle.l #a, #b angle.r$
}

=

La $P = {x_0, x_1, ... , x_n}$ være en partisjon av intervallet $[1, 2]$ med $n$ like store delintervaller, der $x_0 = 1$ og $x_n = 2$, og la $f(x)=x^2-2x+3$.

==

Finn et uttrykk for $sum_(i=1)^n f(x_i)$. #h(1cm) (Vink: $sum_(i=1)^n i^2 = 1/6 n(n+1)(2n+1)$.)

$ sum_(i=1)^n f(x_i) &= ((1+1/n)^2 - 2(1+1/n)+3) + ... + ((1+n/n)^2 - 2(1+n/n) + 3) \
&= ((1+2/n + 1/n^2) - 2 -2/n + 3) + ((1+4/n+4/n^2)-2-4/n+3) + ... \
&= (2+1/n^2) + (2+4/n^2) + ... + 3 \
&= 2 dot n + (n(n+1)(2n+1))/(6n^2) \
&= (12n^2)/(6n) + ((n+1)(2n+1))/(6n) \
&= (12n^2 + (n+1)(2n+1))/(6n) \
&= (12n^2 + 2n^2 + 3n + 1)/(6n) \
&= underline(underline((14n^2 + 3n + 1)/(6n))) $

==

Bestem $ lim_(n->infinity) 1/n sum_(i=1)^n f(x_i) $

$ lim_(n->infinity) 1/n sum_(i=1)^n f(x_i) \ 
&= lim_(n->infinity) 1/n (14n^2 + 3n + 1)/(6n) \
&= lim_(n->infinity) (14n^2+3n+1)/(6n^2) \
&= lim_(n->infinity) (28n+3)/(12n) \
&= lim_(n->infinity) (28)/(12) \
&= 28/12 = 14/6 = underline(underline(7/3))
$

==

Regn ut $ integral_1^2 f(x) dif x $

$ integral x^2-2x+3 dif x = 1/3 x^3 - x^2 + 3x + C $

$ integral_1^2 f(x) dif x &= [1/3 x^3 - x^2 + 3x]_1^2 \
&= (8/3-4+6)-(1/3-1+3) \
&= (8/3 + cancel(2)) - (1/3 + cancel(2)) \
&= underline(underline(7/3)) $

#pagebreak()

=

Regn ut $ lim_(n->infinity) 2/n sum_(i=1)^n sqrt(2+(2i)/n) $

Velger $x_i = i/n => Delta x_i = 1/n$

$ sqrt(2+(2i)/n) = sqrt(2 + 2x_i) $

$ 2/n sum_(i=1)^n sqrt(2+(2i)/n) =>f(x_i) = 2 sqrt(2 + 2x_i) $

$ &lim_(n->infinity) 2/n sum_(i=1)^n sqrt(2+(2i)/n) \
= &integral_0^1 2 sqrt(2+2x) dif x \
= &2 integral_0^1 sqrt(2+2x) dif x \
= &2 integral_0^1 (2+2x)^(1/2) dif x \
= &2 [1/(3/2 dot 2) (2+2x)^(3/2)]_0^1 \
= &2 (1/3 sqrt(4^3) - 1/3 sqrt(2^3)) \
= &2 ((8 - 2sqrt(2))/3) \
= &underline(underline((16-4sqrt(2))/3))
$

#pagebreak()

=

==

Finn alle løsningene av ligningen $cos(2x) = sin(x)$ for $x in [0, pi]$.

(Vink: $cos(2x) = 1 − 2 sin^2(x)$.)

$ cos(2x) &= sin(x) \
&arrow.t.b.double \
1 - 2 sin^2(x) &= sin(x) \
2 sin^2(x) + sin(x) - 1 &= 0 \
sin(x) &= (-1 plus.minus sqrt(1^2 - (4 dot 2 dot (-1))))/(2 dot 2) \
sin(x) &= (-1 plus.minus sqrt(9))/(4) \
sin(x) &= (-1 plus.minus 3)/(4) &&"me forkastar den negative løysinga" \
sin(x) &= 1/2 \
x &= arcsin(1/2) \
underline(underline(x &= pi/6))
$

==


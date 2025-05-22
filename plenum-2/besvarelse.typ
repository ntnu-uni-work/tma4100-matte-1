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
    Kandidat:  #candidate
    #line(length: 100%)
  ],
  numbering: (..nums) => "Side " + nums.pos().map(str).join(" av ")
)

#set heading(numbering: "1a.")

=

Gitt at $ lim_(x->4) (4x f(x)-1)/(x-4) = 9 $

finn $ lim_(x->4) f(x) $

Faktoriser teller til $(x-4)(x+5)$ slik at $x-4$ kanselleres i teller og nevner, og $lim_(x->4) x+5$ evalueres til 9. Bruk $f(x)$ til å lage faktorene.

=

Bestem grenseverdien $ lim_(x->infinity) ((3x^2+4)/(4x^2+8))^2 $

$ &lim_(x->infinity) ((3x^2+4)/(4x^2+8))^2 \
= &lim_(x->infinity) ((3+4/x^2)/(4+8/x^2))^2 \
= &(3/4)^2 \
= &9/16
$


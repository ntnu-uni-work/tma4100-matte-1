#let subject = "Matematikk 1 / TMA4100"
#let candidate = "Tien Tran"

#set text(size: 12pt, lang: "nb")
#set par(
  leading: 14pt,
  justify: true,
)

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

#let next = {
  $ \ arrow.t.b.double \ $
}

#let sol(exp) = {
  $ underline(underline(#exp)) $
}

#let der(var) = {
  $ dif / (dif #var) $
}

#let inf = {
  $ infinity $
}

#let pm = {
  $ plus.minus $
}

#let mp = {
  $ minus.plus $
}

#let line = {
  line(length: 100%, stroke: (dash: "dashed"))
}

=

Et fullt vannreservoar skal tømmes for vann. Anta at reservoaret har form som en sirkulær kjegle med spissen pekende loddrett nedover, at reservoaret er 10 meter dypt og har en diameter på 50 meter.

Anta så at det krever 9810 joule å pumpe 1 kubikkmeter vann 1 meter opp. Hvor mye energi skal til for å tømme hele vannreservoaret ved å pumpe alt vannet opp i en høyde 1 meter over toppen av reservoaret?

#line

Vi kan "rotere" aksene slik at vi dreier om x-aksen. Da vil en kjegle være gitt ved en lineær funksjon (med radius, f(0), lik 25m, dybde 10m, $f(10)=0$):

$ f(x) = a x + b, f(0) = 25, f(10) = 0 next
b = 25, a=-2.5 next
f(x) = -5/2 x + 25
$

Avstanden mellom $x=-1$ og $x$ er gitt ved $x+1$ (så lenge $x>=-1$, som går fint fordi vi integrerer fra $0$ til $10$). Vi finner volumet $V_(x_i)$ i en gitt $x_i$ og regner samtidig ut hvor mye forflyttelse $V_(x_i)$ må gjennom. Siden forflyttelsesenergien er gitt ved 9810 joule per 1 meters avstand på 1 kubikkmeter vann, går enhetene opp når vi ganger med energikravet og vi kommer til å stå igjen med joule:

$ E &= 9810 dot pi integral_0^10 f(x)^2 dot (x+1) dif x \
&= 9810 dot pi integral_0^10 (25/4x^2 - 125x + 625) dot (x+1) dif x \
&= 9810 dot pi integral_0^10 (25/4x^3 - 125x^2 + 625x + 25/4x^2 - 125x + 625) dif x \
&= 9810 dot pi integral_0^10 (25/4x^3 - 475/4x^2 + 500x + 625) dif x \
&= 9810 dot pi [25/16 x^4 - 475/12 x^3 + 500/2x^2 + 625x]_0^10 \
&= 9810 dot pi dot (250000/16 - 475000/12 + 50000/2 + 6250) \
&approx sol(224.72 "MJ")
$

#pagebreak()

=

Vis at forholdstesten _ikke_ kan avgjøre hvorvidt rekken

$ sum_(n=1)^inf n/(n^2 + 17) $

konvergerer eller divergerer. Bruk så en annen test til å avgjøre hvorvidt rekken konvergerer eller divergerer.

#line

Vi bruker forholdstesten:

$ k &= a_(n+1)/a_n \
&= ((n+1)/((n+1)^2 + 17))/(n/(n^2+17)) \
&= ((n+1)(n^2+17))/(n((n+1)^2+17)) \
&= (n^3 + n^2 + 17n + 17)/(n(n^2+2n+1+17)) \
&= (n^3 + n^2 + 17n + 17)/(n^3 + 2n^2 + 18n)
$

Vi regner ut forholdstallet når $n->inf$. Vi ser at dette blir $inf/inf$, selv med tre ganger derivert på grunn av polynomoppførsel. Til slutt får vi $3!/3! = 1$:

$ lim_(n->inf) k &= (n^3 + n^2 + 17n + 17)/(n^3 + 2n^2 + 18n) = inf/inf \
arrow.b.double \
lim_(n->inf) k &= (3n^2 + 2n + 17)/(3n^2 + 4n + 18) = inf/inf \
arrow.b.double \
lim_(n->inf) k &= (6n + 2)/(6n + 4) = inf/inf \
arrow.b.double \
lim_(n->inf) k &= 6/6 = sol(1)
$

Siden forholdstallet går mot $1$, kan vi ikke konkludere om rekken konvergerer ($<1$) eller divergerer ($>1$)

Vi lar $a_n = n/(n^2 +17)$ og $b_n = 1/n$ (som vi vet har en divergerende sum). Vi kan bruke grensesammenligningstesten for å påvise divergens

$ lim_(n->inf) a_n/b_n &= (n/(n^2+17))/(1/n) \
&=(n^2)/(n^2+17) \
&= inf/inf \
&#h(0.5cm)arrow.b.double \
lim_(n->inf) a_n/b_n &= (2n)/(2n) = underline(1)
$

Siden grensen er større enn 0, og $b_n$ divergerer, må vi konkludere om at rekken med $a_n$ også divergerer.

#pagebreak()

=

I denne oppgaven ser vi på rekken

$ sum_(n=2)^inf a_n $

der

$ a_n = (-1)^n/sqrt(n) + 1/n $

==

Vis at $a_n a_(n+1) < 0$ for alle $n$ (med andre ord at leddene alternerer) og at $ lim_(n->inf) a_n = 0 $

#line

Siden $x>=2 => sqrt(x) < x$ vil $abs(1/sqrt(n)) > 1/n$. Det vil si at når $n$ er oddetall slik at $(-1)^n = -1$ så vil $-1/sqrt(n) + 1/n < 0$. Henter vi verdien til det neste $n$-leddet, får vi: $1/(sqrt(n+1)) + 1/(n+1)$. Dette er et positivt uttrykk siden det består av to positive ledd. Henter vi verdien til det neste leddet er vi tilbake til en oddetall $n$, og da vet vi at leddet blir negativt som vist tidligere. Så når vi ganger sammen to etterfølgende ledd, vil dette alltid være negativt siden et og bare et av leddene er alltid negativt.

Vi setter opp uttrykket for å vise at grenseverdien konvergerer mot 0: 

$ &lim_(n->inf) a_n \
= &lim_(n->inf) (-1)^n/sqrt(n) + 1/n \
= &lim_(n->inf) (-1)^n/sqrt(n) + cancel(lim_(n->inf) 1/n) \
= &lim_(n->inf) (-1)^n/sqrt(n)
$

Vi bruker så skviseteoremet. Siden de eneste endringene i telleren er dens fortegn, kan man konkludere med at for alle $n>=2$ så:

$ -1/sqrt(n) <= a_n <= 1/sqrt(n) $

Siden $ lim_(n->inf) -1/sqrt(n) = 0 = lim_(n->inf) 1/sqrt(n) $

forteller skviseteoremet at da må også $ lim_(n->inf) a_n = 0 $

==

Vis at rekken divergerer. Hvorfor strider ikke dette mot testen for alternerende rekker?

#line

Vi omskriver rekken:

$ sum_(n=2)^inf (-1)^n/sqrt(n) + 1/n = sum_(n=2)^inf 1/n + sum_(n=2)^inf (-1)^n/sqrt(n) $

Siden det er kjent at $ sum_(n=2)^inf 1/n $ divergerer, og $ sum_(n=2)^inf (-1)^n/sqrt(n) $ er en alternerende rekke (altså konvergerer), kan ikke summen av de to konvergere (divergens + konvergens = divergens).

Dette strider ikke mot testen for alternerende rekker siden en av betingelsene ikke er oppfylt for $a_n$, nemlig at $abs(a_(n+1)) <= abs(a_n)$. Vi viser at dette ikke er tilfellet med et moteksempel:

$ n = 3 => a_n &= -1/sqrt(3) + 1/3 = -sqrt(3)/3 + 1/3 = (1 - sqrt(3))/3 approx -0.244 \
a_(n+1) &= 1/sqrt(4) + 1/4 = 1/2 + 1/4 = 3/4 = 0.75
$

Siden $0.75 > 0.244$, har vi vist et moteksempel hvor $abs(a_(n+1)) <= abs(a_n)$ ikke stemmer.

#pagebreak()

=

Finn konvergensområdet og sum for rekken

$ sum_(n=0)^inf x(1-x^2)^n $

Er summen en kontinuerlig funksjon? Svaret må begrunnes.

#line

Vi gjenkjenner at rekken er geometrisk hvor kvotienten $k(x) = (1-x^2)$. Siden geometriske rekker kun konvergerer når $abs(k(x)) < 1$ får vi:

$ abs(k(x)) < 1 next
abs(1-x^2) < 1 next
-1 < 1-x^2 < 1 next
-2 < -x^2 < 0 next
0 < x^2 < 2 next
0 < abs(x) < sqrt(2)
$

Vi observerer også at rekken konvergerer når $x=0$ siden rekken blir $0 + 0 + 0 + ... = 0$. Konvergensområdet er altså $(-sqrt(2), sqrt(2))$. 

Vi trekker ut $x$ og får $x sum_(n=0)^inf (1-x^2)^n$. Summen vil da være gitt ved $x dot 1/(1-k(x)) = x/(1-(1-x^2)) = 1/x$. 

Summen er derimot _ikke_ en kontinuerlig funksjon, siden vi fikk en endring av definisjonsmengde. $1/x$ er ikke definert ved $x=0$, men $0 in (-sqrt(2), sqrt(2))$. Altså kan summen beskrives slik:

$ S(x) = cases(
  1/x &"hvis" abs(x)<sqrt(2), 
  0 &"hvis" x = 0,
  &"ellers divergerer rekken"
) $

$S(x)$ er ikke kontinuerlig fordi $ lim_(x->0^-) S(x) = -inf != S(0) = 0 != inf = lim_(x->0^+) S(x) $
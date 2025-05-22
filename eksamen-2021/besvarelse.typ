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

#image("image (8).png")

Vi mangler $y'(1)$. Vi deriverer derfor implisitt:

$ der(x) y^3 - 2x y &= der(x) 4e^(2x-y) \
3y^2 y' - 2(x y' + y) &= 4e^(2x - y) (2-y') \
3y^2 y' - 2x y' - 2y &= 8e^(2x-y) - 4y'e^(2x-y) \
3y^2 y' - 2x y' + 4y'e^(2x-y) &= 2y + 8e^(2x-y) \
y'(3y^2 - 2x + 4e^(2x-y)) &= 2y + 8e^(2x-y) \
y' &= (2y + 8e^(2x-y))/(3y^2 - 2x + 4e^(2x-y))
$

For å finne $y'(1)$ setter vi inn punktet vårt:

$ y'(1) &= (2(2) + 8e^(2(1)-(2)))/(3(2)^2 - 2(1) + 4e^(2(1)-(2))) \
&= (4 + 8e^(0))/(10 + 4e^(0)) \
&= (12)/14 = 6/7
$

Vi bruker ettpunktsformelen og får:

$ T(x) = 6/7(x-1) + 2 = 6/7x - 6/7 + 2 = 6/7x + 8/7 $

#pagebreak()

=

#image("image (9).png")

Vi lar $P(x) = 3x$ og $Q(x) = 2x$, den integrerende faktoren blir da $e^(integral P(x)) = e^( 3/2x^2)$:

$ e^(3/2x^2)y' + e^(3/2x^2)(3x y) &= e^(3/2x^2)(2x) \
e^(3/2x^2)y &= integral e^(3/2x^2)(2x) dif x \
e^(3/2x^2)y &= integral e^(u)(2x) (dif u)/(3x) \
e^(3/2x^2)y &= 2/3 integral e^(u) dif u \
e^(3/2x^2)y &= 2/3 e^(u) + C \
e^(3/2x^2)y &= 2/3 e^(3/2 x^2) + C \
$

Setter inn initialverdien:

$ e^(0)0 &= 2/3 e^(0) + C => C = -2/3 $

Løsningen på differensiallikningen er

$ y(x) = (2 e^(3/2 x^2) - 2)/(3 e^(3/2 x^2)) $

#pagebreak()

=

#image("image (10).png")

$f$ er kontinuerlig i $x=0$ hvis $lim_(x->0) f(x) = f(0) = 0$. Ser at vi får $0/0$ i grenseverdien, vi bruker derfor l'Hôpitals: $ lim_(x->0) f(x) &= ((sin x(1-cos x))')/((x^2)') \
&= (sin x (sin x) + cos x(1-cos x))/(2x) \
&= (sin^2 x + cos x - cos^2 x)/(2x) \
&= 0/0
$

Vi anvender l'Hôpitals på nytt:

$ 
lim_(x->0) f(x) &= (sin^2 x + cos x - cos^2 x)'/(2x)' \
&= (2sin x cos x - sin x + 2 cos x sin x)/2 \
&= 0/2 = 0
$

Siden grenseverdien er lik funksjonsverdien er $f$ kontinuerlig i $x=0$

$f$ er deriverbar i 0 hvis grenseverdien eksisterer: $ f'(0) &= lim_(h->0) (f(0 + h) - cancel(f(0)))/h \
&= lim_(h->0) (sin h(1-cos h))/h^3
$

Vi anvender l'Hôpitals siden nevneren er et polynom, kommer vi til å komme til en slutt. Vi benytter dobbelderiverte fra tidligere teller og går rett på tredjederivert:

$ f'(0) &= lim_(h->0) (2sin h cos h - sin h + 2 cos h sin h)'/3! \
&= lim_(h->0) (4sin h cos h - sin h)'/6 \
&= lim_(h->0) (4(cos^2 h - sin^2 h) - cos h)/6 \
&= 3/6 = 1/2
$

Grenseverdien eksisterer og den deriverte i $x=0$ er lik $1/2$

#pagebreak()

=

#image("image (11).png")

#image("image (12).png")

Den delen av kurven $x=y^2$ som avgrenser $R$ er den positive roten, $y=sqrt(x)$.

Vi bruker sylinderskallmetoden:

$ V &= 2 pi integral_1^3 (x+1) dot x - (x+1) dot sqrt(x) dif x \
&= 2 pi integral_1^3 x^2 + x - x^(3/2) - sqrt(x) dif x \
&= 2 pi [1/3 x^3 + 1/2 x^2 - 2/5 x^(5/2) - 2/3 x^(3/2)]_1^3 \
&approx 2 pi dot 4.03 \
&approx 25.35 \
$

#pagebreak()

=

#image("image (13).png")

$ &integral 1/(3+e^x) dif x \
= &integral 1/u (dif u)/(u - 3) \
= &integral 1/u 1/(u-3) dif u \
$

$ A(u-3) + B u = 1 \
u = 0 => A = -1/3 \
u = 3 => B = 1/3
$

$
&integral -1/3 1/u + 1/3 1/(u-3) dif u \
= &-1/3 ln(abs(u)) + 1/3 ln(abs(u-3))  + C \
= &-1/3 ln(3+e^x) + 1/3 ln(e^x) + C
$

Vi lar $ f(x) = &-1/3 ln(3+e^x) + 1/3 ln(e^x) + C $

$ &lim_(b->inf) integral_0^b 1/(3 + e^x) dif x \
&= lim_(b->inf) f(b) - f(0) \
&= lim_(b->inf) f(b) - (-1/3 ln(3+e^0) + cancel(1/3 ln(e^0)) + C) \
&= lim_(b->inf) (-1/3 ln(3+e^b) + 1/3 ln(e^b) + cancel(C)) - (-1/3 ln(4) + cancel(C)) \
&= lim_(b->inf) -1/3 ln(3+e^b) + 1/3 ln(e^b) + 1/3 ln(4) \
&= 1/3 lim_(b->inf) ln((4 e^b)/(3+e^b)) \
&= 1/3 lim_(b->inf) ln((4)/(3/e^b + 1)) \
&= 1/3 ln((4)/1) \
&= 1/3 ln(4) \
&= 2/3 ln(2) \
$

#pagebreak()

=

1. Rekken er alternerende, ergo konvergerer den. Sjekker absolutt konvergens ved å bruke integraltesten (som vi kan gjøre fordi integranden er strengt avtagende, dvs. for alle rektangel $i$, er arealet $Delta x dot f(x_i)$ større enn integralet $integral_(x_i)^(x_i + Delta x) f(x) dif x$): $ sum_(n=1)^inf 1/((n+1)ln(n+1)) &> integral_1^inf 1/((x+1)ln(x+1)) dif x \
  &= lim_(b->inf) integral_1^b 1/((x+1)ln(x+1)) dif x \
  &= lim_(c->inf) integral_2^c 1/(u ln(u)) dif u \
  &= lim_(d->inf) integral_ln(2)^d 1/(u v) dif v dot u \
  &= lim_(d->inf) integral_ln(2)^d 1/(v) dif v \
  &= lim_(d->inf) [ln(abs(v))]_ln(2)^d \
  &= lim_(c->inf) [ln(abs(ln(u)))]_2^c \
  &= lim_(b->inf) [ln(abs(ln(x+1)))]_1^b \
  &= inf - ln(abs(ln(2))) \
$

Siden integralet divergerer, må rekken også divergere

2. Vi bruker forholdstesten:

$ &lim_(n->inf) ((3^(n+1))/n!)/((3^n)/(n-1)!) \
= &lim_(n->inf) (3^(n+1) (n-1)!)/(3^n n!) \
= &lim_(n->inf) 3 1/n \
= & 0
$
Siden grenseverdien er i intervallet $[0, 1)$, så konvergerer rekken absolutt.

3. Siden $abs(sin n) <= 1$, er $abs(sin n)/n^2 <= 1/n^2 $, og $1/n^2$ vet vi konvergerer (p-rekke med eksponent 2), da må rekken konvergere absolutt.

#pagebreak()

=

For $0<=h<=5$ har vi:

$ V(h) &= integral_0^h (15 dot 30)/5x dif x \
&= [45 x^2]_0^h \
&= 45 h^2
$

For $5<h<=6$ har vi:

$ V(h) &= V(5) + (h-5)dot 15 dot 30 \
&= 1125 - 2250 + 450h \
&= 450h - 1125
$

Altså blir funksjonen: 

$ V(h) = cases(45 h^2 &"for" 0<=h<=5, 450h - 1125 &"for" 5<h<=6) $

Vi bruker kjerneregelen fordi volumet avhenger av høyden (som avhenger av tid): $ der(t) V = -1 = der(h) V bar.v_(h=3) dot der(t) h = 90h bar.v_(h=3) dot der(t) h = 270 dot der(t) h next
der(t) h = -1/270
$

#pagebreak()

=

Fordi i intervallet så er sinusfunksjonen strengt avtagende og $x$ strengt voksende og funksjonsverdien er positiv i den første enden $2 sin pi/2 - pi/2 = 2-pi/2 > 0$, mens i den andre enden så er den negativ $2 sin pi - pi = 0 - pi < 0$, og da forteller skjæringssetningen at det finnes et punkt $x=c$ i intervallet $(pi/2, pi)$ slik at $f(c) = 0$

Vi trenger den deriverte: $ f'(x) = 2 cos x - 1 $

$ x_1 = x_0 - f(x_0)/(f'(x_0)) \
x_0 = 2 => x_1 approx 1.90
$

#pagebreak()

=

$ &lim_(x->0) (x sin^2 x)/(x - arctan x) \
= &lim_(x->0) (x sin^2 x)/(1/3x^3 - cal(O)(x^5)) \
= &lim_(x->0) (x sin^2 x)'/(1/3x^3 - cal(O)(x^5))' \
= &lim_(x->0) (2x sin x cos x + sin^2 x)/(x^2 - cal(O)(x^4)) \
= &lim_(x->0) (2x sin x cos x + sin^2 x)'/(x^2 - cal(O)(x^4))' \
= &lim_(x->0) (2 sin x cos x + 2x(cos^2 x - sin^2 x) + 2 sin x cos x)/(2x - cal(O)(x^3)) \
= &lim_(x->0) (2 sin x cos x + 2x(cos^2 x - sin^2 x) + 2 sin x cos x)'/(2x - cal(O)(x^3))' \
= &lim_(x->0) (4 cos^2 x -4sin ^2 x + 2(cos^2 x - sin^2 x) + 2x(-2cos x sin x - 2sin x cos x))/(2 - cal(O)(x^2)) \
= &(4-0+2(1) + 0)/2 \
= &3
$

#pagebreak()

=

Vi finner kandidater til ekstremalpunkter ved å finne kritiske punkter. Vi deriverer: $ 
  f'(x) &= (e^(2x^2-1) dot 4x dot x - e^(2x^2-1))/(x^2) \
  &= (e^(2x^2-1)(4x^2-1))/x^2
$

Og setter den deriverte lik 0: $
  f'(x) = 0 next
  (e^(2x^2-1)(4x^2-1))/x^2 = 0 next
  x=pm sqrt(1/4) = pm 1/2
$

Vi vet at $f(x)$ kommer til å "likne" på $1/x$ siden $e^(2x^2-1)>0$ for alle $x$, hvor det jeg mener med "likne" er at alle funksjonsverdiene befinner seg i samme kvadrant. Siden telleren vokser mye raskere enn nevneren kommer det også til å være en slags bueform. Vi vet derfor at de lokale ekstremalpunktene er $x=-1/2$ (toppunkt) og $x=1/2$ (bunnpunkt)


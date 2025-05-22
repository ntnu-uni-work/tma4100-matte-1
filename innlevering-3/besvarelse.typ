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

=

Bruk definisjonen av den deriverte til å finne den deriverte til $f(x) = 1/x$.

$ &lim_(Delta x -> 0) (f(x+Delta x) - f(x))/(Delta x) \
= &lim_(Delta x -> 0) (1/(x+Delta x) - 1/x)/(Delta x) \ 
= &lim_(Delta x -> 0) 1/(x Delta x + (Delta x)^2) - 1/(x Delta x) \
= &lim_(Delta x -> 0) 1/(x Delta x (1 + (Delta x)^2/(x Delta x))) - (1 + (Delta x)^2/(x Delta x))/(x Delta x(1 + (Delta x)^2/(x Delta x))) \
= &lim_(Delta x -> 0) - ((Delta x)/x)/(x Delta x (1 + (Delta x)/x)) \
= &lim_(Delta x -> 0) - 1/(x^2(1+(Delta x)/x)) \
= &sol(-1/(x^2))
$

#pagebreak()

=

Vis at punktet $(x, y) = (- pi, 1/2)$ ligger på kurven $y=y(x)$ gitt ved

$ tan(x y^2) = (2x y)/pi $

Setter inn:

$ tan(-pi (1/2)^2) &= (2(-pi)1/2)/pi \
tan(-1/4 pi) &= -1 \
sin(-1/4 pi)/cos(-1/4 pi) &= -1 \
(-sqrt(2)/2)/(sqrt(2)/2) &= -1 \
-1 &= -1
$

$sol("Punktet ligger på kurven.")$

Finn likningen for tangenten til kurven i punktet $(-pi, 1/2)$.

Vi deriverer begge sidene:

$ der(x) tan(x y^2) &= der(x) (2x y)/pi \
1/(cos^2(x y^2)) dot (y^2 + x dot 2y dot y') &= 2/pi (y + x dot y') \
$

Setter inn punktet for $x$ og $y$, altså evaluerer $y'(x)$. Evaluasjonen blir $y'$:

$ 1/(cos^2(-pi/4)) dot (1/4 -pi y') &= 2/pi (1/2 -pi y') \ 
(1/4 -pi y')/(sqrt(2)/2)^2 &= (1-2pi y')/pi \
1/2 - 2pi y' &= 1/pi - 2y' \
y' dot (2-2 pi) &= 1/pi - 1/2 \
y' &= (2-pi)/(2 pi dot (2-2 pi)) \
y' &= (2-pi)/(4 pi dot (1- pi)) \
$

Setter dette inn i tangentlikningen $ T(x) &= f(x_0) + f'(x_0) (x-x_0) \ 
&= 1/2 + (2-pi)/(4pi dot (1-pi))(x+pi)
$


#pagebreak()

=

Avgjør om følgende integral

$ integral_(-1)^inf (x+4)/(x^2 + 6x + 9) dif x $

konvergerer eller divergerer.

$ &integral_(-1)^inf (x+4)/(x^2 + 6x + 9) dif x \
= &integral_(-1)^inf (x+4)/((x+3)^2) dif x \
= &integral_(-1)^inf (u+1)/u^2 (dif u) / ((x+3)')  \
= &integral_(-1)^inf 1/u + 1/u^2 dif u \
= &integral_(-1)^inf 1/u + u^(-2) dif u \
= &[ln(abs(u)) + 1/(-1) u^(-1)]_(-1)^inf \
= &[ln(abs(x+3)) -1/(x+3)]_(-1)^inf \
= &inf - (...), #h(1cm) ...in RR
$

Integralet divergerer

#pagebreak()

=

Vis at buelengden til $L$ til grafen til funksjonen

$ f(x) = x^4, #h(1cm) "for" x in [0, 1] $

kan skrives som

$ L = integral_0^1 sqrt(1+16 x^6) dif x $

Formelen for buelengde (som kommer av Pytagoras og algebraisk triksing: $(f(x+Delta x)-f(x))/(Delta x) = f'(x)$) er gitt ved $ 
B = integral_a^b sqrt(1 + f'(x)^2) dif x
$

I vårt tilfelle er $a=0$ og $b=1$.

$ f'(x) = 4x^3 => L &= integral_0^1 sqrt(1+(4x^3)^2) dif x \
&= integral_0^1 sqrt(1 + 16x^6) dif x
$

Bruk Simpsons metode med $2n = 4$ delintervall til å regne ut $L$.

$ L approx S_4 = h/3 (y_0 + 4y_1 + 2y_2 + 4y_3 + y_4) $

$ h = 1/4 $
$ y_0 &= f(0)=0 \
y_1 &= f(1/4)=1/256 \
y_2 &= f(2/4)=2^4/(2^4)^2 = 1/16 \
y_3 &= f(3/4)=81/256 \
y_4 &= f(1) = 1 
$

$ L approx S_4 = 77/384 $

#pagebreak()

=

Finn funksjonen $f(x)$ slik at

$ f(x) = 1 - integral_0^x f(t) dif t $

(Vink: Analysens fundamentalteorem.)

$ f(x) = 1 - integral_0^x f(t) dif t => f'(x) = -f(x) => f(x) = -f'(x) $

En funksjon som har egenskapen om å være sin egen derivert er $e^x$. Vi benytter kjerneregelen for å få den negativ i tillegg:

$ f(x) = e^(-x) $

#pagebreak()

=

La $S$ være området i $x y$-planet som ligger over linjen $y = 0$ og er avgrenset av grafene til funksjonene

$ f(x) = x+1, #h(1cm) g(x) = x^2 - 1 $

Skisser området $S$

#image("2024k-6.png")

Finn volumet av omdreingslegemet som oppstår ved å dreie $S$ om linjen $y=-1$

$ f(x)=g(x) next x^2 - x + 2 = 0 next (x-2)(x+1) = 0 => "Skjæring"(f, g) = {-1, 2} $

$g$ sitt nullpunkt ligger også i $x=1$, det gir at volumet blir:

$ V = (V_f)_(-1)^2 - (V_g)_1^2 $

$ (V_f)_(-1)^2 &= 2pi integral_(0)^3 x dot (x) dif x \
&= 2pi integral_(0)^3 x^2 dif x \
&= 2pi [1/3 x^3]_(0)^3 \
&= 18 pi
$

$ (V_g)_(1)^2 &= 2 pi integral_1^2 x dot (x^2 - 1) dif x \
&= 2 pi integral_1^2 x^3 - x dif x \
&= 2pi[1/4 x^4 - 1/2 x^2]_1^2 \
&= 9/2 pi
$

$ V = 18 pi - 9/2 pi = 27/2 pi $

oops dreiet om $x=-1$ og ikke $y=-1$... (oppdaget for sent, har ikke tid til å rette) 

#pagebreak()

=

Anta at mengden $y = y(t)$ (målt i millioner tonn) skrei i Barentshavet tilfredstiller

$  $

DIFFLIKNING SKIP

#pagebreak()

=

Vis at rekken

$ sum_(n=1)^inf (-1)^(n-1)/n x^(2n) $

konvergerer for $x in [-1, 1]$.

Den konvergerer fordi den inngår under definisjonen av en alternerende rekke

For $x = 1/2$, lar vi $s$ være summen til rekken. Regn ut $e^s$

TAYLOR EXPANSION

#pagebreak()

=

Følgen ${a_n}_(n=1)^inf$ er gitt rekursivt som

$ a_(n+1) = sqrt(1/2 a_n + 1/2), #h(1cm) "der" a_1 = 0 $

Vis at følgen er voksende

$ a_2 > a_1 => sqrt(1/2 dot 0 + 1/2) > 0 => 1/sqrt(2) > 0 => "sant" $

Antar at $a_(k+1) > a_k$. Vil vise at dette medfører $a_(k+2) > a_(k+1)$:

$ a_(k+2) = sqrt(1/2 a_(k+1) + 1/2) > a_(k+1) = sqrt(1/2 a_k + 1/2) next sqrt(1/2a_(k+1) + 1/2) > sqrt(1/2 a_k + 1/2) next 1/2 a_(k+1) + 1/2 > 1/2 a_k + 1/2 next a_(k+1) + 1 > a_k + 1 next a_(k+1) > a_k $

Siden vi har kommet tilbake til antagelsen, har vi bevist med induksjon at følgen er stigende.

Du får oppgitt at følgen er avgrenset ovenifra.

Forklar hvorfor følgen konvergerer og regn ut $lim_(n->inf) a_n$.

La:

$ L = lim_(n->inf) a_n $

$L$ er også lik grenseverdien av den rekursive formelen:

$ L = lim_(n->inf) sqrt(1/2 a_n + 1/2) = sqrt(1/2 L + 1/2) next
L^2 - 1/2 L - 1/2 = 0 next
L = (1/2 pm sqrt(1/4 - 4 dot 1 dot -1/2))/2 next
L = (1/2 pm 3/2)/2 next
L = 1/4 pm 3/4 next
L = 1 or L = -1/2
$

Følgen konvergerer mot $1$

#pagebreak()

=

Vis at dersom $f(x)$ er kontinuerlig i $x=a$, så vil $abs(f(x))$ være kontinuerlig i $x=a$.

(Vink: Du kan få bruk for at $abs(abs(z) - abs(y)) < abs(z-y)$ for alle reelle $z$, $y$.)

Dersom $f(x)$ er kontinuerlig i $x=a$ må følgende stemme (fra definisjon):

$ lim_(x->a) f(x) = f(a) $
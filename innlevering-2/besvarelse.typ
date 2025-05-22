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

Vis at $ e^x > 1+x #h(1cm) "for" x>0 "." $

(Vink: Sekantsetningen.)

Både $e^x$ og $1+x$ er deriverbare når $x>0$ og kontinuerlige når $x>=0$. La $f(x) = e^x$. Sekantsetningen forteller da at det må finnes et punkt $c in (0, infinity)$ slik at $(f(a) - f(0))/(a-0) = f'(c)$, hvor $a > 0$. 

Siden $e^x |_(x=0) = 1+x |_(x=0) = 1$, må vi vise at $(dif e^x)/(dif x) |_(x=c) > (dif (1+x))/(dif x) = 1$ for at $e^x > 1+x$.

$ (f(a) - f(0))/(a-0) = (e^a - e^0)/(a) = (e^a - 1)/a $

Vi kjenner fra før at $f'(x) = e^x$. 

$ f'(c) = e^c $

Siden $c in (0, infinity)$, er $e^c > 1$. Vi får:

$ (e^a - 1)/a = f'(c) = e^c > 1 \
arrow.t.b.double \
(e^a - 1)/a > 1 \
arrow.t.b.double \
underline(underline(e^a > a + 1)) 
$

Merk det siste steget som er lovlig uten å snu ulikhetstegnet siden vi fastslo tidligere at $a > 0$.

Vi har nå brukt sekantsetningen til å vise at for alle $a = x > 0$ så gjelder ulikheten. $qed$

#pagebreak()

=

Sandra har fått i oppgave på eksamen å regne ut den deriverte til

$ g(x) = cases(
  x^2 sin(1/x) "for" x!=0,
  0 #h(1.6cm) "for" x=0
) $ 

i $x=0$, altså $g'(0)$. Hun ser med en gang at for $x!=0$ får hun

$ g'(x) &= 2x sin(1/x) + x^2 cos(1/x) (-1/x^2) \
&= 2x sin(1/x) - cos(1/x) $

Hun konkluderer så med at siden $lim_(x->0) g'(x)$ ikke eksisterer, vil ikke g'(0) eksistere heller.

Rett før hun skal levere eksamensbesvarelsen sin ser hun at hun har gjort en feil.

Klarer du å se hvorfor Sandras argument er feill? Husk å begrunne hva du mener er feil i Sandras besvarelse og skriv ned hva du mener vil være en riktig konklusjon.

(Vink: Hva er forskjellen mellom utsagnene _den deriverte eksisterer_ og _den deriverte er kontinuerlig_?)

Sandras argument er feil fordi hun tenker at grenseverdien for den deriverte må eksistere for at $g'(0)$ skal eksistere, noe som ikke stemmer alltid. Med denne utregningen vil hun finne ut om den deriverte er kontinuerlig i stedet (evt. at $g(x)$ er dobbelderiverbar)

For å finne ut av $g'(0)$ kan vi gå tilbake til den gode gamle definisjonen av den deriverte:

$ f'(x) &= lim_(h->0) (f(x+h) - f(x))/(h) \ 
&arrow.t.b.double \
g'(0) &= lim_(h->0) (g(0+h) - g(0))/h \
&= lim_(h->0) (g(h) - 0)/h \
&= lim_(h->0) (h^2 sin(1/h))/h \
&= lim_(h->0) h sin(1/h) \ $

Verdimengden til sinusfunksjonen er $[0, 1]$. Altså vet vi at:

$ -1 <= sin(1/h) <= 1 \
arrow.t.b.double \
-h <= h sin(1/h) <= h
$

Når $h->0$, går både venstre og høyredelen av ulikheten mot 0. Skviseteoremet gir at $lim_(h->0) h sin(1/h) = 0$.

Altså eksisterer den deriverte i 0 og er $ g'(0) = 0 $

#pagebreak()

=

I denne oppgaven ser vi på en funksjon $f(x)$ som oppgis å være kontinuerlig og deriverbar. Vi får også oppgitt at

- funksjonen er odde, det vil si $f(-x) = -f(x)$,
- funksjonen er periodisk med periode $2pi$, det vil si $f(x + 2pi) = f(x)$,
- $f(x) >= 0$ for $0 <= x <= pi$,
- $f(pi/2) = 1$,
- $integral_0^pi f(x) dif x = 2$.

Regn så ut:

#pagebreak()

==

$ integral_(7pi)^(9pi) |f(x)| dif x $

Siden funksjonen er periodisk vet vi at:

$ integral_(7pi)^(9pi) |f(x)| dif x = integral_((2n + 1)pi)^((2n+3)pi) |f(x)| dif x, n in ZZ $

Vi setter $n=-1$ og får:

$ integral_(7pi)^(9pi) |f(x)| dif x = integral_(-pi)^(pi) |f(x)| dif x $

Absoluttverdien av en odde-funksjon er en like-funksjon. Vi vet at $f(x) = -f(-x)$ så $abs(f(x)) = abs(-f(-x)) = abs(f(-x))$. Vi ser tydeligere at dette er en like-funksjon hvis vi lar $g(x) = abs(f(x))$, da får vi at $g(x) = g(-x)$, som er definisjonen på en like-funksjon. Regneregler for like-funksjoner forteller oss at $integral_(-a)^a f(x) dif x = 2 integral_(0)^a f(x) dif x$.

Videre vet vi at $integral_0^pi abs(f(x)) dif x = 2$, siden for alle $x in [0, pi]$ så er $f(x) >= 0$, altså endrer absoluttverditegnet ikke på noe. Vi får da at

$ integral_(7pi)^(9pi) |f(x)| dif x = 2 dot 2 = underline(underline(4)) $

#pagebreak()

==

$ integral_0^(pi/6) e^(f(3x)) f'(3x) dif x $

Vi gjenkjenner resultatet av kjerneregelen i integranden og dermed ved antiderivasjon får vi at

$ integral e^(f(3x)) f'(3x) dif x = e^(f(3x)) + C $

Så bruker vi analysens fundamentalteorem til å finne det bestemte integralet:

$ integral_0^(pi/6) e^(f(3x)) f'(3x) dif x = [e^f(3x)]_0^(pi/6) = e^f(pi/2) - e^f(0) $

Vi vet at $f(pi/2) = 1$ fra definisjonen av $f$, og at $f(0) = 0$ fra definisjonen av en odde-funksjon.

Vi kan bevise at $f(0)=0$ ved motsigelsesbevis. Anta $f(0) = k$, hvor $k != 0$, da sier definisjonen av en odde-funksjon at $f(0) = -f(-0) = -f(0) = -k$. Vi har nå kommet frem til en motsigelse siden $f(0)$ har to funksjonsverdier $k$ og $-k$, men dette er ikke lovlig i matematikken (hvertfall ikke enda?), så den eneste lovlige måten er hvis $k=0$, og det stemmer siden $f(0) = -f(-0) = -f(0) = -0 = 0$, og fjerner vi mellomregningen ser vi det tydeligere:

$ f(0) = -f(0) = 0 $

Vi går tilbake fra digresjonen vår og får at:

$ integral_0^(pi/6) e^(f(3x)) f'(3x) dif x = e^f(pi/2) - e^f(0) = e^1 - e^0 = underline(underline(e - 1)) $

#pagebreak()

==

$ integral_(-pi)^pi e^(f(x))^2 sin(f(x)) dif x $

(Jeg satt og stirret på denne i over 1 time og prøvde forskjellige ting før jeg fant ut av det)

Først ser jeg at integralgrensene er fra $-pi$ til $pi$, noe som tyder på at man skal bruke en regel for integraler fra $-a$ til $a$. La

$ g(x) = e^(f(x))^2 sin(f(x)) $

Også tester vi om integranden $g(x)$ er en odde- eller like-funksjon. 

For at en funksjon skal være en odde-funksjon må likningen $f(x) = -f(-x) <=> f(-x) = -f(x)$ stemme:

$ g(-x) = e^(f(-x))^2 sin(f(-x)) $

Fra definisjonen til $f(x)$ vet vi at $f(-x) = -f(x)$:

$ g(-x) = e^(-f(x))^2 sin(-f(x)) $

Vi vet at det finnes en trigonometrisk identitet $sin(-v) = -sin(v)$, og at ethvert kvadrat er et positivt uttrykk $(-k)^2 = k^2$. Dermed får vi:

$ g(-x) = e^(f(x))^2 dot -sin(f(x)) $

Vi flytter minustegnet forrest og ser at uttrykket til høyre for minustegnet ikke er noe annet enn $g(x)$!

$ g(-x) = - e^(f(x))^2 sin(f(x)) = -g(x) $

Siden vi har at $g(-x) = -g(x)$, er $g(x)$ en odde-funksjon, og da gjelder regelen $integral_a^a g(x) dif x = 0$

Altså er

$ integral_(-pi)^pi e^(f(x))^2 sin(f(x)) dif x = underline(underline(0)) $

#pagebreak()

=

Bruk en riemannsum til å finne grenseverdien

$ lim_(n->infinity) sum_(i=1)^n (4i)/(n^2 + i^2) $

Vi tolker summen som en riemannsum og må omskrive til formen

$ lim_(n->infinity) sum_(i=1)^n f(x_i) Delta x_i $

Vi lar $ x_i = i/n $ og får at

$ Delta x_i &= x_i - x_(i-1) \
&=i/n - (i-1)/n \
&=(i-(i-1))/n \
&=(cancel(i-i)+1)/n \
&=1/n $

Vi bruker resultatet fra de to forrige utregningene til å finne $f(x_i)$:

$ f(x_i) Delta x_i &= (4i)/(n^2 + i^2) \
&arrow.t.b.double \
f(x_i) &= (4i)/((n^2 + i^2) Delta x_i) \
&= (4i)/((n^2 + i^2) 1/n) \
&= (4 i/n dot n)/((n^2 + i^2) 1/n) \
&= (4 i/n)/((n^2 + i^2) 1/n^2) \ 
&= (4 i/n)/((1 + i^2/n^2)) \ 
&= (4 i/n)/(1 + (i/n)^2) \ 
&= underline((4 x_i)/(1 + x_i^2))
$

Integrasjonsgrensene er gitt ved $a = x_0$ og $b = x_n$.

$ x_0 = 0/n = 0 $
$ x_n = n/n = 1 $

Altså er

$ lim_(n->infinity) sum_(i=1)^n (4i)/(n^2 + i^2) = integral_0^1 (4x)/(1+x^2) dif x $

Vi begynner å bestemme det bestemte integralet ved å antiderivere

$ integral (4x)/(1+x^2) dif x &= integral (4x)/(1+u) (dif u)/(x^2)' \
&= integral (4x)/(1+u) (dif u)/(2x) \
&= integral 2/(1+u) dif u \
&= 2 integral 1/(1+u) dif u \
&= 2 ln(1+u) + C \
&= underline(2 ln(1 + x^2) + C) $

Deretter anvender vi analysens fundamentalteorem

$ integral_0^1 (4x)/(1+x^2) dif x &= [2 ln(1 + x^2)]_0^1 \
&= 2 ln(1 + 1^2) - 2 ln (1 + 0^2 ) \
&= 2 ln(2) - 2ln(1) \
&= 2 ln(2) - 2 dot 0 \
&= underline(underline(2 ln(2))) $


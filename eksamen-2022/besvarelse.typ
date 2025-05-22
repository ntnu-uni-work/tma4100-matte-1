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

Bruker delbrøkoppspalting:

$ integral A/(x+1) + B/(x-1) + C/(x-2) dif x
$

$ A(x-1)(x-2) + B(x+1)(x-2) + C(x+1)(x-1) = x^2 $
$
x=-1 &=> A(-2)(-3) = (-1)^2 => A = 1/6 \
x= 1 &=> B(2)(-1) = 1^2 => B=-1/2 \
x=2 &=> C(3)(1) = 2^2 => C = 4/3 
$

$ integral 1/6 1/(x+1) - 1/2 1/(x-1) + 4/3 1/(x-2) dif x \
= 1/6 ln(abs(x+1)) - 1/2 ln(abs(x-1)) + 4/3 ln(abs(x-2)) + C
$

#pagebreak()

=

Vi finner den minste vertikale avstanden ved å undersøke forskjellen mellom funksjonsverdiene:

$ f(x) &= (x^2+1) - (x - x^2) \
&= 2x^2 -x + 1
$

Vi deriverer for å lete etter kritiske punkter:

$ f'(x) = 4x -1 = 0 => x=1/4 $

Vi kan bekrefte dette visuelt ved å se på skissen at $x=1/4$ er et fornuftig svar, da denne $x$-verdien befinner seg midt mellom topp/bunn-punktene til $y_1$ og $y_2$ (og deres koeffisienter er kun $pm 1$).

#pagebreak()

=

Newtons metode får vi fra formelarket: $ x_(n+1) = x_n - f(x_n)/(f'(x_n)) $

Først flytter vi alt til venstresiden slik at $ f(x) = x/(x^2 + 1) - sqrt(1-x) $ og skæringspunktet befinner seg når $f(x)=0$. 

Vi kommer til å trenge $f'$, så vi beregner ut den først:

$ f'(x) &= ((x^2+1)1-x(2x))/(x^2+1)^2 + 1/(2 sqrt(1-x)) \
&= (1-x^2)/(x^4 + 2x^2 + 1) + 1/(2 sqrt(1-x))
$

Gitt at $x_0 = 0.8$ får vi:

$ x_1 &= 0.8 - f(0.8)/(f'(0.8)) approx 0.7676 \
x_2 &= 0.7676 - f(0.7676)/(f'(0.7676)) approx 0.7668 \
x_3 &= 0.7668 - f(0.7668)/(f'(0.7668)) approx 0.7668
$

Avrundet til 2 desimalers nøyaktighet er skjæringspunktet ved $x=0.77$

#pagebreak()

=

#image("image (1).png")

Først finner vi skjæringspunktene for å vite integralgrensene:

$ f(x) = g(x) \
x^2 + x +1 = 2-x^2 \
2x^2 + x - 1 = 0 \
x = (-1 pm sqrt(1+8))/4 \
x = -1 or x=1/2
$

Forskyver grafene til venstre slik at vi kan dreie om $y$-aksen

$ f(x+1) = (x+1)^2 + x+2 = x^2 + 2x + 1 + x+ 2 = x^2 + 3x + 3 \
g(x+1) = 2-(x+1)^2 = 2-(x^2 + 2x + 1) = -x^2 - 2x + 1
$

Skjæringspunktene blir også forskjøvet 1 til venstre (trekk fra 1).

Området $R$ blir da $
 &2 pi (integral_(-2)^(-1/2) -x g(x+1) dif x - integral_(-2)^(-1/2) -x f(x+1) dif x) \
 &= 2 pi (integral_(-2)^(-1/2) x^3 + 2x^2 - x dif x - integral_(-2)^(-1/2) -x^3 - 3x^2 - 3x dif x) \
 &= 2 pi (integral_(-2)^(-1/2) 2x^3 + 5x^2 + 2x dif x) \
  &= 2 pi [1/2 x^4 + 5/3 x^3 + x^2]_(-2)^(-1/2) \
  &= 2 pi ((1/32-5/24+1/4) - (16/2 - 40/3 + 4)) \
  &= 45/16 pi
$

#pagebreak()

=

#image("image (2).png")

$ &integral_1^R x/(x^2+1) dif x \ &= integral_1^R x/(u) (dif u)/(2x) \ &= 1/2 integral_1^R 1/(u) dif u \ &= 1/2[ln(abs(u))]_1^R \ &= 1/2[ln(abs(x^2 + 1))]_1^R \ &= 1/2 (ln(abs(R^2 + 1)) - ln(abs(2))) \ &= 1/2 ln((R^2 + 1)/2) $

La $a in RR$

$ &lim_(R->inf) integral_1^R (a x)/(x^2 + 1) - 1/(2x) dif x \
= &lim_(R->inf) a/2 ln((R^2+1)/2) - 1/2 [ln(x)]_1^R \
= &lim_(R->inf) a/2 ln((R^2+1)/2) - 1/2 (ln(R) - ln(1)) \
= &lim_(R->inf) a/2 ln((R^2+1)/2) - 1/2 ln(R) \
= &lim_(R->inf) 1/2 ln(((R^2+1)/2)^a) - 1/2 ln(R) \
= &lim_(R->inf) 1/2 ln(((R^2+1)/2)^a / R) \
= &lim_(R->inf) 1/2 ln((R^2+1)^a / R 1/2^a) \
= &lim_(R->inf) 1/2 (ln((R^2+1)^a / R) - ln(2^a)) \
$

Velger $a=1/2$ for å bruke vinket:

$ &lim_(R->inf) 1/2 (ln((R^2+1)^(1/2) / R) - ln(2^(1/2))) \
= & 1/2 (0 - ln(2^(1/2))) \
= & -ln(2)/4
$

#pagebreak()

=

#image("image (3).png")

$ (dif S)/(dif t) = a S(5000 - S) $

De som er smittet er gitt ved $S$, de som ikke er smittet er gitt ved $"total" - S = 5000- S$. Produktet av dette er $S(5000-S)$. Dette produktet er skalert av en proporsjonalitetskonstant $a$: $a S(5000-S)$. Dette skal beskrive endringsraten til antall smittede gitt ved: $der(t) S$. Altså får vi likningen gitt.

Vi har at $S(0) = 250$ og $S(7) = 1250$. Vi vil løse $S(x) = 80% dot 5000 = 4000$

Løser differensiallikningen ved separasjon:

$ integral 1/(S(5000-S)) dif S = integral a dif t next
integral A/S + B/(5000-S) dif S = integral a dif t $

$ A(5000-S) + B S= 1 \
S = 0 => A = 1/5000 \
S = 5000 => B = 1/5000
$

$
integral 1/5000 1/S + 1/5000 1/(5000-S) dif S = integral a dif t next
1/5000 ln(abs(S)) - 1/5000 ln(abs(5000-S)) = a t + C next
ln(S/(5000-S)) = 5000a t + C next
S/(5000-S) = K e^(5000a t)
$

Setter inn punktene:

$ 250/(5000-250) = K e^(5000a dot 0) => K = 1/19
$

$ 1250/(5000-1250) = 1/19 e^(5000a dot 7) => a = ln((1250 dot 19)/(5000-1250))/(5000 dot 7) = ln(19/3)/35000 $

Så løser vi likningen når $S=4000$, men $t$ er ukjent:

$ 4000/(5000-4000) = 1/19 e^(1/7 ln(19/3) t) next
4 = 1/19 (19/3)^(1/7 t) next
76 = (19/3)^(1/7 t) next
ln(76) = ln((19/3)^(1/7 t)) next
ln(76) = t/7 ln(19/3) next
t = 7 ln(76)/ln(19/3) next
t approx 16.42
$

#pagebreak()

=

#image("image (4).png")

i. Sjekker absolutt konvergens først. $cos^2(n)$ er alltid i intervallet $[0, 1]$, altså må rekken være mindre enn eller lik $sum_(n=1)^inf 1/n^2022$, som er en $p$-rekke med eksponent $2022 > 1$, så den konvergerer absolutt.

ii. Rekken divergerer siden leddene ikke går mot 0. Ved gjentatt l'Hôpitals får vi $ lim_(n->inf) (3! dot 3)/(4!) = 3/4 != 0 $

#pagebreak()

=

#image("image (5).png")

$ f'(x) = ((1+x)^(-r))' = -r(1+x)^(-r-1) = -r/(1+x)^(r+1) $

$ P_1(x) = f(0) + f'(0) x = 1 - r x $

Vi vil vise at $f(x)>P_1(x)$. Vi kan komme frem til dette med Taylors teorem:

$ E_1(x) = f(x) - P_1(x) = (f''(s))/2 x^2 $

Siden $ f''(x) = (r(r+1))/(1+x)^(r+2) > 0 $ er differansen mellom $f(x)$ og $P_1(x)$ positiv, siden $(f''(s))/2 x^2$ er positiv, og dermed er $f(x) > P_1(x)$

#pagebreak()

=

#image("image (6).png")

Bruker definisjonen av den deriverte:

$ f'(0) &= lim_(Delta x->0) (f(0 + Delta x) - f(0))/(Delta x) \
&= lim_(Delta x->0) ((0 + Delta x)g(0 + Delta x) - 0 g(0))/(Delta x) \
&= lim_(Delta x->0) ((Delta x)g(Delta x))/(Delta x) \
&= lim_(Delta x->0) g(Delta x) \
&= g(0) = 2 pi
$

Vi kan ikke fjerne grenseverdien dersom grenseverdien ikke eksisterer, så kontinuerligheten til $g$ i $x=0$ her medfører deriverbarhet i $x=0$ på $f$.

#pagebreak()

=

#image("image (7).png")

Vi bruker arealmetoden for å bestemme integralet:

$ g(4) = integral_0^4 f(t) dif t = cancel(integral_0^2 f(t) dif t) + integral_2^4 f(t) dif t = (2+1)/2 dot 2 = 3 $

Analysens fundamentalteorem gir at: 

$ g'(x) = der(x) integral_0^x f(t) dif t = f(x) $

Altså er $g(4) = f(4) = 0$
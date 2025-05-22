#let subject = "TMA4100 Matematikk 1"
#let candidate = "Tien Tran"

#set text(size: 12pt, lang: "nb")
#set par(
  leading: 14pt,
  justify: true,
)
#show par: set block(above: 16pt)
#set math.equation(numbering: "(1)")

#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt,
  width: 100%
)

#show raw.where(block: true): par.with(
  leading: 8pt,
)

#set page(
  header: [
    #subject / #datetime.today().display("[day].[month].[year]")
    #h(1fr)
    #candidate
    #line(length: 100%)
  ],
  numbering: (..nums) => "Side " + nums.pos().map(str).join(" av ")
)

= Oppgave #1

La følgen ${a_n}_(n=1)^infinity$ være gitt ved

$ a_1 = 3 #h(1cm) "og" #h(1cm) a_(n+1) = sqrt(3a_n - 2) $

Vis at følgen konvergerer og finn grenseverdien

$ lim_(n -> infinity) a_n $

Jeg begynner med å sjekke om det virker som følgen konvergerer ved å sjekke de tjue første verdiene til $a_n$.

#figure(
  image("1.png"), caption: [
    Beregning av de tjue første verdiene til $a_n$
  ]
)

Det ser ut til at følgen er strengt avtagende og konvergerer mot $2$.

Vi gjør så en mer matematisk beregning:

$ L = lim_(n -> infinity) a_n $
$ L = lim_(n -> infinity) a_(n+1) = lim_(n -> infinity) sqrt(3a_n - 2) = lim_(n -> infinity) sqrt(3L - 2) = sqrt(3L - 2) $
$ L^2 = 3L-2 => L^2-3L+2 = 0 => (L-2)(L-1) = 0 => L=2 or L=1 $

Vi ser at $L=2$ stemmer overens med gjetningsverdien vår. Altså følgen konvergerer og grenseverdien er:

$ underline(underline(lim_(n -> infinity) a_n = 2)) $

#pagebreak()

= Oppgave #2

La ${a_n}_(n=1)^infinity$ være en følge. Vis at 

$ lim_(n -> infinity) abs(a_n) = 0 #h(1cm) <==> #h(1cm) lim_(n->infinity) a_n = 0 $

Begge grenseverdiene konvergerer mot $0$. Skriver vi ned definisjonen på konvergens (for enhver $epsilon > 0$ finnes det et heltall $N$ slik at alle $n >= N$ oppfyller ulikheten $abs(a_n - L) < epsilon$, her er $L=0$), så ser vi at disse to uttrykkene er ekvivalente:

$ abs(abs(a_n)) < epsilon <==> abs(a_n) < epsilon $

Denne påstanden holder siden absoluttverdifunksjonen ikke kan påvirke et tall mer enn én gang. Altså $f(x) = |x| => f(f(... f(x)) ...)) = |x|$

#pagebreak()

= Oppgave #3

Bruk definisjonen av grenseverdi til å vise at

$ lim_(x->2) (5x^3 - x^2 - 20x + 4)/(x^2 - 4) = 9 $

Vi forsøker å sette inn $x=2$ og observerer at vi får $0/0$

$ (5x^3 - x^2 - 20x + 4)/(x^2 - 4) = (5 dot 8 - 4 - 40 + 4)/(4 - 4) = 0/0 $

Dette betyr at $x=2$ er nullpunkter for både teller- og nevnerpolynomene. Vi kan bruke dette faktumet og polynomdivisjon til å faktorisere polynomene. Hvis $x=a$ er et nullpunkt på et polynom, er $x-a$ en faktor i polynomet, og dette medfølger at en polynomdivisjon med $x-a$ som divisor gir en kvotient uten rest. Nevneren kan alternativt faktoriseres gjennom den gjenkjennelige konjugatsetningen: $a^2 - b^2 = (a+b)(a-b)$

Vi faktoriserer telleren: 

$ &5x^3 - x^2 - 20x + 4 : x-2 = underline(5x^2 + 9x - 2) \
-(&5x^3 - 10x^2) \
&#h(0.75cm) = 9x^2 - 20x \
&#h(0.75cm)-(9x^2 - 18x) \
&#h(2cm)=-2x + 4 \
&#h(2cm)-(-2x + 4) \
&#h(3.4cm)=0 $

Ved å bruke abc-formelen ($x=(-b plus.minus sqrt(b^2 - 4 a c))/(2a)$) på kvotienten ($a=5 and b=9 and c=-2$), finner vi at $x=-2 or x=1/5$. Siden $a!=1$, må vi legge til $a$ som faktor i det faktoriserte uttrykket også.

Altså er:

$ &lim_(x->2) (5x^3 - x^2 - 20x + 4)/(x^2 - 4) \
= &lim_(x->2) (cancel((x-2)(x+2))(x-1/5) dot 5)/(cancel((x-2)(x+2))) \
= &lim_(x->2) (5x-1)/1 = 10-1= underline(underline(9)) $

Vi har nå vist at grenseverdien er lik 9 $qed$

#pagebreak()

= Oppgave #4

Vi kan tenke oss følgende scenarioer hvis vi går fra venstre til høyre:

- $f(x) = k$, altså konstantfunksjon. Da vil $f(a)=f(d)=f(b)$ for alle $d in (a,b)$. I tillegg vil åpenbart $f''(x)=0$
- Hvis $f(x)$ stiger, så må $f(x)$ synke på et eller annet tidspunkt for at $f(a) = f(d)$. I punktene etter kan grafen både synke så stige, eller stige så synke. Den derivertes fortegn kan altså være:
 - - + + -
 - - + - +
 - + - - +
 - + - + -
Dersom vi finner minst to fortegnsskifter på den derivertes graf, betyr det at den deriverte har ekstremalpunkt(er) i intervallet $x in (a,b)$. Vi ser at alle tilfellene tilfredsstiller dette kravet. Siden den deriverte har ekstremalpunkter vet vi at det må finnes en $c in (a, b)$ slik at $f''(c) = 0$

Et eksempel på en slik graf er $f(x) = (x+1)(x-1)x^2$ for $a=-1 and b=1$. Dette polynomet er konstruert med faktorer slik at $x in {-1, 0, 1}$ gir lik funksjonsverdi. Vi ser at $a < 0 < b => -1 < 0 < 1 => d = 0$ og at $f''(c)=0 => 12c^2 - 2 = 0 => c = plus.minus sqrt(6)/6$. Av dette kan vi si at $c$ kan ha verdien $sqrt(6)/6$ for eksempel.
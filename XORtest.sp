XORtest

*MOS models*

.include 'LP32nm.mod'

VDD VDD 0 dc 1

Va A 0 pulse(0 1 0.01n 0.01n 0.01n 2.5u 5u)
Vb B 0 pulse(0 1 0.01n 0.01n 0.01n 2.5u 5u)

X1 VDD 0 A B Y xor
X2 VDD 0 A B Y1 xor1


.SUBCKT xor1 VDD 0 A B Y
Mp1 VDD A A1 VDD pmos W=320n L=32n
Mp2 B A Y VDD pmos W=320n L=32n
Mp3 VDD B B1 VDD pmos W=320n L=32n
Mp4 B1 A1 Y VDD pmos W=320n L=32n

Mn1 A1 A 0 0 nmos W=160n L=32n
Mn2 B A1 Y 0 nmos W=160n L=32n
Mn3 B1 B 0 0 nmos W=160n L=32n
Mn4 B1 A Y 0 nmos W=160n L=32n
.ENDS


.SUBCKT xor VDD 0 a b y
Mn1 a1 a 0 0 nmos W=160n L=32n
Mn2 b1 b 0 0 nmos W=160n L=32n
Mn3 y1 b b2 0 nmos W=160n L=32n
Mn4 b2 a1 0 0 nmos W=160n L=32n
Mn5 y1 b1 b2 0 nmos W=160n L=32n
Mn6 b2 a 0 0 nmos W=160n L=32n
Mn7 y y1 0 0 nmos W=160n L=32n

Mp1 VDD a a1 VDD pmos W=320n L=32n
Mp2 VDD b b1 VDD pmos W=320n L=32n
Mp3 VDD b a2 VDD pmos W=320n L=32n
Mp4 a2 b1 y1 VDD pmos W=320n L=32n
Mp5 VDD a1 a2 VDD pmos W=320n L=32n
Mp6 a2 a y1 VDD pmos W=320n L=32n
Mp7 VDD y1 y VDD pmos W=320n L=32n
.ENDS



*Simulation*

.OPTION POST=2
.TRAN 0.1u 20u
.PRINT TRAN V(B) V(A) V(y)

.END

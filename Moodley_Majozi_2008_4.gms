$Title Moodley_Majozi_2008_4
$Ontext
         Simultaneous targeting and design for cooling water systems with multiple cooling water supplies (2008)
         A. Moodley & T. Majozi
         Example 4
         Illustrative Example: Multiple Source Targeting
         Unified Targeting - Maximum Reuse
         Targeting With Cooling Water Return Temperature Limitation
         Includes additional fourth constraint for each of the linearisation variables.
         This formulation works when Tret is defined as a parameter and calculated after the solve
         When Tret is defined as a variable, the solution is obtained when appropriate lower bound is assigned to the cooling water required.
         Solution procedure:
                 1) Solve LP minimising sto0
                 2) Solve LP minimising CW
                 3) Solve MINLP minimising sto and calculating Tc and Th
                 4) Free sto0 and CW
                 5) Solve MINLP minimising sto0
                 6) Solve MINLP minimising CW
                 7) Solve MINLP minimising sto

         Alternatively, solve Tret as a parameter as in Moodley.
         Check if this formulation allows for back-recycling loops
         Check whether CW could not have been reduced by making use of storage?
         Check why cold blowdown outperformes hot blowdown
$Offtext
Sets
i                Cooling-water-using operations that complies with a mass and energy balance of a counter current heat exchanger\
                 /i1*i6/
n                Cooling water sources supplying the cooling water network
                 /n1*n3/
p                Time points
                 /p1*p5/
;
Alias
(i,ii)
;
Positive Variables
B(n,p)           Blowdown flow from cooling tower n at time point p (t.h^-1)
CR(i,n,p)        Return cooling water flow from cooling-water-using operation i to cooling water source n at time point p (t.h^-1)
CS(i,n,p)        Cooling water flow supplied from cooling water source n to cooling-water-using operation i at time point p (t.h^-1)
D(n,p)           Drift loss in cooling tower n at time point p (t.h^-1)
E(n,p)           Evaporation loss in cooling tower n at time point p (t.h^-1)
Fin(i,p)         Total cooling water flow into cooling-water-using operation i including supply and reused water at time point p(t.h^-1)
Fout(i,p)        Total cooling water flow from cooling-water-using operation i including return and reused water at time point p (t.h^-1)
FR(ii,i,p)       Reused cooling water flow from any other cooling-water-using operation ip to cooling-water-using operation i at time point p (t.h^-1)
M(n,p)           Makeup water flow to cooling tower n at time point p (t.h^-1)
mC0              Initial mass of cold water in storage tank (t)
mC(p)            Mass of cold water in storage tank at the start of time point p (t)
mH0              Initial mass of hot water in storage tank (t)
mH(p)            Mass of hot water in storage tank at the start of time point p (t)
mHf              Maximum Amount of Storage Required for Hot Water Across All Time Points (t)
mCf              Maximum Amount of Storage Required for Cold Water Across All Time Points (t)
OS(n)            Total cooling water flow supplied from cooling water source n (t.h^-1)
QCin(n,p)        Cooling water flow rate from cooling tower n into cold water storage tank at time point p (t.h^-1)
QCout(i,p)       Cooling water flow rate from cold water storage tank into cooling water using operation i at time point p (t.h^-1)
QHin(i,p)        Cooling water flow rate from cooling water using operation i to hot water storage tank at time point p (t.h^-1)
QHout(n,p)       Cooling water flow rate from hot water storage tank to cooling tower n at time point p (t.h^-1)
Tc(p)            Temperature of cold water storage tank at time point p (C)
Th(p)            Temperature of hot water storage tank at time point p(C)
Ts(n,p)          Supply temperature from cooling tower n at time point p to cooling water network (C)

G1(i,n,p)        Linearisation variable 1 for term CR(i.n.p)*Tout(i.p)
G2(ii,i,p)       Linearisation variable 2 for term FR(ii.i.p)*Tout(ii.p)
G3(i,p)          Linearisation variable 3 for term Fin(i.p)*Tout(i.p)
G4(i,n,p)        Linearisation variable 4 for term CS(i.n.p)*Ts(n.p)
G5(n,p)          Linearisation variable 5 for term QHout(n.p)*Th(p)
G6(i,p)          Linearisation variable 6 for term QCout(i.p)*Tc(p)

*Tin(i,p)         Inlet cooling water temperature to cooling-water-using operation i at time point p (C)
Tout(i,p)        Outlet cooling water temperature from cooling-water-using operation i at time point p(C)
TWin(n,p)        Return temperature to cooling water source n at time point p (C)
;
Binary Variables
yCin(p)          Binary variable controlling inlet of cold storage tank water.
yCout(p)         Binary variable controlling outlet of cold storage tank water.
yHin(p)          Binary variable controlling inlet of hot storage tank water.
yHout(p)         Binary variable controlling outlet of hot storage tank water.
;
Free Variables
CW               Total cooling water flow supplied from all cooling water sources (t.h^-1)
sto              Design capacity of both storage tanks (t)
sto0             Total initial amount of water in storage tanks (t)
;
Parameters
Fin_U(i)         Maximum flowrate through cooling-water-using operation i (t.h^-1)
OS_U(n)          Design capacity of cooling water source n (t.h^-1)
                 /n1     30
                  n2     40
                  n3     40/
Q(i)             Duty of cooling-water-using operation i (kW)
                 /i1     610
                  i2     420
                  i3     800
                  i4     555
                  i5     345
                  i6     700/
TWout(n)         Cooling water supply temperature from cooling water source n (C)
                 /n1     20
                  n2     22
                  n3     25/
Tau(p)           Duration of time slot p (h)
                 /p1     3
                  p2     1
                  p3     4
                  p4     2
                  p5     2/
Tcmin
Thmax            Maximum temperature of hot storage tank (C)
Tin(i,p)         Inlet cooling water temperature to cooling-water-using operation i at time point p (C)
Tin_U(i)         Limiting inlet temperature to cooling-water-using operation i (C)
                 /i1     30
                  i2     40
                  i3     25
                  i4     45
                  i5     40
                  i6     30/
Tout_U(i)        Limiting outlet temperature from cooling-water-using operation i (C)
                 /i1     45
                  i2     60
                  i3     50
                  i4     53
                  i5     55
                  i6     45/
TWin_U(n)        Maximum return temperature to cooling water source n (C)
                 /n1     52
                  n2     52
                  n3     50/
*Tret(n)
;
Scalars
CC               Cycles of concentration
                 /4/
cp               Specific heat capacity of water (J.(kg.C)^-1)
                 /4187/
BM               Large value
                 /999999999/
Tamb             Ambient temperature (C)
                 /25/
Tce              Estimated cold storage tank temperature (C)
                 /22/
The              /50/
Tout_L           Limiting outlet temperature from cooling-water-using operation i (C)
                 /30/
;
Table    y(i,p)  Binary parameter indicating activity of cooling water using operation i during time slot p
                 p1      p2      p3      p4      p5
         i1      1       1       0       0       0
         i2      1       1       1       1       0
         i3      1       1       1       0       0
         i4      0       1       1       1       1
         i5      0       0       1       1       1
         i6      0       0       0       0       1
;
Tcmin = smin(n,TWout(n));
Fin_U(i) = Q(i)*3600/(cp*(Tout_U(i)-Tin_U(i)));
* Is Fin_U calculated correctly?
Thmax = smax(i,Tout_U(i));
Equations
e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19,e20,e21,e22,e23,e24,e25       General Model
e26,e27,e28,e29,e30,e31,e32,e33,e34,e35,e36,e37,e38,e39,e40,e41,e42,e43,e44,e45,e46,e47          Linear Model
e48,e49,e50,e51,e52,e53,e54,e55,e56,e57,e58,e59,e60,e61                                          Nonlinear Model
e401,e411,e441,e451
ee1,ee2,ee3,ee4,ee21,ee5,ee10
eg1,eg2,eg3,eg4
;
$Ontext
---------------------------------General Model----------------------------------
$Offtext

e1..                              CW =E= sum(n,OS(n));
e2(n,p)..                         OS(n) =E= sum(i,CS(i,n,p)) + QCin(n,p) - M(n,p) + B(n,p);
e3(n,p)..                         OS(n) =E= sum(i,CR(i,n,p)) + QHout(n,p) - D(n,p) - E(n,p);
e4(i,p)..                         Fin(i,p) =E= y(i,p)*(sum(n,CS(i,n,p)) + sum(ii$(ord(ii) ne ord(i)),FR(ii,i,p)) + QCout(i,p));
e5(i,p)..                         Fout(i,p) =E= y(i,p)*(sum(n,CR(i,n,p)) + sum(ii$(ord(ii) ne ord(i)),FR(i,ii,p)) + QHin(i,p));
e6(i,p)..                         Fin(i,p) =E= Fout(i,p);
e7(n)..                           OS(n) =L= OS_U(n);
e8(i,p)..                         Tout(i,p) =L= Tout_U(i)*y(i,p);
e9(i,p)..                         Fin(i,p) =L= (Fin_U(i))*y(i,p);
e10(p)$(ord(p) ne 1)..            mC(p) =E= mC(p-1) + sum(n,Tau(p)*QCin(n,p)) - sum(i,Tau(p)*QCout(i,p));
e11(p)$(ord(p) ne 1)..            mH(p) =E= mH(p-1) + sum(i,Tau(p)*QHin(i,p)) - sum(n,Tau(p)*QHout(n,p));
e12(p)$(ord(p) = 1)..             mC(p) =E= mC0 + sum(n,Tau(p)*QCin(n,p)) - sum(i,Tau(p)*QCout(i,p));
e13(p)$(ord(p) = 1)..             mH(p) =E= mH0 + sum(i,Tau(p)*QHin(i,p)) - sum(n,Tau(p)*QHout(n,p));
e14(ii,i,p)$(ord(ii) ne ord(i)).. FR(ii,i,p) =L= Fin_U(i)*y(i,p)*y(ii,p);
e15(i,p)..                        QCout(i,p) =L= Fin_U(i)*y(i,p);
e16(i,p)..                        QHin(i,p) =L= Fin_U(i)*y(i,p);
e17(i,n,p)..                      CR(i,n,p) =L= (OS(n) + D(n,p) + E(n,p))*y(i,p);
e18(i,n,p)..                      CS(i,n,p) =L= (OS(n) + M(n,p) - B(n,p))*y(i,p);
e19..                             sto0 =E= mC0 + mH0;
e20(i,p)..                        QHin(i,p) =L= BM*yHin(p);
e21(n,p)..                        QHout(n,p) =L= BM*yHout(p);
e22(n,p)..                        QCin(n,p) =L= BM*yCin(p);
e23(i,p)..                        QCout(i,p) =L= BM*yCout(p);
e24(p)..                          yCin(p) + yCout(p) =L= 1;
e25(p)..                          yHin(p) + yHout(p) =L= 1;
ee1(n,p)..                        D(n,p) =E= 0.002*sum(i,CR(i,n,p));
*ee2(n,p)..                        B(n,p) =E= (B(n,p) + D(n) + E(n,p)/CC) - D(n);
ee2(n,p)..                        B(n,p) =E= E(n,p)/(CC-1);
ee3(n,p)..                        E(n,p) =E= 0.00085*1.8*OS(n)*(TWin_U(n)-TWout(n));
ee4(n,p)..                        M(n,p) =E= D(n,p) + E(n,p) + B(n,p);

$Ontext
-------------------------------Linear Subproblem--------------------------------
$Offtext

e26(n,p)..                        sum(i,G1(i,n,p)) + G5(n,p) =L= TWin_U(n)*OS(n);
e27(i,p)..                        (y(i,p)*Q(i)*3600/cp) + sum(n,G4(i,n,p)) + sum(ii$(ord(ii) ne ord(i)),G2(ii,i,p)) + G6(i,p) =E= G3(i,p);
ee10(n,p)..                       sum(i,G4(i,n,p)) =E= M(n,p)*Tamb + (OS(n) - B(n,p))*TWout(n);

$Ontext
e26(n,p)..                        sum(i,G1(i,n,p)) + QHout(n,p)*The =L= Tret_U(n)*OS(n);
e27(i,p)..                        (y(i,p)*Q(i)*3600/cp) + sum(n,CS(i,n,p)*T(n)) + sum(ii$(ord(ii) ne ord(i)),G2(ii,i,p)) + QCout(i,p)*Tce =E= G3(i,p);
e26(n,p)..                        sum(i,G1(i,n,p)) + G5(n,p) =L= TWin_U(n)*OS(n);
e27(i,p)..                        (y(i,p)*Q(i)*3600/cp) + sum(n,CS(i,n,p)*TWout(n)) + sum(ii$(ord(ii) ne ord(i)),G2(ii,i,p)) + G6(i,p) =E= G3(i,p);
$Offtext


* Should I multiply these by the binary paramter?
e28(i,n,p)..                      G1(i,n,p) =G= y(i,p)*((Fin_U(i)*Tout(i,p)) + (CR(i,n,p)*Tout_U(i)) - (Fin_U(i)*Tout_U(i)));
*e29(i,n,p)..                      G1(i,n,p) =L= Fin_U(i)*Tout(i,p) + CR(i,n,p)*Tout_L - Fin_U(i)*Tout_L;
e29(i,n,p)..                      G1(i,n,p) =L= y(i,p)*(Fin_U(i)*Tout(i,p) + CR(i,n,p)*Tout_L - Fin_U(i)*Tout_L);
*e29(i,n,p)..                      G1(i,n,p) =L= Fin_U(i)*Tout(i,p);
e30(i,n,p)..                      G1(i,n,p) =L= y(i,p)*CR(i,n,p)*Tout_U(i);
e31(i,n,p)..                      G1(i,n,p) =G= y(i,p)*CR(i,n,p)*Tout_L;

e32(ii,i,p)$(ord(ii) ne ord(i)).. G2(ii,i,p) =G= y(i,p)*y(ii,p)*((Fin_U(i)*Tout(ii,p)) + (FR(ii,i,p)*Tout_U(ii)) - (Fin_U(i)*Tout_U(ii)));
e33(ii,i,p)$(ord(ii) ne ord(i)).. G2(ii,i,p) =L= y(i,p)*y(ii,p)*(Fin_U(i)*Tout(ii,p) + FR(ii,i,p)*Tout_L - Fin_U(i)*Tout_L);
e34(ii,i,p)$(ord(ii) ne ord(i)).. G2(ii,i,p) =L= y(i,p)*y(ii,p)*FR(ii,i,p)*Tout_U(ii);
e35(ii,i,p)$(ord(ii) ne ord(i)).. G2(ii,i,p) =G= y(i,p)*y(ii,p)*FR(ii,i,p)*Tout_L;
*Tout_L*y(i,p)???
*Perhap G2 =G= RHS should always be 0
e36(i,p)..                        G3(i,p) =G= y(i,p)*((Fin_U(i)*Tout(i,p)) + (Fin(i,p)*Tout_U(i)) - (Fin_U(i)*Tout_U(i)));
e37(i,p)..                        G3(i,p) =L= y(i,p)*((Fin_U(i)*Tout(i,p)) + (Fin(i,p)*Tout_L) - (Fin_U(i)*Tout_L));
e38(i,p)..                        G3(i,p) =L= y(i,p)*Fin(i,p)*Tout_U(i);
e39(i,p)..                        G3(i,p) =G= y(i,p)*Fin(i,p)*Tout_L;
*Same

eg1(i,n,p)..                      G4(i,n,p) =G= y(i,p)*(Fin_U(i)*Ts(n,p) + CS(i,n,p)*Tamb - Fin_U(i)*Tamb);
eg2(i,n,p)..                      G4(i,n,p) =L= y(i,p)*(Fin_U(i)*Ts(n,p) + CS(i,n,p)*Tcmin - Fin_U(i)*Tcmin);
eg3(i,n,p)..                      G4(i,n,p) =L= y(i,p)*CS(i,n,p)*Tamb;
eg4(i,n,p)..                      G4(i,n,p) =G= y(i,p)*CS(i,n,p)*Tcmin;

*$Ontext
e40(n,p)$(ord(p) ne 1)..          G5(n,p) =G= (OS_U(n)*Th(p-1)) + (QHout(n,p)*Thmax) - (OS_U(n)*Thmax);
e401(n,p)$(ord(p) = 1)..          G5(n,p) =G= (OS_U(n)*Tamb) + (QHout(n,p)*Thmax) - (OS_U(n)*Thmax);
e41(n,p)$(ord(p) ne 1)..          G5(n,p) =L= (OS_U(n)*Th(p-1)) + (QHout(n,p)*0) - (OS_U(n)*0);
e411(n,p)$(ord(p) = 1)..          G5(n,p) =L= (OS_U(n)*Tamb) + (QHout(n,p)*0) - (OS_U(n)*0);
e42(n,p)..                        G5(n,p) =L= QHout(n,p)*Thmax;
e43(n,p)..                        G5(n,p) =G= QHout(n,p)*0;
* p-1?
e44(i,p)$(ord(p) ne 1)..          G6(i,p) =G= (Fin_U(i)*Tc(p-1)) + (QCout(i,p)*Tamb) - (Fin_U(i)*Tamb);
e441(i,p)$(ord(p) = 1)..          G6(i,p) =G= (Fin_U(i)*Tamb) + (QCout(i,p)*Tamb) - (Fin_U(i)*Tamb);
e45(i,p)$(ord(p) ne 1)..          G6(i,p) =L= (Fin_U(i)*Tc(p-1)) + (QCout(i,p)*0) - (Fin_U(i)*0);
e451(i,p)$(ord(p) = 1)..          G6(i,p) =L= (Fin_U(i)*Tamb) + (QCout(i,p)*0) - (Fin_U(i)*0);
e46(i,p)..                        G6(i,p) =L= QCout(i,p)*Tamb;
e47(i,p)..                        G6(i,p) =G= QCout(i,p)*0;

*ee10..                           Ts(n,p)*sum(i,CS(i,n,p)) =E= M(n,p)*Tamb + sum(i,CS(i,n,p))*TWout(n);


*Try this linearisation, otherwise use estimated paramters for Tc and Th
*$Offtext
$Ontext
------------------------------Nonlinear Subproblem------------------------------
$Offtext

e48..                             mHf =E= smax(p,mH(p));
e49..                             mCf =E= smax(p,mC(p));
e50..                             sto =E= mHf + mCf;

e51(p)$(ord(p) ne 1)..            0.1*(Tc(p)*(mC(p-1) + Tau(p)*(sum(n,QCin(n,p)) - sum(i,QCout(i,p))))) =E= 0.1*(mC(p-1)*Tc(p-1) + sum(n,QCin(n,p)*Ts(n,p))*Tau(p) - sum(i,QCout(i,p)*Tau(p)*Tc(p-1)));
e52(p)$(ord(p) = 1)..             Tc(p)*(mC0 + Tau(p)*(sum(n,QCin(n,p)) - sum(i,QCout(i,p)))) =E= mC0*Tamb + sum(n,QCin(n,p)*Ts(n,p))*Tau(p) - sum(i,QCout(i,p))*Tau(p)*Tamb;
e53(p)$(ord(p) ne 1)..            Th(p)*(mH(p-1) + Tau(p)*(sum(i,QHin(i,p)) - sum(n,QHout(n,p)))) =E= mH(p-1)*Th(p-1) + sum(i,QHin(i,p)*Tau(p)*Tout(i,p)) - sum(n,QHout(n,p))*Tau(p)*Th(p-1);
e54(p)$(ord(p) = 1)..             Th(p)*(mH0 + Tau(p)*(sum(i,QHin(i,p)) - sum(n,QHout(n,p)))) =E= mH0*Tamb + sum(i,QHin(i,p)*Tau(p)*Tout(i,p)) - sum(n,QHout(n,p))*Tau(p)*Tamb;

e55(i,p)$(ord(p) ne 1)..          0.1*((y(i,p)*Q(i)*3600/cp) + sum(n,CS(i,n,p)*Ts(n,p)) + (QCout(i,p)*Tc(p-1)) + sum(ii$(ord(ii) ne ord(i)),FR(ii,i,p)*Tout(ii,p))) =E= 0.1*Fout(i,p)*Tout(i,p);
e56(i,p)$(ord(p) = 1)..           (y(i,p)*Q(i)*3600/cp) + sum(n,CS(i,n,p)*Ts(n,p)) + (QCout(i,p)*Tamb) + sum(ii$(ord(ii) ne ord(i)),FR(ii,i,p)*Tout(ii,p)) =E= Fout(i,p)*Tout(i,p);

e57(n,p)..                        TWin(n,p)*OS(n) =E= sum(i,(CR(i,n,p) - D(n,p) - E(n,p))*Tout(i,p)) + (QHout(n,p)*Th(p));
e58(n,p)..                        TWin(n,p) =L= TWin_U(n);
e59(i,p)..                        Tout(i,p) =G= Tout_L*y(i,p);

e60(i,p)$(ord(p) ne 1)..          Fin(i,p)*Tin(i,p) =E= (sum(n,CS(i,n,p)*Ts(n,p)) + sum(ii$(ord(ii) ne ord(i)),FR(ii,i,p)*Tout(ii,p)) + QCout(i,p)*Tc(p-1));
e61(i,p)$(ord(p) = 1)..           Fin(i,p)*Tin(i,p) =E= (sum(n,CS(i,n,p)*Ts(n,p)) + sum(ii$(ord(ii) ne ord(i)),FR(ii,i,p)*Tout(ii,p)) + QCout(i,p)*Tamb);

ee21(n,p)..                       E(n,p) =E= 0.00085*1.8*sum(i,CR(i,n,p))*(TWin(n,p)-TWout(n));
ee5(n,p)..                        Ts(n,p)*sum(i,CS(i,n,p)) =E= M(n,p)*Tamb + (OS(n) - B(n,p))*TWout(n);

$Ontext
-----------------------------------Boundaries-----------------------------------
$Offtext

Fin.UP(i,p) = Fin_U(i);
*Tin.UP(i,p) = Tin_U(i);
Tout.UP(i,p) = Tout_U(i);
TWin.UP(n,p) = TWin_U(n);
OS.UP(n) = OS_U(n);
CW.LO = 0;
Th.UP(p) = Thmax;
Tc.UP(p) = Tamb;
*FR.FX(i,ii,p) = 0;
*Remove above comment to compare when recycle is not allowed.

Model Moodley_Majozi_2008_4a /e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19,e26,e27,e28,e29,e30,e31,e32,e33,e34,e35,e36,e37,e38,e39,e40,e41,e42,e43,e44,e45,e46,e47,e401,e411,e441,e451,ee1,ee2,ee3,ee4,eg1,eg2,eg3,eg4,ee10/;
Option SYSOUT = ON;
Options LIMROW = 1e9;
Options LP = CPLEX;
Moodley_Majozi_2008_4a.optfile=1
$onecho > cplex.opt
iis              1
$offecho
Solve Moodley_Majozi_2008_4a using MIP minimising sto0;
mC0.FX = mC0.L;
mH0.FX = mH0.L;

Model Moodley_Majozi_2008_4b /e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32,e33,e34,e35,e36,e37,e38,e39,e40,e41,e42,e43,e44,e45,e46,e47,e401,e411,e441,e451,ee1,ee2,ee3,ee4,eg1,eg2,eg3,eg4,ee10/;
Option SYSOUT = ON;
Options LIMROW = 1e9;
Options MIP = CPLEX;
Moodley_Majozi_2008_4b.optfile=1
$onecho > cplex.opt
iis              1
$offecho
Solve Moodley_Majozi_2008_4b using MIP minimising CW;

CW.FX = CW.L;

Model Moodley_Majozi_2008_4c /e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32,e33,e34,e35,e36,e37,e38,e39,e40,e41,e42,e43,e44,e45,e46,e401,e411,e441,e451,e47,e48,e49,e50,e51,e52,e53,e54,ee1,ee2,ee3,ee4,eg1,eg2,eg3,eg4,ee10/;
*Include all equations?
Options SYSOUT = ON;
Options LIMROW = 1e9;
Options MIP = CPLEX;
*Moodley_Majozi_2008_4c.optfile=1
*$onecho > cplex.opt
*iis              1
*$offecho
*$onecho > dicopt.opt
*maxcycles        10000
*$offecho
Solve Moodley_Majozi_2008_4c using MINLP minimising sto;

* Freeing the fixed variables
CW.LO = CW.L;
*CW.LO = 60;
CW.UP = inf;
mC0.LO = 0;
mC0.UP = inf;
mH0.LO = 0;
mH0.UP = inf;

QCin.FX(n,p) = 0;

Model Moodley_Majozi_2008_4d /e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19,e20,e21,e22,e23,e24,e25,e48,e49,e50,e51,e52,e53,e54,e55,e56,e57,e58,e59,ee1,ee2,ee21,ee4,ee5/;
Option SYSOUT = ON;
Options LIMROW = 1e9
Options MINLP = DICOPT;
Options MIP = CPLEX;
Moodley_Majozi_2008_4d.optfile=1
$onecho > cplex.opt
iis              1
$offecho
$onecho > dicopt.opt
maxcycles        100000
$offecho
Solve Moodley_Majozi_2008_4d using MINLP minimising sto0;

sto0.FX = sto0.L;

Model Moodley_Majozi_2008_4e /e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19,e20,e21,e22,e23,e24,e25,e48,e49,e50,e51,e52,e53,e54,e55,e56,e57,e58,e59,ee1,ee2,ee21,ee4,ee5/;
Options SYSOUT = ON;
Options LIMROW = 1e9
Options MINLP = DICOPT;
Options MIP = CPLEX;
Moodley_Majozi_2008_4e.optfile=1
$onecho > cplex.opt
iis              1
$offecho
$onecho > dicopt.opt
maxcycles        10000
$offecho
Solve Moodley_Majozi_2008_4e using MINLP minimising CW;

CW.FX = CW.L;

Model Moodley_Majozi_2008_4f /e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19,e20,e21,e22,e23,e24,e25,e48,e49,e50,e51,e52,e53,e54,e55,e56,e57,e58,e59,ee1,ee2,ee21,ee4,ee5/;
Options SYSOUT = ON;
Options LIMROW = 1e9
Options MINLP = DICOPT;
Options MIP = CPLEX;
Moodley_Majozi_2008_4f.optfile=1
$onecho > cplex.opt
iis              1
$offecho
$onecho > dicopt.opt
maxcycles        10000
$offecho
Solve Moodley_Majozi_2008_4f using MINLP minimising sto;
Tin(i,p)$(ord(p) ne 1) = (sum(n,CS.L(i,n,p)*Ts.L(n,p)) + sum(ii$(ord(ii) ne ord(i)),FR.L(ii,i,p)*Tout.L(ii,p)) + QCout.L(i,p)*Tc.L(p-1))/Fin.L(i,p);
Tin(i,p)$(ord(p) = 1) = (sum(n,CS.L(i,n,p)*Ts.L(n,p)) + sum(ii$(ord(ii) ne ord(i)),FR.L(ii,i,p)*Tout.L(ii,p)) + QCout.L(i,p)*Tamb)/Fin.L(i,p);
Display Tin,Fin_U;

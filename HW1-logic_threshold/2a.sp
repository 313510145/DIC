********************************
**     Simulator setting      **
********************************
.option accurate
.option post           
.op
.TEMP 25.0

********************************
**     Library setting        **
********************************
.protect
.lib '../bulk_32nm.l' TT
.unprotect

********************************
**     Parameter setting      **
********************************
.param xvdd = 0.9
.param xvct = 0.9
.param xvss = 0
.param lp = 32n
.param ln = 32n
.param lpn = 32n

********************************
**     Circuit description    **
********************************
.subckt schmitt in out ct vdd vss
*m1   1  in vss vss nmos_svt w=64n  l=ln
*m2 out  in   1 vss nmos_svt w=64n  l=ln
*m3   1 out   2 vss nmos_svt w=64n l=32n
*m4   2  ct vdd vss nmos_svt w=64n l=32n
*m5 out  in   3 vdd pmos_svt w=64n  l=lp
*m6   3  in vdd vdd pmos_svt w=64n  l=lp
*m7   3 out   4 vdd pmos_svt w=64n l=32n
*m8   4  ct vss vdd pmos_svt w=64n l=32n

*m1   1  in vss vss nmos_svt w=64n l=lpn
*m2 out  in   1 vss nmos_svt w=64n l=lpn
*m3   1 out   2 vss nmos_svt w=64n l=32n
*m4   2  ct vdd vss nmos_svt w=64n l=32n
*m5 out  in   3 vdd pmos_svt w=64n l=lpn
*m6   3  in vdd vdd pmos_svt w=64n l=lpn
*m7   3 out   4 vdd pmos_svt w=64n l=32n
*m8   4  ct vss vdd pmos_svt w=64n l=32n

m1   1  in vss vss nmos_svt w=64n l=64n
m2 out  in   1 vss nmos_svt w=64n l=64n
m3   1 out   2 vss nmos_svt w=64n l=32n
m4   2  ct vdd vss nmos_svt w=64n l=32n
m5 out  in   3 vdd pmos_svt w=64n  l=lp
m6   3  in vdd vdd pmos_svt w=64n  l=lp
m7   3 out   4 vdd pmos_svt w=64n l=32n
m8   4  ct vss vdd pmos_svt w=64n l=32n
.ends

xschmitt_1 input output ctrl vdd vss schmitt

cload output vss 5f

********************************
**     Power declaration      **
********************************
vvdd  vdd 0 xvdd
vvss  vss 0 xvss
vct  ctrl 0 xvct

********************************
**     Input declaration      **
********************************
vin input 0 xvss

********************************
**     Analysis setting       **
********************************
*.dc vin   0 0.9  0.01 sweep lp 32n 160n 32n
*.dc vin 0.9   0 -0.01 sweep lp 32n 160n 32n
*.dc vin   0 0.9  0.01 sweep ln 32n 160n 32n
*.dc vin 0.9   0 -0.01 sweep ln 32n 160n 32n

*.dc vin   0 0.9  0.01 sweep lpn 32n 160n 32n
*.dc vin 0.9   0 -0.01 sweep lpn 32n 160n 32n

.dc vin   0 0.9  0.01 sweep lp 96n 256n 32n
.dc vin 0.9   0 -0.01 sweep lp 96n 256n 32n

.end   

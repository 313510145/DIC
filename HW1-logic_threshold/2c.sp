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
.param xvct = 0.72
.param xvss = 0

********************************
**     Circuit description    **
********************************
.subckt schmitt in out ct vdd vss
m1   1  in vss vss nmos_svt w=64n  l=64n
m2 out  in   1 vss nmos_svt w=64n  l=64n
m3   1 out   2 vss nmos_svt w=64n  l=32n
m4   2  ct vdd vss nmos_svt w=64n  l=32n
m5 out  in   3 vdd pmos_svt w=64n l=256n
m6   3  in vdd vdd pmos_svt w=64n l=256n
m7   3 out   4 vdd pmos_svt w=64n  l=32n
m8   4  ct vss vdd pmos_svt w=64n  l=32n
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
.dc vin   0 0.9  0.01
.dc vin 0.9   0 -0.01

.end   

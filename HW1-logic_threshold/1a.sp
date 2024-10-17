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
.param xvg = 0
.param xvss = 0

********************************
**     Circuit description    **
********************************
m1 input vg vdd vdd pmos_svt w=64n l=32n
m2 input vg vss vss nmos_svt w=64n l=32n

cload input vss 5f

********************************
**     Power declaration      **
********************************
vvdd vdd 0 xvdd
vvss vss 0 xvss
vvg   vg 0  xvg

********************************
**     Input declaration      **
********************************
vin input 0 xvss

********************************
**     Analysis setting       **
********************************
.dc vin 0 0.9 0.01 sweep xvg 0 0.9 0.1
.probe i(m1)
.probe i(m2)

.end   

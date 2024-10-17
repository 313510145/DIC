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
.include '../7nm_FF_160803.pm'
.unprotect

********************************
**     Parameter setting      **
********************************
.param xvdd = 0.8
.param xvss = 0
.param xvg = 0

********************************
**     Circuit description    **
********************************
m1 input vg vdd vdd pmos_rvt nfin=2
m2 input vg vss vss nmos_rvt nfin=1

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
.dc vin 0 0.8 0.01 sweep xvg 0 0.8 0.05
.probe i(m1)
.probe i(m2)

.end

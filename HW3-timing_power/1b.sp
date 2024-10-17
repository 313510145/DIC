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
.param pfin_num = 1

********************************
**     Circuit description    **
********************************
.subckt inv in out vdd vss
m1 out in vdd vdd pmos_rvt nfin=pfin_num
m2 out in vss vss nmos_rvt nfin=1
.ends

xinv_1 input output vdd vss inv

********************************
**     Power declaration      **
********************************
vvdd vdd 0 xvdd
vvss vss 0 xvss

********************************
**     Input declaration      **
********************************
vin input 0 xvss

********************************
**     Analysis setting       **
********************************
.dc vin 0 0.8 0.01 sweep pfin_num 1 2 1

.end

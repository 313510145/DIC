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
.param simstep = 1f
.param simtime = 50p

********************************
**     Circuit description    **
********************************
.subckt inv in out vdd vss nfin_p=1
m1 out in vdd vdd pmos_rvt nfin=nfin_p
m2 out in vss vss nmos_rvt nfin=1
.ends

xinv_1 output      1 vdd vss inv nfin_p=2
xinv_2      1      2 vdd vss inv nfin_p=2
xinv_3      2 output vdd vss inv nfin_p=2

********************************
**     Power declaration      **
********************************
vvdd vdd 0 xvdd
vvss vss 0 xvss

********************************
**     Input declaration      **
********************************

********************************
**     Analysis setting       **
********************************
.ic v(output) = xvss v(1) = xvdd v(2) = xvss
.tran simstep simtime
.probe tran power
.meas tran average_power avg power

.end

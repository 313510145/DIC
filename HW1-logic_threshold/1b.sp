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
.param xvss = 0
.param wp = 64n

********************************
**     Circuit description    **
********************************
.subckt inv in out vdd vss
m1 out in vdd vdd pmos_svt  w=wp l=32n
m2 out in vss vss nmos_svt w=64n l=32n
.ends

xinv_1 input output vdd vss inv

cload output vss 5f

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
.dc vin 0 0.9 0.01 sweep wp 64n 320n 64n
.dc vin 0 0.9 0.01 sweep wp 64n 128n 16n
.dc vin 0 0.9 0.01 sweep wp 112n 128n 4n
.dc vin 0 0.9 0.01 sweep wp 112n 116n 1n

.end   

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
.param xvdd = 0.8
.param xvss = 0
.param wp = 64n
.param wn = 64n

********************************
**     Circuit description    **
********************************
.subckt sym_nand2 in_a in_b out_y vdd vss
m1 out_y in_a vdd vdd pmos_lvt w=wp l=32n
m2 out_y in_b vdd vdd pmos_lvt w=wp l=32n
m3 out_y in_a   1 vss nmos_lvt w=wn l=32n
m4     1 in_b vss vss nmos_lvt w=wn l=32n
m5 out_y in_b   2 vss nmos_lvt w=wn l=32n
m6     2 in_a vss vss nmos_lvt w=wn l=32n
.ends

xsym_nand2_1 input input output vdd vss sym_nand2

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
.dc vin 0 0.8 0.01 sweep wp  64n 320n 64n
.dc vin 0 0.8 0.01 sweep wn  64n 320n 64n
.dc vin 0 0.8 0.01 sweep wn 128n 192n 16n
.dc vin 0 0.8 0.01 sweep wn 144n 160n  4n
.dc vin 0 0.8 0.01 sweep wn 148n 152n  1n

.end   

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
.param simstep = 1p
.param simtime = 5p

********************************
**     Circuit description    **
********************************
.subckt sym_nand2 in_a in_b out_y vdd vss
m1 out_y in_a vdd vdd pmos_lvt  w=64n l=32n ad=3456a  as=5056a pd=236n ps=286n
m2 out_y in_b vdd vdd pmos_lvt  w=64n l=32n ad=3456a  as=5056a pd=236n ps=286n
m3 out_y in_a   1 vss nmos_lvt w=149n l=32n ad=8046a  as=3651a pd=406n ps=347n
m4 out_y in_b   2 vss nmos_lvt w=149n l=32n ad=8046a  as=3651a pd=406n ps=347n
m5     1 in_b vss vss nmos_lvt w=149n l=32n ad=3651a as=11771a pd=347n ps=456n
m6     2 in_a vss vss nmos_lvt w=149n l=32n ad=3651a as=11771a pd=347n ps=456n
.ends

xsym_nand2_1 input input output vdd vss sym_nand2

********************************
**     Power declaration      **
********************************
vvdd vdd 0 xvdd
vvss vss 0 xvss

********************************
**     Input declaration      **
********************************
*vin input 0 xvss
vin input 0 xvdd

********************************
**     Analysis setting       **
********************************
.tran simstep simtime
.print tran cap(output)
.print tran cap(input)
.print tran power

.end   

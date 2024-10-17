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
.param simstep = 1p
.param simtime = 10n

********************************
**     Circuit description    **
********************************
.subckt inv in out vdd vss nfin_p=1 nfin_n=1
m1 out in vdd vdd pmos_rvt nfin=nfin_p
m2 out in vss vss nmos_rvt nfin=nfin_n
.ends

.subckt tg en en_n in out vdd vss nfin_p=1 nfin_n=1
m1 out en_n in vdd pmos_rvt nfin=nfin_p
m2 out   en in vss nmos_rvt nfin=nfin_n
.ends

.subckt tri_inv en en_n in out vdd vss nfin_p=1 nfin_n=1
m1   1   in vdd vdd pmos_rvt nfin=nfin_p
m2 out en_n   1 vdd pmos_rvt nfin=nfin_p
m3 out   en   2 vss nmos_rvt nfin=nfin_n
m4   2   in vss vss nmos_rvt nfin=nfin_n
.ends

.subckt static_reg clk clk_n in out out_n vdd vss
xinv_1                 in     1 vdd vss     inv nfin_p=6 nfin_n=3
xtg_1      clk_n   clk  1     2 vdd vss      tg nfin_p=1 nfin_n=1
xinv_2                  2     3 vdd vss     inv nfin_p=1 nfin_n=1
xtri_inv_1   clk clk_n  3     2 vdd vss tri_inv nfin_p=1 nfin_n=1
xtg_2        clk clk_n  3     4 vdd vss      tg nfin_p=2 nfin_n=2
xinv_3                  4     5 vdd vss     inv nfin_p=1 nfin_n=1
xtri_inv_2 clk_n   clk  5     4 vdd vss tri_inv nfin_p=1 nfin_n=1
xinv_4                  5   out vdd vss     inv nfin_p=2 nfin_n=2
xinv_5                  4 out_n vdd vss     inv nfin_p=1 nfin_n=1
.ends

xinv_1                               clock  clock_n vdd vss        inv nfin_p=6 nfin_n=6
xstatic_reg_1 clock clock_n input   output output_n vdd vss static_reg
xinv_2                              output        1 vdd vss        inv
xinv_3                              output        2 vdd vss        inv
xinv_4                              output        3 vdd vss        inv
xinv_5                              output        4 vdd vss        inv
xinv_6                            output_n        5 vdd vss        inv
xinv_7                            output_n        6 vdd vss        inv
xinv_8                            output_n        7 vdd vss        inv
xinv_9                            output_n        8 vdd vss        inv

********************************
**     Power declaration      **
********************************
vvdd vdd 0 xvdd
vvss vss 0 xvss

********************************
**     Input declaration      **
********************************
vin  input 0 pulse(xvss xvdd 0.9ns 0.1ns 0.1ns 0.9ns 2ns)
vclk clock 0 pulse(xvss xvdd 0.4ns 0.1ns 0.1ns 0.4ns 1ns)

********************************
**     Analysis setting       **
********************************
.tran simstep simtime
.meas tran tsetup_0 trig v(input) val='0.5*xvdd' fall=1 targ v(xstatic_reg_1.3) val='0.5*xvdd' fall=1
.meas tran tsetup_1 trig v(input) val='0.5*xvdd' rise=1 targ v(xstatic_reg_1.3) val='0.5*xvdd' rise=1
.meas tran tpcq_0 trig v(clock) val='0.5*xvdd' rise=3 targ v(output) val='0.5*xvdd' fall=1
.meas tran tpcq_1 trig v(clock) val='0.5*xvdd' rise=2 targ v(output) val='0.5*xvdd' rise=1
.meas tran tpcq_n_1 trig v(clock) val='0.5*xvdd' rise=3 targ v(output_n) val='0.5*xvdd' rise=1
.meas tran tpcq_n_0 trig v(clock) val='0.5*xvdd' rise=2 targ v(output_n) val='0.5*xvdd' fall=1

.end

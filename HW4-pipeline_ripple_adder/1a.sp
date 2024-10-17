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
.subckt inv in out vdd vss nfin_p=2 nfin_n=1
m1 out in vdd vdd pmos_rvt nfin=nfin_p
m2 out in vss vss nmos_rvt nfin=nfin_n
.ends

.subckt fo5_inv in out_1 out_2 out_3 out_4 out_5 vdd vss
xinv_1 in out_1 vdd vss inv
xinv_2 in out_2 vdd vss inv
xinv_3 in out_3 vdd vss inv
xinv_4 in out_4 vdd vss inv
xinv_5 in out_5 vdd vss inv
.ends

.subckt fa_n in_a in_b in_c out_c_n out_s_n vdd vss nfin_c_l_p=1 nfin_c_l_n=1 nfin_c_r=1 nfin_s_l=1 nfin_s_r=1
m1  out_c_n    in_c   1 vdd pmos_rvt nfin=nfin_c_l_p
m2        1    in_a vdd vdd pmos_rvt nfin=nfin_c_l_p
m3        1    in_b vdd vdd pmos_rvt nfin=nfin_c_l_p
m4  out_c_n    in_b   2 vdd pmos_rvt   nfin=nfin_c_r
m5        2    in_a vdd vdd pmos_rvt   nfin=nfin_c_r
m6  out_c_n    in_c   3 vss nmos_rvt nfin=nfin_c_l_n
m7        3    in_a vss vss nmos_rvt nfin=nfin_c_l_n
m8        3    in_b vss vss nmos_rvt nfin=nfin_c_l_n
m9  out_c_n    in_b   4 vss nmos_rvt   nfin=nfin_c_r
m10       4    in_a vss vss nmos_rvt   nfin=nfin_c_r

m11 out_s_n out_c_n   5 vdd pmos_rvt   nfin=nfin_s_l
m12       5    in_a vdd vdd pmos_rvt   nfin=nfin_s_l
m13       5    in_b vdd vdd pmos_rvt   nfin=nfin_s_l
m14       5    in_c vdd vdd pmos_rvt   nfin=nfin_s_l
m15 out_s_n    in_c   6 vdd pmos_rvt   nfin=nfin_s_r
m16       6    in_b   7 vdd pmos_rvt   nfin=nfin_s_r
m17       7    in_a vdd vdd pmos_rvt   nfin=nfin_s_r
m18 out_s_n out_c_n   8 vss nmos_rvt   nfin=nfin_s_l
m19       8    in_a vss vss nmos_rvt   nfin=nfin_s_l
m20       8    in_b vss vss nmos_rvt   nfin=nfin_s_l
m21       8    in_c vss vss nmos_rvt   nfin=nfin_s_l
m22 out_s_n    in_c   9 vss nmos_rvt   nfin=nfin_s_r
m23       9    in_b  10 vss nmos_rvt   nfin=nfin_s_r
m24      10    in_a vss vss nmos_rvt   nfin=nfin_s_r
.ends

.subckt tspc_reg_n clk in out_n vdd vss
m1     1  in vdd vdd pmos_rvt nfin=1
m2     2 clk   1 vdd pmos_rvt nfin=1
m3     2  in vss vss nmos_rvt nfin=1

m4     3 clk vdd vdd pmos_rvt nfin=1
m5     3   2   4 vss nmos_rvt nfin=1
m6     4 clk vss vss nmos_rvt nfin=1

m7 out_n   3 vdd vdd pmos_rvt nfin=1
m8 out_n clk   6 vss nmos_rvt nfin=1
m9     6   3 vss vss nmos_rvt nfin=1
.ends

xtspc_reg_n_1                          clock                          a[0]          a[0]_tspc_reg_n                          vdd vss   tspc_reg_n
xtspc_reg_n_2                          clock                          a[1]          a[1]_tspc_reg_n                          vdd vss   tspc_reg_n
xtspc_reg_n_3                          clock                          a[2]          a[2]_tspc_reg_n                          vdd vss   tspc_reg_n
xtspc_reg_n_4                          clock                          a[3]          a[3]_tspc_reg_n                          vdd vss   tspc_reg_n
xtspc_reg_n_5                          clock                          b[0]          b[0]_tspc_reg_n                          vdd vss   tspc_reg_n
xtspc_reg_n_6                          clock                          b[1]          b[1]_tspc_reg_n                          vdd vss   tspc_reg_n
xtspc_reg_n_7                          clock                          b[2]          b[2]_tspc_reg_n                          vdd vss   tspc_reg_n
xtspc_reg_n_8                          clock                          b[3]          b[3]_tspc_reg_n                          vdd vss   tspc_reg_n
xtspc_reg_n_9                          clock                           cin           cin_tspc_reg_n                          vdd vss   tspc_reg_n

xinv_1                       a[0]_tspc_reg_n           a[0]_tspc_reg_n_inv                                                   vdd vss          inv
xinv_2                       a[1]_tspc_reg_n           a[1]_tspc_reg_n_inv                                                   vdd vss          inv
xinv_3                       a[2]_tspc_reg_n           a[2]_tspc_reg_n_inv                                                   vdd vss          inv
xinv_4                       a[3]_tspc_reg_n           a[3]_tspc_reg_n_inv                                                   vdd vss          inv
xinv_5                       b[0]_tspc_reg_n           b[0]_tspc_reg_n_inv                                                   vdd vss          inv
xinv_6                       b[1]_tspc_reg_n           b[1]_tspc_reg_n_inv                                                   vdd vss          inv
xinv_7                       b[2]_tspc_reg_n           b[2]_tspc_reg_n_inv                                                   vdd vss          inv
xinv_8                       b[3]_tspc_reg_n           b[3]_tspc_reg_n_inv                                                   vdd vss          inv
xinv_9                        cin_tspc_reg_n            cin_tspc_reg_n_inv                                                   vdd vss          inv

xinv_10                  a[0]_tspc_reg_n_inv       a[0]_tspc_reg_n_inv_inv                                                   vdd vss          inv
xinv_11                  a[1]_tspc_reg_n_inv       a[1]_tspc_reg_n_inv_inv                                                   vdd vss          inv
xinv_12                  a[2]_tspc_reg_n_inv       a[2]_tspc_reg_n_inv_inv                                                   vdd vss          inv
xinv_13                  a[3]_tspc_reg_n_inv       a[3]_tspc_reg_n_inv_inv                                                   vdd vss          inv
xinv_14                  b[0]_tspc_reg_n_inv       b[0]_tspc_reg_n_inv_inv                                                   vdd vss          inv
xinv_15                  b[1]_tspc_reg_n_inv       b[1]_tspc_reg_n_inv_inv                                                   vdd vss          inv
xinv_16                  b[2]_tspc_reg_n_inv       b[2]_tspc_reg_n_inv_inv                                                   vdd vss          inv
xinv_17                  b[3]_tspc_reg_n_inv       b[3]_tspc_reg_n_inv_inv                                                   vdd vss          inv
xinv_18                   cin_tspc_reg_n_inv        cin_tspc_reg_n_inv_inv                                                   vdd vss          inv

xinv_19              a[1]_tspc_reg_n_inv_inv   a[1]_tspc_reg_n_inv_inv_inv                                                   vdd vss          inv
xinv_20              a[3]_tspc_reg_n_inv_inv   a[3]_tspc_reg_n_inv_inv_inv                                                   vdd vss          inv
xinv_21              b[1]_tspc_reg_n_inv_inv   b[1]_tspc_reg_n_inv_inv_inv                                                   vdd vss          inv
xinv_22              b[3]_tspc_reg_n_inv_inv   b[3]_tspc_reg_n_inv_inv_inv                                                   vdd vss          inv

xfa_n_1              a[0]_tspc_reg_n_inv_inv       b[0]_tspc_reg_n_inv_inv   cin_tspc_reg_n_inv_inv     c[0]     s[0]        vdd vss         fa_n   nfin_c_l_p=6   nfin_c_l_n=6
xfa_n_2          a[1]_tspc_reg_n_inv_inv_inv   b[1]_tspc_reg_n_inv_inv_inv                     c[0]   c[1]_n   s[1]_n        vdd vss         fa_n   nfin_c_l_p=7   nfin_c_l_n=7
xinv_23                               s[1]_n                          s[1]                                                   vdd vss          inv
xfa_n_3              a[2]_tspc_reg_n_inv_inv       b[2]_tspc_reg_n_inv_inv                   c[1]_n     c[2]     s[2]        vdd vss         fa_n   nfin_c_l_p=6   nfin_c_l_n=6
xfa_n_4          a[3]_tspc_reg_n_inv_inv_inv   b[3]_tspc_reg_n_inv_inv_inv                     c[2]   c[3]_n   s[3]_n        vdd vss         fa_n   nfin_c_l_p=6   nfin_c_l_n=6
xinv_24                               s[3]_n                          s[3]                                                   vdd vss          inv
xinv_25                               c[3]_n                          c[3]                                                   vdd vss          inv

xfo5_inv_1                              s[0]                             1                        2        3        4    5   vdd vss      fo5_inv
xfo5_inv_2                              s[1]                             6                        7        8        9   10   vdd vss      fo5_inv
xfo5_inv_3                              s[2]                            11                       12       13       14   15   vdd vss      fo5_inv
xfo5_inv_4                              s[3]                            16                       17       18       19   20   vdd vss      fo5_inv
xfo5_inv_5                              c[3]                            21                       22       23       24   25   vdd vss      fo5_inv

xtspc_reg_n_10                         clock                          s[0]          s[0]_tspc_reg_n                          vdd vss   tspc_reg_n
xtspc_reg_n_11                         clock                          s[1]          s[1]_tspc_reg_n                          vdd vss   tspc_reg_n
xtspc_reg_n_12                         clock                          s[2]          s[2]_tspc_reg_n                          vdd vss   tspc_reg_n
xtspc_reg_n_13                         clock                          s[3]          s[3]_tspc_reg_n                          vdd vss   tspc_reg_n
xtspc_reg_n_14                         clock                          c[3]          c[3]_tspc_reg_n                          vdd vss   tspc_reg_n

xinv_26                      s[0]_tspc_reg_n                        sum[0]                                                   vdd vss          inv
xinv_27                      s[1]_tspc_reg_n                        sum[1]                                                   vdd vss          inv
xinv_28                      s[2]_tspc_reg_n                        sum[2]                                                   vdd vss          inv
xinv_29                      s[3]_tspc_reg_n                        sum[3]                                                   vdd vss          inv
xinv_30                      c[3]_tspc_reg_n                       cout[3]                                                   vdd vss          inv

********************************
**     Power declaration      **
********************************
vvdd vdd 0 xvdd
vvss vss 0 xvss

********************************
**     Input declaration      **
********************************
va[0]  a[0] 0 xvss
va[1]  a[1] 0 xvss
va[2]  a[2] 0 xvss
va[3]  a[3] 0 xvss
vb[0]  b[0] 0 xvdd
vb[1]  b[1] 0 xvdd
vb[2]  b[2] 0 xvdd
vb[3]  b[3] 0 xvdd
vcin    cin 0 pulse(xvss xvdd 0.98ns 0.02ns 0.02ns 0.98ns 2ns)
vclk  clock 0 pulse(xvss xvdd 0.48ns 0.02ns 0.02ns 0.48ns 1ns)

********************************
**     Analysis setting       **
********************************
.tran simstep simtime

.probe tran power
.meas tran average_power avg power
.meas tran maximum_power max power
.meas tran minimum_power min power

.meas tran tsetup0 trig   v(cin) val='0.5*xvdd' rise=1 targ    v(xtspc_reg_n_9.2) val='0.5*xvdd' fall=1
.meas tran tsetup1 trig v(clock) val='0.5*xvdd' fall=2 targ    v(xtspc_reg_n_9.2) val='0.5*xvdd' rise=1

.meas tran   tpcq0 trig v(clock) val='0.5*xvdd' rise=1 targ v(cin_tspc_reg_n_inv) val='0.5*xvdd' fall=1
.meas tran   tpcq1 trig v(clock) val='0.5*xvdd' rise=2 targ v(cin_tspc_reg_n_inv) val='0.5*xvdd' rise=1

.meas tran tpd0_cin_to_s[0] trig v(cin_tspc_reg_n_inv) val='0.5*xvdd' rise=3 targ v(s[0]) val='0.5*xvdd' fall=3
.meas tran tpd1_cin_to_s[0] trig v(cin_tspc_reg_n_inv) val='0.5*xvdd' fall=3 targ v(s[0]) val='0.5*xvdd' rise=2
.meas tran tpd0_cin_to_s[1] trig v(cin_tspc_reg_n_inv) val='0.5*xvdd' rise=3 targ v(s[1]) val='0.5*xvdd' fall=3
.meas tran tpd1_cin_to_s[1] trig v(cin_tspc_reg_n_inv) val='0.5*xvdd' fall=3 targ v(s[1]) val='0.5*xvdd' rise=2
.meas tran tpd0_cin_to_s[2] trig v(cin_tspc_reg_n_inv) val='0.5*xvdd' rise=3 targ v(s[2]) val='0.5*xvdd' fall=4
.meas tran tpd1_cin_to_s[2] trig v(cin_tspc_reg_n_inv) val='0.5*xvdd' fall=3 targ v(s[2]) val='0.5*xvdd' rise=3
.meas tran tpd0_cin_to_s[3] trig v(cin_tspc_reg_n_inv) val='0.5*xvdd' rise=3 targ v(s[3]) val='0.5*xvdd' fall=3
.meas tran tpd1_cin_to_s[3] trig v(cin_tspc_reg_n_inv) val='0.5*xvdd' fall=3 targ v(s[3]) val='0.5*xvdd' rise=2
.meas tran tpd0_cin_to_c[3] trig v(cin_tspc_reg_n_inv) val='0.5*xvdd' fall=3 targ v(c[3]) val='0.5*xvdd' fall=3
.meas tran tpd1_cin_to_c[3] trig v(cin_tspc_reg_n_inv) val='0.5*xvdd' rise=3 targ v(c[3]) val='0.5*xvdd' rise=3

.end

set terminal x11 
set output 
set noclip points
set clip one
set noclip two
#set border 15 
set boxwidth
set dummy x,y
set format x "%g"
set format y "%g"
set format z "%g"
set nogrid
set noarrow
set nologscale
set offsets 0, 0, 0, 0
set nopolar
set angles radians
set noparametric
set view 60, 30, 1, 1
set samples 100, 100
set isosamples 10, 10
set surface
set nocontour
set clabel
set nohidden3d
set cntrparam order 4
set cntrparam linear
set cntrparam levels auto 5
set cntrparam points 5
set size 1,1
set data style points
set function style lines
set noxzeroaxis
set noyzeroaxis
set tics in
set ticslevel 0.5
set xtics
set ytics
set ztics
set title "" 0,0
set notime
set rrange [-0 : 10]
set trange [-5 : 5]
set urange [-5 : 5]
set vrange [-5 : 5]
set xlabel "" 0,0
set xrange [0 : 13.2]
set ylabel "" 0,0
set yrange [120: 140]
set zlabel "" 0,0
set zrange [-10 : 10]
set autoscale r
set autoscale t
set autoscale xy
set autoscale z
set zero 1e-08
#FIT_INDEX = 0p
#
# Viscosity control problem; LQG
#
set terminal x11
set output 
set nolabel
set nokey
set xlabel "$\\sigma_u^2$"
set ylabel "$\\sigma_y^2$"
set ylabel -2
plot "lqg_visc.dat" u 2:3 w l 1
pause -1
#
set term latex
set output "lqg_visc_uy.tex"
set nolabel
set nokey
set xlabel "$\\sigma_u^2$"
set ylabel "$\\sigma_y^2$"
set ylabel -2
plot "lqg_visc.dat" u 2:3 w l 1

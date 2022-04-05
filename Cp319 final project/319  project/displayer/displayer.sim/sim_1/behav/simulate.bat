@echo off
set xv_path=D:\\program\\vivado_anzhuang\\Vivado\\2015.4\\bin
call %xv_path%/xsim testbench_behav -key {Behavioral:sim_1:Functional:testbench} -tclbatch testbench.tcl -view F:/VIVADO_program/look_ahead_adder_X064/displayer_X064/displayer/testbench_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

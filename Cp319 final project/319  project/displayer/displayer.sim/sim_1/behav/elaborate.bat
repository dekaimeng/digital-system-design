@echo off
set xv_path=D:\\program\\vivado_anzhuang\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto f92ccfd1649243c6955765a6c0b50c70 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot testbench_behav xil_defaultlib.testbench -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

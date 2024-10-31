clear -all
analyze -sv09 a_checker.sv bind.sv
analyze -vhdl zadaci.vhd

elaborate -vhdl -top zadaci
clock clk
reset rst
prove -bg -all
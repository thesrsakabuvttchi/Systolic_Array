import cocotb
from cocotb.triggers import Timer
import struct
from random import uniform
import csv

def int_to_str(x):
    return('{0:032b}'.format(x))

def to_int(x):
    return (sum([j<<8*i for i,j in enumerate(struct.pack("f", x ))]))

def to_float(b):
    try:
        s = (int(b[0]))
        e = (int(b[1:9],2))
        m = (int('1'+b[9:],2))
        return(pow(-1,s)*m*pow(2,(e-150)))
    except:
        return(b)
    #return (struct.unpack('>d', h)[0])

@cocotb.test()
def systolic_test(dut):
    for i in range(10):
        dut.clk.value <= i%2
        dut.b.value=to_int(10.0)
        yield Timer(1,'ns')

        print(dut.row[0].column[0].out_prop)

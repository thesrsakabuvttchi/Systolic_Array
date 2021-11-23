import cocotb
from cocotb.triggers import Timer
import struct
from random import uniform
import csv

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
def fp_mul_test(dut):
    a = 56.0
    b = 10.0
    c = 2.0

    dut.a.value <= to_int(a)
    dut.b.value <= to_int(b)
    dut.c.value <= to_int(c)

    dut.clk.value <= 0
    yield Timer(1,'ns')
    print(a,b,c,to_float(str(dut.out_prop.value)),to_float(str(dut.dormant.value)))

    dut.clk.value <= 1
    yield Timer(2,'ns')
    print(a,b,c,to_float(str(dut.out_ans.value)),to_float(str(dut.dormant.value)))

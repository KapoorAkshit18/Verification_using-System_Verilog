// full adder dut 
module fa (
            input logic a,bin,cin,
            output logic sum,cout
);

assign {cout,sum} = a + b + cin;

endmodule
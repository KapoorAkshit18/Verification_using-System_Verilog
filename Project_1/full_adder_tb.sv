// testbench for fulladder using oop
-------------‐-----------
-------------‐-----------
class txn;
{
rand bit a,b,cin;
bit sum_tmp, cout_tmp;

function check_fa ();
assign temp = a+b+cin; //why temp
temp[1]=cout_tmp;
temp[0]=sum_tmp;
assert(sum_tmp==sum && cout_tmp==cout);
else
$display("error the results are not correct");
endfunction 
endclass

module fa_tb;

logic a,b,cin;
logic sum,cout;

fa dut (

          .a(a),
          .b(b),
          .cin(cin),
          .sum(sum),
          .cout(cout)
)

txn t;

initial 
begin 

t=new();



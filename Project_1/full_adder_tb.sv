// testbench for fulladder using oop
-------------‐-----------
-------------‐-----------
class txn;
{
rand bit a,b,cin;
bit sum_tmp, cout_tmp;

function check_fa ();
bit[1:0] temp;
temp = a+b+cin; //why temp
temp[1]=cout_tmp;
temp[0]=sum_tmp;
/*assert(sum_tmp==sum && cout_tmp==cout);
else
$display("error the results are not correct"); */
endfunction 
endclass

//-------------------------------------------------
// Testbench Module
//-------------------------------------------------  

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

initial begin 
  t=new();
  
  repeat(10) begin
            assert(t.randomize());      // Randomize Inputs
    t.a = a;  t.b = b;  t.cin = cin;      // Drive DUT

    #1;
          
    t.check_fa();

// Check Results

            if (sum !== t.sum_tmp || cout !== t.cout_tmp)
        $display("❌ Error: a=%0b b=%0b cin=%0b | sum=%0b (exp=%0b) cout=%0b (exp=%0b)",
                  t.a, t.b, t.cin, sum, t.sum_tmp, cout, t.cout_tmp);
      else
        $display("✅ Pass: a=%0b b=%0b cin=%0b | sum=%0b cout=%0b",
                  t.a, t.b, t.cin, sum, cout);




  end
 end
endmodule



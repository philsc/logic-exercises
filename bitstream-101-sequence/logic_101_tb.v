`include "logic_101.v"

module logic_101_tb();

reg oCLK;
reg oRST;
reg oIN;

wire iOUT;

initial begin
  oRST = 1;
  oCLK = 0;
  oIN = 0;

  $display ("time\t clk reset input output");
  $monitor ("%g\t %b   %b     %b      %b",
      $time, oCLK, oRST, oIN, iOUT);

  #5 oRST = 0;  // Assert the reset.
  #5 oRST = 1;  // De-assert the reset.
  #20 oIN = 1;
  #10 oIN = 0;
  #10 oIN = 1;
  #10 oIN = 0;
  #100 $finish;
end

// Toggle clock every 5 ticks.
always begin
  #5 oCLK = ~oCLK;
end

logic_101 U_logic_101(oCLK, oRST, oIN, iOUT);

endmodule

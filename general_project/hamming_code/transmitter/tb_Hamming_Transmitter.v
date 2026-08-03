`timescale 1ns / 1ps

module tb_Hamming_Transmitter_simple;

  reg [56:0] data_in;
  reg clk = 0;
  reg en = 0;
  wire [62:0] onotp;
  
  // Instantiate UUT
  \63_bit_ uut (
    .data_in(data_in),
    .clk(clk),
    .en(en),
    .onotp(onotp)
  );
  
  // Clock generation
  always #5 clk = ~clk;
  
  // Test sequence
  initial begin
    // Display header
    $display("\n=================================================");
    $display("  63-bit Hamming Code Transmitter Testbench");
    $display("=================================================\n");
    
    // Test 1: Reset/Idle
    $display("Test 1: Idle state (en=0)");
    data_in = 57'h0;
    en = 0;
    #20;
    $display("  Output: %h\n", onotp);
    
    // Test 2: All zeros with enable
    $display("Test 2: All zeros with enable");
    data_in = 57'h000000000000000;
    en = 1;
    #10;
    en = 0;
    #20;
    $display("  Output: %h", onotp);
    $display("  Expected parity bits: 000000 (p1-p6)\n");
    
    // Test 3: All ones
    $display("Test 3: All ones");
    data_in = 57'h1FFFFFFFFFFFFFF;
    en = 1;
    #10;
    en = 0;
    #20;
    $display("  Output: %h", onotp);
    $display("  Expected: All parity bits = 0 (even parity)\n");
    
    // Test 4: Single bit
    $display("Test 4: Single bit at data_in[0]=1");
    data_in = 57'h000000000000001;
    en = 1;
    #10;
    en = 0;
    #20;
    $display("  Output: %h", onotp);
    $display("  Expected: p1=1, p2=1 (bits 0,1 set)\n");
    
    // Test 5: Specific pattern
    $display("Test 5: Pattern 0x0A5A5A5A5A5A5A5");
    data_in = 57'h0A5A5A5A5A5A5A5;
    en = 1;
    #10;
    en = 0;
    #20;
    $display("  Output: %h\n", onotp);
    
    // Test 6: Sequential updates
    $display("Test 6: Sequential data updates");
    data_in = 57'h000000000000001;
    en = 1;
    #10;
    data_in = 57'h000000000000003;
    #10;
    data_in = 57'h000000000000007;
    #10;
    en = 0;
    #20;
    $display("  Final output: %h\n", onotp);
    
    // Test 7: Verify parity bit positions
    $display("Test 7: Verify output bit positions");
    $display("  onotp[1:0] = p1, p2");
    $display("  onotp[2]   = data (pos 3)");
    $display("  onotp[3]   = p3");
    $display("  onotp[6:4] = data (pos 5-7)");
    $display("  onotp[7]   = p4");
    $display("  onotp[14:8]= data (pos 9-15)");
    $display("  onotp[15]  = p5");
    $display("  onotp[30:16]=data (pos 17-31)");
    $display("  onotp[31]  = p6");
    $display("  onotp[62:32]=data (pos 33-63)\n");
    
    // End simulation
    #50;
    $display("=================================================");
    $display("  Simulation Complete!");
    $display("=================================================");
    $finish;
  end
  
  // Monitor
  initial begin
    $monitor("Time=%t: en=%b, data_in=%h, onotp=%h", 
             $time, en, data_in, onotp);
  end
  
endmodule
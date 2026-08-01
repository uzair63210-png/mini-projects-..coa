`timescale 1ns/1ps

`timescale 1ns/1ps

module vending_machine_TB;
    reg clk;
    reg rst;
    reg start;
    reg [9:0] amount_in;
    reg [3:0] product;
    reg emergency_stop;
    
    wire ready;
    wire [15:0] p;
    wire [3:0] dispense_signals;
    wire dispensing_pulse;
    wire done;
    wire error;
    wire [7:0] error_code;
    wire [9:0] total_dispensed;
    
    // Instantiate DUT
    vending_machine uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .amount_in(amount_in),
        .product(product),
        .emergency_stop(emergency_stop),
        .ready(ready),
        .p(p),
        .dispense_signals(dispense_signals),
        .dispensing_pulse(dispensing_pulse),
        .done(done),
        .error(error),
        .error_code(error_code),
        .total_dispensed(total_dispensed)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    // Test procedure
    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        start = 0;
        amount_in = 0;
        product = 0;
        emergency_stop = 0;
        
        // Release reset
        #10 rst = 0;
        #10;
        
        // Test 1: Product 0 with Rs. 200 (Change: 100)
        $display("========================================");
        $display("Test 1: Product 0 (Price: 100), Amount: 200");
        product = 4'd0;
        amount_in = 10'd200;
        start = 1;
        #10 start = 0;
        
        wait(done == 1 || error == 1);
        #10;
        $display("Product dispensed: %b (Bit 0 should be 1)", p);
        $display("Change dispensed: %0d (Expected: 100)", total_dispensed);
        $display("Error code: %h", error_code);
        if (total_dispensed == 10'd100 && error == 0) begin
            $display("Result: PASS");
        end else begin
            $display("Result: FAIL - Expected 100, Got %0d", total_dispensed);
        end
        $display("---");
        
        // Test 2: Product 5 with exact amount (Change: 0)
        $display("Test 2: Product 5 (Price: 75), Amount: 75");
        product = 4'd5;
        amount_in = 10'd75;
        start = 1;
        #10 start = 0;
        
        wait(done == 1 || error == 1);
        #10;
        $display("Product dispensed: %b (Bit 5 should be 1)", p);
        $display("Change dispensed: %0d (Expected: 0)", total_dispensed);
        $display("Error code: %h", error_code);
        if (total_dispensed == 10'd0 && error == 0) begin
            $display("Result: PASS");
        end else begin
            $display("Result: FAIL - Expected 0, Got %0d", total_dispensed);
        end
        $display("---");
        
        // Test 3: Product 10 with insufficient amount (Error expected)
        $display("Test 3: Product 10 (Price: 130), Amount: 100 (Insufficient)");
        product = 4'd10;
        amount_in = 10'd100;
        start = 1;
        #10 start = 0;
        
        wait(error == 1);
        #10;
        $display("Error code: %h (Expected: 02)", error_code);
        if (error_code == 8'h02) begin
            $display("Result: PASS");
        end else begin
            $display("Result: FAIL - Expected 02, Got %h", error_code);
        end
        $display("---");
        
        // Test 4: Product 15 with Rs. 500 (Change: 200)
        $display("Test 4: Product 15 (Price: 300), Amount: 500");
        product = 4'd15;
        amount_in = 10'd500;
        start = 1;
        #10 start = 0;
        
        wait(done == 1 || error == 1);
        #10;
        $display("Product dispensed: %b (Bit 15 should be 1)", p);
        $display("Change dispensed: %0d (Expected: 200)", total_dispensed);
        $display("Error code: %h", error_code);
        if (total_dispensed == 10'd200 && error == 0) begin
            $display("Result: PASS");
        end else begin
            $display("Result: FAIL - Expected 200, Got %0d", total_dispensed);
        end
        $display("---");
        
        // Test 5: Product 3 with Rs. 500 (Change: 250)
        $display("Test 5: Product 3 (Price: 250), Amount: 500");
        product = 4'd3;
        amount_in = 10'd500;
        start = 1;
        #10 start = 0;
        
        wait(done == 1 || error == 1);
        #10;
        $display("Product dispensed: %b (Bit 3 should be 1)", p);
        $display("Change dispensed: %0d (Expected: 250)", total_dispensed);
        $display("Error code: %h", error_code);
        if (total_dispensed == 10'd250 && error == 0) begin
            $display("Result: PASS");
        end else begin
            $display("Result: FAIL - Expected 250, Got %0d", total_dispensed);
        end
        $display("---");
        
        // Test 6: Product 7 with Rs. 200 (Change: 20)
        $display("Test 6: Product 7 (Price: 180), Amount: 200");
        product = 4'd7;
        amount_in = 10'd200;
        start = 1;
        #10 start = 0;
        
        wait(done == 1 || error == 1);
        #10;
        $display("Product dispensed: %b (Bit 7 should be 1)", p);
        $display("Change dispensed: %0d (Expected: 20)", total_dispensed);
        $display("Error code: %h", error_code);
        if (total_dispensed == 10'd20 && error == 0) begin
            $display("Result: PASS");
        end else begin
            $display("Result: FAIL - Expected 20, Got %0d", total_dispensed);
        end
        $display("---");
        
        // Test 7: Emergency stop
        $display("Test 7: Emergency stop");
        product = 4'd0;
        amount_in = 10'd200;
        start = 1;
        #10 start = 0;
        #10 emergency_stop = 1;
        #10 emergency_stop = 0;
        
        wait(error == 1);
        #10;
        $display("Error code: %h (Expected: 03)", error_code);
        if (error_code == 8'h03) begin
            $display("Result: PASS");
        end else begin
            $display("Result: FAIL - Expected 03, Got %h", error_code);
        end
        $display("---");
        
        // Test 8: Product 12 with Rs. 250 (Change: 40)
        $display("Test 8: Product 12 (Price: 210), Amount: 250");
        product = 4'd12;
        amount_in = 10'd250;
        start = 1;
        #10 start = 0;
        
        wait(done == 1 || error == 1);
        #10;
        $display("Product dispensed: %b (Bit 12 should be 1)", p);
        $display("Change dispensed: %0d (Expected: 40)", total_dispensed);
        $display("Error code: %h", error_code);
        if (total_dispensed == 10'd40 && error == 0) begin
            $display("Result: PASS");
        end else begin
            $display("Result: FAIL - Expected 40, Got %0d", total_dispensed);
        end
        $display("---");
        
        // Test 9: Product 2 with exact amount (Change: 0)
        $display("Test 9: Product 2 (Price: 200), Amount: 200");
        product = 4'd2;
        amount_in = 10'd200;
        start = 1;
        #10 start = 0;
        
        wait(done == 1 || error == 1);
        #10;
        $display("Product dispensed: %b (Bit 2 should be 1)", p);
        $display("Change dispensed: %0d (Expected: 0)", total_dispensed);
        $display("Error code: %h", error_code);
        if (total_dispensed == 10'd0 && error == 0) begin
            $display("Result: PASS");
        end else begin
            $display("Result: FAIL - Expected 0, Got %0d", total_dispensed);
        end
        $display("---");
        
        // Test 10: Product 8 with Rs. 150 (Change: 60)
        $display("Test 10: Product 8 (Price: 90), Amount: 150");
        product = 4'd8;
        amount_in = 10'd150;
        start = 1;
        #10 start = 0;
        
        wait(done == 1 || error == 1);
        #10;
        $display("Product dispensed: %b (Bit 8 should be 1)", p);
        $display("Change dispensed: %0d (Expected: 60)", total_dispensed);
        $display("Error code: %h", error_code);
        if (total_dispensed == 10'd60 && error == 0) begin
            $display("Result: PASS");
        end else begin
            $display("Result: FAIL - Expected 60, Got %0d", total_dispensed);
        end
        $display("---");
        
        $display("========================================");
        $display("All tests completed!");
        $display("========================================");
        
        $finish;
    end
    
    // Monitor
    initial begin
        $monitor("Time=%0t: State=%b, Ready=%b, Done=%b, Error=%b, ErrorCode=%h, Pulse=%b, Total=%0d",
                 $time, uut.state, ready, done, error, error_code, dispensing_pulse, total_dispensed);
    end
endmodule
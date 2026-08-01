`timescale 1ns/1ps

module vending_machine ( 
    input clk,
    input rst,
    input start,
    input [9:0] amount_in,
    input [3:0] product,
    input emergency_stop,
    output wire ready,
    output reg [15:0] p,
    output wire [3:0] dispense_signals,
    output wire dispensing_pulse,
    output wire done,
    output wire error,
    output reg [7:0] error_code,
    output wire [9:0] total_dispensed
);

    // 16 product prices
    reg [9:0] prize [0:15];
    
    // State machine
    reg [3:0] state;
    reg [9:0] remaining_amount;
    reg [3:0] note_type;
    reg [9:0] total;
    reg done_reg;
    reg error_reg;
    reg ready_reg;
    reg dispensing_pulse_reg;
    reg [9:0] total_dispensed_reg;
    reg [9:0] change_amount_reg;
    reg [3:0] product_selected;
    
    // FSM states
    localparam IDLE = 4'b0000;
    localparam CHECK_PRICE = 4'b0001;
    localparam CALCULATE_CHANGE = 4'b0010;
    localparam START_DISPENSE = 4'b0011;
    localparam DISPENSE_NOTE = 4'b0100;
    localparam NEXT_NOTE = 4'b0101;
    localparam DISPENSE_PRODUCT = 4'b0110;
    localparam DONE_STATE = 4'b0111;
    localparam ERROR_STATE = 4'b1000;
    
    // Error codes
    localparam ERR_NONE = 8'h00;
    localparam ERR_INVALID = 8'h01;
    localparam ERR_INSUFFICIENT = 8'h02;
    localparam ERR_EMERGENCY = 8'h03;
    localparam ERR_PRODUCT = 8'h04;
    
    // Note types
    localparam NOTE_500 = 4'd0;
    localparam NOTE_200 = 4'd1;
    localparam NOTE_100 = 4'd2;
    localparam NOTE_20  = 4'd3;
    localparam NOTE_10  = 4'd4;
    localparam NOTE_5   = 4'd5;
    localparam NOTE_2   = 4'd6;
    localparam NOTE_1   = 4'd7;
    
    // Function to get denomination value
    function [9:0] get_note_value;
        input [3:0] note_type_in;
        begin
            case (note_type_in)
                NOTE_500: get_note_value = 10'd500;
                NOTE_200: get_note_value = 10'd200;
                NOTE_100: get_note_value = 10'd100;
                NOTE_20:  get_note_value = 10'd20;
                NOTE_10:  get_note_value = 10'd10;
                NOTE_5:   get_note_value = 10'd5;
                NOTE_2:   get_note_value = 10'd2;
                NOTE_1:   get_note_value = 10'd1;
                default:  get_note_value = 10'd0;
            endcase
        end
    endfunction
    
    // Output assignments
    assign ready = ready_reg;
    assign done = done_reg;
    assign error = error_reg;
    assign dispensing_pulse = dispensing_pulse_reg;
    assign total_dispensed = total_dispensed_reg;
    assign dispense_signals = note_type;
    
    // Initialize product prices
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prize[0]  <= 10'd100;
            prize[1]  <= 10'd150;
            prize[2]  <= 10'd200;
            prize[3]  <= 10'd250;
            prize[4]  <= 10'd50;
            prize[5]  <= 10'd75;
            prize[6]  <= 10'd120;
            prize[7]  <= 10'd180;
            prize[8]  <= 10'd90;
            prize[9]  <= 10'd110;
            prize[10] <= 10'd130;
            prize[11] <= 10'd160;
            prize[12] <= 10'd210;
            prize[13] <= 10'd230;
            prize[14] <= 10'd270;
            prize[15] <= 10'd300;
        end
    end
    
    // Main FSM
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            ready_reg <= 1'b1;
            done_reg <= 1'b0;
            error_reg <= 1'b0;
            error_code <= ERR_NONE;
            remaining_amount <= 10'd0;
            note_type <= 4'd0;
            total <= 10'd0;
            total_dispensed_reg <= 10'd0;
            dispensing_pulse_reg <= 1'b0;
            change_amount_reg <= 10'd0;
            product_selected <= 4'd0;
            p <= 16'b0;
        end else if (emergency_stop && state != ERROR_STATE) begin
            error_reg <= 1'b1;
            error_code <= ERR_EMERGENCY;
            state <= ERROR_STATE;
            dispensing_pulse_reg <= 1'b0;
            p <= 16'b0;
        end else begin
            case (state)
                IDLE: begin
                    ready_reg <= 1'b1;
                    done_reg <= 1'b0;
                    dispensing_pulse_reg <= 1'b0;
                    total_dispensed_reg <= 10'd0;
                    p <= 16'b0;
                    
                    if (start && ready_reg) begin
                        if (amount_in > 10'd500 || amount_in == 10'd0) begin
                            error_reg <= 1'b1;
                            error_code <= ERR_INVALID;
                            state <= ERROR_STATE;
                        end
                        else if (product > 4'd15) begin
                            error_reg <= 1'b1;
                            error_code <= ERR_PRODUCT;
                            state <= ERROR_STATE;
                        end
                        else begin
                            product_selected <= product;
                            change_amount_reg <= amount_in - prize[product];  // Calculate here
                            state <= CHECK_PRICE;
                            ready_reg <= 1'b0;
                        end
                    end
                end
                
                CHECK_PRICE: begin
                    if (amount_in >= prize[product_selected]) begin
                        state <= CALCULATE_CHANGE;
                    end else begin
                        error_reg <= 1'b1;
                        error_code <= ERR_INSUFFICIENT;
                        state <= ERROR_STATE;
                    end
                end
                
                CALCULATE_CHANGE: begin
                    if (change_amount_reg == 10'd0) begin
                        state <= DISPENSE_PRODUCT;
                    end else begin
                        remaining_amount <= change_amount_reg;
                        total <= 10'd0;
                        total_dispensed_reg <= 10'd0;
                        note_type <= NOTE_500;
                        state <= START_DISPENSE;
                    end
                end
                
                START_DISPENSE: begin
                    if (remaining_amount == 10'd0) begin
                        state <= DISPENSE_PRODUCT;
                    end else begin
                        if (remaining_amount >= get_note_value(note_type) && get_note_value(note_type) > 0) begin
                            state <= DISPENSE_NOTE;
                            dispensing_pulse_reg <= 1'b1;
                        end else begin
                            if (note_type < NOTE_1) begin
                                note_type <= note_type + 4'd1;
                            end else begin
                                error_reg <= 1'b1;
                                error_code <= ERR_INSUFFICIENT;
                                state <= ERROR_STATE;
                            end
                        end
                    end
                end
                
                DISPENSE_NOTE: begin
                    dispensing_pulse_reg <= 1'b0;
                    remaining_amount <= remaining_amount - get_note_value(note_type);
                    total <= total + get_note_value(note_type);
                    total_dispensed_reg <= total + get_note_value(note_type);
                    
                    state <= NEXT_NOTE;
                end
                
                NEXT_NOTE: begin
                    if (remaining_amount >= get_note_value(note_type) && get_note_value(note_type) > 0) begin
                        state <= DISPENSE_NOTE;
                        dispensing_pulse_reg <= 1'b1;
                    end else begin
                        if (note_type < NOTE_1) begin
                            note_type <= note_type + 4'd1;
                            state <= START_DISPENSE;
                        end else begin
                            state <= DISPENSE_PRODUCT;
                        end
                    end
                end
                
                DISPENSE_PRODUCT: begin
                    p <= 16'b1 << product_selected;
                    state <= DONE_STATE;
                end
                
                DONE_STATE: begin
                    done_reg <= 1'b1;
                    ready_reg <= 1'b1;
                    dispensing_pulse_reg <= 1'b0;
                    error_code <= ERR_NONE;
                    
                    if (!start) begin
                        state <= IDLE;
                    end
                end
                
                ERROR_STATE: begin
                    ready_reg <= 1'b1;
                    dispensing_pulse_reg <= 1'b0;
                    p <= 16'b0;
                    
                    if (!start && !emergency_stop) begin
                        error_reg <= 1'b0;
                        error_code <= ERR_NONE;
                        state <= IDLE;
                    end
                end
                
                default: state <= IDLE;
            endcase
        end
    end
endmodule
module DIG_Register
(
    input C,
    input en,
    input D,
    output Q
);

    reg  state = 'h0;

    assign Q = state;

    always @ (posedge C) begin
        if (en)
            state <= D;
   end
endmodule

module DIG_Register_BUS #(
    parameter Bits = 1
)
(
    input C,
    input en,
    input [(Bits - 1):0]D,
    output [(Bits - 1):0]Q
);

    reg [(Bits - 1):0] state = 'h0;

    assign Q = state;

    always @ (posedge C) begin
        if (en)
            state <= D;
   end
endmodule

module Hamming_63_Transmitter (
    input [56:0] data_in,
    input clk,
    input en,
    output [62:0] encoded_out
);

    // Internal signals for data bits after registration
    wire [1:0] parity_1_2;
    wire [1:0] parity_1_2_reg;
    wire bit_3;
    wire bit_3_reg;
    wire bit_4;
    wire bit_4_reg;
    wire [2:0] bits_5_7;
    wire [2:0] bits_5_7_reg;
    wire bit_8;
    wire bit_8_reg;
    wire [6:0] bits_9_15;
    wire [6:0] bits_9_15_reg;
    wire bit_16;
    wire bit_16_reg;
    wire [14:0] bits_17_31;
    wire [14:0] bits_17_31_reg;
    wire bit_32;
    wire bit_32_reg;
    wire [30:0] bits_33_63;
    wire [30:0] bits_33_63_reg;

    // Assign data bits to internal signals
    assign bit_3 = data_in[0];
    assign bits_5_7 = data_in[3:1];
    assign bits_9_15 = data_in[10:4];
    assign bits_17_31 = data_in[25:11];
    assign bits_33_63 = data_in[56:26];

    // Register all inputs
    DIG_Register reg_bit_3 (
        .D(bit_3),
        .C(clk),
        .en(en),
        .Q(bit_3_reg)
    );

    DIG_Register_BUS #(.Bits(3)) reg_bits_5_7 (
        .D(bits_5_7),
        .C(clk),
        .en(en),
        .Q(bits_5_7_reg)
    );

    DIG_Register_BUS #(.Bits(7)) reg_bits_9_15 (
        .D(bits_9_15),
        .C(clk),
        .en(en),
        .Q(bits_9_15_reg)
    );

    DIG_Register_BUS #(.Bits(15)) reg_bits_17_31 (
        .D(bits_17_31),
        .C(clk),
        .en(en),
        .Q(bits_17_31_reg)
    );

    DIG_Register_BUS #(.Bits(31)) reg_bits_33_63 (
        .D(bits_33_63),
        .C(clk),
        .en(en),
        .Q(bits_33_63_reg)
    );

    // Extract individual bits from registered buses
    wire bit_5, bit_6, bit_7;
    assign {bit_7, bit_6, bit_5} = bits_5_7_reg;
    
    wire bit_9, bit_10, bit_11, bit_12, bit_13, bit_14, bit_15;
    assign {bit_15, bit_14, bit_13, bit_12, bit_11, bit_10, bit_9} = bits_9_15_reg;
    
    wire bit_17, bit_18, bit_19, bit_20, bit_21, bit_22, bit_23;
    wire bit_25, bit_26, bit_27, bit_28, bit_29, bit_30, bit_31;
    assign {bit_31, bit_30, bit_29, bit_28, bit_27, bit_26, bit_25, 
            bit_23, bit_22, bit_21, bit_20, bit_19, bit_18, bit_17} = bits_17_31_reg;
    
    wire bit_33, bit_34, bit_35, bit_36, bit_37, bit_38, bit_39;
    wire bit_41, bit_42, bit_43, bit_44, bit_45, bit_46, bit_47;
    wire bit_49, bit_50, bit_51, bit_52, bit_53, bit_54, bit_55;
    wire bit_56, bit_57, bit_58, bit_59, bit_60, bit_61, bit_62, bit_63;
    assign {bit_63, bit_62, bit_61, bit_60, bit_59, bit_58, bit_57, bit_56,
            bit_55, bit_54, bit_53, bit_52, bit_51, bit_50, bit_49,
            bit_47, bit_46, bit_45, bit_44, bit_43, bit_42, bit_41,
            bit_39, bit_38, bit_37, bit_36, bit_35, bit_34, bit_33} = bits_33_63_reg;

    // Hamming Code Parity Calculations
    // Bit 1 (position 0): XOR of bits with LSB = 1
    wire parity_bit_1;
    assign parity_bit_1 = (bit_3_reg ^ bit_5 ^ bit_7 ^ bit_9 ^ bit_11 ^ bit_13 ^ bit_15 ^ 
                          bit_17 ^ bit_19 ^ bit_21 ^ bit_23 ^ bit_25 ^ bit_27 ^ bit_29 ^ bit_31 ^ 
                          bit_33 ^ bit_35 ^ bit_37 ^ bit_39 ^ bit_41 ^ bit_43 ^ bit_45 ^ bit_47 ^ 
                          bit_49 ^ bit_51 ^ bit_53 ^ bit_55 ^ bit_57 ^ bit_59 ^ bit_61 ^ bit_63);

    // Bit 2 (position 1): XOR of bits with bit 1 = 1
    wire parity_bit_2;
    assign parity_bit_2 = (bit_3_reg ^ bit_6 ^ bit_7 ^ bit_10 ^ bit_11 ^ bit_14 ^ bit_15 ^ 
                          bit_18 ^ bit_19 ^ bit_22 ^ bit_23 ^ bit_26 ^ bit_27 ^ bit_30 ^ bit_31 ^ 
                          bit_34 ^ bit_35 ^ bit_38 ^ bit_39 ^ bit_42 ^ bit_43 ^ bit_46 ^ bit_47 ^ 
                          bit_50 ^ bit_51 ^ bit_54 ^ bit_55 ^ bit_58 ^ bit_59 ^ bit_62 ^ bit_63);

    // Bit 4 (position 3): XOR of bits with bit 2 = 1
    wire parity_bit_4;
    assign parity_bit_4 = (bit_5 ^ bit_6 ^ bit_7 ^ bit_12 ^ bit_13 ^ bit_14 ^ bit_15 ^ 
                          bit_20 ^ bit_21 ^ bit_22 ^ bit_23 ^ bit_28 ^ bit_29 ^ bit_30 ^ bit_31 ^ 
                          bit_36 ^ bit_37 ^ bit_38 ^ bit_39 ^ bit_44 ^ bit_45 ^ bit_46 ^ bit_47 ^ 
                          bit_52 ^ bit_53 ^ bit_54 ^ bit_55 ^ bit_60 ^ bit_61 ^ bit_62 ^ bit_63);

    // Bit 8 (position 7): XOR of bits with bit 3 = 1
    wire parity_bit_8;
    assign parity_bit_8 = (bit_9 ^ bit_10 ^ bit_11 ^ bit_12 ^ bit_13 ^ bit_14 ^ bit_15 ^ 
                          bit_25 ^ bit_26 ^ bit_27 ^ bit_28 ^ bit_29 ^ bit_30 ^ bit_31 ^ 
                          bit_41 ^ bit_42 ^ bit_43 ^ bit_44 ^ bit_45 ^ bit_46 ^ bit_47 ^ 
                          bit_57 ^ bit_58 ^ bit_59 ^ bit_60 ^ bit_61 ^ bit_62 ^ bit_63 ^ bit_41);

    // Bit 16 (position 15): XOR of bits with bit 4 = 1
    wire parity_bit_16;
    assign parity_bit_16 = (bit_17 ^ bit_18 ^ bit_19 ^ bit_20 ^ bit_21 ^ bit_22 ^ bit_23 ^ 
                           bits_17_31_reg[7] ^ bit_25 ^ bit_26 ^ bit_27 ^ bit_28 ^ bit_29 ^ bit_30 ^ bit_31 ^ 
                           bit_49 ^ bit_50 ^ bit_51 ^ bit_52 ^ bit_53 ^ bit_54 ^ bit_55 ^ 
                           bit_56 ^ bit_57 ^ bit_58 ^ bit_59 ^ bit_60 ^ bit_61 ^ bit_62 ^ bit_63);

    // Bit 32 (position 31): XOR of bits with bit 5 = 1
    wire parity_bit_32;
    assign parity_bit_32 = (bit_33 ^ bit_34 ^ bit_35 ^ bit_36 ^ bit_37 ^ bit_38 ^ bit_39 ^ 
                           bits_33_63_reg[7] ^ bit_41 ^ bit_42 ^ bit_43 ^ bit_44 ^ bit_45 ^ bit_46 ^ bit_47 ^ 
                           bits_33_63_reg[15] ^ bit_49 ^ bit_50 ^ bit_51 ^ bit_52 ^ bit_53 ^ bit_54 ^ bit_55 ^ 
                           bit_56 ^ bit_57 ^ bit_58 ^ bit_59 ^ bit_60 ^ bit_61 ^ bit_62 ^ bit_63);

    // Register parity bits
    wire [1:0] parity_1_2_comb = {parity_bit_2, parity_bit_1};
    
    DIG_Register_BUS #(.Bits(2)) reg_parity_1_2 (
        .D(parity_1_2_comb),
        .C(clk),
        .en(en),
        .Q(parity_1_2_reg)
    );

    DIG_Register reg_parity_4 (
        .D(parity_bit_4),
        .C(clk),
        .en(en),
        .Q(bit_4_reg)
    );

    DIG_Register reg_parity_8 (
        .D(parity_bit_8),
        .C(clk),
        .en(en),
        .Q(bit_8_reg)
    );

    DIG_Register reg_parity_16 (
        .D(parity_bit_16),
        .C(clk),
        .en(en),
        .Q(bit_16_reg)
    );

    DIG_Register reg_parity_32 (
        .D(parity_bit_32),
        .C(clk),
        .en(en),
        .Q(bit_32_reg)
    );
    assign encoded_out[62:32] = bits_33_63_reg;
    assign encoded_out[31] = bit_32_reg;
    assign encoded_out[30:16] = bits_17_31_reg;
    assign encoded_out[15] = bit_16_reg;
    assign encoded_out[14:8] = bits_9_15_reg;
    assign encoded_out[7] = bit_8_reg;
    assign encoded_out[6:4] = bits_5_7_reg;
    assign encoded_out[3] = bit_4_reg;
    assign encoded_out[2] = bit_3_reg;
    assign encoded_out[1:0] = parity_1_2_reg;

endmodule

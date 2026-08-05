module Hamming_Receiver_64bit (
    input [63:0] codeword_in,
    input clk,
    input en,
    output reg [56:0] data_out, 
    output reg [5:0] error_pos,  // Error position
    output reg error_detected,   // 1 if error detected
    output reg error_corrected,  // 1 if error was corrected
    output reg double_error      // 1 (uncorrectable)
);

 
  wire [62:0] code = codeword_in[62:0];
  
  wire [56:0] data_bits;
  assign data_bits[0]  = code[2];   
  assign data_bits[1]  = code[4];  
  assign data_bits[2]  = code[5];  
  assign data_bits[3]  = code[6];   
  assign data_bits[4]  = code[8];  
  assign data_bits[5]  = code[9];   //   10
  assign data_bits[6]  = code[10];  //   11
  assign data_bits[7]  = code[11];  //   12
  assign data_bits[8]  = code[12];  //   13
  assign data_bits[9]  = code[13];  //   14
  assign data_bits[10] = code[14];  //   15
  assign data_bits[11] = code[16];  //   17
  assign data_bits[12] = code[17];  //   18
  assign data_bits[13] = code[18];  //   19
  assign data_bits[14] = code[19];  //   20
  assign data_bits[15] = code[20];  //   21
  assign data_bits[16] = code[21];  //   22
  assign data_bits[17] = code[22];  //   23
  assign data_bits[18] = code[23];  //   24
  assign data_bits[19] = code[24];  //   25
  assign data_bits[20] = code[25];  //   26
  assign data_bits[21] = code[26];  //   27
  assign data_bits[22] = code[27];  //   28
  assign data_bits[23] = code[28];  //   29
  assign data_bits[24] = code[29];  //   30
  assign data_bits[25] = code[30];  //   31
  assign data_bits[26] = code[32];  //   33
  assign data_bits[27] = code[33];  //   34
  assign data_bits[28] = code[34];  //   35
  assign data_bits[29] = code[35];  //   36
  assign data_bits[30] = code[36];  //   37
  assign data_bits[31] = code[37];  //   38
  assign data_bits[32] = code[38];  //   39
  assign data_bits[33] = code[39];  //   40
  assign data_bits[34] = code[40];  //   41
  assign data_bits[35] = code[41];  //   42
  assign data_bits[36] = code[42];  //   43
  assign data_bits[37] = code[43];  //   44
  assign data_bits[38] = code[44];  //   45
  assign data_bits[39] = code[45];  //   46
  assign data_bits[40] = code[46];  //   47
  assign data_bits[41] = code[47];  //   48
  assign data_bits[42] = code[48];  //   49
  assign data_bits[43] = code[49];  //   50
  assign data_bits[44] = code[50];  //   51
  assign data_bits[45] = code[51];  //   52
  assign data_bits[46] = code[52];  //   53
  assign data_bits[47] = code[53];  //   54
  assign data_bits[48] = code[54];  //   55
  assign data_bits[49] = code[55];  //   56
  assign data_bits[50] = code[56];  //   57
  assign data_bits[51] = code[57];  //   58
  assign data_bits[52] = code[58];  //   59
  assign data_bits[53] = code[59];  //   60
  assign data_bits[54] = code[60];  //   61
  assign data_bits[55] = code[61];  //   62
  assign data_bits[56] = code[62];  //   63
  
  // Extract parity bits from codeword
  wire p1_rec = code[0];   //   1
  wire p2_rec = code[1];   //   2
  wire p3_rec = code[3];   //   4
  wire p4_rec = code[7];   //   8
  wire p5_rec = code[15];  //   16
  wire p6_rec = code[31];  //   32
  
  // Recalculate parity bits from received data
  wire p1_calc, p2_calc, p3_calc, p4_calc, p5_calc, p6_calc;
  
  assign p1_calc = ^{
    code[2], code[4], code[6], code[8], code[10], code[12], code[14],
    code[16], code[18], code[20], code[22], code[24], code[26], code[28],
    code[30], code[32], code[34], code[36], code[38], code[40], code[42],
    code[44], code[46], code[48], code[50], code[52], code[54], code[56],
    code[58], code[60], code[62]
  };
  
  assign p2_calc = ^{
    code[2], code[5], code[6], code[9], code[10], code[13], code[14],
    code[17], code[18], code[21], code[22], code[25], code[26], code[29],
    code[30], code[33], code[34], code[37], code[38], code[41], code[42],
    code[45], code[46], code[49], code[50], code[53], code[54], code[57],
    code[58], code[61], code[62]
  };
  
  assign p3_calc = ^{
    code[4], code[5], code[6], code[11], code[12], code[13], code[14],
    code[19], code[20], code[21], code[22], code[27], code[28], code[29],
    code[30], code[35], code[36], code[37], code[38], code[43], code[44],
    code[45], code[46], code[51], code[52], code[53], code[54], code[59],
    code[60], code[61], code[62]
  };
  
  assign p4_calc = ^{
    code[8], code[9], code[10], code[11], code[12], code[13], code[14],
    code[24], code[25], code[26], code[27], code[28], code[29], code[30],
    code[40], code[41], code[42], code[43], code[44], code[45], code[46],
    code[56], code[57], code[58], code[59], code[60], code[61], code[62]
  };
  
  assign p5_calc = ^{
    code[16], code[17], code[18], code[19], code[20], code[21], code[22],
    code[23], code[24], code[25], code[26], code[27], code[28], code[29],
    code[30], code[48], code[49], code[50], code[51], code[52], code[53],
    code[54], code[55], code[56], code[57], code[58], code[59], code[60],
    code[61], code[62]
  };
  
  assign p6_calc = ^{
    code[32], code[33], code[34], code[35], code[36], code[37], code[38],
    code[39], code[40], code[41], code[42], code[43], code[44], code[45],
    code[46], code[47], code[48], code[49], code[50], code[51], code[52],
    code[53], code[54], code[55], code[56], code[57], code[58], code[59],
    code[60], code[61], code[62]
  };
  
  // Calculate syndrome (error position)
  wire [5:0] syndrome;
  assign syndrome[0] = p1_rec ^ p1_calc;
  assign syndrome[1] = p2_rec ^ p2_calc;
  assign syndrome[2] = p3_rec ^ p3_calc;
  assign syndrome[3] = p4_rec ^ p4_calc;
  assign syndrome[4] = p5_rec ^ p5_calc;
  assign syndrome[5] = p6_rec ^ p6_calc;
  
  // Detect errors
  wire no_error = (syndrome == 6'b0);
  wire single_error = (syndrome != 6'b0) && (syndrome <= 6'd63);
  
  // Error correction logic
  reg [62:0] corrected_code;
  reg [5:0] error_pos_reg;
  
  always @(*) begin
    corrected_code = code;
    error_pos_reg = syndrome;
    
    if (single_error && (syndrome <= 6'd62)) begin
      // Invert the bit at the error position
      corrected_code[syndrome] = ~code[syndrome];
    end
  end
  
  // Extract corrected data
  wire [56:0] corrected_data;
  assign corrected_data[0]  = corrected_code[2];
  assign corrected_data[1]  = corrected_code[4];
  assign corrected_data[2]  = corrected_code[5];
  assign corrected_data[3]  = corrected_code[6];
  assign corrected_data[4]  = corrected_code[8];
  assign corrected_data[5]  = corrected_code[9];
  assign corrected_data[6]  = corrected_code[10];
  assign corrected_data[7]  = corrected_code[11];
  assign corrected_data[8]  = corrected_code[12];
  assign corrected_data[9]  = corrected_code[13];
  assign corrected_data[10] = corrected_code[14];
  assign corrected_data[11] = corrected_code[16];
  assign corrected_data[12] = corrected_code[17];
  assign corrected_data[13] = corrected_code[18];
  assign corrected_data[14] = corrected_code[19];
  assign corrected_data[15] = corrected_code[20];
  assign corrected_data[16] = corrected_code[21];
  assign corrected_data[17] = corrected_code[22];
  assign corrected_data[18] = corrected_code[23];
  assign corrected_data[19] = corrected_code[24];
  assign corrected_data[20] = corrected_code[25];
  assign corrected_data[21] = corrected_code[26];
  assign corrected_data[22] = corrected_code[27];
  assign corrected_data[23] = corrected_code[28];
  assign corrected_data[24] = corrected_code[29];
  assign corrected_data[25] = corrected_code[30];
  assign corrected_data[26] = corrected_code[32];
  assign corrected_data[27] = corrected_code[33];
  assign corrected_data[28] = corrected_code[34];
  assign corrected_data[29] = corrected_code[35];
  assign corrected_data[30] = corrected_code[36];
  assign corrected_data[31] = corrected_code[37];
  assign corrected_data[32] = corrected_code[38];
  assign corrected_data[33] = corrected_code[39];
  assign corrected_data[34] = corrected_code[40];
  assign corrected_data[35] = corrected_code[41];
  assign corrected_data[36] = corrected_code[42];
  assign corrected_data[37] = corrected_code[43];
  assign corrected_data[38] = corrected_code[44];
  assign corrected_data[39] = corrected_code[45];
  assign corrected_data[40] = corrected_code[46];
  assign corrected_data[41] = corrected_code[47];
  assign corrected_data[42] = corrected_code[48];
  assign corrected_data[43] = corrected_code[49];
  assign corrected_data[44] = corrected_code[50];
  assign corrected_data[45] = corrected_code[51];
  assign corrected_data[46] = corrected_code[52];
  assign corrected_data[47] = corrected_code[53];
  assign corrected_data[48] = corrected_code[54];
  assign corrected_data[49] = corrected_code[55];
  assign corrected_data[50] = corrected_code[56];
  assign corrected_data[51] = corrected_code[57];
  assign corrected_data[52] = corrected_code[58];
  assign corrected_data[53] = corrected_code[59];
  assign corrected_data[54] = corrected_code[60];
  assign corrected_data[55] = corrected_code[61];
  assign corrected_data[56] = corrected_code[62];

  always @(posedge clk) begin
    if (en) begin
      data_out <= corrected_data;
      error_pos <= error_pos_reg;
      error_detected <= single_error;
      error_corrected <= single_error && (syndrome <= 6'd62);
      double_error <= 1'b0; // Single error correction only
    end
  end

endmodule

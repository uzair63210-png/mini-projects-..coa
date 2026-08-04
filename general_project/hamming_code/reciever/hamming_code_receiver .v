
module t_decoder (
    input [5:0] sel,
    input rst,
    input clk,
    input correct,
    output reg [63:0] p
);

always @(negedge clk) begin 
    if (rst) begin 
        p = 64'b0;
    end 
	else if (correct) begin
	p = 64'b1 << sel;
    end
	else begin 
        // Thermometer: bits 0 to sel are HIGH
	p = (64'b1 << (sel + 1)) - 64'b1;
    end
end

endmodule

module Mux_2x1
(
    input [0:0] sel,
    input in_0,
    input in_1,
    output reg out
);
    always @ (*) begin
        case (sel)
            1'h0: out = in_0;
            1'h1: out = in_1;
            default:
                out = 'h0;
        endcase
    end
endmodule


module BitSel6 (
    input [63:0] in,
    input [5:0] sel,
    output out
);
    assign out = in[sel];
endmodule


module Mux_2x1_NBits #(
    parameter Bits = 2
)
(
    input [0:0] sel,
    input [(Bits - 1):0] in_0,
    input [(Bits - 1):0] in_1,
    output reg [(Bits - 1):0] out
);
    always @ (*) begin
        case (sel)
            1'h0: out = in_0;
            1'h1: out = in_1;
            default:
                out = 'h0;
        endcase
    end
endmodule


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

module CompUnsigned #(
    parameter Bits = 1
)
(
    input [(Bits -1):0] a,
    input [(Bits -1):0] b,
    output \> ,
    output \= ,
    output \<
);
    assign \> = a > b;
    assign \= = a == b;
    assign \< = a < b;
endmodule


module hamming_code_receiver_ (
  input [5:0] no_of_bit,
  input rstnotnotstart,
  input [63:0] \input ,
  input clk,
  output [56:0] onotp
);
  wire s0;
  wire [63:0] s1;
  wire [63:0] s2;
  wire \1 ;
  wire \2 ;
  wire \3 ;
  wire \4 ;
  wire \5 ;
  wire \6 ;
  wire \7 ;
  wire \8 ;
  wire \9 ;
  wire \10 ;
  wire \11 ;
  wire \12 ;
  wire \13 ;
  wire \14 ;
  wire \15 ;
  wire \16 ;
  wire \17 ;
  wire \18 ;
  wire \19 ;
  wire \20 ;
  wire \21 ;
  wire \22 ;
  wire \23 ;
  wire \24 ;
  wire \25 ;
  wire \26 ;
  wire \27 ;
  wire \28 ;
  wire \29 ;
  wire \30 ;
  wire \31 ;
  wire \32 ;
  wire \33 ;
  wire \34 ;
  wire \35 ;
  wire \36 ;
  wire \37 ;
  wire \38 ;
  wire \39 ;
  wire \40 ;
  wire \41 ;
  wire \42 ;
  wire \43 ;
  wire \44 ;
  wire \45 ;
  wire \46 ;
  wire \47 ;
  wire \48 ;
  wire \49 ;
  wire \50 ;
  wire \51 ;
  wire \52 ;
  wire \53 ;
  wire \54 ;
  wire \55 ;
  wire \56 ;
  wire \57 ;
  wire \58 ;
  wire \59 ;
  wire \60 ;
  wire \61 ;
  wire \62 ;
  wire \63 ;
  wire \64 ;
  wire \1en ;
  wire \2en ;
  wire \3en ;
  wire \4en ;
  wire \5en ;
  wire \6en ;
  wire \7en ;
  wire \8en ;
  wire \9en ;
  wire \10en ;
  wire \11en ;
  wire \12en ;
  wire \13en ;
  wire \14en ;
  wire \15en ;
  wire \16en ;
  wire \17en ;
  wire \18en ;
  wire \19en ;
  wire \20en ;
  wire \21en ;
  wire \22en ;
  wire \23en ;
  wire \24en ;
  wire \25en ;
  wire \26en ;
  wire \27en ;
  wire \28en ;
  wire \29en ;
  wire \30en ;
  wire \31en ;
  wire \32en ;
  wire \33en ;
  wire \34en ;
  wire \35en ;
  wire \36en ;
  wire \37en ;
  wire \38en ;
  wire \39en ;
  wire \40en ;
  wire \41en ;
  wire \42en ;
  wire \43en ;
  wire \44en ;
  wire \45en ;
  wire \46en ;
  wire \47en ;
  wire \48en ;
  wire \49en ;
  wire \50en ;
  wire \51en ;
  wire \52en ;
  wire \53en ;
  wire \54en ;
  wire \55en ;
  wire \56en ;
  wire \57en ;
  wire \58en ;
  wire \59en ;
  wire \60en ;
  wire \61en ;
  wire \62en ;
  wire \63en ;
  wire \64en ;
  wire s3;
  wire \1_0 ;
  wire s4;
  wire \2_0 ;
  wire s5;
  wire \3_0 ;
  wire s6;
  wire \4_0 ;
  wire s7;
  wire \5_0 ;
  wire s8;
  wire \6_0 ;
  wire s9;
  wire \7_0 ;
  wire s10;
  wire \8_0 ;
  wire s11;
  wire \9_0 ;
  wire s12;
  wire \10_0 ;
  wire s13;
  wire \11_0 ;
  wire s14;
  wire \12_0 ;
  wire s15;
  wire \13_0 ;
  wire s16;
  wire \14_0 ;
  wire s17;
  wire \15_0 ;
  wire s18;
  wire \16_0 ;
  wire s19;
  wire \17_0 ;
  wire s20;
  wire \18_0 ;
  wire s21;
  wire \19_0 ;
  wire s22;
  wire \20_0 ;
  wire s23;
  wire \21_0 ;
  wire s24;
  wire \22_0 ;
  wire s25;
  wire \23_0 ;
  wire s26;
  wire \24_0 ;
  wire s27;
  wire \25_0 ;
  wire s28;
  wire \26_0 ;
  wire s29;
  wire \27_0 ;
  wire s30;
  wire \28_0 ;
  wire s31;
  wire \29_0 ;
  wire s32;
  wire \30_0 ;
  wire s33;
  wire \31_0 ;
  wire s34;
  wire \32_0 ;
  wire s35;
  wire \33_0 ;
  wire s36;
  wire \34_0 ;
  wire s37;
  wire \35_0 ;
  wire s38;
  wire \36_0 ;
  wire s39;
  wire \37_0 ;
  wire s40;
  wire \38_0 ;
  wire s41;
  wire \39_0 ;
  wire s42;
  wire \40_0 ;
  wire s43;
  wire \41_0 ;
  wire s44;
  wire \42_0 ;
  wire s45;
  wire \43_0 ;
  wire s46;
  wire \44_0 ;
  wire s47;
  wire \45_0 ;
  wire s48;
  wire \46_0 ;
  wire s49;
  wire \47_0 ;
  wire s50;
  wire \48_0 ;
  wire s51;
  wire \49_0 ;
  wire s52;
  wire \50_0 ;
  wire s53;
  wire \51_0 ;
  wire s54;
  wire \52_0 ;
  wire s55;
  wire \53_0 ;
  wire s56;
  wire \54_0 ;
  wire s57;
  wire \55_0 ;
  wire s58;
  wire \56_0 ;
  wire s59;
  wire \57_0 ;
  wire s60;
  wire \58_0 ;
  wire s61;
  wire \59_0 ;
  wire s62;
  wire \60_0 ;
  wire s63;
  wire \61_0 ;
  wire s64;
  wire \62_0 ;
  wire s65;
  wire \63_0 ;
  wire s66;
  wire \64_0 ;
  wire [5:0] s67;
  wire s68;
  wire [63:0] s69;
  wire s70;
  // t_decoder
  t_decoder t_decoder_i0 (
    .sel( no_of_bit ),
    .rst( rstnotnotstart ),
    .clk( clk ),
    .correct( s0 ),
    .p( s1 )
  );
  Mux_2x1 Mux_2x1_i1 (
    .sel( rstnotnotstart ),
    .in_0( \1  ),
    .in_1( 1'b0 ),
    .out( s3 )
  );
  Mux_2x1 Mux_2x1_i2 (
    .sel( rstnotnotstart ),
    .in_0( \9  ),
    .in_1( 1'b0 ),
    .out( s11 )
  );
  Mux_2x1 Mux_2x1_i3 (
    .sel( rstnotnotstart ),
    .in_0( \17  ),
    .in_1( 1'b0 ),
    .out( s19 )
  );
  Mux_2x1 Mux_2x1_i4 (
    .sel( rstnotnotstart ),
    .in_0( \25  ),
    .in_1( 1'b0 ),
    .out( s27 )
  );
  Mux_2x1 Mux_2x1_i5 (
    .sel( rstnotnotstart ),
    .in_0( \33  ),
    .in_1( 1'b0 ),
    .out( s35 )
  );
  Mux_2x1 Mux_2x1_i6 (
    .sel( rstnotnotstart ),
    .in_0( \41  ),
    .in_1( 1'b0 ),
    .out( s43 )
  );
  Mux_2x1 Mux_2x1_i7 (
    .sel( rstnotnotstart ),
    .in_0( \49  ),
    .in_1( 1'b0 ),
    .out( s51 )
  );
  Mux_2x1 Mux_2x1_i8 (
    .sel( rstnotnotstart ),
    .in_0( \57  ),
    .in_1( 1'b0 ),
    .out( s59 )
  );
  Mux_2x1 Mux_2x1_i9 (
    .sel( rstnotnotstart ),
    .in_0( \2  ),
    .in_1( 1'b0 ),
    .out( s4 )
  );
  Mux_2x1 Mux_2x1_i10 (
    .sel( rstnotnotstart ),
    .in_0( \10  ),
    .in_1( 1'b0 ),
    .out( s12 )
  );
  Mux_2x1 Mux_2x1_i11 (
    .sel( rstnotnotstart ),
    .in_0( \18  ),
    .in_1( 1'b0 ),
    .out( s20 )
  );
  Mux_2x1 Mux_2x1_i12 (
    .sel( rstnotnotstart ),
    .in_0( \26  ),
    .in_1( 1'b0 ),
    .out( s28 )
  );
  Mux_2x1 Mux_2x1_i13 (
    .sel( rstnotnotstart ),
    .in_0( \34  ),
    .in_1( 1'b0 ),
    .out( s36 )
  );
  Mux_2x1 Mux_2x1_i14 (
    .sel( rstnotnotstart ),
    .in_0( \42  ),
    .in_1( 1'b0 ),
    .out( s44 )
  );
  Mux_2x1 Mux_2x1_i15 (
    .sel( rstnotnotstart ),
    .in_0( \50  ),
    .in_1( 1'b0 ),
    .out( s52 )
  );
  Mux_2x1 Mux_2x1_i16 (
    .sel( rstnotnotstart ),
    .in_0( \58  ),
    .in_1( 1'b0 ),
    .out( s60 )
  );
  Mux_2x1 Mux_2x1_i17 (
    .sel( rstnotnotstart ),
    .in_0( \3  ),
    .in_1( 1'b0 ),
    .out( s5 )
  );
  Mux_2x1 Mux_2x1_i18 (
    .sel( rstnotnotstart ),
    .in_0( \11  ),
    .in_1( 1'b0 ),
    .out( s13 )
  );
  Mux_2x1 Mux_2x1_i19 (
    .sel( rstnotnotstart ),
    .in_0( \19  ),
    .in_1( 1'b0 ),
    .out( s21 )
  );
  Mux_2x1 Mux_2x1_i20 (
    .sel( rstnotnotstart ),
    .in_0( \27  ),
    .in_1( 1'b0 ),
    .out( s29 )
  );
  Mux_2x1 Mux_2x1_i21 (
    .sel( rstnotnotstart ),
    .in_0( \35  ),
    .in_1( 1'b0 ),
    .out( s37 )
  );
  Mux_2x1 Mux_2x1_i22 (
    .sel( rstnotnotstart ),
    .in_0( \43  ),
    .in_1( 1'b0 ),
    .out( s45 )
  );
  Mux_2x1 Mux_2x1_i23 (
    .sel( rstnotnotstart ),
    .in_0( \51  ),
    .in_1( 1'b0 ),
    .out( s53 )
  );
  Mux_2x1 Mux_2x1_i24 (
    .sel( rstnotnotstart ),
    .in_0( \59  ),
    .in_1( 1'b0 ),
    .out( s61 )
  );
  Mux_2x1 Mux_2x1_i25 (
    .sel( rstnotnotstart ),
    .in_0( \4  ),
    .in_1( 1'b0 ),
    .out( s6 )
  );
  Mux_2x1 Mux_2x1_i26 (
    .sel( rstnotnotstart ),
    .in_0( \12  ),
    .in_1( 1'b0 ),
    .out( s14 )
  );
  Mux_2x1 Mux_2x1_i27 (
    .sel( rstnotnotstart ),
    .in_0( \20  ),
    .in_1( 1'b0 ),
    .out( s22 )
  );
  Mux_2x1 Mux_2x1_i28 (
    .sel( rstnotnotstart ),
    .in_0( \28  ),
    .in_1( 1'b0 ),
    .out( s30 )
  );
  Mux_2x1 Mux_2x1_i29 (
    .sel( rstnotnotstart ),
    .in_0( \36  ),
    .in_1( 1'b0 ),
    .out( s38 )
  );
  Mux_2x1 Mux_2x1_i30 (
    .sel( rstnotnotstart ),
    .in_0( \44  ),
    .in_1( 1'b0 ),
    .out( s46 )
  );
  Mux_2x1 Mux_2x1_i31 (
    .sel( rstnotnotstart ),
    .in_0( \52  ),
    .in_1( 1'b0 ),
    .out( s54 )
  );
  Mux_2x1 Mux_2x1_i32 (
    .sel( rstnotnotstart ),
    .in_0( \60  ),
    .in_1( 1'b0 ),
    .out( s62 )
  );
  Mux_2x1 Mux_2x1_i33 (
    .sel( rstnotnotstart ),
    .in_0( \5  ),
    .in_1( 1'b0 ),
    .out( s7 )
  );
  Mux_2x1 Mux_2x1_i34 (
    .sel( rstnotnotstart ),
    .in_0( \13  ),
    .in_1( 1'b0 ),
    .out( s15 )
  );
  Mux_2x1 Mux_2x1_i35 (
    .sel( rstnotnotstart ),
    .in_0( \21  ),
    .in_1( 1'b0 ),
    .out( s23 )
  );
  Mux_2x1 Mux_2x1_i36 (
    .sel( rstnotnotstart ),
    .in_0( \29  ),
    .in_1( 1'b0 ),
    .out( s31 )
  );
  Mux_2x1 Mux_2x1_i37 (
    .sel( rstnotnotstart ),
    .in_0( \37  ),
    .in_1( 1'b0 ),
    .out( s39 )
  );
  Mux_2x1 Mux_2x1_i38 (
    .sel( rstnotnotstart ),
    .in_0( \45  ),
    .in_1( 1'b0 ),
    .out( s47 )
  );
  Mux_2x1 Mux_2x1_i39 (
    .sel( rstnotnotstart ),
    .in_0( \53  ),
    .in_1( 1'b0 ),
    .out( s55 )
  );
  Mux_2x1 Mux_2x1_i40 (
    .sel( rstnotnotstart ),
    .in_0( \61  ),
    .in_1( 1'b0 ),
    .out( s63 )
  );
  Mux_2x1 Mux_2x1_i41 (
    .sel( rstnotnotstart ),
    .in_0( \6  ),
    .in_1( 1'b0 ),
    .out( s8 )
  );
  Mux_2x1 Mux_2x1_i42 (
    .sel( rstnotnotstart ),
    .in_0( \14  ),
    .in_1( 1'b0 ),
    .out( s16 )
  );
  Mux_2x1 Mux_2x1_i43 (
    .sel( rstnotnotstart ),
    .in_0( \22  ),
    .in_1( 1'b0 ),
    .out( s24 )
  );
  Mux_2x1 Mux_2x1_i44 (
    .sel( rstnotnotstart ),
    .in_0( \30  ),
    .in_1( 1'b0 ),
    .out( s32 )
  );
  Mux_2x1 Mux_2x1_i45 (
    .sel( rstnotnotstart ),
    .in_0( \38  ),
    .in_1( 1'b0 ),
    .out( s40 )
  );
  Mux_2x1 Mux_2x1_i46 (
    .sel( rstnotnotstart ),
    .in_0( \46  ),
    .in_1( 1'b0 ),
    .out( s48 )
  );
  Mux_2x1 Mux_2x1_i47 (
    .sel( rstnotnotstart ),
    .in_0( \54  ),
    .in_1( 1'b0 ),
    .out( s56 )
  );
  Mux_2x1 Mux_2x1_i48 (
    .sel( rstnotnotstart ),
    .in_0( \62  ),
    .in_1( 1'b0 ),
    .out( s64 )
  );
  Mux_2x1 Mux_2x1_i49 (
    .sel( rstnotnotstart ),
    .in_0( \7  ),
    .in_1( 1'b0 ),
    .out( s9 )
  );
  Mux_2x1 Mux_2x1_i50 (
    .sel( rstnotnotstart ),
    .in_0( \15  ),
    .in_1( 1'b0 ),
    .out( s17 )
  );
  Mux_2x1 Mux_2x1_i51 (
    .sel( rstnotnotstart ),
    .in_0( \23  ),
    .in_1( 1'b0 ),
    .out( s25 )
  );
  Mux_2x1 Mux_2x1_i52 (
    .sel( rstnotnotstart ),
    .in_0( \31  ),
    .in_1( 1'b0 ),
    .out( s33 )
  );
  Mux_2x1 Mux_2x1_i53 (
    .sel( rstnotnotstart ),
    .in_0( \39  ),
    .in_1( 1'b0 ),
    .out( s41 )
  );
  Mux_2x1 Mux_2x1_i54 (
    .sel( rstnotnotstart ),
    .in_0( \47  ),
    .in_1( 1'b0 ),
    .out( s49 )
  );
  Mux_2x1 Mux_2x1_i55 (
    .sel( rstnotnotstart ),
    .in_0( \55  ),
    .in_1( 1'b0 ),
    .out( s57 )
  );
  Mux_2x1 Mux_2x1_i56 (
    .sel( rstnotnotstart ),
    .in_0( \63  ),
    .in_1( 1'b0 ),
    .out( s65 )
  );
  Mux_2x1 Mux_2x1_i57 (
    .sel( rstnotnotstart ),
    .in_0( \8  ),
    .in_1( 1'b0 ),
    .out( s10 )
  );
  Mux_2x1 Mux_2x1_i58 (
    .sel( rstnotnotstart ),
    .in_0( \16  ),
    .in_1( 1'b0 ),
    .out( s18 )
  );
  Mux_2x1 Mux_2x1_i59 (
    .sel( rstnotnotstart ),
    .in_0( \24  ),
    .in_1( 1'b0 ),
    .out( s26 )
  );
  Mux_2x1 Mux_2x1_i60 (
    .sel( rstnotnotstart ),
    .in_0( \32  ),
    .in_1( 1'b0 ),
    .out( s34 )
  );
  Mux_2x1 Mux_2x1_i61 (
    .sel( rstnotnotstart ),
    .in_0( \40  ),
    .in_1( 1'b0 ),
    .out( s42 )
  );
  Mux_2x1 Mux_2x1_i62 (
    .sel( rstnotnotstart ),
    .in_0( \48  ),
    .in_1( 1'b0 ),
    .out( s50 )
  );
  Mux_2x1 Mux_2x1_i63 (
    .sel( rstnotnotstart ),
    .in_0( \56  ),
    .in_1( 1'b0 ),
    .out( s58 )
  );
  Mux_2x1 Mux_2x1_i64 (
    .sel( rstnotnotstart ),
    .in_0( \64  ),
    .in_1( 1'b0 ),
    .out( s66 )
  );
  BitSel6 BitSel6_i65 (
    .sel( s67 ),
    .in( \input  ),
    .out( s68 )
  );
  Mux_2x1_NBits #(
    .Bits(64)
  )
  Mux_2x1_NBits_i66 (
    .sel( s0 ),
    .in_0( \input  ),
    .in_1( s69 ),
    .out( s2 )
  );
  assign s70 = ~ s68;
  assign \1  = s2[0];
  assign \2  = s2[1];
  assign \3  = s2[2];
  assign \4  = s2[3];
  assign \5  = s2[4];
  assign \6  = s2[5];
  assign \7  = s2[6];
  assign \8  = s2[7];
  assign \9  = s2[8];
  assign \10  = s2[9];
  assign \11  = s2[10];
  assign \12  = s2[11];
  assign \13  = s2[12];
  assign \14  = s2[13];
  assign \15  = s2[14];
  assign \16  = s2[15];
  assign \17  = s2[16];
  assign \18  = s2[17];
  assign \19  = s2[18];
  assign \20  = s2[19];
  assign \21  = s2[20];
  assign \22  = s2[21];
  assign \23  = s2[22];
  assign \24  = s2[23];
  assign \25  = s2[24];
  assign \26  = s2[25];
  assign \27  = s2[26];
  assign \28  = s2[27];
  assign \29  = s2[28];
  assign \30  = s2[29];
  assign \31  = s2[30];
  assign \32  = s2[31];
  assign \33  = s2[32];
  assign \34  = s2[33];
  assign \35  = s2[34];
  assign \36  = s2[35];
  assign \37  = s2[36];
  assign \38  = s2[37];
  assign \39  = s2[38];
  assign \40  = s2[39];
  assign \41  = s2[40];
  assign \42  = s2[41];
  assign \43  = s2[42];
  assign \44  = s2[43];
  assign \45  = s2[44];
  assign \46  = s2[45];
  assign \47  = s2[46];
  assign \48  = s2[47];
  assign \49  = s2[48];
  assign \50  = s2[49];
  assign \51  = s2[50];
  assign \52  = s2[51];
  assign \53  = s2[52];
  assign \54  = s2[53];
  assign \55  = s2[54];
  assign \56  = s2[55];
  assign \57  = s2[56];
  assign \58  = s2[57];
  assign \59  = s2[58];
  assign \60  = s2[59];
  assign \61  = s2[60];
  assign \62  = s2[61];
  assign \63  = s2[62];
  assign \64  = s2[63];
  assign \1en  = s1[0];
  assign \2en  = s1[1];
  assign \3en  = s1[2];
  assign \4en  = s1[3];
  assign \5en  = s1[4];
  assign \6en  = s1[5];
  assign \7en  = s1[6];
  assign \8en  = s1[7];
  assign \9en  = s1[8];
  assign \10en  = s1[9];
  assign \11en  = s1[10];
  assign \12en  = s1[11];
  assign \13en  = s1[12];
  assign \14en  = s1[13];
  assign \15en  = s1[14];
  assign \16en  = s1[15];
  assign \17en  = s1[16];
  assign \18en  = s1[17];
  assign \19en  = s1[18];
  assign \20en  = s1[19];
  assign \21en  = s1[20];
  assign \22en  = s1[21];
  assign \23en  = s1[22];
  assign \24en  = s1[23];
  assign \25en  = s1[24];
  assign \26en  = s1[25];
  assign \27en  = s1[26];
  assign \28en  = s1[27];
  assign \29en  = s1[28];
  assign \30en  = s1[29];
  assign \31en  = s1[30];
  assign \32en  = s1[31];
  assign \33en  = s1[32];
  assign \34en  = s1[33];
  assign \35en  = s1[34];
  assign \36en  = s1[35];
  assign \37en  = s1[36];
  assign \38en  = s1[37];
  assign \39en  = s1[38];
  assign \40en  = s1[39];
  assign \41en  = s1[40];
  assign \42en  = s1[41];
  assign \43en  = s1[42];
  assign \44en  = s1[43];
  assign \45en  = s1[44];
  assign \46en  = s1[45];
  assign \47en  = s1[46];
  assign \48en  = s1[47];
  assign \49en  = s1[48];
  assign \50en  = s1[49];
  assign \51en  = s1[50];
  assign \52en  = s1[51];
  assign \53en  = s1[52];
  assign \54en  = s1[53];
  assign \55en  = s1[54];
  assign \56en  = s1[55];
  assign \57en  = s1[56];
  assign \58en  = s1[57];
  assign \59en  = s1[58];
  assign \60en  = s1[59];
  assign \61en  = s1[60];
  assign \62en  = s1[61];
  assign \63en  = s1[62];
  assign \64en  = s1[63];
  DIG_Register DIG_Register_i67 (
    .D( s3 ),
    .C( clk ),
    .en( \1en  ),
    .Q( \1_0  )
  );
  DIG_Register DIG_Register_i68 (
    .D( s4 ),
    .C( clk ),
    .en( \2en  ),
    .Q( \2_0  )
  );
  DIG_Register DIG_Register_i69 (
    .D( s5 ),
    .C( clk ),
    .en( \3en  ),
    .Q( \3_0  )
  );
  DIG_Register DIG_Register_i70 (
    .D( s6 ),
    .C( clk ),
    .en( \4en  ),
    .Q( \4_0  )
  );
  DIG_Register DIG_Register_i71 (
    .D( s7 ),
    .C( clk ),
    .en( \5en  ),
    .Q( \5_0  )
  );
  DIG_Register DIG_Register_i72 (
    .D( s8 ),
    .C( clk ),
    .en( \6en  ),
    .Q( \6_0  )
  );
  DIG_Register DIG_Register_i73 (
    .D( s9 ),
    .C( clk ),
    .en( \7en  ),
    .Q( \7_0  )
  );
  DIG_Register DIG_Register_i74 (
    .D( s10 ),
    .C( clk ),
    .en( \8en  ),
    .Q( \8_0  )
  );
  DIG_Register DIG_Register_i75 (
    .D( s11 ),
    .C( clk ),
    .en( \9en  ),
    .Q( \9_0  )
  );
  DIG_Register DIG_Register_i76 (
    .D( s12 ),
    .C( clk ),
    .en( \10en  ),
    .Q( \10_0  )
  );
  DIG_Register DIG_Register_i77 (
    .D( s13 ),
    .C( clk ),
    .en( \11en  ),
    .Q( \11_0  )
  );
  DIG_Register DIG_Register_i78 (
    .D( s14 ),
    .C( clk ),
    .en( \12en  ),
    .Q( \12_0  )
  );
  DIG_Register DIG_Register_i79 (
    .D( s15 ),
    .C( clk ),
    .en( \13en  ),
    .Q( \13_0  )
  );
  DIG_Register DIG_Register_i80 (
    .D( s16 ),
    .C( clk ),
    .en( \14en  ),
    .Q( \14_0  )
  );
  DIG_Register DIG_Register_i81 (
    .D( s17 ),
    .C( clk ),
    .en( \15en  ),
    .Q( \15_0  )
  );
  DIG_Register DIG_Register_i82 (
    .D( s18 ),
    .C( clk ),
    .en( \16en  ),
    .Q( \16_0  )
  );
  DIG_Register DIG_Register_i83 (
    .D( s19 ),
    .C( clk ),
    .en( \17en  ),
    .Q( \17_0  )
  );
  DIG_Register DIG_Register_i84 (
    .D( s20 ),
    .C( clk ),
    .en( \18en  ),
    .Q( \18_0  )
  );
  DIG_Register DIG_Register_i85 (
    .D( s21 ),
    .C( clk ),
    .en( \19en  ),
    .Q( \19_0  )
  );
  DIG_Register DIG_Register_i86 (
    .D( s22 ),
    .C( clk ),
    .en( \20en  ),
    .Q( \20_0  )
  );
  DIG_Register DIG_Register_i87 (
    .D( s23 ),
    .C( clk ),
    .en( \21en  ),
    .Q( \21_0  )
  );
  DIG_Register DIG_Register_i88 (
    .D( s24 ),
    .C( clk ),
    .en( \22en  ),
    .Q( \22_0  )
  );
  DIG_Register DIG_Register_i89 (
    .D( s25 ),
    .C( clk ),
    .en( \23en  ),
    .Q( \23_0  )
  );
  DIG_Register DIG_Register_i90 (
    .D( s26 ),
    .C( clk ),
    .en( \24en  ),
    .Q( \24_0  )
  );
  DIG_Register DIG_Register_i91 (
    .D( s27 ),
    .C( clk ),
    .en( \25en  ),
    .Q( \25_0  )
  );
  DIG_Register DIG_Register_i92 (
    .D( s28 ),
    .C( clk ),
    .en( \26en  ),
    .Q( \26_0  )
  );
  DIG_Register DIG_Register_i93 (
    .D( s29 ),
    .C( clk ),
    .en( \27en  ),
    .Q( \27_0  )
  );
  DIG_Register DIG_Register_i94 (
    .D( s30 ),
    .C( clk ),
    .en( \28en  ),
    .Q( \28_0  )
  );
  DIG_Register DIG_Register_i95 (
    .D( s31 ),
    .C( clk ),
    .en( \29en  ),
    .Q( \29_0  )
  );
  DIG_Register DIG_Register_i96 (
    .D( s32 ),
    .C( clk ),
    .en( \30en  ),
    .Q( \30_0  )
  );
  DIG_Register DIG_Register_i97 (
    .D( s33 ),
    .C( clk ),
    .en( \31en  ),
    .Q( \31_0  )
  );
  DIG_Register DIG_Register_i98 (
    .D( s34 ),
    .C( clk ),
    .en( \32en  ),
    .Q( \32_0  )
  );
  DIG_Register DIG_Register_i99 (
    .D( s35 ),
    .C( clk ),
    .en( \33en  ),
    .Q( \33_0  )
  );
  DIG_Register DIG_Register_i100 (
    .D( s36 ),
    .C( clk ),
    .en( \34en  ),
    .Q( \34_0  )
  );
  DIG_Register DIG_Register_i101 (
    .D( s37 ),
    .C( clk ),
    .en( \35en  ),
    .Q( \35_0  )
  );
  DIG_Register DIG_Register_i102 (
    .D( s38 ),
    .C( clk ),
    .en( \36en  ),
    .Q( \36_0  )
  );
  DIG_Register DIG_Register_i103 (
    .D( s39 ),
    .C( clk ),
    .en( \37en  ),
    .Q( \37_0  )
  );
  DIG_Register DIG_Register_i104 (
    .D( s40 ),
    .C( clk ),
    .en( \38en  ),
    .Q( \38_0  )
  );
  DIG_Register DIG_Register_i105 (
    .D( s41 ),
    .C( clk ),
    .en( \39en  ),
    .Q( \39_0  )
  );
  DIG_Register DIG_Register_i106 (
    .D( s42 ),
    .C( clk ),
    .en( \40en  ),
    .Q( \40_0  )
  );
  DIG_Register DIG_Register_i107 (
    .D( s43 ),
    .C( clk ),
    .en( \41en  ),
    .Q( \41_0  )
  );
  DIG_Register DIG_Register_i108 (
    .D( s44 ),
    .C( clk ),
    .en( \42en  ),
    .Q( \42_0  )
  );
  DIG_Register DIG_Register_i109 (
    .D( s45 ),
    .C( clk ),
    .en( \43en  ),
    .Q( \43_0  )
  );
  DIG_Register DIG_Register_i110 (
    .D( s46 ),
    .C( clk ),
    .en( \44en  ),
    .Q( \44_0  )
  );
  DIG_Register DIG_Register_i111 (
    .D( s47 ),
    .C( clk ),
    .en( \45en  ),
    .Q( \45_0  )
  );
  DIG_Register DIG_Register_i112 (
    .D( s48 ),
    .C( clk ),
    .en( \46en  ),
    .Q( \46_0  )
  );
  DIG_Register DIG_Register_i113 (
    .D( s49 ),
    .C( clk ),
    .en( \47en  ),
    .Q( \47_0  )
  );
  DIG_Register DIG_Register_i114 (
    .D( s50 ),
    .C( clk ),
    .en( \48en  ),
    .Q( \48_0  )
  );
  DIG_Register DIG_Register_i115 (
    .D( s51 ),
    .C( clk ),
    .en( \49en  ),
    .Q( \49_0  )
  );
  DIG_Register DIG_Register_i116 (
    .D( s52 ),
    .C( clk ),
    .en( \50en  ),
    .Q( \50_0  )
  );
  DIG_Register DIG_Register_i117 (
    .D( s53 ),
    .C( clk ),
    .en( \51en  ),
    .Q( \51_0  )
  );
  DIG_Register DIG_Register_i118 (
    .D( s54 ),
    .C( clk ),
    .en( \52en  ),
    .Q( \52_0  )
  );
  DIG_Register DIG_Register_i119 (
    .D( s55 ),
    .C( clk ),
    .en( \53en  ),
    .Q( \53_0  )
  );
  DIG_Register DIG_Register_i120 (
    .D( s56 ),
    .C( clk ),
    .en( \54en  ),
    .Q( \54_0  )
  );
  DIG_Register DIG_Register_i121 (
    .D( s57 ),
    .C( clk ),
    .en( \55en  ),
    .Q( \55_0  )
  );
  DIG_Register DIG_Register_i122 (
    .D( s58 ),
    .C( clk ),
    .en( \56en  ),
    .Q( \56_0  )
  );
  DIG_Register DIG_Register_i123 (
    .D( s59 ),
    .C( clk ),
    .en( \57en  ),
    .Q( \57_0  )
  );
  DIG_Register DIG_Register_i124 (
    .D( s60 ),
    .C( clk ),
    .en( \58en  ),
    .Q( \58_0  )
  );
  DIG_Register DIG_Register_i125 (
    .D( s61 ),
    .C( clk ),
    .en( \59en  ),
    .Q( \59_0  )
  );
  DIG_Register DIG_Register_i126 (
    .D( s62 ),
    .C( clk ),
    .en( \60en  ),
    .Q( \60_0  )
  );
  DIG_Register DIG_Register_i127 (
    .D( s63 ),
    .C( clk ),
    .en( \61en  ),
    .Q( \61_0  )
  );
  DIG_Register DIG_Register_i128 (
    .D( s64 ),
    .C( clk ),
    .en( \62en  ),
    .Q( \62_0  )
  );
  DIG_Register DIG_Register_i129 (
    .D( s65 ),
    .C( clk ),
    .en( \63en  ),
    .Q( \63_0  )
  );
  DIG_Register DIG_Register_i130 (
    .D( s66 ),
    .C( clk ),
    .en( \64en  ),
    .Q( \64_0  )
  );
  Mux_2x1_NBits #(
    .Bits(64)
  )
  Mux_2x1_NBits_i131 (
    .sel( s70 ),
    .in_0( 64'b0 ),
    .in_1( 64'b1111111111111111111111111111111111111111111111111111111111111111 ),
    .out( s69 )
  );
  assign s67[0] = (\51_0  ^ \57_0  ^ \47_0  ^ \59_0  ^ \37_0  ^ \43_0  ^ \49_0  ^ \39_0  ^ \33_0  ^ \29_0  ^ \35_0  ^ \41_0  ^ \31_0  ^ \45_0  ^ \21_0  ^ \27_0  ^ \23_0  ^ \63_0  ^ \13_0  ^ \19_0  ^ \25_0  ^ \15_0  ^ \55_0  ^ \5_0  ^ \11_0  ^ \17_0  ^ \7_0  ^ \61_0  ^ \53_0  ^ \3_0  ^ \9_0  ^ \1_0 );
  assign s67[1] = (\63_0  ^ \62_0  ^ \59_0  ^ \58_0  ^ \55_0  ^ \54_0  ^ \51_0  ^ \50_0  ^ \47_0  ^ \46_0  ^ \43_0  ^ \42_0  ^ \39_0  ^ \38_0  ^ \35_0  ^ \34_0  ^ \31_0  ^ \30_0  ^ \27_0  ^ \26_0  ^ \23_0  ^ \22_0  ^ \19_0  ^ \18_0  ^ \15_0  ^ \14_0  ^ \11_0  ^ \10_0  ^ \7_0  ^ \6_0  ^ \3_0  ^ \2_0 );
  assign s67[2] = (\63_0  ^ \62_0  ^ \61_0  ^ \60_0  ^ \55_0  ^ \54_0  ^ \53_0  ^ \52_0  ^ \47_0  ^ \46_0  ^ \45_0  ^ \44_0  ^ \39_0  ^ \38_0  ^ \37_0  ^ \36_0  ^ \31_0  ^ \30_0  ^ \29_0  ^ \28_0  ^ \23_0  ^ \22_0  ^ \21_0  ^ \20_0  ^ \15_0  ^ \14_0  ^ \13_0  ^ \12_0  ^ \7_0  ^ \6_0  ^ \5_0  ^ \4_0 );
  assign s67[3] = (\60_0  ^ \59_0  ^ \58_0  ^ \57_0  ^ \56_0  ^ \47_0  ^ \46_0  ^ \45_0  ^ \44_0  ^ \43_0  ^ \42_0  ^ \41_0  ^ \40_0  ^ \31_0  ^ \30_0  ^ \29_0  ^ \28_0  ^ \27_0  ^ \26_0  ^ \25_0  ^ \24_0  ^ \15_0  ^ \14_0  ^ \13_0  ^ \12_0  ^ \11_0  ^ \10_0  ^ \9_0  ^ \8_0 );
  assign s67[4] = (\62_0  ^ \61_0  ^ \60_0  ^ \59_0  ^ \58_0  ^ \57_0  ^ \56_0  ^ \55_0  ^ \54_0  ^ \53_0  ^ \52_0  ^ \51_0  ^ \50_0  ^ \49_0  ^ \48_0  ^ \31_0  ^ \30_0  ^ \29_0  ^ \28_0  ^ \27_0  ^ \26_0  ^ \25_0  ^ \24_0  ^ \23_0  ^ \22_0  ^ \21_0  ^ \20_0  ^ \19_0  ^ \18_0  ^ \17_0  ^ \16_0 );
  assign s67[5] = (\63_0  ^ \62_0  ^ \61_0  ^ \60_0  ^ \59_0  ^ \58_0  ^ \57_0  ^ \56_0  ^ \55_0  ^ \54_0  ^ \53_0  ^ \52_0  ^ \51_0  ^ \50_0  ^ \49_0  ^ \48_0  ^ \47_0  ^ \46_0  ^ \45_0  ^ \44_0  ^ \43_0  ^ \42_0  ^ \41_0  ^ \40_0  ^ \39_0  ^ \38_0  ^ \37_0  ^ \36_0  ^ \35_0  ^ \34_0  ^ \33_0  ^ \32_0 );
  assign onotp[0] = \3_0 ;
  assign onotp[1] = \5_0 ;
  assign onotp[2] = \6_0 ;
  assign onotp[3] = \7_0 ;
  assign onotp[4] = \9_0 ;
  assign onotp[5] = \10_0 ;
  assign onotp[6] = \11_0 ;
  assign onotp[7] = \12_0 ;
  assign onotp[8] = \13_0 ;
  assign onotp[9] = \14_0 ;
  assign onotp[10] = \15_0 ;
  assign onotp[11] = \17_0 ;
  assign onotp[12] = \18_0 ;
  assign onotp[13] = \19_0 ;
  assign onotp[14] = \20_0 ;
  assign onotp[15] = \21_0 ;
  assign onotp[16] = \22_0 ;
  assign onotp[17] = \23_0 ;
  assign onotp[18] = \24_0 ;
  assign onotp[19] = \25_0 ;
  assign onotp[20] = \26_0 ;
  assign onotp[21] = \27_0 ;
  assign onotp[22] = \28_0 ;
  assign onotp[23] = \29_0 ;
  assign onotp[24] = \30_0 ;
  assign onotp[25] = \31_0 ;
  assign onotp[26] = \33_0 ;
  assign onotp[27] = \34_0 ;
  assign onotp[28] = \35_0 ;
  assign onotp[29] = \36_0 ;
  assign onotp[30] = \37_0 ;
  assign onotp[31] = \38_0 ;
  assign onotp[32] = \39_0 ;
  assign onotp[33] = \40_0 ;
  assign onotp[34] = \41_0 ;
  assign onotp[35] = \42_0 ;
  assign onotp[36] = \43_0 ;
  assign onotp[37] = \44_0 ;
  assign onotp[38] = \45_0 ;
  assign onotp[39] = \46_0 ;
  assign onotp[40] = \47_0 ;
  assign onotp[41] = \48_0 ;
  assign onotp[42] = \49_0 ;
  assign onotp[43] = \50_0 ;
  assign onotp[44] = \51_0 ;
  assign onotp[45] = \52_0 ;
  assign onotp[46] = \53_0 ;
  assign onotp[47] = \54_0 ;
  assign onotp[48] = \55_0 ;
  assign onotp[49] = \56_0 ;
  assign onotp[50] = \57_0 ;
  assign onotp[51] = \58_0 ;
  assign onotp[52] = \59_0 ;
  assign onotp[53] = \60_0 ;
  assign onotp[54] = \61_0 ;
  assign onotp[55] = \62_0 ;
  assign onotp[56] = \63_0 ;
  CompUnsigned #(
    .Bits(6)
  )
  CompUnsigned_i132 (
    .a( s67 ),
    .b( 6'b0 ),
    .\> ( s0 )
  );
endmodule

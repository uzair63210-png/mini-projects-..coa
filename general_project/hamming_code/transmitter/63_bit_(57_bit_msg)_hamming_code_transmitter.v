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
//63_bit_(57_bit_msg)_hamming_code_transmitter
module \63_bit_  (
  input [56:0] data_in,
  input clk,
  input en,
  output [62:0] onotp
);
  wire [1:0] s0;
  wire [1:0] s1;
  wire s2;
  wire \3 ;
  wire s3;
  wire \4 ;
  wire [2:0] s4;
  wire [2:0] s5;
  wire s6;
  wire \8 ;
  wire [6:0] s7;
  wire [6:0] s8;
  wire s9;
  wire \16 ;
  wire [14:0] s10;
  wire [14:0] s11;
  wire s12;
  wire \32 ;
  wire [30:0] s13;
  wire [30:0] s14;
  wire \5 ;
  wire \6 ;
  wire \7 ;
  wire \9 ;
  wire \10 ;
  wire \11 ;
  wire \12 ;
  wire \13 ;
  wire \14 ;
  wire \15 ;
  wire \17 ;
  wire \18 ;
  wire \19 ;
  wire \20 ;
  wire \21 ;
  wire \22 ;
  wire \23 ;
  wire \25 ;
  wire \26 ;
  wire \27 ;
  wire \28 ;
  wire \29 ;
  wire \30 ;
  wire \31 ;
  wire \33 ;
  wire \34 ;
  wire \35 ;
  wire \36 ;
  wire \37 ;
  wire \38 ;
  wire \39 ;
  wire \41 ;
  wire \42 ;
  wire \43 ;
  wire \44 ;
  wire \45 ;
  wire \46 ;
  wire \47 ;
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
  wire \1 ;
  wire \2 ;
  assign s2 = data_in[0];
  assign s4 = data_in[3:1];
  assign s7 = data_in[10:4];
  assign s10 = data_in[25:11];
  assign s13 = data_in[56:26];
  DIG_Register DIG_Register_i0 (
    .D( s2 ),
    .C( clk ),
    .en( en ),
    .Q( \3  )
  );
  DIG_Register_BUS #(
    .Bits(3)
  )
  DIG_Register_BUS_i1 (
    .D( s4 ),
    .C( clk ),
    .en( en ),
    .Q( s5 )
  );
  DIG_Register_BUS #(
    .Bits(7)
  )
  DIG_Register_BUS_i2 (
    .D( s7 ),
    .C( clk ),
    .en( en ),
    .Q( s8 )
  );
  DIG_Register_BUS #(
    .Bits(15)
  )
  DIG_Register_BUS_i3 (
    .D( s10 ),
    .C( clk ),
    .en( en ),
    .Q( s11 )
  );
  DIG_Register_BUS #(
    .Bits(31)
  )
  DIG_Register_BUS_i4 (
    .D( s13 ),
    .C( clk ),
    .en( en ),
    .Q( s14 )
  );
  assign \5  = s5[0];
  assign \6  = s5[1];
  assign \7  = s5[2];
  assign \9  = s8[0];
  assign \10  = s8[1];
  assign \11  = s8[2];
  assign \12  = s8[3];
  assign \13  = s8[4];
  assign \14  = s8[5];
  assign \15  = s8[6];
  assign \17  = s11[0];
  assign \18  = s11[1];
  assign \19  = s11[2];
  assign \20  = s11[3];
  assign \21  = s11[4];
  assign \22  = s11[5];
  assign \23  = s11[6];
  assign \25  = s11[8];
  assign \26  = s11[9];
  assign \27  = s11[10];
  assign \28  = s11[11];
  assign \29  = s11[12];
  assign \30  = s11[13];
  assign \31  = s11[14];
  assign \33  = s14[0];
  assign \34  = s14[1];
  assign \35  = s14[2];
  assign \36  = s14[3];
  assign \37  = s14[4];
  assign \38  = s14[5];
  assign \39  = s14[6];
  assign \41  = s14[8];
  assign \42  = s14[9];
  assign \43  = s14[10];
  assign \44  = s14[11];
  assign \45  = s14[12];
  assign \46  = s14[13];
  assign \47  = s14[14];
  assign \49  = s14[16];
  assign \50  = s14[17];
  assign \51  = s14[18];
  assign \52  = s14[19];
  assign \53  = s14[20];
  assign \54  = s14[21];
  assign \55  = s14[22];
  assign \56  = s14[23];
  assign \57  = s14[24];
  assign \58  = s14[25];
  assign \59  = s14[26];
  assign \60  = s14[27];
  assign \61  = s14[28];
  assign \62  = s14[29];
  assign \63  = s14[30];
  assign s0[0] = (\3  ^ \5  ^ \7  ^ \9  ^ \11  ^ \13  ^ \15  ^ \17  ^ \19  ^ \21  ^ \23  ^ \25  ^ \59  ^ \61  ^ \63  ^ \51  ^ \53  ^ \55  ^ \57  ^ \27  ^ \29  ^ \31  ^ \33  ^ \35  ^ \37  ^ \39  ^ \41  ^ \43  ^ \45  ^ \47  ^ \49 );
  assign s0[1] = (\3  ^ \6  ^ \7  ^ \10  ^ \11  ^ \14  ^ \15  ^ \18  ^ \19  ^ \22  ^ \23  ^ \26  ^ \27  ^ \30  ^ \31  ^ \34  ^ \35  ^ \38  ^ \39  ^ \42  ^ \43  ^ \46  ^ \47  ^ \50  ^ \51  ^ \54  ^ \55  ^ \58  ^ \59  ^ \62  ^ \63 );
  assign s3 = (\5  ^ \6  ^ \7  ^ \12  ^ \13  ^ \14  ^ \15  ^ \20  ^ \21  ^ \22  ^ \23  ^ \28  ^ \62  ^ \63  ^ \53  ^ \54  ^ \55  ^ \60  ^ \61  ^ \29  ^ \30  ^ \31  ^ \36  ^ \37  ^ \38  ^ \39  ^ \44  ^ \45  ^ \46  ^ \47  ^ \52 );
  assign s6 = (\9  ^ \10  ^ \11  ^ \12  ^ \13  ^ \14  ^ \15  ^ \25  ^ \26  ^ \27  ^ \28  ^ \29  ^ \30  ^ \31  ^ \42  ^ \43  ^ \44  ^ \45  ^ \46  ^ \47  ^ \57  ^ \58  ^ \59  ^ \60  ^ \61  ^ \62  ^ \63  ^ \41 );
  assign s9 = (\17  ^ \18  ^ \19  ^ \20  ^ \21  ^ \22  ^ \23  ^ s11[7] ^ \25  ^ \26  ^ \27  ^ \28  ^ \29  ^ \30  ^ \31  ^ \50  ^ \51  ^ \52  ^ \53  ^ \54  ^ \55  ^ \56  ^ \57  ^ \58  ^ \59  ^ \60  ^ \61  ^ \62  ^ \63  ^ \49 );
  assign s12 = (\33  ^ \34  ^ \35  ^ \36  ^ \37  ^ \38  ^ \39  ^ s14[7] ^ \41  ^ \42  ^ \43  ^ \44  ^ \61  ^ \62  ^ \63  ^ \57  ^ \58  ^ \59  ^ \60  ^ \45  ^ \46  ^ \47  ^ s14[15] ^ \49  ^ \50  ^ \51  ^ \52  ^ \53  ^ \54  ^ \55  ^ \56 );
  // 1,2
  DIG_Register_BUS #(
    .Bits(2)
  )
  DIG_Register_BUS_i5 (
    .D( s0 ),
    .C( clk ),
    .en( en ),
    .Q( s1 )
  );
  // 4
  DIG_Register DIG_Register_i6 (
    .D( s3 ),
    .C( clk ),
    .en( en ),
    .Q( \4  )
  );
  // 8
  DIG_Register DIG_Register_i7 (
    .D( s6 ),
    .C( clk ),
    .en( en ),
    .Q( \8  )
  );
  // 16
  DIG_Register DIG_Register_i8 (
    .D( s9 ),
    .C( clk ),
    .en( en ),
    .Q( \16  )
  );
  // 32
  DIG_Register DIG_Register_i9 (
    .D( s12 ),
    .C( clk ),
    .en( en ),
    .Q( \32  )
  );
  assign onotp[1:0] = s1;
  assign onotp[2] = \3 ;
  assign onotp[3] = \4 ;
  assign onotp[6:4] = s5;
  assign onotp[7] = \8 ;
  assign onotp[14:8] = s8;
  assign onotp[15] = \16 ;
  assign onotp[30:16] = s11;
  assign onotp[31] = \32 ;
  assign onotp[62:32] = s14;
  assign \1  = s1[0];
  assign \2  = s1[1];
endmodule
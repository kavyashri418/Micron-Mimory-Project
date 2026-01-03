module encoder_13_8 (
    input  wire [7:0] data_in,
    output wire [12:0] codeword
);

    wire p0, p1, p2, p3, p4;

    assign p0 = data_in[0] ^ data_in[1] ^ data_in[3] ^ data_in[4] ^ data_in[6];
    assign p1 = data_in[0] ^ data_in[2] ^ data_in[3] ^ data_in[5] ^ data_in[6];
    assign p2 = data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[7];
    assign p3 = data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7];
    assign p4 = ^data_in;

    assign codeword = {p4, p3, p2, p1, p0, data_in};

endmodule

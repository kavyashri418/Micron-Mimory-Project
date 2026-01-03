module tb_encoder_13_8;

    reg  [7:0]  data;
    reg  [12:0] error_mask;
    wire [12:0] encoded;
    wire [12:0] corrupted;

    encoder_13_8 dut (
        .data_in(data),
        .codeword(encoded)
    );

    assign corrupted = encoded ^ error_mask;

    initial begin
        $display("================================");
        $display(" (13,8) ECC Encoder Test");
        $display("================================");

        data = 8'b10101101;

        error_mask = 13'b0;
        #1 $display("NO ERROR     : %b", corrupted);

        error_mask = 13'b0000000000100;
        #1 $display("SINGLE DATA  : %b", corrupted);

        error_mask = 13'b0000100000000;
        #1 $display("PARITY ERROR : %b", corrupted);

        error_mask = 13'b0000000000101;
        #1 $display("DOUBLE ERROR : %b", corrupted);

        error_mask = 13'b1000000000000;
        #1 $display("SSC ERROR    : %b", corrupted);

        $finish;
    end
endmodule

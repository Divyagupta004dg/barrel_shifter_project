`timescale 1ns / 1ps

module tb_barrel_shifter;

    reg [31:0] data_in;
    reg [4:0] shift_amt;
    reg dir;
    wire [31:0] data_out;

    
    barrel_shifter uut (data_in, shift_amt, dir, data_out);
    initial begin
        $dumpfile("barrel_shifter_project.vcd");
        $dumpvars(0, tb_barrel_shifter);

        data_in = 32'b00000000000000000000000000001111; shift_amt = 5'd0; dir = 1'b0; #10;
        data_in = 32'b00000000000000000000000000001111; shift_amt = 5'd1; dir = 1'b0; #10;
        data_in = 32'b00000000000000000000000000001111; shift_amt = 5'd2; dir = 1'b0; #10;
        data_in = 32'b00000000000000000000000000001111; shift_amt = 5'd3; dir = 1'b1; #10;
        data_in = 32'b00000000000000000000000000001111; shift_amt = 5'd4; dir = 1'b1; #10;
        data_in = 32'b00000000000000000000000000001111; shift_amt = 5'd5; dir = 1'b0; #10;
        data_in = 32'b00000000000000000000000000001111; shift_amt = 5'd6; dir = 1'b1; #10;
        data_in = 32'b00000000000000000000000000001111; shift_amt = 5'd0; dir = 1'b0; #10;

        $finish;
    end

    
    initial begin
        $monitor("Time=%0t | data_in=%b | shift_amt=%d | dir=%b | data_out=%b",
                 $time, data_in, shift_amt, dir, data_out);
    end

endmodule

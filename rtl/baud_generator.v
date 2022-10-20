/*++
//  Description : Generate en_16x_baud signal 
//  File        : baud_generator.v
--*/

`timescale 1ns/10fs

module baud_generator(
  input            clk    ,
  input            rst_n  ,      //active low reset
                                  
  input  [15:0]    baud_config_i ,
  output reg       en_16x_baud_o
);
  reg    [15:0]    baud_count;

  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      en_16x_baud_o <= 1'b0;
      baud_count    <= 16'd0;
    end
    else if(baud_count == (baud_config_i-1)) begin
      baud_count    <= 16'd0;
      en_16x_baud_o <= 1'b1;
    end
    else begin
      baud_count    <= baud_count + 1;
      en_16x_baud_o <= 1'b0;
    end
  end
endmodule

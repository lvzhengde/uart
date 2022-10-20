/*++
//  Description : Synchronous FIFO memory
//  File        : bbfifo_16x8_mem.v
--*/

`timescale 1ns/10fs

module bbfifo_16x8_mem (
  input                clk  ,
  input                rst_n,   
  
  input                wen_i   , 
  input   [7:0]        wdata_i , 
  input   [3:0]        waddr_i , 
  input   [3:0]        raddr_i , 
  output reg  [7:0]    rdata_o  
);
  //fifo memory registers
  reg  [7:0]       mregs0 ;
  reg  [7:0]       mregs1 ;
  reg  [7:0]       mregs2 ;
  reg  [7:0]       mregs3 ;  
  reg  [7:0]       mregs4 ;
  reg  [7:0]       mregs5 ;  
  reg  [7:0]       mregs6 ;
  reg  [7:0]       mregs7 ;  
  reg  [7:0]       mregs8 ;
  reg  [7:0]       mregs9 ;
  reg  [7:0]       mregsa ;
  reg  [7:0]       mregsb ;  
  reg  [7:0]       mregsc ;
  reg  [7:0]       mregsd ;  
  reg  [7:0]       mregse ;
  reg  [7:0]       mregsf ;
  
  //read fifo memory
  always @(*) begin
    case (raddr_i[3:0])                        
      4'h0 :  rdata_o = mregs0 ;            
      4'h1 :  rdata_o = mregs1 ;            
      4'h2 :  rdata_o = mregs2 ;            
      4'h3 :  rdata_o = mregs3 ;            
      4'h4 :  rdata_o = mregs4 ;            
      4'h5 :  rdata_o = mregs5 ;            
      4'h6 :  rdata_o = mregs6 ;            
      4'h7 :  rdata_o = mregs7 ;            
      4'h8 :  rdata_o = mregs8 ;            
      4'h9 :  rdata_o = mregs9 ;            
      4'ha :  rdata_o = mregsa ;            
      4'hb :  rdata_o = mregsb ;            
      4'hc :  rdata_o = mregsc ;            
      4'hd :  rdata_o = mregsd ;            
      4'he :  rdata_o = mregse ;            
      4'hf :  rdata_o = mregsf ;            
    endcase                                    
  end  

  //write fifo
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      mregs0  <= 8'h0 ;            
      mregs1  <= 8'h0 ;            
      mregs2  <= 8'h0 ;            
      mregs3  <= 8'h0 ;            
      mregs4  <= 8'h0 ;            
      mregs5  <= 8'h0 ;            
      mregs6  <= 8'h0 ;            
      mregs7  <= 8'h0 ;            
      mregs8  <= 8'h0 ;            
      mregs9  <= 8'h0 ;            
      mregsa  <= 8'h0 ;            
      mregsb  <= 8'h0 ;            
      mregsc  <= 8'h0 ;            
      mregsd  <= 8'h0 ;            
      mregse  <= 8'h0 ;            
      mregsf  <= 8'h0 ;                  
    end
    else if(wen_i == 1'b1) begin
      case (waddr_i[3:0])
        4'h0 :  mregs0  <= wdata_i ;
        4'h1 :  mregs1  <= wdata_i ;
        4'h2 :  mregs2  <= wdata_i ;
        4'h3 :  mregs3  <= wdata_i ;
        4'h4 :  mregs4  <= wdata_i ;
        4'h5 :  mregs5  <= wdata_i ;
        4'h6 :  mregs6  <= wdata_i ;
        4'h7 :  mregs7  <= wdata_i ;
        4'h8 :  mregs8  <= wdata_i ;
        4'h9 :  mregs9  <= wdata_i ;
        4'ha :  mregsa  <= wdata_i ;
        4'hb :  mregsb  <= wdata_i ;
        4'hc :  mregsc  <= wdata_i ;
        4'hd :  mregsd  <= wdata_i ;
        4'he :  mregse  <= wdata_i ;
        4'hf :  mregsf  <= wdata_i ;  
      endcase  
    end  
  end

endmodule

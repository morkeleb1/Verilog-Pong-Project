`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2023 07:20:59 PM
// Design Name: 
// Module Name: timer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// gameover, ball reset
// 2 second timer
module timer(
    input clk,
    input reset,                 
    input timer_start, timer_tick,
    output timer_up
    );
    
    // signal declaration
    reg [6:0] timer_reg, timer_next;
    
    // register control
    always @(posedge clk or posedge reset)
        if(reset)
            timer_reg <= 7'b1111111;
        else
            timer_reg <= timer_next;
    
    // next state logic
    always @*
        if(timer_start)
            timer_next = 7'b1111111;
        else if((timer_tick) && (timer_reg != 0))
            timer_next = timer_reg - 1;
        else
            timer_next = timer_reg;
            
    // output
    assign timer_up = (timer_reg == 0);
    
endmodule

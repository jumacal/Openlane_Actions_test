`timescale 1ns / 1ps

module src(
    input [2:0] ALU_control,
    input [31:0] A,B,
    output Zero,
    output reg [31:0] ALUResult
    );
    wire [31:0] M1;
    wire [31:0] AND;
    wire [31:0] OR;
    wire [31:0] XOR;
    wire [31:0] SLT;
    wire [31:0] SUM; 
    
    //MUX 2a1
    assign M1 = ALU_control[0] ? ~B : B;
   
   //Sumador completo
    assign SUM = A + M1 + ALU_control[0]; 
    
   //AND 
    assign AND = A & B;
    
    //OR
    assign OR = A | B;
    
    //XOR
    assign XOR = A ^ B;
    
    assign SLT = A <  B;
     
    always @(*)
        case (ALU_control)
         3'b000: ALUResult = SUM;
         3'b001: ALUResult = SUM;
         3'b010: ALUResult = AND;
         3'b011: ALUResult = OR;
         3'b100: ALUResult = XOR;
         3'b101: ALUResult = SLT;
         default : ALUResult = SUM;
        endcase 
    
    assign Zero = (SUM == 0)? 1'b1 : 1'b0; 
    
endmodule

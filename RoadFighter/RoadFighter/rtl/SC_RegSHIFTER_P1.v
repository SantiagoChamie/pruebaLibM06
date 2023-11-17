/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module SC_RegSHIFTER_P1 #(parameter RegSHIFTER_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_RegSHIFTER_P1_data_OutBUS,
	//////////// INPUTS //////////
	SC_RegSHIFTER_P1_CLOCK_50,
	SC_RegSHIFTER_P1_RESET_InHigh,
	SC_RegSHIFTER_P1_load_InLow, 
	SC_RegSHIFTER_P1_shiftselection_In,
	SC_RegSHIFTER_P1_data_InBUS	
);
//=======================================================
//  PORT declarations
//=======================================================
output		[RegSHIFTER_DATAWIDTH-1:0]	SC_RegSHIFTER_P1_data_OutBUS;
input			SC_RegSHIFTER_P1_CLOCK_50;
input			SC_RegSHIFTER_P1_RESET_InHigh;
input			SC_RegSHIFTER_P1_load_InLow;	
input			[1:0] SC_RegSHIFTER_P1_shiftselection_In;
input			[RegSHIFTER_DATAWIDTH-1:0]	SC_RegSHIFTER_P1_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegSHIFTER_DATAWIDTH-1:0] RegSHIFTER_Register;
reg [RegSHIFTER_DATAWIDTH-1:0] RegSHIFTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin

	if (SC_RegSHIFTER_P1_load_InLow == 1'b0)begin
		if(SC_RegSHIFTER_P1_data_InBUS == 8'b00000010)
			RegSHIFTER_Signal = 8'b00100000;
		else 
			RegSHIFTER_Signal = 8'b00000000;
	end
		
	else if (SC_RegSHIFTER_P1_shiftselection_In == 2'b01) begin
		if(RegSHIFTER_Register == 8'b10000000)
			RegSHIFTER_Signal = RegSHIFTER_Register;  
		else 
			RegSHIFTER_Signal = RegSHIFTER_Register << 1'b1;  		
	end	
		
	else if (SC_RegSHIFTER_P1_shiftselection_In== 2'b10) begin 
		if(RegSHIFTER_Register == 8'b00010000)
			RegSHIFTER_Signal = RegSHIFTER_Register;  
		else 
			RegSHIFTER_Signal = RegSHIFTER_Register >> 1'b1;   
	end
	
	else
		RegSHIFTER_Signal = RegSHIFTER_Register;
end	
	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_RegSHIFTER_P1_CLOCK_50, posedge SC_RegSHIFTER_P1_RESET_InHigh)
begin
	if (SC_RegSHIFTER_P1_RESET_InHigh == 1'b1)
		RegSHIFTER_Register <= 0;
	else
		RegSHIFTER_Register <= RegSHIFTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_RegSHIFTER_P1_data_OutBUS = RegSHIFTER_Register;

endmodule

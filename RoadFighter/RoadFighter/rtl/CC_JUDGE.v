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
module CC_JUDGE(
//////////// OUTPUTS //////////
	CC_JUDGE_D0_outBus,
	CC_JUDGE_D1_outBus,
	CC_JUDGE_D2_outBus,
	CC_JUDGE_D3_outBus,
	CC_JUDGE_D4_outBus,
	CC_JUDGE_D5_outBus,
	CC_JUDGE_D6_outBus,
	CC_JUDGE_D7_outBus,
//////////// INPUTS //////////
	CC_JUDGE_DataP1_In,
	CC_JUDGE_DataP2_In
);

//=======================================================
//  PARAMETER declarations
//=======================================================

//Mensaje J1
parameter WIN_P1_D0   = ~8'b00000000;
parameter WIN_P1_D1   = ~8'b00010000;
parameter WIN_P1_D2 	 = ~8'b00110000;
parameter WIN_P1_D3   = ~8'b00010000;
parameter WIN_P1_D4   = ~8'b00010000;
parameter WIN_P1_D5   = ~8'b00010000;
parameter WIN_P1_D6   = ~8'b01111100;
parameter WIN_P1_D7   = ~8'b00000000;

//Mensaje J2
parameter WIN_P2_D0   = ~8'b00000000;
parameter WIN_P2_D1   = ~8'b00111100;
parameter WIN_P2_D2   = ~8'b01000010;
parameter WIN_P2_D3   = ~8'b00000100;
parameter WIN_P2_D4   = ~8'b00011000;
parameter WIN_P2_D5   = ~8'b00100000;
parameter WIN_P2_D6   = ~8'b01111110;
parameter WIN_P2_D7   = ~8'b00000000;

//Mensaje empate
parameter WIN_Px_D0   = ~8'b00000000;
parameter WIN_Px_D1   = ~8'b00000000;
parameter WIN_Px_D2   = ~8'b10101110;
parameter WIN_Px_D3   = ~8'b01001001;
parameter WIN_Px_D4   = ~8'b01001001;
parameter WIN_Px_D5   = ~8'b10101110;
parameter WIN_Px_D6   = ~8'b00000000;
parameter WIN_Px_D7   = ~8'b00000000;

//=======================================================
//  PORT declarations
//=======================================================

output reg 	[7:0]	CC_JUDGE_D0_outBus;
output reg 	[7:0]	CC_JUDGE_D1_outBus;
output reg 	[7:0]	CC_JUDGE_D2_outBus;
output reg 	[7:0]	CC_JUDGE_D3_outBus;
output reg 	[7:0]	CC_JUDGE_D4_outBus;
output reg 	[7:0]	CC_JUDGE_D5_outBus;
output reg	[7:0]	CC_JUDGE_D6_outBus;
output reg 	[7:0]	CC_JUDGE_D7_outBus;

input 	[5:0]CC_JUDGE_DataP1_In;
input		[5:0]CC_JUDGE_DataP2_In;

//=======================================================
//  Structural coding
//=======================================================

always @(*)
begin
	if(CC_JUDGE_DataP1_In > CC_JUDGE_DataP2_In)begin
		CC_JUDGE_D0_outBus = WIN_P1_D0;
		CC_JUDGE_D1_outBus = WIN_P1_D1;
		CC_JUDGE_D2_outBus = WIN_P1_D2;
		CC_JUDGE_D3_outBus = WIN_P1_D3;
		CC_JUDGE_D4_outBus = WIN_P1_D4;
		CC_JUDGE_D5_outBus = WIN_P1_D5;
		CC_JUDGE_D6_outBus = WIN_P1_D6;
		CC_JUDGE_D7_outBus = WIN_P1_D7;
	end
	
	else if (CC_JUDGE_DataP1_In < CC_JUDGE_DataP2_In) begin
		CC_JUDGE_D0_outBus = WIN_P2_D0;
		CC_JUDGE_D1_outBus = WIN_P2_D1;
		CC_JUDGE_D2_outBus = WIN_P2_D2;
		CC_JUDGE_D3_outBus = WIN_P2_D3;
		CC_JUDGE_D4_outBus = WIN_P2_D4;
		CC_JUDGE_D5_outBus = WIN_P2_D5;
		CC_JUDGE_D6_outBus = WIN_P2_D6;
		CC_JUDGE_D7_outBus = WIN_P2_D7;
	end
	
	else begin
		CC_JUDGE_D0_outBus = WIN_Px_D0;
		CC_JUDGE_D1_outBus = WIN_Px_D1;
		CC_JUDGE_D2_outBus = WIN_Px_D2;
		CC_JUDGE_D3_outBus = WIN_Px_D3;
		CC_JUDGE_D4_outBus = WIN_Px_D4;
		CC_JUDGE_D5_outBus = WIN_Px_D5;
		CC_JUDGE_D6_outBus = WIN_Px_D6;
		CC_JUDGE_D7_outBus = WIN_Px_D7;
	end
		
end

endmodule  
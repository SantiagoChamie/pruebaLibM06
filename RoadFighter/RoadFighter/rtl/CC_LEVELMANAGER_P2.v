/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
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

module CC_LEVELMANAGER_P2 (
//////////// OUTPUTS //////////
	CC_LEVELMANAGER_P2_Lv_OutBus,
		
//////////// INPUTS //////////
	CC_LEVELMANAGER_P2_Progress,
	CC_LEVELMANAGER_P2_Current

);

//=======================================================
//  PORT declarations
//=======================================================
output reg [7:0]	CC_LEVELMANAGER_P2_Lv_OutBus;

input		  [4:0]	 	CC_LEVELMANAGER_P2_Progress;
input 	  [2:0]		CC_LEVELMANAGER_P2_Current;

//=======================================================
//  PARAMETER declarations
//=======================================================

//parameter LEVELMANAGER_DATAWIDTH = 8;

//Nivel 1
parameter Lv1_u0  = 8'b00000010;
parameter Lv1_u1  = 8'b00001000;
parameter Lv1_u2  = 8'b00000010;
parameter Lv1_u3  = 8'b00000001;
parameter Lv1_u4  = 8'b00001000;
parameter Lv1_u5  = 8'b00000010;
parameter Lv1_u6  = 8'b00001000;
parameter Lv1_u7  = 8'b00000010;
parameter Lv1_u8  = 8'b00000001;
parameter Lv1_u9  = 8'b00010000;

//Nivel 2
parameter Lv2_u0  = 8'b00000110;
parameter Lv2_u1  = 8'b00001010;
parameter Lv2_u2  = 8'b00000110;
parameter Lv2_u3  = 8'b00000001;
parameter Lv2_u4  = 8'b00001000;
parameter Lv2_u5  = 8'b00000110;
parameter Lv2_u6  = 8'b00000110;
parameter Lv2_u7  = 8'b00001010;
parameter Lv2_u8  = 8'b00010001;
parameter Lv2_u9  = 8'b00001000;
parameter Lv2_u10 = 8'b00001010;
parameter Lv2_u11 = 8'b00000011;
parameter Lv2_u12 = 8'b00000011;
parameter Lv2_u13 = 8'b00000101;
parameter Lv2_u14 = 8'b00001101;

//Nivel 3
parameter Lv3_u0  = 8'b00001110;
parameter Lv3_u1  = 8'b00001011;
parameter Lv3_u2  = 8'b00001110;
parameter Lv3_u3  = 8'b00000111;
parameter Lv3_u4  = 8'b00001110;
parameter Lv3_u5  = 8'b00000111;
parameter Lv3_u6  = 8'b00001011;
parameter Lv3_u7  = 8'b00000111;
parameter Lv3_u8  = 8'b00001011;
parameter Lv3_u9  = 8'b00001101;
parameter Lv3_u10 = 8'b00001011;
parameter Lv3_u11 = 8'b00000111;
parameter Lv3_u12 = 8'b00000111;
parameter Lv3_u13 = 8'b00000111;
parameter Lv3_u14 = 8'b00001110;
parameter Lv3_u15 = 8'b00001011;
parameter Lv3_u16 = 8'b00001101;
parameter Lv3_u17 = 8'b00001110;
parameter Lv3_u18 = 8'b00001101;
parameter Lv3_u19 = 8'b00001001;

//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
	case (CC_LEVELMANAGER_P2_Current)
			
	2: begin
			if(CC_LEVELMANAGER_P2_Progress == 1) CC_LEVELMANAGER_P2_Lv_OutBus 			= Lv1_u0;
			else if (CC_LEVELMANAGER_P2_Progress == 2) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv1_u1;
			else if (CC_LEVELMANAGER_P2_Progress == 3) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv1_u2;
			else if (CC_LEVELMANAGER_P2_Progress == 4) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv1_u3;
			else if (CC_LEVELMANAGER_P2_Progress == 5) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv1_u4;
			else if (CC_LEVELMANAGER_P2_Progress == 6) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv1_u5;
			else if (CC_LEVELMANAGER_P2_Progress == 7) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv1_u6;
			else if (CC_LEVELMANAGER_P2_Progress == 8) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv1_u7;
			else if (CC_LEVELMANAGER_P2_Progress == 9) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv1_u8;
			else if (CC_LEVELMANAGER_P2_Progress == 10) CC_LEVELMANAGER_P2_Lv_OutBus = Lv1_u9;
			else CC_LEVELMANAGER_P2_Lv_OutBus = 0;
		end		
	4: begin
			if(CC_LEVELMANAGER_P2_Progress == 1) CC_LEVELMANAGER_P2_Lv_OutBus 			= Lv2_u0;
			else if (CC_LEVELMANAGER_P2_Progress == 2) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv2_u1;
			else if (CC_LEVELMANAGER_P2_Progress == 3) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv2_u2;
			else if (CC_LEVELMANAGER_P2_Progress == 4) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv2_u3;
			else if (CC_LEVELMANAGER_P2_Progress == 5) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv2_u4;
			else if (CC_LEVELMANAGER_P2_Progress == 6) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv2_u5;
			else if (CC_LEVELMANAGER_P2_Progress == 7) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv2_u6;
			else if (CC_LEVELMANAGER_P2_Progress == 8) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv2_u7;
			else if (CC_LEVELMANAGER_P2_Progress == 9) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv2_u8;
			else if (CC_LEVELMANAGER_P2_Progress == 10) CC_LEVELMANAGER_P2_Lv_OutBus = Lv2_u9;
			else if (CC_LEVELMANAGER_P2_Progress == 11) CC_LEVELMANAGER_P2_Lv_OutBus = Lv2_u10;
			else if (CC_LEVELMANAGER_P2_Progress == 12) CC_LEVELMANAGER_P2_Lv_OutBus = Lv2_u11;
			else if (CC_LEVELMANAGER_P2_Progress == 13) CC_LEVELMANAGER_P2_Lv_OutBus = Lv2_u12;
			else if (CC_LEVELMANAGER_P2_Progress == 14) CC_LEVELMANAGER_P2_Lv_OutBus = Lv2_u13;
			else if (CC_LEVELMANAGER_P2_Progress == 15) CC_LEVELMANAGER_P2_Lv_OutBus = Lv2_u14;
			else CC_LEVELMANAGER_P2_Lv_OutBus = 0;
		end
		
	6: begin
			if(CC_LEVELMANAGER_P2_Progress == 1) CC_LEVELMANAGER_P2_Lv_OutBus 			= Lv3_u0;
			else if (CC_LEVELMANAGER_P2_Progress == 2) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv3_u1;
			else if (CC_LEVELMANAGER_P2_Progress == 3) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv3_u2;
			else if (CC_LEVELMANAGER_P2_Progress == 4) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv3_u3;
			else if (CC_LEVELMANAGER_P2_Progress == 5) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv3_u4;
			else if (CC_LEVELMANAGER_P2_Progress == 6) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv3_u5;
			else if (CC_LEVELMANAGER_P2_Progress == 7) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv3_u6;
			else if (CC_LEVELMANAGER_P2_Progress == 8) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv3_u7;
			else if (CC_LEVELMANAGER_P2_Progress == 9) CC_LEVELMANAGER_P2_Lv_OutBus 	= Lv3_u8;
			else if (CC_LEVELMANAGER_P2_Progress == 10) CC_LEVELMANAGER_P2_Lv_OutBus = Lv3_u9;
			else if (CC_LEVELMANAGER_P2_Progress == 11) CC_LEVELMANAGER_P2_Lv_OutBus = Lv3_u10;
			else if (CC_LEVELMANAGER_P2_Progress == 12) CC_LEVELMANAGER_P2_Lv_OutBus = Lv3_u11;
			else if (CC_LEVELMANAGER_P2_Progress == 13) CC_LEVELMANAGER_P2_Lv_OutBus = Lv3_u12;
			else if (CC_LEVELMANAGER_P2_Progress == 14) CC_LEVELMANAGER_P2_Lv_OutBus = Lv3_u13;
			else if (CC_LEVELMANAGER_P2_Progress == 15) CC_LEVELMANAGER_P2_Lv_OutBus = Lv3_u14;
			else if (CC_LEVELMANAGER_P2_Progress == 16) CC_LEVELMANAGER_P2_Lv_OutBus = Lv3_u15;
			else if (CC_LEVELMANAGER_P2_Progress == 17) CC_LEVELMANAGER_P2_Lv_OutBus = Lv3_u16;
			else if (CC_LEVELMANAGER_P2_Progress == 18) CC_LEVELMANAGER_P2_Lv_OutBus = Lv3_u17;
			else if (CC_LEVELMANAGER_P2_Progress == 19) CC_LEVELMANAGER_P2_Lv_OutBus = Lv3_u18;
			else if (CC_LEVELMANAGER_P2_Progress == 20) CC_LEVELMANAGER_P2_Lv_OutBus = Lv3_u19;
			else CC_LEVELMANAGER_P2_Lv_OutBus = 0;
		end
		
	default: CC_LEVELMANAGER_P2_Lv_OutBus = 0;
	endcase

end

endmodule 
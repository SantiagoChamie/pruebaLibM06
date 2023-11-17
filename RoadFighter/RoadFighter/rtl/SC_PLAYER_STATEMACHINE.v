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
module SC_PLAYER_STATEMACHINE(
//////////// OUTPUTS //////////
	SC_PLAYER_STATEMACHINE_ShiftSelection_Out,
	SC_PLAYER_STATEMACHINE_LoadData_Out,
	SC_PLAYER_STATEMACHINE_PlayerData_Out,
	SC_PLAYER_STATEMACHINE_Lost_Out,
	//////////// INPUTS //////////
	SC_PLAYER_STATEMACHINE_CLOCK_50,
	SC_PLAYER_STATEMACHINE_RESET_InHigh,
	SC_PLAYER_STATEMACHINE_LeftButton_InLow,
	SC_PLAYER_STATEMACHINE_RightButton_InLow,
	SC_PLAYER_STATEMACHINE_Lost_InLow,
	SC_PLAYER_STATEMACHINE_FinishedLevel_InLow
);

//=======================================================
//  PARAMETER declarations
//=======================================================

// states declaration
localparam STATE_STILL											= 0;
localparam STATE_LEFT_0											= 1;
localparam STATE_LEFT_1											= 2;
localparam STATE_RIGHT_0										= 3;
localparam STATE_RIGHT_1										= 4;
localparam STATE_LOST											= 5;
localparam STATE_LOAD											= 6;

//=======================================================
//  PORT declarations
//=======================================================

// 10 si debe ir a la derecha, 01 si debe ir a la izquierda
output reg 	[1:0]SC_PLAYER_STATEMACHINE_ShiftSelection_Out;
// 0 si se está cargando al jugador, 1 si ya está cargado
output reg	SC_PLAYER_STATEMACHINE_LoadData_Out;
// 
output reg  [7:0]SC_PLAYER_STATEMACHINE_PlayerData_Out;
// 0 si perdió el jugador, 1 si sigue vivo
output reg 	SC_PLAYER_STATEMACHINE_Lost_Out;

input 		SC_PLAYER_STATEMACHINE_CLOCK_50;
input			SC_PLAYER_STATEMACHINE_RESET_InHigh;
input			SC_PLAYER_STATEMACHINE_LeftButton_InLow;
input 		SC_PLAYER_STATEMACHINE_RightButton_InLow;
input 		SC_PLAYER_STATEMACHINE_Lost_InLow;
input 		SC_PLAYER_STATEMACHINE_FinishedLevel_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [3:0] STATE_Register;
reg [3:0] STATE_Signal;

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL

always @(*) 
begin

	case (STATE_Register)
	
		STATE_STILL: 	if (SC_PLAYER_STATEMACHINE_LeftButton_InLow == 1'b0) 
									STATE_Signal = STATE_LEFT_0;
							else if (SC_PLAYER_STATEMACHINE_RightButton_InLow == 1'b0)
									STATE_Signal = STATE_RIGHT_0;
							else if (SC_PLAYER_STATEMACHINE_Lost_InLow == 1'b0)
									STATE_Signal = STATE_LOST;
							else 
									STATE_Signal = STATE_STILL;
											
		STATE_LEFT_0:		STATE_Signal = STATE_LEFT_1;									
						
		STATE_LEFT_1:  	if (SC_PLAYER_STATEMACHINE_LeftButton_InLow == 1'b1)
									STATE_Signal = STATE_STILL;
								else if (SC_PLAYER_STATEMACHINE_RightButton_InLow == 1'b0)
									STATE_Signal = STATE_RIGHT_0;
								else if (SC_PLAYER_STATEMACHINE_Lost_InLow == 1'b0)
									STATE_Signal = STATE_LOST;
								else 
									STATE_Signal = STATE_LEFT_1;
										
		STATE_RIGHT_0:		STATE_Signal = STATE_RIGHT_1;	
		
		STATE_RIGHT_1:		if (SC_PLAYER_STATEMACHINE_RightButton_InLow == 1'b1)
									STATE_Signal = STATE_STILL;
								else if (SC_PLAYER_STATEMACHINE_LeftButton_InLow == 1'b0)
									STATE_Signal = STATE_LEFT_0;
								else if (SC_PLAYER_STATEMACHINE_Lost_InLow == 1'b0)
									STATE_Signal = STATE_LOST;			
								else 
									STATE_Signal = STATE_RIGHT_1;
											
		STATE_LOST: 		if(SC_PLAYER_STATEMACHINE_FinishedLevel_InLow == 1'b0)
									STATE_Signal = STATE_LOAD;
								else
									STATE_Signal = STATE_LOST;
											
		STATE_LOAD:			STATE_Signal=STATE_STILL;
											
											
		default: 					STATE_Signal = STATE_LOAD;
	
	endcase

end 

// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_PLAYER_STATEMACHINE_CLOCK_50 , posedge SC_PLAYER_STATEMACHINE_RESET_InHigh)
begin
	if (SC_PLAYER_STATEMACHINE_RESET_InHigh == 1'b1)
		STATE_Register <= STATE_LOAD;
	else
		STATE_Register <= STATE_Signal;
end

//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
always @ (*)
begin
	case (STATE_Register)
	
	STATE_STILL :	
		begin
			SC_PLAYER_STATEMACHINE_ShiftSelection_Out = 2'b00;
			SC_PLAYER_STATEMACHINE_LoadData_Out 		= 1'b1;
			SC_PLAYER_STATEMACHINE_PlayerData_Out 		= 0;
			SC_PLAYER_STATEMACHINE_Lost_Out				= 1;
		end
		
	STATE_LEFT_0 :	
		begin
			SC_PLAYER_STATEMACHINE_ShiftSelection_Out = 2'b01;
			SC_PLAYER_STATEMACHINE_LoadData_Out 		=	1'b1;
			SC_PLAYER_STATEMACHINE_PlayerData_Out 		=	0;
			SC_PLAYER_STATEMACHINE_Lost_Out				= 1;
			
		end
	STATE_LEFT_1 :	
		begin
			SC_PLAYER_STATEMACHINE_ShiftSelection_Out = 2'b00;
			SC_PLAYER_STATEMACHINE_LoadData_Out 		=	1'b1;
			SC_PLAYER_STATEMACHINE_PlayerData_Out 		=	0;
			SC_PLAYER_STATEMACHINE_Lost_Out				= 1;
		end

	STATE_RIGHT_0 :
		begin
			SC_PLAYER_STATEMACHINE_ShiftSelection_Out = 2'b10;
			SC_PLAYER_STATEMACHINE_LoadData_Out 		=	1'b1;
			SC_PLAYER_STATEMACHINE_PlayerData_Out 		=	0;
			SC_PLAYER_STATEMACHINE_Lost_Out				= 1;
		end
		
	STATE_RIGHT_1 :
		begin
			SC_PLAYER_STATEMACHINE_ShiftSelection_Out = 2'b00;
			SC_PLAYER_STATEMACHINE_LoadData_Out 		=	1'b1;
			SC_PLAYER_STATEMACHINE_PlayerData_Out 		=	0;
			SC_PLAYER_STATEMACHINE_Lost_Out				= 1;
		end

	STATE_LOST :
		begin
			SC_PLAYER_STATEMACHINE_ShiftSelection_Out = 2'b00;
			SC_PLAYER_STATEMACHINE_LoadData_Out 		=	1'b1;
			SC_PLAYER_STATEMACHINE_PlayerData_Out 		=	0;
			SC_PLAYER_STATEMACHINE_Lost_Out				= 0;
		end
		
	STATE_LOAD :
		begin
			SC_PLAYER_STATEMACHINE_ShiftSelection_Out = 2'b00;
			SC_PLAYER_STATEMACHINE_LoadData_Out 		=	1'b0;
			SC_PLAYER_STATEMACHINE_PlayerData_Out 		=	8'b00000010;
			SC_PLAYER_STATEMACHINE_Lost_Out				= 1;
		end

	default :
		begin
			SC_PLAYER_STATEMACHINE_ShiftSelection_Out = 2'b00;
			SC_PLAYER_STATEMACHINE_LoadData_Out 		=	1'b0;
			SC_PLAYER_STATEMACHINE_PlayerData_Out 		=	8'b00000010;
			SC_PLAYER_STATEMACHINE_Lost_Out				= 1;
		end
	endcase
end

endmodule 

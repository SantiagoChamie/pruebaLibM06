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

module SC_MAIN_STATEMACHINE(
//////////// OUTPUTS //////////
	SC_MAIN_STATEMACHINE_State_Out,

//////////// INPUTS //////////

	SC_MAIN_STATEMACHINE_CLOCK_50,
	SC_MAIN_STATEMACHINE_RESET_InHigh,
	SC_MAIN_STATEMACHINE_Start_InLow,
	SC_MAIN_STATEMACHINE_End_InLow

);

//=======================================================
//  PARAMETER declarations
//=======================================================

// states declaration
localparam STATE_PENDING_0									= 0;
localparam STATE_CHAMBA										= 1;
localparam STATE_END											= 2;
localparam STATE_PENDING_1									= 3;


//=======================================================
//  PORT declarations
//=======================================================

output reg		[1:0] SC_MAIN_STATEMACHINE_State_Out;

input				SC_MAIN_STATEMACHINE_CLOCK_50;
input 			SC_MAIN_STATEMACHINE_RESET_InHigh;
input				SC_MAIN_STATEMACHINE_Start_InLow;
input				SC_MAIN_STATEMACHINE_End_InLow;


//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [1:0] STATE_Register;
reg [1:0] STATE_Signal;


//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*) 
begin

	case (STATE_Register)
	
		STATE_PENDING_0: 	if (SC_MAIN_STATEMACHINE_Start_InLow == 1'b0) 
									STATE_Signal = STATE_PENDING_1;	
								else 
									STATE_Signal = STATE_PENDING_0;
									
		STATE_PENDING_1:	STATE_Signal = STATE_CHAMBA;
		
		STATE_CHAMBA:  		if (SC_MAIN_STATEMACHINE_End_InLow == 1'b0)
									STATE_Signal = STATE_END;
								else if (SC_MAIN_STATEMACHINE_RESET_InHigh == 1'b1)
									STATE_Signal = STATE_PENDING_0;
								else 
									STATE_Signal = STATE_CHAMBA;	
									
		STATE_END:			if (SC_MAIN_STATEMACHINE_RESET_InHigh == 1'b1)		
									STATE_Signal = STATE_PENDING_0;
								else
									STATE_Signal = STATE_END;
									
		default: 			STATE_Signal = STATE_CHAMBA;
	
	endcase

end 

// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_MAIN_STATEMACHINE_CLOCK_50 , posedge SC_MAIN_STATEMACHINE_RESET_InHigh)
begin
	if (SC_MAIN_STATEMACHINE_RESET_InHigh == 1'b1)
		STATE_Register <= STATE_PENDING_0;
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

	STATE_PENDING_0 :	
		begin
			SC_MAIN_STATEMACHINE_State_Out = 2'b00;
		end

	STATE_CHAMBA :	
		begin
			SC_MAIN_STATEMACHINE_State_Out = 2'b01;
		end

	STATE_END :
		begin
			SC_MAIN_STATEMACHINE_State_Out = 2'b10;
			
		end

	STATE_PENDING_1 :	
		begin
			SC_MAIN_STATEMACHINE_State_Out = 2'b11;
		end

	default :
		begin
			SC_MAIN_STATEMACHINE_State_Out = 2'b00;
		end
	endcase
end

endmodule 
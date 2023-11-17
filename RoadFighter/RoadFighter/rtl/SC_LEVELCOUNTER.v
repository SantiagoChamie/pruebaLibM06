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

module SC_LEVELCOUNTER (
//////////// OUTPUTS //////////
	SC_LEVELCOUNTER_Data_OutBus,

//////////// INPUTS //////////
	SC_LEVELCOUNTER_CurrentState_Inbus,
	SC_LEVELCOUNTER_CountSignal_InLow,
	SC_LEVELCOUNTER_CLOCK_50,
	SC_LEVELCOUNTER_RESET_InHigh
);

//=======================================================
//  PARAMETER declarations
//=======================================================

localparam STATE_WAIT									= 0;
localparam STATE_START									= 1;
localparam STATE_END										= 2;
localparam STATE_WAIT_1									= 3;

//=======================================================
//  PORT declarations
//=======================================================

output		[2:0] SC_LEVELCOUNTER_Data_OutBus;

input 		[1:0] SC_LEVELCOUNTER_CurrentState_Inbus;
input 		SC_LEVELCOUNTER_CountSignal_InLow;
input			SC_LEVELCOUNTER_CLOCK_50;
input			SC_LEVELCOUNTER_RESET_InHigh;

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [2:0] LEVELCOUNTER_Register;
reg [2:0] LEVELCOUNTER_Signal;

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin

	if (SC_LEVELCOUNTER_CurrentState_Inbus == STATE_WAIT) begin
		LEVELCOUNTER_Signal = 0;
	end
	else if (SC_LEVELCOUNTER_CurrentState_Inbus == STATE_WAIT_1)
		LEVELCOUNTER_Signal = 1;
	
	else if (SC_LEVELCOUNTER_CurrentState_Inbus == STATE_START) begin
		if (SC_LEVELCOUNTER_CountSignal_InLow == 1'b0) begin
			LEVELCOUNTER_Signal = LEVELCOUNTER_Register + 1'b1;
		end
		else begin
			LEVELCOUNTER_Signal = LEVELCOUNTER_Register;
		end
	end
	else if (SC_LEVELCOUNTER_CurrentState_Inbus == STATE_END) begin
		LEVELCOUNTER_Signal = 7;
	end
	else begin
		LEVELCOUNTER_Signal = 0;
	end

end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_LEVELCOUNTER_CLOCK_50, posedge SC_LEVELCOUNTER_RESET_InHigh)
begin
	if (SC_LEVELCOUNTER_RESET_InHigh  == 1'b1)
		LEVELCOUNTER_Register <= 0;
	else
		LEVELCOUNTER_Register <= LEVELCOUNTER_Signal;
end

//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_LEVELCOUNTER_Data_OutBus = LEVELCOUNTER_Register;

endmodule 
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

module SC_LEVELPROGRESS (
//////////// OUTPUTS //////////
	SC_LEVELPROGRESS_Data_OutBus,
	
//////////// INPUTS //////////
	SC_LEVELPROGRESS_CountSignal_in,
	SC_LEVELPROGRESS_EndLevel_in,
	SC_LEVELPROGRESS_EndGame_in,
	SC_LEVELPROGRESS_CLOCK_50,
	SC_LEVELPROGRESS_RESET_InHigh
);

//=======================================================
//  PORT declarations
//=======================================================

output		[4:0] SC_LEVELPROGRESS_Data_OutBus;

input 		SC_LEVELPROGRESS_CountSignal_in;
input			SC_LEVELPROGRESS_EndGame_in;
input			SC_LEVELPROGRESS_CLOCK_50;
input 		SC_LEVELPROGRESS_RESET_InHigh;
input 		SC_LEVELPROGRESS_EndLevel_in;

//=======================================================
//  REG/WIRE declarations
//=======================================================


reg [4:0] LEVELPROGRESSCOUNTER_Register;
reg [4:0] LEVELPROGRESSCOUNTER_Signal;


//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL

always @(*)
begin
    if (SC_LEVELPROGRESS_EndGame_in == 1'b1) begin
        
         if (SC_LEVELPROGRESS_CountSignal_in == 1'b0)
                LEVELPROGRESSCOUNTER_Signal = LEVELPROGRESSCOUNTER_Register + 1'b1;
			else if (SC_LEVELPROGRESS_EndLevel_in == 1'b0 )
					 LEVELPROGRESSCOUNTER_Signal = 5'b0;
         else
                LEVELPROGRESSCOUNTER_Signal = LEVELPROGRESSCOUNTER_Register;
        
    end
    else
        LEVELPROGRESSCOUNTER_Signal = 5'b0;
end


//STATE REGISTER: SEQUENTIAL
always @(posedge SC_LEVELPROGRESS_CLOCK_50, posedge SC_LEVELPROGRESS_RESET_InHigh)
begin
	if (SC_LEVELPROGRESS_RESET_InHigh  == 1'b1)
		LEVELPROGRESSCOUNTER_Register <= 0;
	else
		LEVELPROGRESSCOUNTER_Register <= LEVELPROGRESSCOUNTER_Signal;
end

//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_LEVELPROGRESS_Data_OutBus = LEVELPROGRESSCOUNTER_Register;

endmodule 




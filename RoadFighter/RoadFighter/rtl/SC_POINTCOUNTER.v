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

module SC_POINTCOUNTER(
//////////// OUTPUTS //////////
	SC_POINTCOUNTER_Data_OutBus,
//////////// INPUTS //////////
	SC_POINTCOUNTER_Progress_inLow,
	SC_POINTCOUNTER_CLOCK_50,
	SC_POINTCOUNTER_RESET_InHigh,
	SC_POINTCOUNTER_Current_In,
	SC_POINTCOUNTER_Lost_inLow,
	SC_POINTCOUNTER_upCount_inLow
);


//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

output  				[5:0]SC_POINTCOUNTER_Data_OutBus;

input 				[4:0]SC_POINTCOUNTER_Progress_inLow;
input 				SC_POINTCOUNTER_CLOCK_50;
input 				SC_POINTCOUNTER_RESET_InHigh;
input 				[2:0]SC_POINTCOUNTER_Current_In;
input 				SC_POINTCOUNTER_Lost_inLow;		
input 				SC_POINTCOUNTER_upCount_inLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================


reg [5:0] SC_POINTCOUNTER_Register;
reg [5:0] SC_POINTCOUNTER_Signal;


//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL


always @(*)
begin
	
	if(SC_POINTCOUNTER_Progress_inLow >= 8)begin
	
		if (SC_POINTCOUNTER_Register <= 50 && SC_POINTCOUNTER_Lost_inLow == 1'b1 && SC_POINTCOUNTER_upCount_inLow == 1'b0) 
			SC_POINTCOUNTER_Signal =	SC_POINTCOUNTER_Register + 1;	
		else
			SC_POINTCOUNTER_Signal = SC_POINTCOUNTER_Register;
		
	end
	
	else 
		 SC_POINTCOUNTER_Signal = SC_POINTCOUNTER_Register;

end

//STATE REGISTER: SEQUENTIAL
always @(posedge SC_POINTCOUNTER_CLOCK_50, posedge SC_POINTCOUNTER_RESET_InHigh)
begin
	if (SC_POINTCOUNTER_RESET_InHigh  == 1'b1)
		SC_POINTCOUNTER_Register <= 0;
	else
		SC_POINTCOUNTER_Register <= SC_POINTCOUNTER_Signal;
end

//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_POINTCOUNTER_Data_OutBus = SC_POINTCOUNTER_Register;

endmodule 




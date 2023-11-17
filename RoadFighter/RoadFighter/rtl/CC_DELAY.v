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

module CC_DELAY(
//////////// OUTPUTS //////////
	CC_DELAY_Data_outBus,

//////////// INPUTS //////////
	CC_DELAY_Data_inBus
);

//=======================================================
//  PARAMETER declarations
//=======================================================

parameter DATAWIDTH_BUS 									= 8;

//=======================================================
//  PORT declarations
//=======================================================

	
output reg	[DATAWIDTH_BUS-1:0] CC_DELAY_Data_outBus;

input			[DATAWIDTH_BUS-1:0] CC_DELAY_Data_inBus;

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [DATAWIDTH_BUS-1:0] DELAYED_DATA;

//=======================================================
//  Structural coding
//=======================================================


always @(*) begin

  DELAYED_DATA <= CC_DELAY_Data_inBus;
end


//=======================================================
//  Outputs
//=======================================================

always @(*) begin

  CC_DELAY_Data_outBus <= DELAYED_DATA;
end

endmodule

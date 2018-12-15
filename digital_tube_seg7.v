module digital_tube_seg7(
			input 					clk,		
			input 					rst_n,	
			input  					display_enable,		
			input      [23:0]		display_num,	
			output reg [6:0] 		hex0,	
			output reg [6:0] 		hex1,
			output reg [6:0] 		hex2,
			output reg [6:0] 		hex3,
			output reg [6:0] 		hex4,
			output reg [6:0] 		hex5
		);

//-------------------------------------------------
//参数定义

parameter 	NUM0 	= 7'b1000000,//0,
				NUM1 	= 7'b1111001,//1,
				NUM2 	= 7'b0100100,//2,
				NUM3 	= 7'b0110000,//3,
				NUM4 	= 7'b0011001,//4,
				NUM5 	= 7'b0010010,//5,
				NUM6 	= 7'b0000010,//6,
				NUM7 	= 7'b1111000,//7,
				NUM8 	= 7'b0000000,//8,
				NUM9 	= 7'b0011000,//9,
				NULL  = 7'b1111111;






always @(posedge clk or negedge rst_n)
	if(!rst_n) 
		begin
			hex5 <= NUM0;
			hex4 <= NUM0;
			hex3 <= NUM0;
			hex2 <= NUM0;
			hex1 <= NUM0;
			hex0 <= NUM0;
		end
	else 
		begin
			case(display_num[23:20]) 
			4'h0: hex5 <= NUM0;
			4'h1: hex5 <= NUM1;
			4'h2: hex5 <= NUM2;
			4'h3: hex5 <= NUM3;
			4'h4: hex5 <= NUM4;
			4'h5: hex5 <= NUM5;
			4'h6: hex5 <= NUM6;
			4'h7: hex5 <= NUM7;
			4'h8: hex5 <= NUM8;
			4'h9: hex5 <= NUM9;
			default:hex5 <= NULL ;
			endcase
			
			case(display_num[19:16]) 
			4'h0: hex4 <= NUM0;
			4'h1: hex4 <= NUM1;
			4'h2: hex4 <= NUM2;
			4'h3: hex4 <= NUM3;
			4'h4: hex4 <= NUM4;
			4'h5: hex4 <= NUM5;
			4'h6: hex4 <= NUM6;
			4'h7: hex4 <= NUM7;
			4'h8: hex4 <= NUM8;
			4'h9: hex4 <= NUM9;
			default: hex4 <= NULL;
			endcase
			
			case(display_num[15:12]) 
			4'h0: hex3 <= NUM0;
			4'h1: hex3 <= NUM1;
			4'h2: hex3 <= NUM2;
			4'h3: hex3 <= NUM3;
			4'h4: hex3 <= NUM4;
			4'h5: hex3 <= NUM5;
			4'h6: hex3 <= NUM6;
			4'h7: hex3 <= NUM7;
			4'h8: hex3 <= NUM8;
			4'h9: hex3 <= NUM9;
			default: hex3 <= NULL;
			endcase
			
			case(display_num[11:8]) 
			4'h0: hex2 <= NUM0;
			4'h1: hex2 <= NUM1;
			4'h2: hex2 <= NUM2;
			4'h3: hex2 <= NUM3;
			4'h4: hex2 <= NUM4;
			4'h5: hex2 <= NUM5;
			4'h6: hex2 <= NUM6;
			4'h7: hex2 <= NUM7;
			4'h8: hex2 <= NUM8;
			4'h9: hex2 <= NUM9;
			default: hex2 <= NULL;
			endcase
			
			case(display_num[7:4]) 
			4'h0: hex1 <= NUM0;
			4'h1: hex1 <= NUM1;
			4'h2: hex1 <= NUM2;
			4'h3: hex1 <= NUM3;
			4'h4: hex1 <= NUM4;
			4'h5: hex1 <= NUM5;
			4'h6: hex1 <= NUM6;
			4'h7: hex1 <= NUM7;
			4'h8: hex1 <= NUM8;
			4'h9: hex1 <= NUM9;
			default: hex1 <= NULL;
			endcase
			
			case(display_num[3:0]) 
			4'h0: hex0 <= NUM0;
			4'h1: hex0 <= NUM1;
			4'h2: hex0 <= NUM2;
			4'h3: hex0 <= NUM3;
			4'h4: hex0 <= NUM4;
			4'h5: hex0 <= NUM5;
			4'h6: hex0 <= NUM6;
			4'h7: hex0 <= NUM7;
			4'h8: hex0 <= NUM8;
			4'h9: hex0 <= NUM9;
			default: hex0 <= NULL;
			

		endcase
	end



endmodule


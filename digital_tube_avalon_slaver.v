module digital_tube_avalon_slaver(
			input 				clk,		     //时钟信号
			input 				rst_n,	         //复位信号，低电平有效
			
				//Avalon-MM总线
			input 				chipselect,	     //片选信号，高电平有效	
			input 				write_n,		 //写选通，低电平有效
			input [1:0]			address,         //地址总线	
			input [31:0] 		writedata,	     //写数据总线			
			//output irq,	                     //中断请求信号，高电平有效
			output reg [31:0] readdata,	         //读数据总线,这里边用不到

			output reg   		display_enable,  //数码管显示位使能信号，高电平有效
			output reg [19:0] 	display_num			
		);

//-------------------------------------------------
//参数设置

//寄存器定义
//	address = 00		数码管显示数据寄存器，bit31-20:保留；bit19-0:999999以内十进制数字
//	address = 01		数码管显示控制寄存器，bit31-1:保留；bit0:显示


//-------------------------------------------------
//寄存器写入操作

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n) 
		begin
			display_num <= 20'h00000;
			display_enable <= 1'b0;
		end
		
	else if(chipselect && !write_n) 
		begin
			case(address)
				2'b00: display_num <= writedata[19:0];
				2'b01: display_enable <= 1'b1;
				default:display_num<=20'b0;
			endcase
		end	
end

//-------------------------------------------------
//寄存器读操作，写了也没用

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n) 
		readdata <= 32'd0;
		
	else if(chipselect && write_n) 
		begin
			case(address)
				2'b00: readdata <= {12'd0,display_num[19:0]};
				2'b01: readdata <= {31'd0,display_enable};
				default: readdata <= 32'd0;
			endcase
		end
end	

endmodule


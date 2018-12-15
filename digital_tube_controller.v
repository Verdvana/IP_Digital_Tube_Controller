module digital_tube_controller(
			input clk,						//时钟信号，25MHz
			input rst_n,					//复位信号，低电平有效
			
				//Avalon-MM总线
			input chipselect,				//片选信号，高电平有效	
			input write_n,					//写选通，低电平有效
			input address,					//地址总线	
			input[31:0] writedata,			//写数据总线			
			//output irq,					//中断请求信号，高电平有效
			output[31:0] readdata,			//读数据总线
			
				//数码管接口
			output  [6:0] 		hex0,	
			output  [6:0] 		hex1,
			output  [6:0] 		hex2,
			output  [6:0] 		hex3,
			output  [6:0] 		hex4,
			output  [6:0] 		hex5
		);

	
		
//-------------------------------------------------
//Avalon-MM总线接口模块
wire  			display_enable;	
wire [23:0] 	display_num;		

digital_tube_avalon_slaver 	uut_digital_tube_avalon_slaver(
						.clk(clk),						//时钟信号
						.rst_n(rst_n),					//复位信号，低电平有效
							
							//Avalon-MM总线
						.chipselect(chipselect),		//片选信号，高电平有效	
						.write_n(write_n),				//写选通，低电平有效
						.address(address),				//地址总线	
						.writedata(writedata),			//写数据总线			
						//output irq,					//中断请求信号，高电平有效
						.readdata(readdata),			//读数据总线
							
							//数码管控制信号
						.display_enable(display_enable),//数码管显示位使能信号，高电平有效
						.display_num(display_num)		//数码管显示数据，[15:12]--数码管千位，[11:8]--数码管百位，[7:4]--数码管十位，[3:0]--数码管个位			
					);

//-------------------------------------------------
//数码管显示驱动模块
					
digital_tube_seg7		uut_seg7(
				.clk(clk),								//时钟信号
				.rst_n(rst_n),							//复位信号，低电平有效
					
														//数码管控制信号
				.display_enable(display_enable),		//数码管显示位使能信号，高电平有效
				.display_num(display_num),				//数码管显示数据，[15:12]--数码管千位，[11:8]--数码管百位，[7:4]--数码管十位，[3:0]--数码管个位	
					
					//数码接口
				.hex5 (hex5),	
				.hex4 (hex4),
				.hex3 (hex3),
				.hex2 (hex2),
				.hex1 (hex1),
				.hex0 (hex0)
			);		

	

endmodule
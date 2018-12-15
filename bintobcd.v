module bintobcd(
						input 					clk,
						input 					rst_n,
						input [19:0] 			bin,  //20位二进制码
						
						output reg [3:0] 		one,  //个位
						output reg [3:0] 		ten,  //十位
						output reg [3:0] 		hun,  //百位
						output reg [3:0] 		tho,  //千位
						output reg [3:0] 		tth,  //万位
						output reg [3:0] 		trl   //兆位

);


reg [4:0] 		count;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		count<=5'b0;
		
	else if (count==21)
		count<=0;
		
	else
		count<=count+1;
end



reg [43:0] 	shift_reg;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		shift_reg<=0;
		
	else if(count==0)
		shift_reg={24'b0000_0000_0000_0000_0000_0000,bin};
	
	else if(count<=20)
		if(shift_reg[23:20]>=5)
			begin
				if(shift_reg[27:24]>=5)
					begin
						if(shift_reg[31:28]>=5)
							begin
								if(shift_reg[35:32]>=5)
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
									end
								
								else
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
									end
							end
						
						else 
							begin
								if(shift_reg[35:32]>=5)
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
									end
								
								else
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
									end
							end
					end
					
				else
					begin
						if(shift_reg[31:28]>=5)
							begin
								if(shift_reg[35:32]>=5)
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
									end
								
								else
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
									end
							end
						
						else 
							begin
								if(shift_reg[35:32]>=5)
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
									end
								
								else
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20]+2'b11;
														shift_reg=shift_reg<<1;
													end
											end
									end
							end
					end
			end
///////////////////////////////////////////		
		else
			begin
				if(shift_reg[27:24]>=5)
					begin
						if(shift_reg[31:28]>=5)
							begin
								if(shift_reg[35:32]>=5)
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
									end
								
								else
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
									end
							end
						
						else 
							begin
								if(shift_reg[35:32]>=5)
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
									end
								
								else
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24]+2'b11;
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
									end
							end
					end
					
				else
					begin
						if(shift_reg[31:28]>=5)
							begin
								if(shift_reg[35:32]>=5)
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
									end
								
								else
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28]+2'b11;
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
									end
							end
						
						else 
							begin
								if(shift_reg[35:32]>=5)
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32]+2'b11;
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
									end
								
								else
									begin
										if(shift_reg[39:36]>=5)
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36]+2'b11;
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
										
										else
											begin
												if(shift_reg[43:40]>=5)
													begin
														shift_reg[43:40]=shift_reg[43:40]+2'b11;
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end

												else
													begin
														shift_reg[43:40]=shift_reg[43:40];
														shift_reg[39:36]=shift_reg[39:36];
														shift_reg[35:32]=shift_reg[35:32];
														shift_reg[31:28]=shift_reg[31:28];
														shift_reg[27:24]=shift_reg[27:24];
														shift_reg[23:20]=shift_reg[23:20];
														shift_reg=shift_reg<<1;
													end
											end
									end
							end
					end
			end
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
			one<=0;
			ten<=0;
			hun<=0;
			tho<=0;
			tth<=0;
			trl<=0;
			
		end
	
	else if(count==21)
		begin
			one<=shift_reg[23:20];
			ten<=shift_reg[27:24];
			hun<=shift_reg[31:28];
			tho<=shift_reg[35:32];
			tth<=shift_reg[39:36];
			trl<=shift_reg[43:40];
		end
end


endmodule

module LED_test_2(output [7:0]DATA_R, DATA_G, DATA_B, output [3:0]COMM, input CLK, output beep, input [3:0]A, output [5:0]A_count
						,output a,b,c,d,e,f,g, input Clear, output [1:0]level, output [3:0]an/*output [3:0]an*/
                   );
/* parameter*/ logic [7:0] H_Char [7:0] =
 '{8'b11111111,
   8'b11001111,
	8'b10111011,
	8'b10111111,
	8'b10111111,
	8'b10111011,
	8'b11001111,
	8'b11111111};
	bit [2:0] cnt;
	bit [3:0] cnt2;
	bit [3:0] cnt3;
	byte check_sw;
	byte flag;
	divfreq F0(CLK, CLK_div);
	change_1HZ F5(CLK,CLK_div1);
	//change_3HZ F7(CLK,CLK_div3);
					//change_2HZ F4(CLK,CLK_div2);
  // BCD_counter(CLK, CLear, a,b,c,d,e,f,g);
	twodigit_onefile(CLK,Clear, a,b,c,d,e,f,g, an[3:0]);
	//Counter(CLK,Clear, a,b,c,d,e,f,g, an[3:0]);
 //divfreq F0(CLK, CLK_div);
	initial 
		begin
			cnt = 0;
			cnt2 = 0;
			cnt3 = 0;
			DATA_R = 8'b11111111;
			DATA_G = 8'b11111111;
			DATA_B = 8'b11111111;
			COMM = 4'b1000; //which col light
			beep <= 0;
			A_count = 6'b111111;
			level = 2'b01;
		end
	
	always @(posedge CLK_div)//CLK_div -> 1kHz
		begin
			if(cnt >= 7) // cnt -> 0~7
				cnt = 0;
			else
				cnt = cnt+1;
				COMM = {1'b1 ,cnt};
				DATA_R = H_Char[cnt];
				if(A_count <= 6'b001000)begin
					level <= 2'b01;
				end
				if(A_count >= 6'b001000)begin
					DATA_B = H_Char[cnt];
					level <= 2'b10;
				end
				if(A_count >= 6'b010100)begin
					DATA_G = H_Char[cnt];
					level <= 2'b11;
				end
				if(A_count == 6'b011101)begin
					DATA_R = 8'b00000000;
					DATA_G = 8'b00000000;
					DATA_B = 8'b00000000;
					//count = 6'b000000;
				end
		end
		
			always @(posedge CLK_div1)      
		begin
	//		mice(H_Char, beep);
			cnt2 = (cnt2*5+3) % 16;
			if(cnt2 == 0)
				begin
					H_Char <=
					'{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b00111111,
						8'b00111111};
					check_sw <=0;
					beep <= 0;
				end
			else if(cnt2 == 1)
				begin
					H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b00111111,
						8'b00111111,
						8'b11111111,
						8'b11111111};
					check_sw <=1;
					beep <= 0;
				end
			else if(cnt2 == 2)
				begin
					H_Char <=
					'{8'b11111111,
						8'b11111111,
						8'b00111111,
						8'b00111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=2;
					beep <= 0;
				end	
			else if(cnt2 == 3)
				  begin
						H_Char <=
						'{8'b00111111,
						8'b00111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=3;
					beep <= 0;
				  end	
			  else if(cnt2 == 4)
				  begin
						H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11001111,
						8'b11001111};
					check_sw <=4;
					beep <= 0;
				  end
			  else if(cnt2 == 5)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11001111,
						8'b11001111,
						8'b11111111,
						8'b11111111};
					check_sw <=5;
					beep <= 0;
				  end
			  else if(cnt2 == 6)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11001111,
						8'b11001111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=6;
					beep <= 0;
				  end
			  else if(cnt2 == 7)
				  begin
				  H_Char <=
					 '{8'b11001111,
						8'b11001111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=7;
					beep <= 0;
				  end
			  else if(cnt2 == 8)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11110011,
						8'b11110011};
					check_sw <=8;
					beep <= 0;
				  end
			  else if(cnt2 == 9)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11110011,
						8'b11110011,
						8'b11111111,
						8'b11111111};
					check_sw <=9;
					beep <= 0;
				  end
			  else if(cnt2 == 10)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11110011,
						8'b11110011,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=10;
					beep <= 0;
				  end		  
			  else if(cnt2 == 11)
				  begin
				  H_Char <=
					 '{8'b11110011,
						8'b11110011,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=11;
					beep <= 0;
				  end		  
			  else if(cnt2 == 12)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111100,
						8'b11111100};
					check_sw <=12;
					beep <= 0;
				  end		  
			  else if(cnt2 == 13)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111100,
						8'b11111100,
						8'b11111111,
						8'b11111111};
					check_sw <=13;
					beep <= 0;
				  end		  
			  else if(cnt2 == 14)
				  begin
				  H_Char <=
					 '{8'b11111111,
						8'b11111111,
						8'b11111100,
						8'b11111100,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=14;
					beep <= 0;
				  end		  
			  else if(cnt2 == 15)
				  begin
				  H_Char <=
					 '{8'b11111100,
						8'b11111100,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111,
						8'b11111111};
					check_sw <=15;
					beep <= 0;
				  end	
			if (check_sw == 1)
					begin
						if (A==4'b0001)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 0)
					begin
						if (A==4'b0000)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 2)
					begin
						if (A==4'b0010)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 3)
					begin
						if (A==4'b0011)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 4)
					begin
						if (A==4'b0100)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 5)
					begin
						if (A==4'b0101)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								A_count <= A_count + 1'b1;
							end
						else;
					end
				else if  (check_sw == 6)
					begin
						if (A==4'b0110)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 7)
					begin
						if (A==4'b0111)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 8)
					begin
						if (A==4'b1000)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 9)
					begin
						if (A==4'b1001)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 10)
					begin
						if (A==4'b1010)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 11)
					begin
						if (A==4'b1011)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 12)
					begin
						if (A==4'b1100)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 13)
					begin
						if (A==4'b1101)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 14)
					begin
						if (A==4'b1110)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
						else;
					end
				else if  (check_sw == 15)
					begin
						if (A==4'b1111)
							begin
								H_Char <= '{8'b11111111,		
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111,
												8'b11111111};
								beep <= 1;
								if(A_count <= 6'b000111 || A_count == 6'b111111)
									A_count <= A_count + 1'b1;
								else if(A_count <= 6'b010011)
									A_count <= A_count + 2'b10;
								else
									A_count <= A_count + 2'b11;
							end
					end
				else;	 
			
			end
endmodule
module divfreq (input CLK, output reg CLK_div);
reg [24:0] Count;
always @(posedge CLK)
 begin
  if (Count > 25000)//HZ
   begin
	 Count <= 25'b0;
	 CLK_div <= ~CLK_div;
	end
  else
   Count <= Count + 1'b1;
 end
endmodule
module change_1HZ(input CLK, output reg CLK_div1);
		reg [24:0] Count;
		always @(posedge CLK)
			begin
				if(Count > 18000000)
					begin
						Count <= 25'b0;
						CLK_div1 <= ~CLK_div1;
					end
				else
					Count <= Count + 1'b1;
			end
endmodule

module BCD_counter(input CLK, Clear, output a,b,c,d,e,f,g);
reg [3:0] A_count;
divfreq_t F0(CLK, CLK_div);
always @(posedge CLK_div, posedge Clear)
  if(Clear) A_count<= 4'b0000;
  else 
  begin
   A_count <= A_count - 1'b1;
	end
   BCD2Seg F1(A_count[3],A_count[2],A_count[1],A_count[0], a,b,c,d,e,f,g);
endmodule
module divfreq_t (input CLK, output reg CLK_div);
reg [24:0] Count;
always @(posedge CLK)
 begin
  if (Count > 25000000)
   begin
	 Count <= 25'b0;
	 CLK_div <= ~CLK_div;
	end
  else
   Count <= Count + 1'b1;
 end
endmodule
module BCD2Seg(input A,B,C,D, output reg a,b,c,d,e,f,g);
 always @(A,B,C,D)
  case({A,B,C,D})
   4'b0000:{a,b,c,d,e,f,g}= 7'b0000001;
	4'b0001:{a,b,c,d,e,f,g}= 7'b1001111;
	4'b0010:{a,b,c,d,e,f,g}= 7'b0010010;
	4'b0011:{a,b,c,d,e,f,g}= 7'b0000110;
	4'b0100:{a,b,c,d,e,f,g}= 7'b1001100;
	4'b0101:{a,b,c,d,e,f,g}= 7'b0100100;
	4'b0110:{a,b,c,d,e,f,g}= 7'b0100000;
	4'b0111:{a,b,c,d,e,f,g}= 7'b0001111;
	4'b1000:{a,b,c,d,e,f,g}= 7'b0000000;
	4'b1001:{a,b,c,d,e,f,g}= 7'b0000100;
	default:{a,b,c,d,e,f,g}= 7'b1111111;
  endcase
endmodule
module twodigit_onefile(
	 input clock,
    input reset,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output [3:0]an
    );
  
reg [3:0]first; //register for the first digit
reg [3:0]second; //register for the second digit
reg [25:0] delay; //register to produce the 0.1 second delay
wire test;

always @ (posedge clock or posedge reset)
 begin
  if (reset)
   delay <= 0;
  else
   delay <= delay + 1;
 end
 
assign test = &delay; //AND each bit of delay with itself; test will be high only when all bits of delay are high



always @ (posedge test or posedge reset)
	 begin
	  if (reset) begin
		first <= 9;//1
		second <= 9;//10
	  end
	  
		else if (first==4'd0) begin  //x9 reached
		 first <= 9;
		  if (second == 4'd0) //99 reached
				second <= 9;
			else
			 second <= second - 1;
		end
		else
		 first <= first - 1;
	end

 

//Multiplexing circuit below

localparam N = 20;

reg [N-1:0]count;

always @ (posedge clock or posedge reset)
 begin
  if (reset)
   count <= 0;
  else
   count <= count + 1;
 end

reg [6:0]sseg;
reg [3:0]an_temp;
always @ (*)
 begin
  case(count[N-1:N-2])
   
   2'b00 : 
    begin
     sseg = first;
     an_temp = 4'b1110;
    end
   
   2'b01:
    begin
     sseg = second;
     an_temp = 4'b1101;
    end
   
   2'b10:
    begin
     sseg = 6'ha; //unknown sent to produce '-'
     an_temp = 4'b1011;//11
    end
    
   2'b11:
    begin
     sseg = 6'ha; //unknown sent to produce '-'
     an_temp = 4'b0111;//7
    end
  endcase
 end
assign an = an_temp;

reg [6:0] sseg_temp; 
always @ (*)
 begin
  case(sseg)
   4'd0 : sseg_temp = 7'b1000000; //0
   4'd1 : sseg_temp = 7'b1111001; //1
   4'd2 : sseg_temp = 7'b0100100; //2
   4'd3 : sseg_temp = 7'b0110000; //3
   4'd4 : sseg_temp = 7'b0011001; //4
   4'd5 : sseg_temp = 7'b0010010; //5
   4'd6 : sseg_temp = 7'b0000010; //6
   4'd7 : sseg_temp = 7'b1111000; //7
   4'd8 : sseg_temp = 7'b0000000; //8
   4'd9 : sseg_temp = 7'b0010000; //9
   default : sseg_temp = 7'b0111111; //dash
  endcase
 end
assign {g, f, e, d, c, b, a} = sseg_temp; 
endmodule

module Counter(clk,rst,dig,seg);
input clk;
input rst;
output[7:0]	dig;						  
output[7:0] seg;

reg clk_1s;	//1s計數時鐘訊號
reg clk_1ms;//1ms掃描時鐘訊號
reg clk_1k;//1ms掃描時鐘訊號
//reg key_r;		//按鍵輸入暫存器變數
reg cntclk;		//動態掃描計數變數，根據此變數的值來選通位碼和顯示值

reg[3:0] unit; //個位數
reg[3:0] decade;  //十位數
reg[7:0] seg_r;//段碼
reg[7:0] dig_r;//位碼
reg[3:0] disp_dat;			
reg[36:0] cnt_1s;//1Hz分頻訊號計數值
reg[20:0] cnt_1ms;//1kHz分頻訊號計數值
reg[4:0] cnt;//計數器計數值

assign dig = dig_r;
assign seg = seg_r;


always @(posedge clk)		//分頻
begin
  if(cnt_1s >=25000000) begin   cnt_1s <= 1'b0;  clk_1s = ~clk_1s;  end
  else cnt_1s <= cnt_1s + 1'b1;	//計數分頻
  
	if(cnt_1ms >= 50000)  begin	  cnt_1ms <= 1'b0;	clk_1k = ~clk_1k;	end
	else cnt_1ms <= cnt_1ms + 1'b1;	//掃描分頻
end


always @(posedge clk_1s or negedge rst)		//計數
begin
	//key_r <= key;
	if(!rst) 	cnt <= 0;		
	else 
		begin 
	//	if(!key)  cnt <= 5'd8;		//是否按鍵清零
		if(cnt >= 5'd20) cnt <= 1'b0;		//是否到時間
		else cnt <= cnt + 1'b1;		//計數加1
		end
end


always @(posedge clk_1s or negedge rst) 		//賦值
begin
	if(!rst)		begin		unit <= 4'd0;		decade <= 4'd0;		end	//位數清零
	else	begin		unit <= cnt % 10;	decade <= cnt / 10;		end	//位數賦值
end


always @(posedge clk_1ms)		//選擇掃描
begin
	cntclk = cntclk + 1'b1;
	case(cntclk)
	1'b0: dig_r <= 8'b10111111;	//位選
	1'b1: dig_r <= 8'b01111111;
	default: dig_r <= 8'b11111111;
	endcase
	case(cntclk)
	1'b0:disp_dat <= unit;
	1'b1:disp_dat <= decade;
	default:disp_dat = 4'h0;
	endcase
end


always @(disp_dat)
begin
	case(disp_dat)						 //段譯碼    
		4'h0:seg_r = 8'hc0;				//顯示0
		4'h1:seg_r = 8'hf9;				//顯示1
		4'h2:seg_r = 8'ha4;				//顯示2
		4'h3:seg_r = 8'hb0;				//顯示3
		4'h4:seg_r = 8'h99;				//顯示4
		4'h5:seg_r = 8'h92;				//顯示5
		4'h6:seg_r = 8'h82;				//顯示6
		4'h7:seg_r = 8'hf8;				//顯示7
		4'h8:seg_r = 8'h80;				//顯示8
		4'h9:seg_r = 8'h90;				//顯示9
		default:seg_r = 8'hc0;		//顯示0
	endcase
end

endmodule

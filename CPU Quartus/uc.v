//UNIDAD DE CONTROL


module uc(input wire clk, reset, zero, input wire [5:0] datos, output reg s_inc, s_inm, we3, s_out, s_in, s_inst, s_rel, output reg [2:0] op);

	/*reg ze;

	initial
	begin
		ze <= zero;
	end*/

	always @(*)
	begin
		case (datos[3:0])

			4'b0000:  //LI
			begin
				we3 <= 1'b1;
				s_inm <= 1'b1;
				s_inc <= 1'b1;
				op <= 3'b000;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= ze;
			end

			4'b0001:  //ADD
			begin
				we3 <= 1'b1;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b010;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= zero;
			end

			4'b0010:  //SUB
			begin
				we3 <= 1'b1;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b011;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= zero;
			end

			4'b0011:  //AND
			begin
				we3 <= 1'b1;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b100;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= zero;
			end

			4'b0100:  //OR
			begin
				we3 <= 1'b1;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b101;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= zero;
			end

			4'b0101:  //NOT A
			begin
				we3 <= 1'b1;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b001;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= zero;
			end

			4'b0110:  //SALTO RELATIVO CONDICIONAL NO Z
			begin
				we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b0;
				op <= 3'b000;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= ze;
						if (!zero)
						begin
							we3 <= 1'b0;
							s_inm <= 1'b0;
							s_inc <= 1'b1;
							op <= 3'b000;
							s_out <= 1'b0;
							s_in <= 1'b0;
							s_inst <= 1'b0;
							s_rel <= 1'b1;
							//ze <= ze;
						end

						else
						begin
							we3 <= 1'b0;
							s_inm <= 1'b0;
							s_inc <= 1'b1;
							op <= 3'b000;
							s_out <= 1'b0;
							s_in <= 1'b0;
							s_inst <= 1'b0;
							s_rel <= 1'b0;
							//ze <= ze;
						end
			end


			4'b0111:  //DESPL
			begin
				we3 <= 1'b1;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b111;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= zero;
			end

			4'b1000:  //EQUAL
			begin
				we3 <= 1'b1;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b000;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= zero;
			end


			4'b1001:  //JMP
			begin
				we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b0;
				op <= 3'b000;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= ze;
			end

			4'b1010:  //BIZ
			begin
				we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b0;
				op <= 3'b000;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= ze;
				if (zero)
				begin
					we3 <= 1'b0;
					s_inm <= 1'b0;
					s_inc <= 1'b0;
					op <= 3'b000;
					s_out <= 1'b0;
					s_in <= 1'b0;
					s_inst <= 1'b0;
					s_rel <= 1'b0;
					//ze <= ze;
				end

				else
				begin
					we3 <= 1'b0;
					s_inm <= 1'b0;
					s_inc <= 1'b1;
					op <= 3'b000;
					s_out <= 1'b0;
					s_in <= 1'b0;
					s_inst <= 1'b0;
					s_rel <= 1'b0;
					//ze <= ze;
				end
			end

			4'b1011:  //BINZ
			begin
				we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b0;
				op <= 3'b000;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= ze;
				if (!zero)
				begin
					we3 <= 1'b0;
					s_inm <= 1'b0;
					s_inc <= 1'b0;
					op <= 3'b000;
					s_out <= 1'b0;
					s_in <= 1'b0;
					s_inst <= 1'b0;
					s_rel <= 1'b0;
					//ze <= ze;
				end

				else
				begin
					we3 <= 1'b0;
					s_inm <= 1'b0;
					s_inc <= 1'b1;
					op <= 3'b000;
					s_out <= 1'b0;
					s_in <= 1'b0;
					s_inst <= 1'b0;
					s_rel <= 1'b0;
					//ze <= ze;
				end
			end

			4'b1100:  //READ REGISTER
			begin
				we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b000;
				s_out <= 1'b1;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= ze;
			end

			4'b1101:  //WRITE REGISTER
			begin
				we3 <= 1'b1;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b000;
				s_out <= 1'b0;
				s_in <= 1'b1;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= ze;
			end

			4'b1110:  //READ INSTRUCTION
			begin
				we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b000;
				s_out <= 1'b0;
				s_in <= 1'b1;
				s_inst <= 1'b1;
				s_rel <= 1'b0;
				//ze <= ze;
			end

			4'b1111:
			begin
				we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b0;
				op <= 3'b000;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= ze;
				case (datos[5:4])
					2'b00: 		//NOP
					begin
						we3 <= 1'b0;
						s_inm <= 1'b0;
						s_inc <= 1'b1;
						op <= 3'b000;
						s_out <= 1'b0;
						s_in <= 1'b0;
						s_inst <= 1'b0;
						s_rel <= 1'b0;
						//ze <= ze;
					end


					2'b01:		//SALTO RELATIVO
					begin
						we3 <= 1'b0;
						s_inm <= 1'b0;
						s_inc <= 1'b1;
						op <= 3'b000;
						s_out <= 1'b0;
						s_in <= 1'b0;
						s_inst <= 1'b0;
						s_rel <= 1'b1;
						//ze <= ze;
					end
					2'b11:		//SALTO RELATIVO CONDICIONAL Z
					begin
						we3 <= 1'b0;
						s_inm <= 1'b0;
						s_inc <= 1'b0;
						op <= 3'b000;
						s_out <= 1'b0;
						s_in <= 1'b0;
						s_inst <= 1'b0;
						s_rel <= 1'b0;
						//ze <= ze;
						if (zero)
						begin
							we3 <= 1'b0;
							s_inm <= 1'b0;
							s_inc <= 1'b1;
							op <= 3'b000;
							s_out <= 1'b0;
							s_in <= 1'b0;
							s_inst <= 1'b0;
							s_rel <= 1'b1;
							//ze <= ze;
						end

						else
						begin
							we3 <= 1'b0;
							s_inm <= 1'b0;
							s_inc <= 1'b1;
							op <= 3'b000;
							s_out <= 1'b0;
							s_in <= 1'b0;
							s_inst <= 1'b0;
							s_rel <= 1'b0;
							//ze <= ze;
						end
					end
				endcase
			end

			default:  //DEFAULT
			begin
				we3 <= 1'b0;
				s_inm <= 1'b0;
				s_inc <= 1'b1;
				op <= 3'b000;
				s_out <= 1'b0;
				s_in <= 1'b0;
				s_inst <= 1'b0;
				s_rel <= 1'b0;
				//ze <= ze;
			end

		endcase
	end

endmodule
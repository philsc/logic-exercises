module logic_101(iCLK, iRST, iIN, oOUT);

// Directions
input iCLK;
input iRST;
input iIN;
output oOUT;

// Sensitivity types
wire iCLK;
wire iRST;
wire iIN;
reg oOUT;

// Private Variables
reg [1:0] state;

// Functionality
always @ (posedge clock)
begin
  if (reset == 1'b0) begin
    oOUT <= 1'b0;
    state <= 2'b00;
  end
  else begin
    case (state)
      2'b00: begin
        if (iIN == 1'b1) begin
          state <= 2'b01;
        end
        oOUT <= 1'b0;
      end

      2'b01: begin
        if (iIN == 1'b0) begin
          state <= 2'b10;
        end
        oOUT <= 1'b0;
      end

      2'b10: begin
        if (iIN == 1'b0) begin
          state <= 2'b00;
        end else begin
          state <= 2'b11;
        end
        oOUT <= 1'b0;
      end

      2'b11: begin
        if (iIN == 1'b0) begin
          state <= 2'b00;
        end else begin
          state <= 2'b01;
        end
        oOUT <= 1'b1;
      end
    endcase
  end
end

endmodule

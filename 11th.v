module JK_FlipFlop(J, K, clk, Q, Q_bar);
    input J, K, clk;
    output reg Q, Q_bar;

    always @(posedge clk) begin
        case ({J, K})
            2'b00: Q <= Q;            
            2'b01: Q <= 0;           
            2'b10: Q <= 1;            
            2'b11: Q <= ~Q;           
        endcase
        Q_bar <= ~Q;                  
    end
endmodule

module tb_JK_FF();
    reg J, K;
    reg clk;
    wire Q, Q_bar;
    JK_FlipFlop dut(J, K, clk, Q, Q_bar);
    initial begin
        clk = 0;
        forever #10 clk = ~clk;  
    end
    initial begin
        $display(" T \t clk \t J \t K \t| Q \t Q_bar");
        $monitor(" %0t \t %d \t %d \t %d | %d \t %d", $time, clk, J, K, Q, Q_bar);
    end

    
    initial begin
        J = 0; K = 0;
        #20;
        J = 0; K = 1;
        #20;
        J = 1; K = 0;
        #20;
        J = 1; K = 1;
        #20;
        J = 0; K = 0;
        #20;
        $finish;
    end
endmodule


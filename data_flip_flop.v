// "why did you change the wires names?"
// because im stupid thats why

// Data flip-flop
// on each tick, saves next_bit into stored_bit
module DataFlipFlop(
    input default_bit,
    input next_bit,
    input tick,
    input reset,
    output reg stored_bit
);

    initial begin
        stored_bit <= default_bit;
    end

    always @(posedge tick, posedge reset) begin
        if (reset)
            stored_bit <= default_bit;
        else
            stored_bit <= next_bit;
    end

endmodule

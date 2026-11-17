module OneHotStateMachine(
    input input_bit,
    input tick,
    input reset,
    output is_lit,
    output [4:0] state      // {E, D, C, B, A}, for the LEDs
);

    wire in_a, in_b, in_c, in_d, in_e;
    wire next_a, next_b, next_c, next_d, next_e;

    // starts in A, so A defaults to 1
    DataFlipFlop state_a(
        .default_bit(1'b1), 
        .next_bit(next_a), 
        .tick(tick), 
        .reset(reset), 
        .stored_bit(in_a)
    );
    DataFlipFlop state_b(
        .default_bit(1'b0), 
        .next_bit(next_b), 
        .tick(tick), 
        .reset(reset), 
        .stored_bit(in_b)
    );
    DataFlipFlop state_c(
        .default_bit(1'b0), 
        .next_bit(next_c), 
        .tick(tick), 
        .reset(reset), 
        .stored_bit(in_c)
    );
    DataFlipFlop state_d(
        .default_bit(1'b0), 
        .next_bit(next_d), 
        .tick(tick), 
        .reset(reset), 
        .stored_bit(in_d)
    );
    DataFlipFlop state_e(
        .default_bit(1'b0), 
        .next_bit(next_e), 
        .tick(tick), 
        .reset(reset), 
        .stored_bit(in_e)
    );

    assign next_a = 1'b0;  // literally nothing leads to A just reset so there is no next_a
    assign next_b = ~input_bit & (in_a | in_d | in_e);
    assign next_c = ~input_bit & (in_b | in_c);
    assign next_d =  input_bit & (in_a | in_b | in_c);
    assign next_e =  input_bit & (in_d | in_e);

    assign is_lit = in_c | in_e;
    assign state  = {in_e, in_d, in_c, in_b, in_a};

endmodule

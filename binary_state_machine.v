// 5-state state machine with the state stored as a 3-bit number

// 5-states: 
// A = 000 
// B = 001 
// C = 010
// D = 011
// E = 100


module BinaryStateMachine(
    input input_bit,
    input tick,
    input reset,
    output is_lit,
    output [2:0] state
);

    wire [2:0] next_state;

    // 0th digit
    // ..x
    DataFlipFlop bit_0(
        .default_bit(1'b0),
        .next_bit(next_state[0]),
        .tick(tick),
        .reset(reset),
        .stored_bit(state[0])
    );

    // 1st digit
    // .x.
    DataFlipFlop bit_1(
        .default_bit(1'b0),
        .next_bit(next_state[1]),
        .tick(tick),
        .reset(reset),
        .stored_bit(state[1])
    );

    // 2nd digit
    // x..
    DataFlipFlop bit_2(
        .default_bit(1'b0),
        .next_bit(next_state[2]),
        .tick(tick),
        .reset(reset),
        .stored_bit(state[2])
    );



    assign is_lit = state[2] | (state[1] & ~state[0]);

    assign next_state[0] = (~input_bit &  state[2] & ~state[1])
                    | (~state[0]  & ~state[2] & ~state[1])
                    | ( state[0]  & ~input_bit &  state[1])
                    | (~state[0]  &  input_bit & ~state[2])
                    | ( input_bit & ~state[2] & ~state[1]);
    
    assign next_state[1] = (state[1] & ~state[0])
                     | (~state[1] & state[0])
                     | (input_bit & ~state[2] & ~state[1]);
    
    assign next_state[2] = input_bit & (state[2] | (state[1] & state[0]));


endmodule

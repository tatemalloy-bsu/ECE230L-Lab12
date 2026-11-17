module top(
    input sw,           // input bit (aka w)
    output [9:0] led,   // see da IO table
    input btnC,         // tick (aka clock)
    input btnU          // reset
);

    OneHotStateMachine one_hot_machine(
        .input_bit(sw),
        .tick(btnC),
        .reset(btnU),
        .is_lit(led[0]),
        .state(led[6:2])
    );

    BinaryStateMachine binary_machine(
        .input_bit(sw),
        .tick(btnC),
        .reset(btnU),
        .is_lit(led[1]),
        .state(led[9:7])
    );

endmodule







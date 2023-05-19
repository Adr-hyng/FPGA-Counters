module up_down_counter (clk, button, up_down, reset, LEDS);

// Define constant
parameter default_pulse = 25'b0;
parameter pulse_meter = 25'd2000000;
parameter bits = 4;
parameter is_off = 1'b0;
parameter is_on = 1'b1;

// Define inputs and outputs
input clk, button, reset, up_down;
output [bits - 1:0] LEDS;

// Create register for counting the amount of times the button was pressed
reg [bits - 1:0] count;

// 3 more registers used for debounce since the button will oscillate a few times when pressed
reg [24:0] counter_pressed, counter_not_pressed;
reg button_state = is_on;

// Give initial values to the registers. It's important otherwise there might be errors
initial begin
    count <= 4'b0;
    counter_pressed <= default_pulse;
    counter_not_pressed <= default_pulse;
end

// Each positive edge of the clock (50MHz in this case), we enter this part of code
always @(posedge clk or negedge reset)
begin
    if (!reset) // If the reset is negative (reset button pressed), we reset the values
    begin
        count <= 4'b0;
        counter_pressed <= default_pulse;
        counter_not_pressed <= default_pulse;
    end

    else
    begin
        // If button is negative (button pressed) and status is low, we start counting
        if (!button & !button_state)
            begin
                counter_pressed <= counter_pressed + 1'b1;
            end
        else
        begin
            counter_pressed <= default_pulse; // If not, reset the counter
        end

        if (counter_pressed == pulse_meter) // When 2M pulses are reached, we decrease the push counter by one and reset the others
        begin
            count <= (up_down) ? (count + 1'b1) : (count - 1'b1);
            counter_pressed <= default_pulse;
            button_state = is_on;
        end

        // Do the same for the positive part of button (button not pressed)
        if (button & button_state)
            begin
                counter_not_pressed <= counter_not_pressed + 1'b1;
            end
        else
        begin
            counter_not_pressed <= default_pulse;
        end

        if (counter_not_pressed == pulse_meter)
        begin
            counter_not_pressed <= default_pulse;
            button_state = is_off;
        end
    end // end of else of negative reset
end // end of always

// Finally, assign 'N' bits from the counter to the 'N' LEDs
assign LEDS[bits - 1:0] = ~count[bits - 1:0];

endmodule

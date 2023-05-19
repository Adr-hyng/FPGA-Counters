# Documentation:
- This Verilog code implements an up-down counter for an Altera Cyclone IV FPGA development board with a 50 MHz clock frequency. The counter's value is displayed on the board's LEDs. The code also includes a debouncing mechanism to handle button press oscillations. Key components of the code are:

## Parameters: 
- The code defines constants, such as the default pulse, pulse meter, and the number of bits used in the counter.

## Inputs and outputs: 
- The module has inputs for clock, button, reset, and up_down signals, and outputs an LEDS signal.

## Registers: 
- The code uses registers to store the count value, debounce counters, and button state.
## Initial values: 
- The registers are initialized with default values to avoid unexpected behavior.
## Always block: 
- This block is executed on every positive edge of the clock or negative edge of the reset signal. It handles button press and release events, including debouncing, and updates the count value according to the up_down signal.
## LED assignment: 
- The counter value is assigned to the LEDs with an inversion operation.

## Here's an example of how the code works:

1. When the button is pressed, the counter_pressed register starts incrementing on each clock cycle.
2. Once counter_pressed reaches the pulse_meter value (2 million clock cycles), the count is updated based on the up_down signal (incremented if up_down is high, decremented if it's low).
3. The button release is handled similarly with the counter_not_pressed register.
4. The debouncing mechanism ensures that the count is updated only once per button press and release, even if the button oscillates during the transition.
5. The counter value is displayed on the LEDs with an inversion operation, which turns on the corresponding LEDs for each bit set to 0 in the count value.

## Truth Table and Timing Diagram

### Up counter:
- ![Sample](https://www.engineersgarage.com/wp-content/uploads/2021/01/Screen-Shot-2021-01-11-at-2.14.37-PM.png)

## Down counter Timing Diagram:
- ![Sample](https://www.brightways.org/images/asychronous-4bit-down-timing.png)
# This Verilog code is for a Johnson counter implemented on an Altera Cyclone IV EP4CE6E22C8N development board with a 50 MHz clock. 

### The counter is controlled by a button, and its output is displayed on LEDs. The code also includes debouncing logic for the button input fpga4student.com.

### The module johnson_counter has the following:
- inputs for clock, button, and reset, and an output for LEDs. 
- Constants are defined for initialization and pulse counting. The main body of the code consists of an initial block for setting initial values of registers and an always block for handling positive edge of the clock and negative edge of the reset. The always block contains logic for debouncing the button input by counting pulses when the button is pressed or not pressed. When a certain pulse count is reached (2 million in this case), the counter is updated accordingly. 
- The button state is also updated based on whether the button is pressed or not. Finally, the counter's values are assigned to the LEDs
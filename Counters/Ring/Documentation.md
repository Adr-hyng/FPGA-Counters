# This Verilog code describes a ring counter with a debounce mechanism for an Altera Cyclone IV EP4CE6E22C8N FPGA development board operating at 50 MHz. 
## The module takes three inputs: 
- clk
- button
- reset

## one output: 
- LEDS

### The code uses several parameters to define constants, such as the number of bits in the counter, and the debounce threshold. It then declares registers for counting button presses, debounce counters, and the button state.

### The initial values for the registers are set in an initial block. The main logic for the ring counter and debounce mechanism is implemented in an always block, which is triggered at the positive edge of the clock signal or the negative edge of the reset signal.

### When the button is pressed, the debounce mechanism is in place to ensure that the counter is only incremented once, even if the button oscillates. The debounce mechanism uses two counters, counter_pressed and counter_not_pressed, which count the number of clock cycles the button is pressed or not pressed, respectively. When either of these counters reaches the pulse_meter value (2M in this case), the button state is updated, and the respective counter is reset.

### The ring counter is updated by shifting the count register's bits when the debounce threshold is reached. The output LEDS is assigned the bitwise negation of the count register. This means that the LEDs will display the binary representation of the counter value, with 0s displayed as lit LEDs and 1s displayed as unlit LEDs.

### Example: 2M pulse is reached with binary value of 0001 -> 0010, another 2M pulse, 0010 -> 0100, and last 2M pulse for the cycle to finish with 4-bit output from 0100 -> 1000, then go back from 1000 -> 0001. 

![Truth Table](https://allaboutfpga.com/wp-content/uploads/2016/05/Ring-Counter4-bit-State-Table.png)

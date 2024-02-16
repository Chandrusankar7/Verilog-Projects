Sequential circuits work based on the clock signal, timing violations in the sequential circuits depend on
the clock signal only. Static Timing analysis for any circuit depends on timing checks, design constraints
and libraries. The design constraints are provided by the user and the library files are pre defined, so the
timing check is the only parameter that can be changed in order to avoid any violation while designing
itself. The timing chek depends on the timing path (critical path), arrival time, required time and min, max
slack. Timing path refers to the path between the start point of the input port of the launch flip flop and
the output port of the capture flip flop. Slack is the difference between the required and arrival time.
Required time is the difference between the clock and setup time and arrival time is the difference
between the clk-Q propagation time and combinational delay. Minimum slack is (Arrival time - Required
time) and Maximum slack is (Required time - Arrival time). Slack of a sequential circuit depends on the
clock signal, setup and hold times. The setup and hold times is based on the active edge of the clock
signal, so the entire is indirectly based on the clock signal and its active edge. The setup and hold analysis
depends on the paths such as register-register, input-register, register-output, input-output and other
factors such as clock gating, recovery, removal time, data-data path, latch, slew, load (Fan-out,
Capacitance) and clock timings (skew, pulse width). Even though the circuits are designed based on the
timing analysis, it will not be the same when it is implemented in the hardware due to a factor called
On-Chip variation (OCV). Usually OCV value will be around 20% i.e.., for a circuit of clock with 10ns,
due to OCV, it might oscillate between 0/8 to 1.2 ns. The increase in the delay value due to OCV is called
“Clock push-out” and the decrease in delay value is called “Clock pull-in”. Decrease in the clock signal
signal timing will lead to the setup time violation. Synchronous sequential circuits need precise timing
parameters and violations in these specifications causes the Chip to operate with reduced frequency or
total failure of the chip. In order to avoid any timing violations in the sequential circuit, delay buffers and
time borrowing principles are used, which are fixed and cannot be modified after implementing the
circuit, so in this method a detector and corrector circuit is used for detecting the violations in the circuit
and selecting clock signal depending upon the amount of the clock value required. The detector circuit has
a detector circuit that takes the clock and data as the input. Both are provided to a one shot detector and
provided to an NAND gate and a buffer which detects latency between the data and clock signal. The
detector circuit produces two signals which are provided as the select lines to the multiplexer in the
corrector circuit that selects the clock signal required depending upon the clock required. The multiplexer
circuits are provided with clock signal with step increase in base clock signals